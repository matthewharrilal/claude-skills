# EMBEDDED VISUAL JUDGMENT — Copy Into Every Agent Prompt

This block MUST be included in every agent prompt that produces visual output.
Copy it verbatim. Do not paraphrase. Do not abbreviate.

---

## THE BLOCK (copy everything between the ═══ lines)

```
═══════════════════════════════════════════════════════════════════════════
MANDATORY: VISUAL JUDGMENT — BEFORE DECLARING DONE
═══════════════════════════════════════════════════════════════════════════

After finishing your work, BEFORE declaring done:

1. Open your page in Playwright at 1440px viewport
2. Take a FULL-PAGE screenshot
3. LOOK at the screenshot — do NOT check rules, just LOOK
4. Answer THREE questions (include in your report):

   Q1: "What's the first thing that bothers me?"
       → Not a rule. What VISUALLY bothers you.
       → BAD answer: "border-radius is 0" (that's a rule check)
       → GOOD answer: "left column text is crushed" (that's visual)

   Q2: "Is any text uncomfortable to read?"
       → Check every text block at this viewport width
       → Are any columns too narrow? Words stacking vertically?
       → Would you comfortably read this for 10 minutes?

   Q3: "Would a designer ship each section as-is?"
       → For each major section: YES or NO
       → If NO: what specifically would they change?

5. If ANY answer reveals a visual problem:
   → FIX IT before declaring done
   → Re-screenshot after fix
   → Re-answer Q1-Q3
   → Repeat until all three are clean

6. ALSO: Resize viewport to 1024px and screenshot
   → Any grid or layout that looked fine at 1440px may squeeze at 1024px
   → If squeezing occurs, fix the responsive behavior

YOUR WORK IS NOT COMPLETE until Q1-Q3 answers are in your report
AND all answers are clean. Missing Q1-Q3 = INCOMPLETE output.

═══════════════════════════════════════════════════════════════════════════
```

---

## WHERE TO INCLUDE THIS

| Agent Type | Where to Add |
|------------|-------------|
| Builder agents | End of builder prompt, before file-write reminder |
| Fixer agents | End of fixer prompt, after fix instructions |
| Visual auditor agents | Beginning of audit prompt (it IS their primary job) |
| Fresh-eyes agents | After cold-look protocol (supplements, doesn't replace) |
| Verifier agents | After programmatic checks (visual check comes last) |
| Scribe agents | NOT NEEDED (scribes don't produce visual output) |
| Research agents | NOT NEEDED (research is file-only) |

---

## ENFORCEMENT

If an agent's report is missing the Visual Judgment section:
→ The output is INCOMPLETE
→ Before accepting the work, spawn a Quick Mode judgment agent
→ Or have Lead run Embedded Mode on the file

If an agent's Q1-Q3 answers are rule-based instead of perceptual:
→ The answers are INVALID
→ Re-ask with emphasis: "Not rules. What do you SEE?"

---

## EXAMPLE GOOD vs BAD REPORTS

### BAD (Rule-checking in disguise):
```
## VISUAL JUDGMENT CHECK
Q1: border-radius is 0 on all elements
Q2: fonts are correctly loaded (Instrument Serif, Inter, JetBrains Mono)
Q3: all sections comply with AD-CONVENTION-SPEC
Status: CLEAN
```
→ INVALID. These are rule checks, not visual reactions.

### GOOD (Actual visual judgment):
```
## VISUAL JUDGMENT CHECK
Screenshot: _ad-execution/screenshots/ad-003-1440.png

Q1: The "Advanced" bento grid section has a very narrow left column.
    The "Responsive Grid Collapse" card text is stacking one word per
    line. It looks broken.

Q2: Yes — the left column in the Advanced bento grid. At 1440px viewport
    the 4-column grid gives single-span cells about 143px of content width.
    Every word wraps to its own line. Uncomfortable to read.

Q3: Header: YES. Beginner section: YES. Intermediate section: YES.
    Advanced section: NO — the narrow column makes it look unfinished.
    Responsive section: YES.

Status: FIXING — reducing to 3-column grid for Advanced section
```
→ VALID. Agent actually looked and reacted to what they saw.
