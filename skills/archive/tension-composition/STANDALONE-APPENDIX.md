# Tension-Composition Standalone Appendix

**This file contains output formatting, divergence verification, edge cases, and invocation protocol for standalone TC mode (direct `/tension-composition` invocation, NOT via /build-page).**

When invoked as a sub-skill by /build-page, the TC agent stops at Phase 4.5 (Sub-Skill Output Mode) and does NOT use this appendix.

---

## Phase 5: Output

Generate TWO outputs:

### Output A: Conventions Brief (Telescope Distillate, ~60-80 lines)

The planner distills the full pipeline output into a conventions brief for the builder:

**Section 1: Content Direction (~15 lines)**
- 3-5 highest-yield axis results (one sentence each: "Reader needs to [VERB] [WHAT] because [CONTENT PROPERTY]")
- Primary tension statement
- Resolution direction (metaphor name + 1-sentence rationale)

**Section 2: Zone Semantic Map (~10 lines)**
- Each zone named with semantic role + progression direction
- Direction principle in one sentence

**Section 3: Core Principle (~5 lines)**
- What makes this page rich (1 sentence)
- What was rejected and why (1 sentence about restraint)
- Squint test target (what the page looks like from 10 feet away)

**Section 4: CSS Domain Extrapolation (~30 lines)**
- For each of 6 CSS domains: progression principle + extrapolation for unstated decisions
- Format: `[Value]: [token] // [zone name] -- [1-line reason]`

**Volume ceiling: 80 lines.** If the brief exceeds 80 lines, compress.

### Output A-Full: The Thought Process Document (for reference/audit)

Show every step explicitly:
1. Content assessment (Phase 0 classification)
2. Content analysis summary
3. Multi-axis questioning results (all axes, with yield ratings)
4. Tension derivation (all axis tensions, with richness scores)
5. Selected tension and why (with Addition Test, BECAUSE test, richness formula)
6. Metaphor candidates, composite scores, and winner (with isomorphism table)
7. Property-to-mechanism translation table (5-category extraction)
8. Coherence check results
9. Invented components and justification
10. Fractal consistency verification

### Output B: The HTML Compositional Layout

A complete, self-contained HTML file that:
- Uses ONLY KortAI design system CSS (no soul violations)
- Implements the metaphor through concrete mechanisms
- Contains the actual content (or representative content if full content is too large)
- Passes the Soul Test (5 questions)
- Includes `<style>` block with all CSS inline (single-file, no external dependencies)

---

## Edge Cases & Failure Modes

### Structureless Content (flat lists, FAQs, tip collections)
The pipeline degrades -- forces metaphor onto content that doesn't need one. **Fix**: The cosmetic tension exit ramp (Phase 2 gate) handles this. If all tensions are COSMETIC, skip Phase 3 and proceed with direct component mapping.

### Already-Visual Content (code-heavy, diagram-heavy, table-heavy)
The pipeline breaks -- assumes content is raw prose needing visual structure. **Fix**: Phase 0A Content Type Classification routes visual-dominant content to the PRESENTATION-INTRINSIC path.

### Emotionally Flat Content (reference docs, tool installation)
Similar to structureless. FEEL and BECOME axes produce LOW YIELD. **Fix**: If FEEL = LOW YIELD AND BECOME = LOW YIELD, flag as "pragmatic content." Weight DO and UNDERSTAND double. Accept "no metaphor" as optimal outcome.

### Zero-Tension Content (perfect alignment with system)
Pipeline breaks -- both sides agree. **Fix**: Phase 2 tension threshold gate routes to zero-tension path.

### Maximum-Tension Content (total opposition)
Pipeline's sweet spot. Maximum tension = maximum creative energy. No fix needed.

### Scale Problems (too short / too long)
Short content gets over-designed; long content gets under-scoped. **Fix**: Phase 0B scope assessment with word-count categories.

### Multi-Metaphor Content (section-level variation needed)
Single metaphor fails for structurally heterogeneous content. **Fix**: Phase 0C section identification + section-aware composition. One metaphor with movement-level variations, not a collage.

### Equal-Richness Axes (tied tension)
Use tiebreaker hierarchy: most shared structural DNA > UNDERSTAND > FEEL > BECOME > DO.

### Determinism
The pipeline is deterministic in all phases EXCEPT the constrained associative search (Phase 3.4). Multiple valid metaphors may exist for the same content. This is by design -- the pipeline is a creative scaffold, not a compiler. If determinism is required, document the selected metaphor in a COMPOSITION BRIEF for future reference.

---

## Phase 5: Divergence Verification (NOW ACCESS CASE STUDIES)

**After Phase 4 completion, you may NOW consult:**

- `design-system/compositional-core/case-studies/` (pattern library)
- Read 2-3 MOST SIMILAR case studies to your committed metaphor

**Purpose of Phase 5:**

NOT to get implementation ideas (you already built in Phase 4).

TO verify your metaphor diverges from library patterns (or justify convergence).

### Step 5.1 -- Select Similar Case Studies

**Scan `/case-studies/_INDEX.md` (titles + tension summaries only).**

**Identify 2-3 case studies with SIMILAR tensions to yours:**
- Similar axis (FEEL, UNDERSTAND, BECOME)
- Similar tension type (warmth/austerity, complexity/clarity, etc.)

**Read THOSE case studies. DO NOT read all case studies.**

### Step 5.2 -- Divergence Comparison Table

**For each similar case study, complete this table:**

| Comparison Dimension | Your Metaphor | Case Study Metaphor | Divergence? |
|---------------------|---------------|---------------------|-------------|
| **Metaphor domain** | [yours] | [theirs] | DIFFERENT / SAME |
| **Structural isomorphisms** | [your mappings] | [their mappings] | DIFFERENT / SOME OVERLAP / SAME |
| **Section architecture** | [your structure] | [their structure] | DIFFERENT / SIMILAR / SAME |
| **Vocabulary** | [your labels] | [their labels] | DIFFERENT / SAME |
| **Mechanisms used** | [your techniques] | [their techniques] | DIFFERENT / OVERLAP / SAME |

### Step 5.3 -- Divergence Verdict

**For each case study comparison:**

**If divergence = DIFFERENT on 3+ dimensions:**
STRONG DIVERGENCE -- Your metaphor is novel. Proceed to Output.

**If divergence = SAME/SIMILAR on 3+ dimensions:**
CONVERGENCE DETECTED -- Proceed to Step 5.4 (justification required)

### Step 5.4 -- Convergence Justification (If Needed)

**If your metaphor converged with a library pattern:**

**Answer these questions with STRONG evidence:**

1. **Did you complete Phases 1-3 WITHOUT reading this case study?** YES / NO
   - If NO: Violation of Phase 0D prohibition. Derivation is INVALID.

2. **Did content tension analysis INDEPENDENTLY lead to the same domain?** YES / NO
   - If NO: Pattern-matching occurred. Regenerate with constraint (ban this metaphor).

3. **Is the content tension IDENTICAL to the case study's tension?** YES / NO
   - If NO: Convergence is coincidental, not justified. Regenerate.
   - If YES: Proceed to question 4.

4. **Do you have DIFFERENT structural isomorphisms despite same domain?** YES / NO
   - If YES: Acceptable convergence (same domain, different execution).
   - If NO: Full replication. Regenerate with explicit constraint.

**If justification FAILS:** Regenerate metaphor with explicit constraint: "BANNED metaphors: [list]. Derive NEW metaphor for same tension."

### Step 5.5 -- Extraction of Mechanisms (Final)

**After divergence verification, extract any NEW mechanisms your work discovered:**

**Mechanisms in library but NOT in your work:**
- [List -- you didn't need these]

**Mechanisms in your work but NOT in library:**
- [List -- you discovered these]

**If you discovered NEW mechanisms, document them for future library addition.**

---

### Stale Tension (re-using a resolved tension)
If a tension has been resolved in a previous exploration, force a DIFFERENT metaphor by adding constraints: "The geological metaphor is taken. What OTHER domain resolves warmth vs austerity?"

### Artificial Tension (manufactured opposition)
Detection: the BECAUSE test. "The reader needs X BECAUSE [specific content property]." If you cannot complete the sentence, the need is manufactured. Do not proceed.

---

## Test Content Recommendations

Three pieces that stress DIFFERENT pipeline phases:

### Boris Cherny Extraction (FEEL tension)
- Tests Phase 2 hardest: warmth/mentorship vs angular authority is the deepest emotional opposition
- Content structure: concentric layers descending toward philosophical core
- Predicted metaphor space: manuscript/codex, craftsman's workshop, geological strata

### Gas Town / Yegge Extraction (UNDERSTAND tension)
- Tests Phase 3 hardest: bridging "8-role interconnected network" with "flat sharp rectangles"
- Content structure: hub-spoke with nested hierarchies
- Predicted metaphor space: circuit board, building floor plan, periodic table

### Master Playbook (BECOME tension)
- Tests Phase 4 hardest: translating temporal progression into static CSS with KortAI vocabulary
- Content structure: linear staircase (Level 0-7) with cross-cutting reference layers
- Predicted metaphor space: building under construction, curriculum/syllabus, elevation map

---

## Invocation

```
/tension-composition [content-path-or-pasted-content]
```

Or describe what content to analyze:
```
/tension-composition "analyze the Ralph mastery guide"
```

The skill reads the content, runs the full pipeline, and produces both outputs.

---

## Appendix: Test Results Summary

### Pipeline Test Data (15 layouts, 3 content pieces)

The pipeline was tested against 3 content pieces with 5 metaphor candidates each. Key findings:

1. **Pipeline predicts metaphor RICHNESS, not perceptual QUALITY.** Tension resolution score has ~0 correlation with visual quality.
2. **Pipeline disagreed with auditors on ALL THREE top picks.** The pipeline's structural scoring consistently overweighted deep opposition and underweighted execution quality.
3. **Best layouts had IMPLICIT metaphors** (graduated backgrounds, spatial hierarchy), worst had EXPLICIT (labeled connectors, announced transitions).
4. **Dead zone epidemic**: 5/15 layouts suffered from excessive empty space. All were metaphors that conceptualize transitions as EMPTY SPACE.
5. **Stats bars universally weak**: Every layout with a horizontal metadata strip had problems at 768px.
6. **Zero soul violations** across 15 layouts -- KortAI constraints are invisible infrastructure.

These findings drove improvements R1-R6, which are integrated into the main SKILL.md pipeline.
