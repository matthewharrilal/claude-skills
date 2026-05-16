# EMBEDDED PERCEPTUAL AUDIT — Copy Into Every Agent Prompt

This block MUST be included in every agent prompt that produces visual output.
Copy it verbatim. Do not paraphrase. Do not abbreviate.

---

## THE BLOCK (copy everything between the ═══ lines)

```
═══════════════════════════════════════════════════════════════════════════
MANDATORY: PERCEPTUAL AUDIT — BEFORE DECLARING DONE
═══════════════════════════════════════════════════════════════════════════

After finishing your work, BEFORE declaring done:

1. Open your page in Playwright at your working viewport width
2. Wait for fonts: document.fonts.ready
3. Disable animations: animation: none !important; opacity: 1 !important
4. Take a VIEWPORT screenshot (not full-page)
5. LOOK at the screenshot — do NOT check rules, just LOOK
6. Answer FIVE questions in PLAIN LANGUAGE (include in your report):

   PA-01: "What's the first thing that bothers me?"
       → Not a rule. What VISUALLY bothers you.
       → BAD: "border-radius is 0" (that's a rule check)
       → GOOD: "left column text is crushed" (that's visual)

   PA-02: "Is any text uncomfortable to read?"
       → Check every text block at this viewport width
       → Are any columns too narrow? Words stacking vertically?
       → Would you comfortably read this for 10 minutes?

   PA-03: "Does this feel like one designer made it, or three?"
       → Visual coherence — do all sections belong together?

   PA-04: "Where does my eye go first? Is that where it SHOULD go?"
       → Is the visual hierarchy working as intended?

   PA-05: "Would I put my name on this? What would I fix first?"
       → If NO: identify what you'd fix and FIX IT before declaring done

7. SCROLL through the page — not just the viewport:
   → Scroll down 80% of viewport height, screenshot
   → Repeat until bottom of page
   → Note anything that bothers you as you scroll
   → Section transitions, dead zones, rhythm breaks

8. If ANY answer reveals a visual problem:
   → FIX IT before declaring done
   → Re-screenshot after fix
   → Re-answer PA-01 through PA-05
   → Repeat until all five are clean

9. ALSO: Resize viewport to 768px and screenshot
   → Any layout that looked fine at 1440px may squeeze
   → If squeezing occurs, fix the responsive behavior

LANGUAGE RESTRICTION: Your answers may NOT contain CSS property names
(px, rem, border-radius, padding, margin, font-size, flex, grid, etc.).
Use human words: cramped, spacious, jarring, heavy, light, broken, polished.

YOUR WORK IS NOT COMPLETE until PA-01 through PA-05 answers are in your
report AND all answers are clean AND you scrolled through the full page.
Missing answers = INCOMPLETE output.

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

If an agent's report is missing the Perceptual Audit section:
→ The output is INCOMPLETE
→ Before accepting the work, spawn a Quick Mode audit agent
→ Or have Lead run Embedded Mode on the file

If an agent's answers are rule-based instead of perceptual:
→ The answers are INVALID
→ Re-ask with emphasis: "Not rules. What do you SEE?"

---

## EXAMPLE GOOD vs BAD REPORTS

### BAD (Rule-checking in disguise):
```
## PERCEPTUAL CHECK
PA-01: border-radius is 0 on all elements
PA-02: fonts are correctly loaded (Instrument Serif, Inter, JetBrains Mono)
PA-03: all sections comply with AD-CONVENTION-SPEC
PA-04: h1 has correct visual weight per token spec
PA-05: YES — all rules pass
```
→ INVALID. These are rule checks, not visual reactions.

### GOOD (Actual perceptual judgment):
```
## PERCEPTUAL CHECK
PA-01: The bento grid section has a very narrow left column. The text
       is stacking one word per line. It looks broken, not designed.

PA-02: Yes — the left column in the bento grid. Every word wraps to its
       own line. Uncomfortable to read — feels like reading a bookmark.

PA-03: The header and main content feel polished, but the bento grid
       feels like a different project entirely. Two designers, not one.

PA-04: Eye goes to the header (correct), but then gets stuck on the
       broken bento column instead of flowing to the main content.

PA-05: NO — I would fix the bento grid column width before shipping.
       It looks unfinished.

Status: FIXING — adjusting grid to give content room to breathe
```
→ VALID. Agent actually looked and reacted to what they saw.
