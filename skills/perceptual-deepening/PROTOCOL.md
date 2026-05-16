<!-- PERCEPTUAL AUDIT SKILL — PROTOCOL.md -->
<!-- VERSION: v3.0 — Agent-Optimized Perceptual Protocol -->
<!-- SUPERSEDES: SKILL-v2.md ship-readiness, plan's inline questions/anti-patterns -->
<!-- LAST UPDATED: 2026-02-11 -->

# PROTOCOL.md — The Perceptual Audit Protocol

This file contains WHAT to do during a perceptual audit.
For WHEN/HOW to validate, see GATES.md.
For WHO does what, see TEAM.md.

---

███████████████████████████████████████████████████████████████████████████
█                                                                         █
█   THE ONE RULE                                                          █
█                                                                         █
█   React to what you SEE before you check what you KNOW.                 █
█                                                                         █
█   "React" demands perception. "Before" creates temporal ordering.       █
█   Perception MUST precede analysis. Always. No exceptions.              █
█                                                                         █
███████████████████████████████████████████████████████████████████████████

---

## SECTION 1: MODES OF INVOCATION

| Mode | Trigger | Agents | Questions | Duration |
|------|---------|--------|-----------|----------|
| **Standalone** | `/ship [page]` or `/judge [page]` | 4-6 per page | All 28 (PA-01 to PA-28) | ~60-90 min/page |
| **Standard** | Batch audit of similar pages | 3 per page | Tier 1 + Tier 2 (PA-01 to PA-20) | ~35-45 min/page |
| **Quick** | `/look [page]` | 0 (lead does it) | Tier 1 only (PA-01 to PA-05) | ~5 min |
| **Embedded** | Automatic after any visual output | 0 (agent does it) | Q1-Q3 only | ~30 sec |

**Default for new work:** Standalone for first audit of a page type.
Standard for subsequent pages of the same type.

---

## SECTION 2: PRE-FLIGHT CHECKLIST

Before ANY audit, the Lead MUST complete:

```
[ ] HTTP server running from showcase root
    cd docs-spa/app/showcase && python3 -m http.server 8080 &
    VERIFY: curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/
    (expect 200)

[ ] GATE 1 PASSED: Playwright can navigate and screenshot
    (see GATES.md — Gate 1: PLAYWRIGHT ALIVE)

[ ] Output directories created
    mkdir -p {output-path}/{page-id}/screenshots

[ ] Input HTML files exist (Glob for *.html)

[ ] Lock Sheet exists or will be generated
    (research contextualizer produces lock-sheet.md)
```

If ANY check fails: STOP. Fix before proceeding.

---

## SECTION 3: COLD LOOK PROTOCOL

===================================================================
THE COLD LOOK IS THE MOST IMPORTANT 60 SECONDS OF THE AUDIT.
IT CAPTURES UNBIASED FIRST IMPRESSIONS BEFORE ANALYSIS CONTAMINATES.
===================================================================

### The 5 Steps

```
1. CLEAR: Close all CSS files, spec documents, convention references.
   You are a person seeing this page for the first time.
   YOU MUST NOT have read the Lock Sheet yet.
   YOU MUST NOT have read any source files.

2. LOOK (5 seconds): Open the viewport-only screenshot.
   Do NOT read text. Do NOT examine details.
   Absorb shape, color, weight, impression.

3. REACT (immediate): Write four responses. They are LOCKED.

   COLD LOOK ([WIDTH]px):
   Gut reaction: [one sentence -- what did you FEEL?]
   Worst thing:  [one element or area -- what would you fix first?]
   Best thing:   [one element or area -- what should be protected?]
   Ship verdict: YES / YES WITH RESERVATIONS / NO

4. LOCK: These responses are FINAL. They CANNOT be changed after
   reading specs. Modifying a Cold Look is AP-22: PROTOCOL VIOLATION.

5. CHECKPOINT WRITE: IMMEDIATELY write reactions to:
   {output-path}/cold-look-{agent-name}.md
   This protects reactions if context compaction occurs.
   THIS WRITE MUST HAPPEN BEFORE ANY ZONE ANALYSIS.
```

### Cold Look Anti-Pattern Detection

**GOOD Cold Look (perceptual, immediate):**
```
Gut reaction: The page feels confident and spacious, but the bottom
              third seems to run out of energy.
Worst thing:  The narrow column on the left where text is stacking
              vertically — it looks like a bookmark, not a content area.
Best thing:   The header typography commands attention without shouting.
Ship verdict: YES WITH RESERVATIONS
```

**BAD Cold Look (analytical, technical — THIS IS FAILURE):**
```
Gut reaction: The layout uses a 4-column grid with appropriate spacing
              and the color palette matches the design system tokens.
Worst thing:  The third grid column computes to approximately 130px
              which is below the minimum recommended width.
Best thing:   The h1 element uses the correct font-family and weight.
Ship verdict: YES
```

The bad example could be written without seeing the page. REJECT IT.

### Per-Viewport Cold Looks

Complete Cold Look independently for EACH viewport:
- 1440px (desktop) — PRIMARY
- 768px (tablet)
- 1024px (laptop)

Do NOT let one viewport's reaction influence another.
Each Cold Look is independent.

---

## SECTION 4: SCROLL-THROUGH PROTOCOL

===================================================================
WHY SCROLL-THROUGH, NOT FULL-PAGE SCREENSHOTS:
A full-page screenshot of a 15,000px page shrinks everything so small
that a crushed 130px column looks "fine" at thumbnail scale.
Scrolling at viewport width makes problems immediately obvious.
THE SCROLL EXPERIENCE IS THE AUDIT.
===================================================================

### The 5 Dimension Passes

Scan ALL scroll-through screenshots once PER DIMENSION.
This reveals systemic issues that zone-by-zone analysis misses.

| Pass | Dimension | What To Watch |
|------|-----------|---------------|
| 1 | **READABILITY** | Word stacking, squinting, lines too wide, text squeezed. Could you read this for 10 minutes? |
| 2 | **SPATIAL BALANCE** | Blur vision. Only shapes and weight. Dead space? Jarring jumps? Heavy/light? Margins generous or anxious? |
| 3 | **HIERARCHY & FLOW** | Focal points. Section transitions. Narrative momentum or disconnected slides? |
| 4 | **CONSISTENCY** | Identical elements match? Visual rhythm? Gray family? Dialect shifts as you scroll? |
| 5 | **SHIP TEST** | Senior designer. Fix with 10 more minutes? Next to Stripe, proud or embarrassed? Any wince? |

### Screenshot Protocol

```
DO:    Take VIEWPORT-SIZED screenshots (not fullPage: true)
DO:    Scroll in 80% viewport-height steps
DO:    Capture EVERY scroll position
DO:    Take screenshots at ALL 3 viewports (1440, 1024, 768)

DO NOT: Use fullPage: true (AP-23: Thumbnail-Scale Blindness)
DO NOT: Skip any scroll position
DO NOT: Skip any viewport width
```

---

## SECTION 5: THE 28 PERCEPTUAL QUESTIONS

### Tier 1: The Mandatory Five (Every Audit, Every Mode)

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-01** | What's the first thing that bothers you? | Misplaced focal points, gestalt discomfort |
| **PA-02** | Is any text uncomfortable to read? Point to the worst spot. | Narrow columns, cramped containers |
| **PA-03** | Does this feel like one designer made it, or three? | Design dialect shifts, visual fragmentation |
| **PA-04** | Where does your eye go first? Is that where it SHOULD go? | Competing focal points |
| **PA-05** | Would you put your name on this? What would you fix first? | Gap between "passes rules" and "is good" |

### Tier 2: The Standard Fifteen (Standard + Standalone)

**Readability and Comfort:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-06** | Are any words stacking vertically, one per line? | Bento-grid failure mode |
| **PA-07** | Can you read the longest paragraph without losing your place? | Line length >80 CPL |
| **PA-08** | Is there text you have to squint to read? | Sub-minimum font sizes |

**Spatial Balance and Weight:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-09** | Is there dead space that serves no purpose? | Viewport-scale dead zones |
| **PA-10** | If you squint until you can't read text, does the layout look balanced? | Macro composition failure |
| **PA-11** | Are margins generous (confident) or anxious (clutching)? | Spacing psychology |

**Visual Flow:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-12** | Do your eyes flow smoothly section to section, or get stuck? | Visual walls, flow-breaking dividers |
| **PA-13** | Is there a clear visual ending, or does the page just stop? | Abrupt endings |

**Grid and Layout:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-14** | Does every column have room for its content to breathe? | Content-container misfit |
| **PA-15** | Trace the left edge of every content block — how many starting positions? | Alignment scatter |

**Consistency:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-16** | Pick two elements that should look identical. Do they? | Contextual inconsistency |
| **PA-17** | Is there visual rhythm (like a beat), or does it feel random? | Arrhythmic sequencing |

**Color and Emotion:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-18** | Do all grays/neutrals feel like the same family? | Color temperature inconsistency |
| **PA-19** | Is any element from a different website? | Visual intruders |
| **PA-20** | Describe this page's personality in three words. Does it match? | Emotional misalignment |

### Tier 3: Deep Dive Eight (Standalone Only)

**Responsiveness:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-21** | Does everything look designed for this width, or squeezed? | Afterthought responsive |
| **PA-22** | Would a user with ONLY this screen feel served or punished? | Mobile-as-degradation |
| **PA-23** | What breaks if you resize 200px narrower? | Fragile breakpoints |

**Cross-Page:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-24** | Does this page feel like family with its siblings? | Cross-page dialect drift |
| **PA-25** | Cover the header — could you identify the design system? | Visual anonymity |

**Architectural Challenge:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-26** | Is any convention CAUSING a visual problem? | Fossilized conventions |
| **PA-27** | From scratch, would you design it this way? | Constraint-shaped design |

**Adversarial:**

| ID | Question | What It Catches |
|----|----------|-----------------|
| **PA-28** | How could someone make this terrible while passing every rule? | Layout vulnerabilities |

---

## SECTION 6: THE DUAL SEVERITY TRACK

### Rule Track (existing, unchanged)
- **SOUL VIOLATION** --> Always fix (binary)
- **CONVENTION BUG** --> Always fix (binary)
- **OVERFLOW** --> Usually fix (binary)

### Perception Track (perceptual audit output)
- **WOULD-NOT-SHIP** --> Designer would refuse to release
- **LOOKS-WRONG** --> Something visually off
- **COULD-BE-BETTER** --> Polish opportunity

### Four Critical Rules

1. Perception Track findings can NEVER be reclassified to Rule Track
2. Cannot be dismissed because "the convention allows it"
3. A finding can exist on BOTH tracks simultaneously
4. When convention and perception conflict, ESCALATE to human

### Perceptual Priority Override

===================================================================
PERCEPTUAL FINDINGS OUTRANK RULE FINDINGS FOR FIX PRIORITIZATION.
===================================================================

A page that passes ALL rules but feels cramped/empty/abrupt is STILL
a failure. Fix order:

1. WOULD-NOT-SHIP perceptual findings (highest priority)
2. SOUL VIOLATIONS (binary rule fixes)
3. LOOKS-WRONG perceptual findings
4. CONVENTION BUGS
5. COULD-BE-BETTER items (lowest priority)

This ordering exists because the skill was created to catch exactly
the failures that rule-checking misses. If rule fixes are prioritized
over perceptual fixes, the skill has no purpose.

---

## SECTION 7: THE SOVEREIGNTY PRINCIPLE

> "Perceptual Auditing evaluates the EXECUTION of research-backed
> decisions, never the decisions themselves. Research defines WHAT.
> Perception judges HOW."

### Three Sovereignty Categories

| Category | What It Covers | Can Be Challenged? |
|----------|---------------|-------------------|
| **ALWAYS-LOCKED** | Soul rules: border-radius: 0, box-shadow: none, no drop-shadow | NEVER |
| **LOCKED** | Research-backed decisions: axis choice, density pairing | Decision: NO. Execution: YES |
| **CHALLENGEABLE** | Convention values, inherited defaults, builder choices | YES, with perceptual evidence |

### The Temporal Firewall

===================================================================
VISUAL AUDITORS MUST NOT SEE THE LOCK SHEET BEFORE COMPLETING
THEIR PERCEPTUAL WORK (Cold Look + all zone findings).

The Lock Sheet is introduced ONLY during synthesis (Weaver step).
If an auditor reads the Lock Sheet before completing perceptual work,
all their findings are CONTAMINATED by research knowledge.

Reading the Lock Sheet early is a PROTOCOL VIOLATION (AP-21).
===================================================================

---

## SECTION 8: ANTI-PATTERNS — THE 23 FAILURE MODES

===================================================================
These are not a reference table to read and forget.
Each anti-pattern is a BINARY RULE with a CONSEQUENCE.
If you detect an agent exhibiting an anti-pattern,
the affected findings are INVALID.
===================================================================

### Category A: Cognitive Escape

**AP-01 ANALYTICAL ESCAPE:**
Your first action after a screenshot MUST be writing a Cold Look
or zone reaction. If your next action is Read, Grep, or any file
operation, the audit is INVALID.

**AP-02 GREPPING FOR EXISTENCE:**
If your answer could be written without a screenshot, it is NOT
a perceptual finding. It is an analytical finding wearing
perceptual language. REJECT.

**AP-03 TECHNICAL DOCUMENTATION:**
If your finding describes CSS properties instead of visual experience,
it belongs in a structural audit, not a perceptual audit. REJECT.

**AP-04 PROPERTY-NAME ANSWERS:**
If your answer contains ANY CSS property name, REWRITE IT.
Use: cramped, spacious, heavy, light, floating, grounded.
NOT: padding, margin, flex, grid, opacity.

### Category B: Rule-Checking in Disguise

**AP-05 COMPLIANCE STATEMENT:**
"border-radius is 0 on all elements" is a rule check, not a visual
reaction. What VISUALLY bothers you? REWRITE.

**AP-06 SPEC COMPARISON:**
"matches the design system tokens" references a specification.
Describe what you SEE, not what the spec says. REWRITE.

**AP-07 PIXEL-VALUE PERCEPTION:**
"approximately 130px wide" uses pixel measurements. Say instead:
"so narrow that words stack one per line." REWRITE.

**AP-08 CONVENTION WORSHIP:**
A convention cited as proof despite visual evidence is a SOVEREIGNTY
VIOLATION. Conventions describe WHAT. Perception judges HOW IT LOOKS.

### Category C: Scope Failures

**AP-09 COMPONENT BLINDNESS:**
If no finding references relationships between elements, the audit
examined parts, not the whole. Look at how elements interact.

**AP-10 VIEWPORT TUNNEL VISION:**
If only 1440px and 768px were tested, you missed 1024px where
grids squeeze. MUST test at least 3 viewports.

**AP-11 CONTAINER VS VIEWPORT BLINDNESS:**
If you add a `@media (max-width: 1024px)` breakpoint but the container
is 860px and the viewport is 1440px, the breakpoint never fires.
Check CONTAINER width, not just viewport.

**AP-12 SELF-REFERENCE BLINDNESS:**
If no finding references industry standards or comparable work,
the audit assessed in a vacuum. Context matters.

### Category D: Completion Failures

**AP-13 DECLARING VICTORY AFTER WRITING CSS:**
If there is no post-fix screenshot, the fix is UNVERIFIED.
Writing CSS is step 1. SEEING the result is step 2.

**AP-14 PREMATURE SHIP DECLARATION:**
If PA-05 answer is suspiciously fast or shallow, the agent
didn't actually look. Push for specificity.

**AP-15 "NOTHING NEW" SURRENDER:**
If only one dimension was examined before declaring clean,
the audit is incomplete. Look harder. Look at different scales.
"I don't see anything new" is NOT acceptable.

**AP-16 FINDING-WITHOUT-LOOKING:**
If findings match the task prompt verbatim but not the actual page,
the agent is fabricating from its prompt, not perceiving. REJECT.

### Category E: Aesthetic Masking

**AP-17 AESTHETIC-USABILITY BLINDNESS:**
High overall rating coexisting with element-level problems.
A page can look "nice overall" while having a crushed column.
Check for this pattern.

**AP-18 HALO EFFECT:**
If the assessment only discusses the strongest dimension,
weaknesses are being ignored. Force examination of ALL dimensions.

### Category F: Sovereignty Violations

**AP-19 RESEARCH SUPPRESSION:**
Dismissing valid perception because "the convention allows it"
is suppressing the skill's purpose. Perception stands.

**AP-20 PERCEPTUAL OVERREACH:**
Attacking a LOCKED design decision (the WHAT, not the HOW).
The audit evaluates execution, not decisions.

**AP-21 TEMPORAL FIREWALL BREACH:**
Reading the Lock Sheet before completing Cold Look and zone findings.
All subsequent findings are contaminated. REJECT.

**AP-22 POST-LOCK REVISION:**
Modifying a Cold Look after encountering research or specs.
The Cold Look is LOCKED. Period.

### Category G: Scale Distortion

**AP-23 THUMBNAIL-SCALE BLINDNESS:**
Evaluating from a fullPage: true screenshot instead of scrolling
at viewport scale. At thumbnail scale, a crushed column looks fine.
MUST use viewport-sized screenshots and scroll through.

---

## SECTION 9: EMBEDDED MODE (Q1-Q3)

===================================================================
MANDATORY FOR EVERY AGENT THAT PRODUCES VISUAL OUTPUT.
THIS IS NOT A SEPARATE STEP. THIS IS PART OF "DONE."
===================================================================

```
EMBEDDED VISUAL JUDGMENT — RUN BEFORE DECLARING DONE

1. Open the page in Playwright at 1440px viewport
2. Take a screenshot
3. LOOK at the screenshot — do NOT check rules, just LOOK
4. Answer THREE questions (write in your report):

   Q1: "What's the first thing that bothers me?"
       NOT a rule. What VISUALLY bothers you.
       BAD: "border-radius is 0" (rule check)
       GOOD: "left column text is crushed" (visual)

   Q2: "Is any text uncomfortable to read?"
       Check every text block. Narrow columns? Words stacking?
       Would you read this for 10 minutes?

   Q3: "Would a designer ship this section as-is?"
       For each major section: YES or NO.
       If NO: what specifically would they change?

5. If ANY answer reveals a problem:
   FIX IT before declaring done.
   Re-screenshot. Re-answer Q1-Q3.
   Repeat until all three are clean.

6. ALSO: Resize to 1024px and screenshot.
   Grids that look fine at 1440px may squeeze at 1024px.

YOUR WORK IS NOT COMPLETE until Q1-Q3 are answered AND clean.
Missing Q1-Q3 = INCOMPLETE output.
```

---

## SECTION 10: LOCK SHEET GENERATION

The Lock Sheet classifies every design decision as LOCKED or CHALLENGEABLE.
It is generated ONCE per stage and reused across all page audits.

### Lock Sheet Agent Instructions

```
You are the Research Contextualizer. Your job:
Read all design conventions, identity research, and token files.
Produce a Lock Sheet that classifies decisions.

CLASSIFICATION DECISION TREE:
- Traces to formal finding (XX-F-NNN) with citation? -> LOCKED
- Convention cites research? -> LOCKED
- Convention value without citation? -> CHALLENGEABLE
- Inherited without re-validation? -> CHALLENGEABLE
- Builder choice within convention bounds? -> CHALLENGEABLE
- Unknown provenance? -> CHALLENGEABLE

OUTPUT STRUCTURE:
## ALWAYS-LOCKED (Do Not Question)
| Rule | Lock Source |

## LOCKED (Research-Backed)
| Decision | Lock Source | Research Chain | Auditable Execution Aspects |

## CHALLENGEABLE (Question If Visually Problematic)
| Convention | Current Value | Can Be Questioned If... |

## PREVIOUS FINDINGS (from prior audits)
| Finding ID | Description | Status |

YOU MAY NOT: Use Playwright, take screenshots, read HTML/CSS.
You are a FILE-READING agent. Keep under 200 lines.
```

---

## SECTION 11: WEAVER-SYNTHESIZER PROTOCOL

The Weaver reads all findings files and produces the AUDIT-REPORT.

### Weaver Tasks (Sequential)

1. **CONTAMINATION CHECK** — Flag findings with CSS property names,
   hex values, pixel measurements, spec references, or selectors.
   Exclude contaminated findings. Check for ALL anti-patterns.

2. **CROSS-REFERENCE against Lock Sheet:**
   - Flags LOCKED rule? -> RULE TRACK
   - Flags CONVENTION? -> PERCEPTION TRACK
   - Not in Lock Sheet? -> NOVEL PERCEPTION

3. **DEDUPLICATION** — Merge identical findings, note concordance.

4. **RANKING** — WOULD-NOT-SHIP first, then LOOKS-WRONG, then
   COULD-BE-BETTER.

5. **COLD LOOK CONCORDANCE** — Do gut reactions agree across auditors?

6. **SOVEREIGNTY CLASSIFICATION** — For each finding:
   - Targets locked DECISION? -> INVALID
   - Targets locked EXECUTION? -> VALID (note constraints)
   - Targets CHALLENGEABLE? -> VALID and ACTIONABLE
   - Genuine conflict? -> ESCALATE

7. **MULTI-VIEWPORT COMPARISON:**
   - Squeeze test: graceful degradation or collapse?
   - Content survival: all 1440px content visible at 768px?
   - Identity survival: designed for this width, or squeezed?

8. **CONVENTION CHALLENGES** from PA-26/PA-27

9. **FRAGILITY ASSESSMENT** from PA-28

10. **FINAL VERDICT:**
    - **SHIP:** No WOULD-NOT-SHIP. Few LOOKS-WRONG.
    - **SHIP WITH CONCERNS:** No WOULD-NOT-SHIP, multiple LOOKS-WRONG.
    - **DO NOT SHIP:** Any WOULD-NOT-SHIP survives validation.

### Audit Report Structure (~300-500 lines)

```
# AUDIT REPORT: {page-id}

## Verdict: [SHIP / SHIP WITH CONCERNS / DO NOT SHIP]

## Cold Look Summary
[All auditors' Cold Looks, concordance analysis]

## Top 5 Findings (ranked by visual impact)
1. [Finding] — [severity] — [concordance]
...

## All Findings by Track
### Perception Track
### Rule Track

## Contamination Report
[Which auditors were clean/minor/contaminated]

## Convention Challenges
[From adversarial PA-26/PA-27]

## Fragility Assessment
[From PA-28]

## Sovereignty Classifications
[Per-finding sovereignty mapping]

## Escalation Items (if any)
[Perception-vs-research conflicts]

## Positive Findings (what to protect)
[What's working well]
```

---

## SECTION 12: FIX EXECUTION PROTOCOL

### Fixer Agent Rules

```
1. ONE FIXER PER FILE — exclusive ownership, zero contention
2. MUST use Playwright to verify fixes visually
3. MUST run Embedded Mode Q1-Q3 after completing fixes
4. MUST NOT introduce soul violations (border-radius > 0,
   box-shadow, drop-shadow)
5. MUST write fix-report.md documenting every change
6. MUST take before/after screenshots at 1440px and 768px

FIX PRIORITY ORDER:
1. SYSTEMIC fixes first (from Gate 5 synthesis)
2. WOULD-NOT-SHIP per-page fixes
3. LOOKS-WRONG fixes
4. COULD-BE-BETTER (only if time permits)
```

### Post-Fix Visual Check (MANDATORY)

```
BEFORE DECLARING DONE:
1. Navigate to the fixed page at 1440px
2. Take a screenshot
3. Answer Q1-Q3:
   Q1: "What bothers me now?"
   Q2: "Any text still uncomfortable?"
   Q3: "Would a designer ship this?"
4. If ANY answer reveals a remaining problem, FIX IT.
5. Resize to 768px. Screenshot. Q1-Q3 again.
6. Only then write fix-report.md.
```

---

## SECTION 13: FORCING QUESTIONS (When Stuck)

If an auditor says "nothing seems wrong" or "I can't find issues":

**Level 1 — Surface:**
- What's the first thing that catches my eye?
- Is anything uncomfortable to read?
- Does anything feel cramped or stretched?

**Level 2 — Structure:**
- Does the grid make sense at this width?
- Are all columns earning their space?
- Is empty space intentional breathing or broken layout?

**Level 3 — Architecture:**
- Why is this container this wide?
- Who decided this column count? Research-backed?
- If I change the container width, what breaks? What improves?

**Level 4 — Ship-Readiness:**
- Would a designer show this in a portfolio?
- Would a user read this comfortably for 10 minutes?
- If a client saw this, would they ask "why does this look like that?"

**Level 5 — Nuclear Question:**
- If this were the ONLY page from this design system a user ever saw,
  would they understand the identity?

---

## SECTION 14: LANGUAGE REFERENCE

### Words You MUST Use (Perceptual)
heavy, light, cramped, spacious, jarring, smooth, floating, grounded,
anxious, confident, broken, polished, warm, cold, sharp, soft, trapped,
breathing, aggressive, timid, elegant, clunky, rhythmic, flat, dynamic,
static, balanced, lopsided, generous, stingy, professional, amateur

### Words You MUST NOT Use (Technical)
px, rem, em, %, hex (#), rgb, rgba, hsl, border-radius, box-shadow,
padding, margin, font-size, font-family, line-height, max-width,
min-width, flex, grid, gap, opacity, z-index, overflow, display,
position, transform, transition, animation, @media, :hover,
grid-template-columns, justify-content, align-items, background-color,
color: (as CSS property), font-weight, text-align, border-left,
border-right, border-top, border-bottom

### Self-Check Before Writing

Before writing your findings file, search your own text for the
MUST NOT words above. If ANY match: rewrite the offending sentence
in perceptual language.

Example rewrites:
- "padding is too small" --> "the text feels cramped against the edges"
- "max-width: 860px" --> "the content area is too narrow for the viewport"
- "grid-template-columns creates 130px cells" --> "the columns are so narrow that words stack vertically"
- "font-size is 12px" --> "the text is too small to read comfortably"
- "rgba(0,0,0,0.5) overlay" --> "a dark wash covers the content"
