# SKILL v2: Visual Judgment Protocol
## Ship-Readiness Through Perceptual Reaction, Not Rule Checking

---

## TRIGGER CONDITIONS

Invoke this skill when:
- User says "would you ship this?" or "does this look right?"
- User says "/ship" or "/judge" or "/look"
- User says "visual judgment on [page/component]"
- User says "why does this look wrong?"
- A page or component is "structurally complete" and needs visual sign-off
- Tests pass but something feels off
- ANY build, audit, or fix phase reaches a visual output milestone
- **AUTOMATICALLY** — every agent that produces visual output MUST run Embedded Mode before declaring done

**CRITICAL DISTINCTION from v1:**
- v1 required a reference image. v2 does NOT.
- v1 asked "does this match?" v2 asks "would you ship this?"
- v1 was a standalone post-build step. v2 is woven into every phase.

---

## THE CORE FAILURE THIS SKILL PREVENTS

```
FAILURE MODE (proven across 100+ agents, 7 teams):

Agent writes CSS → Agent verifies rules → Rules pass → Agent declares DONE
                                            ↑
                                     Nobody ever LOOKED at the page.

The page has:
- border-radius: 0 ✓
- box-shadow: none ✓
- correct fonts ✓
- responsive at 768px ✓
- 4-column grid in 860px container = 143px cells with one word per line ✗

Every rule passed. The page looks broken.
```

**This skill forces the question rule-checking will NEVER ask:**
> "Open the page. Look at it. What's the first thing that bothers you?"

---

## THREE MODES

### MODE 1: EMBEDDED (30 seconds — MANDATORY for every visual output)

Every agent that produces visual output (HTML, CSS, layout) MUST run this
before declaring done. This is not optional. This is not a separate step.
This IS part of "done."

```
EMBEDDED VISUAL JUDGMENT — MANDATORY BEFORE DECLARING DONE

1. Open the page in Playwright at default viewport (1440px)
2. Take a screenshot
3. LOOK at the screenshot. Do NOT check rules. Just look.
4. Answer THREE questions (write answers in your report):

   Q1: "What's the first thing that bothers me?"
       If nothing → "Nothing bothers me" (acceptable answer)
       If something → DESCRIBE IT before moving on

   Q2: "Is any text uncomfortable to read?"
       Look at every text block. Is anything too narrow, too wide,
       too cramped, too stretched? Would you read this comfortably?

   Q3: "Would a designer ship this section as-is?"
       For each major visual section, yes or no.
       If no → WHAT would they change?

5. If ANY answer reveals a problem:
   → FIX IT before declaring done
   → Re-screenshot after fix
   → Re-answer the three questions
   → Repeat until all three are clean

6. Include your Q1-Q3 answers in your output report.
   If answers are missing, the work is INCOMPLETE.
```

**WHY THIS WORKS:** These three questions activate visual judgment instead of
rule checking. "What bothers me?" cannot be answered by grepping CSS. You have
to LOOK. And once you look, the narrow column / broken layout / cramped text
is immediately obvious.

**ANTI-CHECKLIST ENFORCEMENT:** If an agent answers Q1 with a rule-based
observation like "border-radius is 0 everywhere" — REJECT. That's not what
bothers you visually. That's a rule check wearing a judgment mask. The answer
must be PERCEPTUAL: "the left column feels crushed" or "there's too much
dead space below the code block."

---

### MODE 2: STANDALONE (Full Protocol — 5+ iterations, explicitly invoked)

Invoked with `/ship [page]` or `/judge [page]` or when the user explicitly
requests a visual judgment audit.

This is the deep version. It deploys zone sub-agents, iterates minimum 5
times, fixes issues one at a time, and documents discoveries.

**KEY DIFFERENCE FROM v1:** No reference image required. The "reference" is
the agent's own visual judgment: "would I ship this?"

#### PHASE 0: SETUP

```
1. Open the page in Playwright at default viewport (1440px)
2. Take a FULL-PAGE screenshot
3. Create audit directory: _visual-judgment/[page-name]/
4. Save screenshot as cycle-0-initial.png
5. Initialize VISUAL-JUDGMENT-LOG.md

OPTIONAL CONTEXT (use if available, don't require):
- Paired OD exploration (for quality baseline comparison)
- Previous AD explorations (for dialect consistency)
- Research findings (for intent verification)
These INFORM but do NOT constrain. Fresh eyes are primary.
```

#### PHASE 1: COLD LOOK (No rules, no context, just react)

```
COLD LOOK PROTOCOL — THE MOST IMPORTANT 60 SECONDS

Before reading ANY rules, ANY specs, ANY research:

1. Open the page screenshot
2. Set a mental timer: 10 seconds
3. Just LOOK. Don't analyze. Don't check. LOOK.

4. Answer (write these down immediately):

   FIRST REACTION: "My gut says: ________________"
   (Examples: "clean but cramped", "broken grid", "text is drowning",
    "this feels unfinished", "confident and editorial")

   WORST THING: "The worst thing on this page is: ________________"
   (Point to a specific area. Not a rule. A PLACE on the page.)

   BEST THING: "The best thing on this page is: ________________"
   (What's working? What should be protected during fixes?)

   SHIP VERDICT: "Would I ship this? ________________"
   (YES / YES WITH RESERVATIONS / NO)
   If not YES: "Because: ________________"

5. These answers are LOCKED. They cannot be changed after reading
   rules or specs. They represent unbiased first impression.
```

**WHY COLD LOOK FIRST:** The moment you read a spec, your brain switches
from "looking" to "checking." Cold Look captures what a real user or
designer would see before knowing any rules. This is the most valuable
data in the entire protocol.

#### PHASE 2: ZONE DEEP DIVE (Parallel sub-agents)

Deploy 6 zone sub-agents simultaneously. Each examines the page through
a specific perceptual lens. ALL questions are feeling-based, not rule-based.

```
┌─────────────────────────────────────────────────────────────────┐
│ ZONE 1: LAYOUT & GRID                              [NEW in v2] │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ THE ZONE THAT CATCHES THE NARROW COLUMN.                        │
│                                                                 │
│ Questions:                                                      │
│ • "Is every column wide enough to read comfortably?"            │
│ • "At this viewport, does the grid feel balanced or lopsided?"  │
│ • "Are any cells so narrow that text stacks vertically?"        │
│ • "Does the container width make sense for this content?"       │
│ • "If I resize to 1024px, does it still work?"                  │
│ • "If I resize to 800px, does it still work?"                   │
│                                                                 │
│ CRITICAL: Agent MUST resize viewport to 3 widths:               │
│ 1440px (desktop), 1024px (laptop), 768px (tablet)               │
│ AND screenshot each. Not just check if breakpoint exists —      │
│ actually LOOK at the result.                                    │
│                                                                 │
│ Architectural questions (v2 ONLY — question conventions):       │
│ • "Is the container max-width appropriate for this content?"    │
│ • "Does the column count work within this container?"           │
│ • "Should a breakpoint exist where one doesn't?"                │
│ • "Is any max-width value creating problems downstream?"        │
│                                                                 │
│ Output:                                                         │
│ - Layout balance assessment (per viewport width)                │
│ - Problem areas identified (with screenshot crops)              │
│ - Architectural flags (if conventions cause problems)           │
│ - Named problem + hypothesis                                   │
│ - Priority: HIGH / MEDIUM / LOW                                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ ZONE 2: TYPOGRAPHY                                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Questions:                                                      │
│ • "Is every text block comfortable to read?"                    │
│ • "Is any line too long (>80ch) or too short (<20ch)?"          │
│ • "Does the type hierarchy feel clear or muddy?"                │
│ • "Are headings dominating or fighting with body text?"         │
│ • "Does anything feel like it's being squeezed?"                │
│                                                                 │
│ Output: Named problem + hypothesis + priority                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ ZONE 3: SPACING & WHITESPACE                                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Questions:                                                      │
│ • "Is the space confident (generous) or anxious (cramped)?"     │
│ • "Is there dead space that serves no purpose?"                 │
│ • "Are sections clearly separated or running together?"         │
│ • "Does the page breathe or gasp?"                              │
│                                                                 │
│ Output: Named problem + hypothesis + priority                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ ZONE 4: CONTAINERS & BOUNDARIES                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Questions:                                                      │
│ • "Is content floating or trapped?"                             │
│ • "Are borders containing or accenting?"                        │
│ • "Are any cards/cells disproportionately tall vs their content?"│
│ • "Does the grid create awkward empty rectangles?"              │
│                                                                 │
│ Output: Named problem + hypothesis + priority                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ ZONE 5: HIERARCHY & FLOW                                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Questions:                                                      │
│ • "Where does my eye go first? Is that correct?"                │
│ • "Can I scan this page and understand the structure?"          │
│ • "Is anything fighting for attention that shouldn't be?"       │
│ • "Does the reading flow match the axis pattern's intent?"      │
│                                                                 │
│ Output: Named problem + hypothesis + priority                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ ZONE 6: OVERALL COMPOSITION                                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Questions:                                                      │
│ • "Does this feel like a finished, professional page?"          │
│ • "Is there energy and tension, or is it flat and safe?"        │
│ • "Does it feel consistent with itself?"                        │
│ • "What's the ONE thing you'd change if you could only change   │
│    one thing?"                                                  │
│                                                                 │
│ THE KILLER QUESTION:                                            │
│ • "If this were on a design portfolio, would it impress?"       │
│                                                                 │
│ Output: Named problem + hypothesis + priority                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

#### PHASE 3: SYNTHESIS + ARCHITECTURAL REVIEW

```
After all 6 zone reports:

1. RANK all findings by visual impact (HIGH first)

2. ARCHITECTURAL FLAGS — if ANY zone flagged a convention:
   - Document: "Convention X causes problem Y"
   - Trace: "Convention X originated from [source]"
   - Assess: "Is this convention research-backed or fossilized?"
   - Recommend: "KEEP / MODIFY / QUESTION"

   If a convention is NOT research-backed (like 860px max-width):
   → Flag as ARCHITECTURAL DEBT
   → Do NOT work around it — fix the root cause

3. SELECT highest-impact single change for first iteration

4. If architectural: propose the convention change + cascading impact
   If visual: propose the CSS fix
```

#### PHASE 4: ITERATIVE FIX (Minimum 3 iterations for standalone)

```
FOR EACH ITERATION:

1. Make ONE change (convention or CSS)
2. Re-screenshot at all 3 viewports (1440, 1024, 768)
3. LOOK at the result — don't grep for rules
4. Evaluate: BETTER / WORSE / SAME
   - BETTER → Document what worked. What's STILL wrong?
   - WORSE → Revert. Try different approach.
   - SAME → Wrong hypothesis. Look elsewhere.
5. Continue until ship-ready

EXIT CONDITION (standalone):
- Minimum 3 iterations complete
- Cold Look re-test: "Would I ship this?" = YES
- No HIGH-priority findings remain
- All architectural flags resolved or explicitly deferred
```

---

### MODE 3: QUICK (60-second gut check — invoked with `/look [page]`)

For rapid assessment without the full protocol:

```
QUICK VISUAL JUDGMENT

1. Screenshot at 1440px
2. FIRST REACTION in one sentence
3. TOP 3 things that bother you (or "nothing")
4. SHIP VERDICT: YES / NO / WITH RESERVATIONS
5. If NO: What needs to change?

Total time: 60 seconds. No zone agents. No iterations.
Use when you need a fast sanity check, not a deep audit.
```

---

## ANTI-PATTERNS (What makes visual judgment FAIL)

### ANTI-PATTERN 1: Rule Checking in Disguise
```
BAD: "Q1 answer: border-radius is 0 on all elements"
     → This is a rule check, not a visual reaction.

GOOD: "Q1 answer: the left column text is crushed into a narrow sliver"
      → This is what you actually SEE.
```

### ANTI-PATTERN 2: Viewport Tunnel Vision
```
BAD: Check at 1440px. Check at 768px. Done.
     → You missed the 1024px range where grids squeeze.

GOOD: Check at 1440, 1024, 800, 768. LOOK at each.
      → The 1024px screenshot shows the bento grid problem.
```

### ANTI-PATTERN 3: Container vs Viewport Blindness
```
BAD: "I added a @media (max-width: 1024px) breakpoint"
     → But the container is 860px, and the viewport is 1440px.
     → The breakpoint never fires.

GOOD: "The container is 860px. At ANY viewport, 4 columns in 860px =
       143px cells. The breakpoint should be on CONTAINER width, or
       the default column count needs to change."
     → This questions the ARCHITECTURE, not just the symptoms.
```

### ANTI-PATTERN 4: Grepping for Existence Instead of Looking
```
BAD: "overflow-wrap: break-word exists in the CSS → PASS"
     → The property exists but the text is still crushed.

GOOD: "I screenshotted the page. The text in the left column still
       wraps one word per line. overflow-wrap doesn't help when the
       container is 143px wide."
     → LOOKING reveals what grepping hides.
```

### ANTI-PATTERN 5: Fossilized Convention Worship
```
BAD: "max-width: 860px matches the spec → PASS"
     → The spec has no research backing. The value was fossilized.

GOOD: "max-width: 860px creates 143px grid cells. The spec doesn't
       cite research for this value. The convention should be
       questioned."
     → Conventions exist to SERVE the design, not the other way around.
```

### ANTI-PATTERN 6: Declaring Victory After Writing CSS
```
BAD: "Added 1024px breakpoint. DONE."
     → You wrote the CSS but never rendered the page to see if it worked.

GOOD: "Added 1024px breakpoint. Screenshotted at 1200px viewport.
       The breakpoint doesn't fire because viewport > 1024px. The
       container is still 860px with 4 columns. Need a different approach."
     → Writing CSS is step 1. SEEING the result is step 2. Both required.
```

---

## INTEGRATION: HOW THIS WEAVES INTO EVERY PHASE

### During Build (Builders)
Every builder MUST run Embedded Mode (Q1-Q3) before declaring their file done.
Include answers in their report. If any answer reveals a problem, fix before done.

### During Audit (Visual Auditors)
Visual auditors run Standalone Mode on their assigned files. Zone agents deployed
for Layout/Grid, Spacing, and Composition at minimum. Screenshots at 3 viewports.

### During Fix (Fixers)
After applying fixes, fixers run Embedded Mode to verify the fix actually
improved the visual result. Screenshot comparison: before vs after.

### During Fresh Eyes (Fresh-Eyes Agent)
Fresh-Eyes runs Cold Look protocol FIRST (before any other examination).
Cold Look answers are LOCKED and included verbatim in the report.

### During Verification (Verifiers)
Verifiers run Quick Mode on every page after programmatic checks pass.
If Quick Mode reveals issues, escalate before declaring verification complete.

### Convention/Architecture Decisions (Lead)
When zones flag architectural problems, Lead runs Standalone Mode on the
specific issue to determine: is the convention serving the design, or is
the design contorting to serve the convention?

---

## FORCING QUESTIONS (Use when stuck or when "nothing seems wrong")

These questions force deeper looking:

```
LEVEL 1 — Surface
• "What's the first thing that catches my eye?"
• "Is anything uncomfortable to read?"
• "Does anything feel cramped or stretched?"

LEVEL 2 — Structure
• "Does the grid make sense at this width?"
• "Are all columns earning their space?"
• "Is there empty space that signals broken layout vs intentional breathing?"

LEVEL 3 — Architecture
• "Why is this container this wide?"
• "Who decided this column count? Is it backed by research?"
• "If I change the container width, what breaks? What improves?"

LEVEL 4 — Ship-Readiness
• "Would a designer be proud to show this in a portfolio?"
• "Would a user find this comfortable to read for 10 minutes?"
• "If a client saw this, would they ask 'why does this look like that?'"
```

---

## ARCHITECTURAL QUESTIONING PROTOCOL

When a visual problem traces to a convention or architectural decision:

```
1. IDENTIFY the root cause
   "This narrow column exists because: max-width: 860px + 4-col grid"

2. TRACE the provenance
   "Where did 860px come from?"
   Read convention spec → trace to origin → check for research backing

3. CLASSIFY the convention
   A. RESEARCH-BACKED: Cited finding ID, validated empirically
      → Respect it. Find another solution to the visual problem.

   B. INHERITED WITHOUT JUSTIFICATION: Copied from prior phase, no citation
      → Flag as ARCHITECTURAL DEBT. Propose revision.

   C. FOSSILIZED: One builder's arbitrary choice, formalized through convention
      pipeline, now treated as immutable despite zero research backing
      → Challenge it directly. Propose the right value with justification.

4. PROPOSE resolution
   For B and C: "Convention X should be [new value] because [visual evidence]"
   Include: screenshot showing the problem + screenshot showing the fix

5. ESCALATE to human
   Architectural changes affect cascading files. Always confirm before
   modifying a convention that propagates across multiple files.
```

---

## EMBEDDED MODE PROMPT (Copy into every builder/fixer/auditor agent prompt)

```
═══════════════════════════════════════════════════════════════════════════
MANDATORY: VISUAL JUDGMENT CHECK — RUN BEFORE DECLARING DONE
═══════════════════════════════════════════════════════════════════════════

After you finish your work, BEFORE you declare done:

1. Open your page in Playwright at 1440px viewport
2. Take a screenshot
3. LOOK at it — don't check rules, just LOOK
4. Answer these THREE questions in your report:

   Q1: "What's the first thing that bothers me?"
   Q2: "Is any text uncomfortable to read?"
   Q3: "Would a designer ship this as-is?"

5. If ANY answer reveals a problem → FIX IT, then re-check

Your work is NOT complete until Q1-Q3 are answered AND clean.
═══════════════════════════════════════════════════════════════════════════
```

---

## OUTPUT FORMAT

### Embedded Mode Output (append to agent report)
```
## VISUAL JUDGMENT CHECK

Screenshot: [path]

Q1 — First thing that bothers me: [answer]
Q2 — Any text uncomfortable to read: [answer]
Q3 — Would a designer ship this: [answer]

Status: CLEAN / FIXED [describe what was fixed]
```

### Standalone Mode Output (dedicated report file)
```
# VISUAL JUDGMENT REPORT: [page name]

## COLD LOOK (locked — written before reading any specs)
- First reaction: [gut feeling]
- Worst thing: [specific area]
- Best thing: [what to protect]
- Ship verdict: [YES / NO / WITH RESERVATIONS]

## ZONE REPORTS
### Layout & Grid: [findings at 3 viewports]
### Typography: [findings]
### Spacing: [findings]
### Containers: [findings]
### Hierarchy: [findings]
### Composition: [findings]

## ARCHITECTURAL FLAGS
[Any conventions questioned, with provenance trace]

## FIX LOG
### Iteration 1: [what changed, result]
### Iteration 2: [what changed, result]
### Iteration 3: [what changed, result]

## FINAL VERDICT
- Ship-ready: [YES / NO]
- Remaining concerns: [if any]
- Architectural debt: [if any]
```

### Quick Mode Output (inline in conversation)
```
QUICK VISUAL JUDGMENT: [page name]
Reaction: [one sentence]
Bothers me: [1-3 items or "nothing"]
Ship: [YES / NO / WITH RESERVATIONS]
```

---

## RELATIONSHIP TO v1 (perceptual-deepening)

v1 is NOT deprecated. v1 is for **reference-matching** — when you have a
specific design to replicate and need to extract its soul through iterative
comparison. v1's squint test, deepener, and soul documenter are valuable
for that use case.

v2 is for **ship-readiness** — when you have original work with no reference
and need to assess whether it's good enough to ship. v2's cold look, zone
agents, and architectural questioning are designed for this use case.

**USE v1 WHEN:** You have a reference image and want to match it.
**USE v2 WHEN:** You have original work and want to judge its quality.
**USE BOTH WHEN:** You have original work AND want to compare against a
baseline (like the paired OD exploration).

---

## INVOCATION

| Command | Mode | Description |
|---------|------|-------------|
| `/ship [page]` | Standalone | Full visual judgment protocol |
| `/judge [page]` | Standalone | Alias for /ship |
| `/look [page]` | Quick | 60-second gut check |
| (automatic) | Embedded | Every agent before declaring done |

---

## THE ONE RULE

> **Look at the page. Would you ship it?**
>
> Everything else in this skill exists to force that question
> into contexts where it would otherwise be replaced by
> "does this pass the checklist?"

---

END SKILL DEFINITION v2
