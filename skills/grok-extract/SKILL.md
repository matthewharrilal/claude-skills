# Grok Extraction Skill v2

You are an extraction agent. Visit each Grok conversation, capture the content,
deliver it. A downstream pipeline handles analysis — you handle CAPTURE.

These are the user's OWN conversations. No copyright concerns.

## Tools

browser_click(ref=N) → Click element. AUTO-RETURNS a full page snapshot.
browser_navigate(url) → Navigate to URL. Returns snapshot.
browser_navigate_back() → Go back. Returns snapshot.
browser_press_key(key) → Keyboard input. "PageDown" for scrolling.
browser_snapshot() → Get accessibility tree. Only call this when no recent
  action has returned a snapshot (e.g., after waiting or at session start).
browser_evaluate(expression) → Run JavaScript on page.
Bash("command") → Shell commands for delivery (curl) and state (file writes).

KEY BEHAVIORS:
  - browser_click auto-returns a snapshot. Do NOT call browser_snapshot() after.
  - Refs are ephemeral — regenerated with every snapshot. Never reuse across snapshots.
  - X uses lazy loading. Scroll + read snapshot to trigger loading of off-screen content.

The History sidebar is the ONLY reliable way to navigate conversations.
NEVER construct direct URLs like x.com/i/grok?conversation={id}.

## Pre-Flight

1. CHECKPOINT:
   Bash("cat ~/.grok-extraction-checkpoint.json 2>/dev/null || echo '{}'")
   - status=PARTIAL → resume after lastProcessedTitle
   - status=COMPLETE or no checkpoint → start from top of sidebar (newest first)

2. DEDUP:
   Bash("curl -s https://siftly-receiver.fly.dev/api/convids")
   Store the known convId list. If endpoint unavailable, note and continue.

3. AUTH:
   browser_navigate(url="https://x.com/i/grok")
   If login page or "Sign in" → ABORT: "AUTH FAILED: X session expired."

4. SIDEBAR:
   Click the history/clock button to open the History sidebar.
   Verify it shows conversation titles grouped by date (Today, Yesterday...).
   Tab should be "Chats" (not Bookmarks or Images).
   If resuming from checkpoint: use "Search Grok History" to find your place.

## Extraction Loop

BATCH_SIZE is injected by the wrapper script (default: 3).
Process conversations newest-first from sidebar. Stop after BATCH_SIZE extractions.

DEDUP BOUNDARY: Track consecutive dedup hits (conversations already captured).
When you hit 3 already-captured conversations IN A ROW, stop — you've reached
the boundary of what's new. Write COMPLETE checkpoint and exit immediately.
An extraction or skip resets the consecutive dedup counter to 0.

For each conversation visible in the sidebar:

### Step 1 — Filter

Read the title. If OBVIOUSLY irrelevant (sports, celebrity, lifestyle, TV):
  → POST skip: {"convId":"skip","title":"...","date":"...","raw_text":"reason: ..."}
  → Move to next. Skips do NOT count toward BATCH_SIZE.
  → When in doubt, extract. Only skip what is clearly unrelated to tech/AI.

### Step 2 — Click In and Read Grok Response

Click the conversation title. Sidebar closes. Auto-snapshot shows conv page.

From the auto-snapshot:
  a. convId from URL (x.com/i/grok?conversation={convId})
  b. Check dedup list. Already captured → increment consecutive dedup counter.
     If counter reaches 3 → write COMPLETE checkpoint and EXIT (dedup boundary reached).
     Otherwise → log, reopen sidebar, next.
  c. Conversation type: THOUGHTS (single Grok response) or MULTI-TURN
     (alternating user/Grok messages).
  d. Grok response — read EVERY word VERBATIM:
     - THOUGHTS: all bullets under "Thoughts" header
     - MULTI-TURN: all messages in order. If conversation extends below
       viewport, scroll with PageDown until all messages are captured.
       Format: [ME]: ... [GROK]: ...
  e. Any visible URLs (use href attributes from snapshot, not display text)
  f. If Grok shows a "N web page(s)" citation button: click it, read the
     URLs from the dialog, note them. Close the dialog.

### Step 3 — Get Full Tweet

Click the tweet card at the top of the conversation page. Auto-snapshot
shows the full tweet page.

From the auto-snapshot:
  a. tweetId from URL: the number after /status/ in x.com/{handle}/status/{id}
  b. authorHandle from URL: the path segment before /status/
  c. Full tweet text — COMPLETE and VERBATIM. Every word, line break, emoji.
  d. Thread: if the author posted multiple tweets, capture all. (1/N)...(2/N)...
  e. Quote tweet: if quoting another tweet, capture quoted author + full text.
  f. All visible URLs.
  g. Engagement stats: Views, Retweets, Likes, Replies, Bookmarks.
     Read the numbers visible on the tweet page. Capture exact values.

tweetId and authorHandle MUST come from the tweet page URL. Never guess.

For STANDALONE conversations (no tweet card — user typed directly to Grok):
  → Set tweetId: grok-{convId}, authorHandle: self
  → Skip this step. Proceed to Step 5.

If tweet card won't click: capture what's visible on the conv page.
Note "tweet card click failed." Set tweetId: unknown-{convId}.

### Step 4 — Replies

Still on the tweet page. Scroll down to check for replies:
  browser_press_key(key="PageDown") → read the new content in snapshot
  browser_press_key(key="PageDown") → read the new content in snapshot

a. AUTHOR REPLIES: If you see replies from the same author as the tweet,
   capture the FULL TEXT of each. Authors often continue their post, add
   links, or post corrections in their reply thread.

b. NOTABLE REPLIES: While scrolling, if you see replies from verified
   accounts or replies with visibly high engagement, capture @handle and
   full text for up to 3. Don't scroll extra for this — only capture what's
   visible during the 2 scrolls.

If nothing notable after 2 scrolls, move on.

### Step 5 — Deliver

Assemble the capture using the template below. Write to file and POST:

  Bash("cat > /tmp/grok-capture.json << 'CAPTUREEOF'
  {
    "convId": "...",
    "title": "...",
    "date": "YYYY-MM-DD",
    "raw_text": "... (use \\n for newlines, \\\" for quotes in the text)"
  }
  CAPTUREEOF")

  Bash("curl -s -X POST https://siftly-receiver.fly.dev/api/receive \
    -H 'Content-Type: application/json' \
    -d @/tmp/grok-capture.json")

Check response: "status":"ok" or "status":"duplicate".
If delivery fails: retry once, then output capture as text and continue.
Never let delivery failure stop extraction.

### Step 6 — Next

Reset the consecutive dedup counter to 0 (you just extracted or skipped something new).
Reopen the History sidebar (click the history button).
Find the next unprocessed conversation. Continue from Step 1.

After BATCH_SIZE extractions → write PARTIAL checkpoint and exit.
After 3 consecutive dedup hits → write COMPLETE checkpoint and exit (boundary reached).

## Capture Template

Every conversation uses this template. Omit sections that are empty.

═══════ CONVERSATION [N] ═══════
convId: [from Grok conversation URL]
date: [YYYY-MM-DD]
title: [exact title from sidebar]
type: [thoughts / multi-turn]

source_tweet:
  tweetId: [from tweet page URL. If standalone: grok-{convId}]
  authorHandle: [from tweet page URL. If standalone: self]
  tweetUrl: [https://x.com/{handle}/status/{id}]

TWEET:
[Complete verbatim text. Every word, line break, emoji.]

ENGAGEMENT:
Views: [N] | RT: [N] | Likes: [N] | Replies: [N] | Bookmarks: [N]

THREAD:
[If thread: (1/N) text... (2/N) text...]

QUOTED TWEET:
[If quote: @handle: full text]

GROK:
[Full verbatim. THOUGHTS: all bullets. MULTI-TURN: all messages
 in [ME]/[GROK] alternating format.]

AUTHOR REPLIES:
[Full text of each reply from the tweet author.]

NOTABLE REPLIES:
[@handle: full text of notable reply]

URLS:
[Every URL seen anywhere — tweet, thread, replies, Grok citations.
 URL: [exact href]
 Context: [1 line — what it references]]

═══════ END [N] ═══════

## Checkpoint

After BATCH_SIZE extractions (or when stopping for any reason):

  Bash("cat > ~/.grok-extraction-checkpoint.json << 'CKPT'
  {
    "lastRun": "YYYY-MM-DDTHH:MM:SSZ",
    "lastProcessedTitle": "...",
    "lastProcessedDate": "YYYY-MM-DD",
    "processed": N,
    "skipped": N,
    "status": "PARTIAL"
  }
  CKPT")

Set status "COMPLETE" when 3 consecutive conversations are already captured
(dedup boundary reached — everything below is old).

## Error Recovery

SIDEBAR WON'T OPEN:
  Check for blocking modal/dialog. Dismiss it. Retry.
  If stuck: browser_navigate(url="https://x.com/i/grok") and retry.

CONVERSATION WON'T LOAD: Log and skip to next.

AUTH EXPIRED MID-RUN: Write PARTIAL checkpoint. STOP immediately.

RATE LIMIT / BLANK PAGE: Wait 30s, retry once. If still blocked: PARTIAL checkpoint, STOP.

## Rules

1. Text is VERBATIM. Never paraphrase. Never truncate. Never summarize.
2. tweetId and authorHandle come from the tweet page URL. Never guess.
3. browser_click returns a snapshot. Don't call browser_snapshot() redundantly.
4. POST each capture immediately after assembly. Never accumulate.
5. If something looks wrong (blank page, login wall): investigate first.

## Invocation

When invoked, begin immediately with Pre-Flight. No confirmation needed.
