<!-- PERCEPTUAL AUDIT SKILL — GATES.md -->
<!-- VERSION: v3.0 — Binary Gate Architecture -->
<!-- SUPERSEDES: All prior gate logic scattered across SKILL.md, SKILL-v2.md, plan files -->
<!-- LAST UPDATED: 2026-02-11 -->

# GATES.md — Binary Validation Gates for Perceptual Auditing

## READ THIS FIRST

This file contains the 7 mandatory gates for perceptual auditing.

**Every gate is:**
- YES/NO — zero judgment required
- Automatically checkable — zero human intervention needed
- BLOCKING — work CANNOT continue if a gate fails

**If you are the Lead/Orchestrator:**
You MUST check every gate at its specified trigger point.
You CANNOT waive a gate. You CANNOT defer a gate. You CANNOT skip a gate.
A gate failure is not a suggestion — it is a HARD STOP.

**If you are an Agent:**
Gates are checked BY the Lead AFTER you complete your work.
Your job is to produce output that PASSES the gates.
If you know you will fail a gate (e.g., Playwright is unavailable),
STOP and report the failure. Do NOT produce output that will be rejected.

---

## THREE-LAYER ARCHITECTURE

```
LAYER 1: BINARY GATES (this file)
  │  Automated. Blocking. 100% compliance expected.
  │  "Did the agent DO the right things?"
  │
  │  MUST PASS before Layer 2 activates.
  │
LAYER 2: STRUCTURED JUDGMENT (see PROTOCOL.md)
  │  Bounded options. Agent chooses from list.
  │  "What is the agent's ASSESSMENT?"
  │
  │  MUST PASS before Layer 3 activates.
  │
LAYER 3: FREE PERCEPTION (see PROTOCOL.md)
     Open-ended perceptual questions.
     "What does the agent SEE?"
```

Layer 1 catches process failures (agent didn't use Playwright).
Layer 2 catches assessment failures (agent rated everything SHIP).
Layer 3 produces the actual audit value (perceptual findings).

WITHOUT Layer 1, agents produce beautiful prose from source-code reading.
WITHOUT Layer 2, free perception has no structure for cross-agent comparison.
WITH all three, the skill produces verified, structured, genuine findings.

---

███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████

# THE SEVEN GATES

███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████


===================================================================
======= GATE 1: PLAYWRIGHT ALIVE ================================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK BEFORE AUDIT STARTS
===================================================================

## When to Check
BEFORE any visual auditor agent is spawned.

## How to Check
```
1. Navigate Playwright to the target URL
2. Wait for page load (document.fonts.ready)
3. Take a screenshot
4. Verify: does the screenshot file exist?
5. Verify: is the screenshot > 0 bytes?
```

## Pass Criteria
  Screenshot file EXISTS and is > 0 bytes.

  YES --> Playwright is alive. Proceed to spawn auditors.
  NO  --> Playwright is NOT alive. DO NOT SPAWN AUDITORS.

## On Failure
- DO NOT spawn any visual auditor agents
- Report to user: "Playwright unavailable. Cannot run perceptual audit."
- Wait for Playwright to become available
- Re-check Gate 1 before proceeding

## Why This Gate Exists
AD-004: Both Auditors Alpha and Beta fell back to source-code analysis.
They produced entire audits without ever rendering the page. The user
discovered this and forced a redo (~45 minutes wasted). A screenshot
existence check before spawning agents would have caught this instantly.

## PASS Example
Lead navigates to http://localhost:8080/explorations/axis/AD-006-compound.html.
Screenshot saved to /tmp/gate-1-check.png. File exists, 847KB. PASS.

## FAIL Example
Lead attempts to navigate. Playwright returns "browser not connected."
No screenshot file created. FAIL. Do not spawn auditors.

===================================================================
THIS GATE CANNOT BE BYPASSED.
THIS GATE CANNOT BE WAIVED.
THIS GATE CANNOT BE DEFERRED.
===================================================================


===================================================================
======= GATE 2: SCREENSHOT EXISTS ===============================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER EACH AUDITOR
===================================================================

## When to Check
AFTER each visual auditor completes their work.

## How to Check
```
Count PNG files in {output-path}/screenshots/ for this auditor.
```

## Pass Criteria
  Screenshot count >= 6 PNG files.
  (3 viewports x 2 minimum screenshots per viewport = 6)

  YES (>= 6 PNGs) --> Findings are VALID. Proceed to synthesis.
  NO  (< 6 PNGs)  --> Findings are INVALID. REJECT. RESPAWN.

## On Failure
- REJECT the auditor's findings. They are INVALID.
- DO NOT pass findings to the weaver-synthesizer.
- RESPAWN the auditor with explicit instruction:
  "YOU MUST TAKE SCREENSHOTS AT ALL 3 VIEWPORTS. YOUR PREVIOUS
   ATTEMPT PRODUCED [N] SCREENSHOTS. MINIMUM IS 6."
- Re-check Gate 2 after respawn.

## Why This Gate Exists
Agents can produce CSS-free perceptual language from source-code reading.
They can PASS Gate 4 (contamination check) while violating the entire
protocol. The ONLY proof of visual inspection is the existence of
screenshot files. Source-code-only analysis is NOT a perceptual audit.

## PASS Example
auditor-a/screenshots/ contains: cold-look-1440.png, scroll-1-1440.png,
scroll-2-1440.png, cold-look-768.png, scroll-1-768.png, cold-look-1024.png,
scroll-1-1024.png. Count = 7. PASS.

## FAIL Example
auditor-a/screenshots/ contains: cold-look-1440.png. Count = 1.
FAIL. Auditor only screenshotted one viewport. Findings INVALID.

===================================================================
REPEAT: Source-code-only analysis is NOT a perceptual audit.
REPEAT: An agent that says "I analyzed the HTML" has FAILED.
REPEAT: No screenshots = no audit. Period.
===================================================================


===================================================================
======= GATE 3: COLD LOOK LOCKED ================================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER EACH AUDITOR
===================================================================

## When to Check
AFTER each visual auditor completes, ALONGSIDE Gate 2.

## How to Check
```
1. Does cold-look-{agent-name}.md exist in {output-path}/?
2. Does findings-{agent-domain}.md exist in {output-path}/?
3. Was cold-look written BEFORE findings?
   (Check: cold-look file must be referenced as a checkpoint
    write in the agent's procedure, written BEFORE zone analysis)
```

## Pass Criteria
  Cold-look file EXISTS.
  Cold-look was written as a SEPARATE STEP before findings.

  YES --> Cold Look is genuine first impression. Proceed.
  NO  --> Cold Look may be contaminated. REJECT. RESPAWN.

## On Failure
- If cold-look file doesn't exist: REJECT. Auditor skipped Cold Look.
  Respawn with: "YOU MUST WRITE cold-look-{name}.md BEFORE analyzing."
- If cold-look was written after or simultaneously with findings:
  REJECT. Temporal Firewall breached. Respawn.

## Why This Gate Exists
The Cold Look is the most valuable data in the entire protocol. It
captures unbiased first impressions before analysis contaminates them.
AP-22 (Post-Lock Revision) cannot be detected after the fact — an agent
that reads specs first will produce a Cold Look rationalized by spec
knowledge, not by genuine perception. The file-existence gate enforces
the temporal ordering.

## PASS Example
cold-look-auditor-a.md exists (written at step 4 of procedure).
findings-impression-emotion.md exists (written at step 11).
Cold look was a checkpoint write before zone analysis. PASS.

## FAIL Example
findings-impression-emotion.md exists but cold-look-auditor-a.md
does not exist. Auditor skipped the checkpoint write. FAIL.

===================================================================
The Cold Look is LOCKED after writing. It CANNOT be modified.
Modifying a Cold Look after reading specs is AP-22: PROTOCOL VIOLATION.
===================================================================


===================================================================
======= GATE 4: PERCEPTUAL LANGUAGE =============================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER EACH AUDITOR
===================================================================

## When to Check
AFTER each visual auditor completes, ALONGSIDE Gates 2 and 3.

## How to Check
```
Grep the findings file for CSS property names:

CONTAMINATION TERMS (grep with word boundaries):
  border-radius, box-shadow, padding, margin, font-size,
  font-family, line-height, max-width, min-width, flex,
  grid-template, gap, opacity, z-index, overflow, display,
  position, rgba, rgb, hsl, \bpx\b, \brem\b, \bem\b,
  transform, transition, animation, @media, :hover,
  border-left, border-right, border-top, border-bottom,
  background-color, color:, font-weight, text-align,
  justify-content, align-items, grid-template-columns

Count total matches.
```

## Pass Criteria
  0 matches    --> CLEAN. Proceed.
  1-3 matches  --> MINOR CONTAMINATION. Flag in report. Proceed
                   with note: "Auditor had [N] contaminated terms."
  4+ matches   --> CONTAMINATED. Findings must be REWRITTEN.

  CLEAN or MINOR --> Proceed to synthesis.
  CONTAMINATED   --> REJECT. Respawn with emphasis on language rules.

## On Failure (4+ matches)
- REJECT the findings file. It is CONTAMINATED.
- Report: "Auditor used [N] CSS property names. List: [terms]."
- RESPAWN with: "YOUR FINDINGS CONTAINED CSS TERMS: [list].
  REWRITE ALL FINDINGS USING ONLY PERCEPTUAL LANGUAGE.
  Use: heavy, light, cramped, spacious, jarring, smooth, floating,
  grounded, anxious, confident, broken, polished, warm, cold."

## Why This Gate Exists
The entire skill exists to produce perceptual observations that
rule-checking cannot. If findings contain CSS property names, the
agent was analyzing source code, not perceiving rendered output.
Even minor contamination correlates with reduced insight quality —
the OD benchmark found that fresh-eyes (zero contamination) produced
the most valuable contradictions.

## PASS Example (CLEAN)
Grep of findings-impression-emotion.md: 0 matches for any
contamination term. All findings use perceptual language:
"the left column feels crushed", "dead space below the fold."
PASS.

## FAIL Example (CONTAMINATED)
Grep of findings-spatial-grid.md: 7 matches.
Found: "padding", "max-width", "grid-template-columns" (x2),
"860px", "border-left", "rgba". FAIL. Respawn.

===================================================================
PERCEPTUAL LANGUAGE means describing what you SEE and FEEL.
TECHNICAL LANGUAGE means describing CSS properties.
This audit requires PERCEPTUAL. Technical findings are INVALID.
===================================================================


===================================================================
======= GATE 5: SYSTEMIC SYNTHESIS ==============================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER 3+ PAGES AUDITED
===================================================================

## When to Check
AFTER the 3rd page audit completes (and after every subsequent page).

## How to Check
```
1. Count completed AUDIT-REPORT.md files: N
2. If N >= 3:
   Does a systemic-synthesis.md file exist in the batch directory?
   Does it list findings appearing in 2+ reports?
```

## Pass Criteria
  N < 3              --> Gate not yet active. Proceed.
  N >= 3, file EXISTS --> Systemic patterns identified. Proceed.
  N >= 3, file ABSENT --> Lead has NOT synthesized. BLOCKING.

  File EXISTS --> Proceed to next audit.
  File ABSENT --> STOP. Lead must spawn synthesis agent NOW.

## On Failure
- STOP all further audits.
- Lead MUST spawn a synthesis agent that:
  1. Reads ALL completed AUDIT-REPORT.md files
  2. Identifies any finding appearing in 2+ reports
  3. Classifies each as SYSTEMIC or SOVEREIGN (page-specific)
  4. Writes systemic-synthesis.md with:
     - SYSTEMIC findings (appear in 2+ pages)
     - Recommended systemic fix (not per-page fix)
     - Pages affected
  5. Presents systemic findings to user
- After synthesis file exists, resume audits.

## Why This Gate Exists
The AD lead had 6 audit reports each mentioning width too narrow
(860px at 1440px = 40% wasted space). The lead never synthesized
them into a systemic finding. The user had to say: "WHY IS THE
WIDTH SO NARROW ON ALL OF THESE." With a synthesis gate after
audit 3, the lead would have identified this pattern and proposed
a systemic fix proactively.

## PASS Example
After audit 3 (AD-005): Lead spawns synthesis agent. Agent reads
AD-006, AD-003, AD-005 reports. Finds "width too narrow" in all 3.
Writes systemic-synthesis.md: "SYSTEMIC: Content width (860px)
creates excessive dead space at 1440px viewport. Appears in 3/3
audited pages. Recommend: widen to 1100px." PASS.

## FAIL Example
After audit 3: Lead proceeds to audit 4 without spawning synthesis.
No systemic-synthesis.md exists. FAIL. Stop. Synthesize first.

===================================================================
Cross-page patterns are the HIGHEST VALUE output of batch audits.
Without synthesis, each page is audited in isolation.
"POTENTIALLY SYSTEMIC" findings left uninvestigated = GATE FAILURE.
===================================================================


===================================================================
======= GATE 6: FIX TRIGGER =====================================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER ALL AUDITS
===================================================================

## When to Check
AFTER all page audits in a batch are complete.

## How to Check
```
1. Count pages with verdict DO-NOT-SHIP: M
2. Count WOULD-NOT-SHIP findings appearing in 3+ pages: K
3. If M > 0 OR K > 0: FIX IS MANDATORY.
```

## Pass Criteria
  M == 0 AND K == 0 --> No mandatory fixes. Lead may propose optional.
  M > 0 OR K > 0    --> Fixes are MANDATORY. Lead MUST present fix list.

  If MANDATORY:
  Lead MUST immediately present to user:
    1. Prioritized fix list (systemic first, then per-page)
    2. Fix team structure
    3. "Proceed with fixes?" prompt
  Lead CANNOT skip this. Lead CANNOT wait for user to ask.

## On Failure (Lead does not present fix list)
- The lead is NOT following the protocol.
- Remind lead: "GATE 6: [M] pages are DO-NOT-SHIP and/or [K]
  WOULD-NOT-SHIP findings are systemic. You MUST present a fix
  list. Do NOT wait for the user to ask."

## Why This Gate Exists
The AD plan said "Fix team deferred (audit-only pass)." When audits
returned DO-NOT-SHIP verdicts (AD-002, AD-006), the lead followed
the plan literally rather than using judgment. The user had to say:
"Please fix everything here especially the width constraints."

The fix trigger makes this automatic: severe verdicts FORCE the lead
to propose fixes. The lead doesn't need judgment — the gate decides.

## PASS Example
Audits complete: AD-002 is DO-NOT-SHIP, AD-006 is DO-NOT-SHIP.
M = 2. Gate triggers. Lead presents: "2 pages are DO-NOT-SHIP.
Systemic issues: width too narrow (all 6), no visual ending (5/6).
Fix team: 6 fixers + 1 verifier. Proceed?" PASS.

## FAIL Example
Audits complete with 2 DO-NOT-SHIP verdicts. Lead says:
"Audit phase complete. Ready for next phase." Lead did NOT present
fix list. FAIL. Gate 6 violation.

===================================================================
When pages are DO-NOT-SHIP, fixes are not optional.
When WOULD-NOT-SHIP findings are systemic, fixes are not optional.
The lead MUST propose. The user decides whether to proceed.
===================================================================


===================================================================
======= GATE 7: INDEPENDENT VERIFICATION ========================
===================================================================
MANDATORY — BLOCKING — NO EXCEPTIONS — CHECK AFTER FIXES
===================================================================

## When to Check
AFTER all fixers have completed their work.

## How to Check
```
1. Does a verification report exist?
2. Was it written by an agent OTHER THAN any fixer?
3. Does it include Playwright screenshots of EVERY fixed page?
4. Does it include at least 1 programmatic check per fix?
```

## Pass Criteria
  ALL four conditions met --> Fixes are VERIFIED. Declare complete.
  ANY condition not met   --> Fixes are UNVERIFIED. BLOCKING.

## On Failure
- DO NOT declare fixes complete.
- Spawn independent verification agent:
  1. Agent MUST be different from all fixer agents
  2. Agent MUST navigate to every fixed page with Playwright
  3. Agent MUST take screenshots at 1440px and 768px
  4. Agent MUST run at least 1 programmatic check per fix:
     - Soul compliance: spot-check border-radius, box-shadow
     - Fix-specific: does the claimed fix actually exist in DOM?
     - Inversion test: "If this fix were absent, would I notice?"
  5. Agent writes verification-report.md
- After verification report exists, declare fixes complete.

## Why This Gate Exists
AD fixers self-certified their work. No independent agent checked
whether fixes actually improved the visual result. OD had 187
programmatic DOM tests run by an independent verifier, catching
2 false positives (font-loading timing artifact, scroll-animation
artifact). Self-certification is the equivalent of approving your
own code review.

## PASS Example
6 fixers complete. Lead spawns verifier-agent (not any of the 6 fixers).
Verifier navigates to all 6 pages, screenshots each at 2 viewports,
runs spot-checks (border-radius: 0 on 10 random elements per page,
fix-specific DOM checks). Writes verification-report.md:
"6/6 pages verified. 12 screenshots. 72 programmatic checks. 0 failures."
PASS.

## FAIL Example
6 fixers complete. Lead declares: "All fixes applied. Fix reports
confirm 0 soul violations." No independent verifier was spawned.
No verification-report.md exists. FAIL. Fixes are UNVERIFIED.

===================================================================
The fixer and the verifier MUST be different agents.
Self-certification is NOT verification.
Fixes without independent verification are UNVERIFIED.
===================================================================


███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████

# GATE EXECUTION SUMMARY

███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████

## Gate Execution Timeline

```
PRE-FLIGHT
  [GATE 1] Playwright Alive? --> YES: spawn auditors. NO: abort.

PER-AUDITOR (after each completes)
  [GATE 2] Screenshots >= 6?  --> YES: valid.  NO: reject, respawn.
  [GATE 3] Cold Look locked?  --> YES: valid.  NO: reject, respawn.
  [GATE 4] Language clean?    --> YES: valid.  NO: reject if 4+ terms.

AFTER 3+ PAGES AUDITED
  [GATE 5] Synthesis exists?  --> YES: continue. NO: stop, synthesize.

AFTER ALL AUDITS
  [GATE 6] Fix trigger?       --> Severe verdicts: MUST propose fixes.

AFTER ALL FIXES
  [GATE 7] Independent verify? --> YES: complete. NO: spawn verifier.
```

## Gate Failure Quick Reference

| Gate | Trigger | PASS | FAIL Action |
|------|---------|------|-------------|
| 1 | Pre-flight | Screenshot exists | Abort. Wait for Playwright. |
| 2 | Per-auditor | >= 6 PNGs | Reject findings. Respawn auditor. |
| 3 | Per-auditor | Cold-look file exists first | Reject. Respawn. |
| 4 | Per-auditor | 0-3 CSS terms | 4+: Reject. Respawn with language emphasis. |
| 5 | After 3+ pages | Synthesis file exists | Stop audits. Spawn synthesis agent. |
| 6 | After all audits | Fix list presented if needed | Remind lead. Present fix list. |
| 7 | After fixes | Independent verifier report | Spawn verifier (not a fixer). |

## The One Meta-Rule

> **No gate can be bypassed, waived, or deferred.**
>
> If a gate fails, the work that failed it is INVALID.
> Invalid work cannot be rescued by reinterpretation.
> Invalid work must be REDONE.
>
> This is not bureaucracy. This is the lesson from 7 human
> interventions that cost ~2-3 hours and 25-30% of total wall time.
> Gates are cheaper than rework.
