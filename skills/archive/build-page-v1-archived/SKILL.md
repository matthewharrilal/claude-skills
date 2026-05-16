---
name: build-page
description: >
  Build a fully designed HTML page using the KortAI design system.
  Orchestrates: Opus builder with conventions brief, programmatic gate
  verification, 9-auditor perceptual audit with Tier 5 questions, and
  fix cycles. Input: content markdown. Output: self-contained .html.
  Trigger: /build-page, "build a page", "run the pipeline",
  "create a design system page", "turn this into a designed page".
---

# /build-page -- KortAI Design System Page Builder

## 0. MISSION

Build ONE HTML page that scores PA-05 >= 3.5 AND Tier 5 >= 7/9.
Three non-negotiables: container 940-960px, warm palette (R>=G>=B), every CSS value perceptible to a human eye.
The target is Flagship 4/4 -- a page with unified pervading metaphor, dynamic multi-coherence, compositional surprise, and fractal expression at all 5 scales.

## 1. INTAKE

1. Parse content source from command argument: `/build-page <path-to-content.md>`
2. If no path provided: ask user for content source (file path, paste, or URL)
3. Read the content file completely
4. Create output directory: `ephemeral/pages/[content-slug]/`
5. All output files go in this directory

## 2. TC SKILL INVOCATION

Spawn 1 Opus agent to derive content-specific composition:

**TC Agent spawn prompt:**

You are the tension-composition analyst. Your job is to analyze content and derive a compositional brief that will guide the page builder.

Read these files IN ORDER:
1. ~/.claude/skills/tension-composition/SKILL.md -- YOUR PROCESS. Follow Phases 0-4 exactly.
2. [content-file-path] -- THE CONTENT to analyze.
3. design-system/compositional-core/grammar/mechanism-catalog.md -- MECHANISM VOCABULARY for Phase 4 selection.
4. design-system/compositional-core/identity/prohibitions.md -- SOUL CONSTRAINTS. Know what the builder cannot override.
5. design-system/compositional-core/vocabulary/tokens.css -- TOKEN VALUES. Know the available CSS variables and palette.

Execute Phases 0-4 of the tension-composition skill on this content:
- Phase 0: Content Assessment (classify content type, scope, sections)
- Phase 1: Multi-Axis Questioning (FEEL/UNDERSTAND/DO/BECOME + discovered axes)
- Phase 2: Tension Derivation (identify content's internal conflicts)
- Phase 3: Metaphor Collapse (derive ONE structural metaphor from tensions)
- Phase 3.5: Metaphor Commitment (lock the metaphor)
- Phase 4: Mechanism Selection (select mechanisms that serve the metaphor)

Run through Phase 4 (Mechanism Selection). DO NOT proceed to Phase 5 (Compositional Layout).

Write your output to [output-dir]/_tc-brief.md containing:
1. STRUCTURAL METAPHOR: The metaphor and WHY it is structural (what CSS properties it implies)
2. ZONE ARCHITECTURE: How the content divides into zones, driven by the metaphor
3. CONTENT TENSIONS: The key tensions in the content that the composition must express
4. SELECTED MECHANISMS: Which mechanisms serve the metaphor, from which catalog categories
5. METAPHOR-IMPLIED CSS DIRECTIONS: Specific CSS patterns the metaphor suggests (e.g., "geological strata → visible layer boundaries via border-left, density gradient via tightening spacing, stratification via bg color shifts")
6. BUILD RECIPE: Zone-keyed deployment sequence with specific CSS values per zone
7. DETECTION EXPECTATIONS: What PA auditors should detect per mechanism (WEAVER-only)
8. BUILDER ANCHORS: 3 page-specific non-negotiable guardrails derived from metaphor+zones+tensions

Keep the brief to 80-120 lines. This is a DESIGN BRIEF, not an essay.

**END OF TC AGENT SPAWN PROMPT**

Wait for TC agent to complete. Verify _tc-brief.md exists and contains all 8 sections.

### 2.1 Recipe-Format Validation

After receiving the TC brief, check Section 6 (BUILD RECIPE) for recipe verbs vs checklist verbs:
- **RECIPE verbs (PASS):** Set, Apply, Deploy, Add, Create, Place, Increase, Darken, Tighten
- **CHECKLIST verbs (FAIL):** Verify, Must, Fail if, Ensure, Confirm, Check that, Should be

If Section 6 uses predominantly checklist verbs (>50% of imperative sentences), return the TC brief to the TC agent with: "Section 6 BUILD RECIPE must be a sequenced recipe with action verbs (Set/Apply/Deploy), not a validation checklist (Verify/Must/Fail if). Rewrite Section 6 as step-by-step build instructions with specific CSS values."

## 3. BUILDER DEPLOYMENT

Spawn agents using the Task tool. You are the team lead / orchestrator.

>>> DO NOT build the page yourself. Spawn agents per the wave structure below.

### Wave 1: Build (1 agent)

Spawn ONE Opus agent as the builder:

```
Role: builder
Model: Opus (ALWAYS -- never Sonnet for builders)
```

**Builder spawn prompt:**

You are building a page for the KortAI design system.

Read these files IN THIS ORDER (order matters -- TC brief establishes compositional foundation, conventions brief establishes world model, recency keeps soul constraints fresh):
1. [output-dir]/_tc-brief.md -- YOUR DESIGN BRIEF. Content-specific metaphor, zones, tensions, mechanisms derived by the TC analyst. This is your compositional foundation.
2. design-system/pipeline/conventions-brief.md -- YOUR PROCESS GUIDANCE. How composition works.
3. [content-file-path] -- THE MATERIAL. Read completely, parsed through the world model.

Reference files (consult as needed during build):
4. design-system/compositional-core/grammar/mechanism-catalog.md -- mechanism CSS patterns. Select mechanisms that serve your multi-coherence channels.
5. design-system/compositional-core/components/components.css -- component library. Components are vehicles for fractal echo at Section and Component scales.
6. design-system/compositional-core/vocabulary/tokens.css -- CSS variable values
7. design-system/compositional-core/identity/prohibitions.md -- soul constraints (LOCKED). Read LAST before CSS begins.

YOUR PROCESS (from conventions brief):
- Phase A: Read the TC brief. Your metaphor, zones, tensions, and mechanisms have been pre-derived by the TC analyst. Internalize them. Your job starts at Phase B.
- Phase B: Plan. Write conviction statement, transition table, and fractal echo table in build log BEFORE any CSS.
- Phase C: Build. HTML + CSS. Self-check at 3 checkpoints:
  1. After HTML skeleton: >= 5 ARIA landmarks? Skip link? >= 8 component classes? header + main + footer present?
  2. After zone boundaries set (all channels together per boundary):
     - All adjacent zone bg deltas >= 15 RGB?
     - >= 3 distinct border configurations? >= 1 structural border-left (3px+)?
     - >= 3 channels shift in same semantic direction at each boundary?
  3. After full build: display-body font-size delta >= 10px? 3+ distinct typography zones?
     Midpoint observation recorded? 5-question self-check complete?
- Phase D: Self-verify. Complete cascade value table. Run 5-question self-check. Final scroll.

YOUR CREATIVE AUTHORITY: You may override ANY non-soul value if you log the override with compositional reasoning. Soul values (border-radius: 0, box-shadow: none, container 940-960px, font trinity, R>=G>=B warm palette) are LOCKED. Everything else is a SUGGESTION you can improve upon.

CONTENT-FORM COUPLING: Each section's visual density, component selection, and spacing must respond to what the content in that section IS ABOUT. Dense analytical content = tighter spacing, more borders, denser typography. Overview content = generous spacing, fewer mechanisms. Identical visual treatment across sections with different content is a design failure.

Write 3 files to [output-directory]:
1. output.html -- the page (self-contained, single file)
2. _build-log.md -- transition table (BEFORE build), fractal echo table (BEFORE build), override log (DURING), midpoint observation (DURING), final self-assessment (AFTER), BRIEF REFLECTION (AFTER -- see below)
3. _cascade-value-table.md -- computed CSS values at every section boundary (background, font-size, font-weight, letter-spacing, border-left, padding, margin)

BRIEF REFLECTION (mandatory in _build-log.md):
After your build is complete, add a BRIEF REFLECTION section to _build-log.md containing:
(a) Which conventions-brief sections most influenced your decisions and how
(b) Which mechanisms you selected and from which catalog categories
(c) How the TC brief's structural metaphor guided your CSS decisions

**END OF BUILDER SPAWN PROMPT**

### Wave 1 Monitoring

Wait for builder to complete. Verify 3 output files exist:
- `[output-dir]/output.html`
- `[output-dir]/_build-log.md`
- `[output-dir]/_cascade-value-table.md`

If any file missing after builder completes: send fix instruction to builder specifying which file to produce.

### 3.1 Midpoint Micro-Gate

After the builder completes approximately 50% of zones (check the build log for progress), run a SUBSET of gates on the partially-built `output.html`:

```
Midpoint gates (MG-5, ~30 sec):
  SC-04: Warm palette -- R >= G >= B on ALL backgrounds so far
  SC-09: Background delta >= 15 RGB at ALL completed zone boundaries
  SC-15: >= 2 distinct border configurations in completed sections
```

Start HTTP server, navigate to output.html, run these 3 gates, stop server.

If ANY midpoint gate FAILS: send a structured fix instruction to the builder IMMEDIATELY, including the measured value, threshold, and which boundary failed. Example: "SC-09 FAIL at Z1->Z2: bg delta 8 RGB (threshold: 15). Your planned direction was DEEPENING. Darken Z2 background before continuing." The builder fixes the existing sections BEFORE writing the remaining CSS. This catches the #1 failure mode (imperceptible backgrounds, zero borders) before it compounds across the full page.

If all midpoint gates PASS: continue monitoring the builder to completion.

NOTE: If the builder completes too quickly for mid-build gate injection (e.g., writes all CSS in a single burst), skip the midpoint gate -- the full gate runner (Step 4) will catch any issues. The midpoint gate is opportunistic, not blocking.

## 4. GATE RUNNER

Run programmatic gates YOURSELF (the orchestrator). Do not spawn a separate agent.

### 4.1 Start HTTP Server

```bash
cd [output-dir] && python3 -m http.server 8765 &
```

### 4.2 Run Gates via Playwright

Navigate to `http://localhost:8765/output.html`.

Before any measurement:
```javascript
// Disable animations and smooth scrolling
const style = document.createElement('style');
style.textContent = '* { animation: none !important; transition: none !important; opacity: 1 !important; scroll-behavior: auto !important; }';
document.head.appendChild(style);

// Wait for fonts
await document.fonts.ready;
```

Run these 17 composition-critical gates.

For complete gate specifications including JavaScript code, fix recipes, and execution groups, reference `design-system/pipeline/gate-runner.md` (~1,340 lines, 25 gates with proven JS).

| Gate | Check | Threshold | Method |
|------|-------|-----------|--------|
| SC-00 | Zone selector validation | >= 3 zone elements resolved | Pre-gate: validate zone selectors before all other gates. See gate-runner.md SC-00 for fallback chain. |
| SC-01 | Container width | 940-960px | `getComputedStyle(container).maxWidth` |
| SC-02 | Soul compliance | border-radius:0, box-shadow:none on ALL | Scan all computed styles |
| SC-03 | Font family | Only Instrument Serif, Inter, JetBrains Mono | Check computed fontFamily |
| SC-04 | Warm palette | R >= G >= B on ALL backgrounds | Parse all computed backgroundColor |
| SC-05 | No pure B/W | No rgb(0,0,0) or rgb(255,255,255) | Scan all computed colors |
| SC-06 | ARIA landmarks | >= 5 | Count `[role]` + semantic elements |
| SC-07 | Skip link | Present | Check `a[href^="#"]` as first focusable |
| SC-08 | Component classes | >= 8 types | Count distinct component class prefixes |
| SC-09 | Background delta | >= 15 RGB between adjacent zones | Parse bg per zone, compute max channel delta |
| SC-10 | Stacked gap | <= 120px total at section boundaries | Sum margin+padding+border at boundaries |
| SC-11 | Typography zones | display-body delta >= 10px, body-detail delta >= 2px, 3+ distinct font-size zones | Measure computed font-size per zone |
| SC-12 | Zone count | 3-5 distinct content zones | Count zones by background color or semantic section. DEPENDENCY: run BEFORE SC-09 and SC-13 |
| SC-13 | Multi-coherence | >= 3 of 6 channels shift at every zone boundary, avg >= 4 | At each boundary: measure bg, font-size, font-weight, letter-spacing, border-left, padding |
| SC-14 | Sub-perceptual prevention | No letter-spacing < 0.025em, no adjacent bg delta < 15 RGB, no 3+ values clustered within 2px | Scan ALL computed letter-spacing, bg colors, font-sizes for imperceptible values. THIS GATE CATCHES THE #1 FLAGSHIP FAILURE MODE. |
| SC-15 | Border/structural presence | >= 3 distinct border configurations (different widths, colors, or positions) | Count distinct border-left, border-top, border-bottom values across all elements |
| SC-17 | Parametric echo | Channel deltas match TC brief boundary CSS table | Compare measured channel shifts at each boundary against TC brief planned deltas (tolerance: bg +/-5 RGB, font-size +/-1px, padding +/-8px). DEPENDENCY: requires SC-13 measured data + TC brief Section 6 boundary table. |

### 4.3 Structured Gate Output

For EACH of the 17 gates (plus blocking gate SC-13B, advisory gate SC-16, deliverable gates DG-1 through DG-4, and behavioral gates BG-1 Metaphor Independence + BG-2 Metaphor Structural), produce a JSON entry:

```json
{
  "gate_id": "SC-XX",
  "status": "PASS | FAIL | ADVISORY",
  "measured_value": "<the actual measured value>",
  "threshold": "<the required threshold>",
  "delta_from_threshold": "<how far measured is from threshold>"
}
```

Write the complete results to `[output-dir]/_gate-results.json`. This file must contain ALL gates with MEASURED VALUES, not just pass/fail.

If any gate FAILS: produce a structured fix instruction with measured values, threshold, and specific CSS fix. Route to builder in fix cycle (Step 7).

### 4.4 Deliverable Gates (from build log)

Check `_build-log.md` and HTML output:
- DG-1: Fractal echo table exists with 5 rows, CSS evidence non-empty, pattern direction consistent
- DG-2: Cascade value table exists at `_cascade-value-table.md`, values populated at every boundary
- DG-3: Landmark completeness -- at least 1 `<header>` (or `[role="banner"]`), 1 `<main>` (or `[role="main"]`), and 1 `<footer>` (or `[role="contentinfo"]`) present in output.html
- DG-4: Transition table and fractal echo table in `_build-log.md` satisfy 5 sub-checks:
  1. zone_count: 3-5
  2. bg_deltas: ALL >= 15 RGB (from transition table planned values)
  3. mechanisms: >= 14 total AND >= 1 in each of 5 categories (Spatial, Hierarchy, Component, Depth/Emphasis, Navigation/Structure)
  4. transitions: >= 3 distinct types
  5. grid_layouts: >= 2 distinct patterns

Behavioral gates (from TC brief and build log):
- BG-1: TC brief (`_tc-brief.md`) shows content assessment -> multi-axis questioning -> tension derivation -> metaphor collapse -> mechanism selection (evidence of Phases 0-4 execution)
- BG-2: Metaphor is STRUCTURAL (suggests CSS properties), not ANNOUNCED (label-only)

## 5. SCREENSHOT CAPTURE

Capture ALL screenshots YOURSELF before spawning PA auditors. This eliminates Playwright contention.

### Protocol

For each viewport width in [1440, 1024, 768]:

1. Set viewport to [width]px
2. Inject animation disabler (same as gate runner)
3. Wait for `document.fonts.ready`
4. Take full-page screenshot: `screenshot-[width]px-00-cold.png`
5. Scroll through at 80% viewport-height steps, capture at each position:
   `screenshot-[width]px-01-scroll.png`, `screenshot-[width]px-02-scroll.png`, etc.

Save all screenshots to `[output-dir]/_screenshots/`.

Stop the HTTP server after screenshots are complete.

## 5.5 LOCK SHEET

Generate a lock sheet from `_build-log.md` and `_gate-results.json`. Categorize every major element as:

- **LOCKED (Soul):** Elements constrained by identity prohibitions (border-radius, box-shadow, container width, font trinity, warm palette). Cannot change.
- **LOCKED (Research):** Elements where gate measurements confirm research-backed thresholds are met (bg deltas >= 15 RGB, stacked gaps <= 120px, multi-coherence >= 3 channels). Changing these risks regression.
- **CHALLENGEABLE (Builder):** Elements that are builder creative choices -- layout topology, metaphor expression, component selection, density arc. Can be improved in fix cycles.

Write to `[output-dir]/_lock-sheet.md`.

Route the lock sheet to the WEAVER ONLY in Step 6.3. Do NOT give it to PA auditors -- they must remain fresh-eyes with zero build context.

## 6. PA DEPLOYMENT

Spawn 9 Opus auditors + 1 Opus weaver using the Task tool.

### 6.1 Auditor Spawn (9 agents, ALL PARALLEL)

Each auditor receives:

```
You are a perceptual auditor for a design system page. You have ZERO
knowledge of how this page was built, what tools were used, or what
the builder intended.

Before answering questions, read the evaluation framework at:
~/.claude/skills/perceptual-auditing/SKILL.md (Sections on perceptual
language, evaluation approach, scoring guidance, the Three Laws, and
the Sovereignty Principle)

Your assigned questions: [PASTE EXACT QUESTIONS FROM ASSIGNMENT TABLE BELOW]

Screenshots are saved at:
  [LIST ALL screenshot file paths from _screenshots/]

Read each screenshot using the Read tool. For each question, provide:
- Your answer (YES / NO / PARTIALLY with specific visual evidence)
- What you SEE (perceptual language only -- describe appearance, not CSS)
- Severity: WOULD-SHIP / WOULD-NOT-SHIP / CONDITIONAL

LANGUAGE RULE: Describe what you SEE, not what the CSS does.
  GOOD: "The background shifts from warm cream to cooler gray"
  BAD: "The background-color changes from #FEF9F5 to #F0EBE3"

Write your report to: [output-dir]/_pa/pa-auditor-[LETTER].md
```

### 6.2 Question Assignments

| Auditor | Role | Questions |
|---------|------|-----------|
| A | Impression+Emotion | PA-01, 03, 04, 05, 18, 19, 20, 45, **65**, **67** |
| B | Readability+Typography | PA-02, 06, 07, 08, 29, **56**, 70 |
| C | Spatial+Proportion | PA-09, 10, 11, 30, 31, 32, 33, 50, 51, 52, 53, **55**, **64**, **66** |
| D | Flow+Pacing | PA-12, 13, 34, 35, 36, 69, **62** |
| E | Grid+Layout | PA-14, 15, 37, 38, 39, **63** |
| F | Consistency+Rhythm | PA-16, 17, 24, 40, 41, **60**, **61** |
| G | Metaphor+Ideology | PA-25, 42, 43, 44, **68** |
| H | Responsive | PA-21, 22, 23, 46, 47 |
| I | Adversarial | PA-26, 27, 28, 48 |

Bold = Tier 5 questions (PA-60 through PA-68) + sub-perceptual questions (PA-55, PA-56). PA question full text is in `~/.claude/skills/perceptual-auditing/SKILL.md` AND `design-system/pipeline/flagship-pa-questions.md` (for Tier 5 only).

Each auditor MUST have the full question text pasted into their prompt. Do not say "answer PA-60" -- paste the entire question, scoring rubric, and evaluation guidance.

### 6.3 Weaver Spawn (1 agent, AFTER all 9 auditors complete)

```
You are the PA weaver. Read all 9 auditor reports from [output-dir]/_pa/.
Also read the gate results at [output-dir]/_gate-results.json for diagnostic
context (which gates passed/failed, measured values). Read the lock sheet at
[output-dir]/_lock-sheet.md for context on
which elements are LOCKED vs CHALLENGEABLE (do NOT let this bias your
quality judgment -- it only informs which fixes are feasible).

Read the TC brief at [output-dir]/_tc-brief.md for the intended metaphor,
zone architecture, and detection expectations (Section 7). Use detection
expectations to calibrate whether auditors perceived what was intended.
Read the builder's _build-log.md at [output-dir]/_build-log.md -- specifically
the conviction statement, transition table, and fractal echo table. Use these
to bridge auditor perceptions to builder intent: if auditors report a problem
and the builder's plan MATCHES the problematic output, the issue is STRUCTURAL
(wrong plan). If the plan DIFFERS from the output, the issue is MECHANICAL
(execution failure). This distinction drives fix-type classification.
Read the cascade value table at [output-dir]/_cascade-value-table.md for the
builder's computed CSS values at every section boundary. Cross-reference these
against gate results to identify where declared values diverge from measured
values (MECHANICAL failure) vs where declared values match but are below
perception thresholds (STRUCTURAL failure -- the builder planned wrong values).

Produce a synthesis with these sections:

1. PA-05 SCORE: Rate each sub-criterion 0-4:
   - DESIGNED (intentionally crafted?)
   - COHERENT (elements work together?)
   - PROPORTIONATE (visual weight distributed well?)
   - POLISHED (details refined?)
   Average to 0.5 precision = PA-05 score.

2. TIER 5 SCORE: Count YES answers from PA-60 through PA-68.
   Apply threshold: 8-9 COMPOSED / 6-7 APPROACHING / 3-5 STRUCTURED / 0-2 VOCABULARY ONLY.

3. TOP-5 ISSUES ranked by severity (WOULD-NOT-SHIP first).
   Each issue must include: auditor source, question ID, severity rating,
   exact auditor quote, scroll position, and actionable CSS-level feedback
   (what to change, not just what is wrong).
   When describing issues, name the affected multi-coherence channel
   (Chromatic/Typographic/Spatial/Structural), the fractal scale
   (Navigation/Page/Section/Component/Character), and the transition type
   at the boundary (SMOOTH/BRIDGE/BREATHING) where applicable.

4. FULL PER-QUESTION MATRIX: Write to [output-dir]/_pa/_pa-matrix.md.
   65 questions x 9 auditors. For each question, record each auditor's
   YES/NO/PARTIALLY answer. Then compute inter-auditor agreement:
   - For each question, count YES vs NO across all auditors who answered it.
   - Questions where auditors DISAGREE (5-4 split or 4-3 split) are flagged
     as CALIBRATION TARGETS -- these reveal where the rubric is ambiguous
     or where auditor perspectives diverge.

5. COMPOSITIONAL CRITERIA:
   - Zero soul violations: [MET/FAILED]
   - Zero void patterns (>120px empty): [MET/FAILED]
   - Metaphor STRUCTURAL (not just labeled): [MET/FAILED/N/A]
   - Rhythm not metronomic: [MET/FAILED]
   - Multi-coherence perceptible: [MET/FAILED]
   - Scale coverage (3+ scales): [MET/FAILED]

6. VERDICT:
   - SHIP: PA-05 >= 3.5 AND Tier 5 >= 7/9 AND all criteria MET
   - SHIP WITH RESERVATION: PA-05 >= 3.5 AND Tier 5 5-6/9
   - FIX: PA-05 3.0-3.4, or criteria FAILED but fixable
   - REBUILD: PA-05 < 3.0
   - ESCALATE: 3 fix cycles exhausted

Write synthesis to: [output-dir]/_pa/_pa-report.md
Write per-question matrix to: [output-dir]/_pa/_pa-matrix.md
```

## 7. FIX CYCLE

If weaver verdict is FIX:

### 7.1 Build Fix Instructions

Compose a fix instruction file at `[output-dir]/_fixes/fix-instructions-cycle-N.md`:

```markdown
## FIX INSTRUCTIONS (Cycle N) -- PRIORITY ORDERED

>>> Fix ALL Tier 1 issues BEFORE touching Tier 2. Fix ALL Tier 2 BEFORE Tier 3.

### TIER 1: STRUCTURAL (fix first -- these affect zone architecture and multi-coherence)
[Gate failures: paste _gate-results.json entries that FAILED, each with measured_value, threshold, delta_from_threshold, and CSS fix]
[PA issues classified as STRUCTURAL by weaver -- zone organization, boundary design, spatial skeleton]

For each failed gate or PA issue at a boundary, include:
- The boundary's planned coherence direction (from transition table in _build-log.md)
- Which channels currently shift there and which are missing
- Re-read conventions-brief.md Section [N] for the relevant concept
[Example: "SC-09 FAIL at Z2->Z3. Planned: DEEPENING. Missing: Chromatic (bg delta 8 RGB). Fix bg while maintaining DEEPENING (darken, not lighten). See brief Section 4."]

### TIER 2: COMPOSITIONAL (fix second -- these affect PA-05 sub-criteria and Tier 5)
[PA Top-5 issues that are compositional, directional not prescriptive:]
1. [WOULD-NOT-SHIP] PA-XX: "[auditor exact words]"
   - WHERE: [scroll position / element]
   - DIRECTION: [what to change -- not what CSS to write]

[Tier 5 gaps:]
- PA-6N: NO -- "[auditor reason]"
  IMPLICATION: [missing compositional property]

### TIER 3: POLISH (fix last -- token compliance, accessibility, minor issues)
[PA issues classified as MECHANICAL by weaver -- CSS value adjustments]
[Accessibility gaps, token compliance, visual artifacts]

### PROTECTED (changes here require explicit justification in build log)
- [Elements that scored well -- do not regress]
```

### 7.2 Send to Same Builder

>>> CRITICAL: Use the SAME Opus builder agent that produced the original page.

Send fix instructions with this framing: "Re-read _tc-brief.md (your metaphor, zones, tensions) AND your conviction statement and transition table in _build-log.md before applying fixes. Then answer this SELF-CHALLENGE in your build log before writing any CSS:

**Name one way your current CSS CONTRADICTS your conviction statement.**

If you cannot name one, you are not looking hard enough -- the PA auditors found problems, which means contradictions exist. Identify the contradiction, then fix from that understanding. Each fix must maintain your planned coherence directions and serve the structural metaphor -- unless the self-challenge reveals the plan itself was wrong, in which case update your conviction statement first."

Builder reads them, applies fixes to output.html, updates _build-log.md and _cascade-value-table.md.

### 7.3 Re-Verify

After builder fixes:
- Re-run all gates (Step 4) -- write updated `_gate-results.json`
- Re-capture screenshots (Step 5)
- For Cycle 2: deploy 4 PA auditors (A, B, C, F) -- re-check ALL dimensions flagged in Cycle 1 Top-5, plus focused questions + all 9 Tier 5. B catches typography regressions (#2 historical failure mode). F catches rhythm/consistency regressions (Tier 1 equivalent).
- For Cycle 3: deploy 3 PA auditors (A, C, G) -- focused + all 9 Tier 5. G evaluates PA-44 and PA-68, enabling the TC re-invocation trigger.
- Weaver re-synthesizes (updates _pa-report.md and _pa-matrix.md)

### 7.4 Cycle Limits

| Cycle | PA Auditors | Questions | Duration |
|-------|-------------|-----------|----------|
| 1 (initial) | 9 Opus | All 65 | ~45 min |
| 2 (targeted) | 4 Opus (A, B, C, F) | Cycle 1 flagged dims + Tier 5 | ~25 min |
| 3 (final) | 3 Opus (A, C, G) | Focused + Tier 5 + PA-44/68 | ~20 min |

After Cycle 3: ESCALATE to user with a structured escalation report. Do NOT loop beyond 3 cycles.

**Escalation Report Format** (write to `[output-dir]/_escalation-report.md` and report to user):

```markdown
## ESCALATION REPORT (3/3 cycles exhausted)

### FINAL SCORES
- PA-05: [X.X/4] (sub-criteria: DESIGNED [X], COHERENT [X], PROPORTIONATE [X], POLISHED [X])
- Tier 5: [X/9]
- Gates: [X/17 pass] (composition-critical) + SC-13B [PASS/FAIL] + DG/BG gates

### CONVERGENCE TRAJECTORY
- Cycle 1: PA-05 [X.X] | Cycle 2: PA-05 [X.X] | Cycle 3: PA-05 [X.X]
- Trend: [IMPROVING / STALLED / OSCILLATING]

### WHAT WAS TRIED
[List each fix cycle's main interventions]

### WHAT IMPROVED
[Dimensions that moved from FAIL to PASS or showed measurable gains]

### WHAT PLATEAUED
[Dimensions that did not improve despite fixes -- include weaver's root-cause hypothesis per dimension]

### ROOT CAUSE HYPOTHESIS
[METAPHOR / BUILDER EXECUTION / SPEC LIMITATION / CONTENT COMPLEXITY]

### RECOMMENDED NEXT ACTION
[Re-run with different metaphor / Manual CSS intervention / Accept as-is / Abandon content]

### KEY FILES FOR REVIEW
- Weaver report: [output-dir]/_pa/_pa-report.md
- Gate results: [output-dir]/_gate-results.json
- Screenshots: [output-dir]/_screenshots/
```

**TC Re-Invocation (rare):** If PA-44 (metaphor structural survival) AND PA-68 (metaphor spatial coverage) BOTH fail across 2+ cycles, the problem is the METAPHOR, not the implementation. In this case: re-spawn the TC agent (Step 2) with the same content + builder's _build-log.md showing what went wrong. TC re-derives a different metaphor. Builder starts fresh with the new TC brief. This resets the cycle counter.

## 8. SUCCESS BAR

### Two-Score Verdict

| Score | Pass Threshold | What It Measures |
|-------|----------------|------------------|
| PA-05 | >= 3.5/4 | "Is this DESIGNED?" |
| Tier 5 | >= 7/9 | "Is this Flagship-tier?" |

### Mandatory Criteria

All must be MET:
- Zero soul violations (SC-01 through SC-05 all PASS)
- Zero void patterns (PA-50 through PA-53 all PASS, SC-10 PASS)
- Metaphor is STRUCTURAL (not ANNOUNCED or LABELED)
- Multi-coherence verified (SC-13 PASS + PA-61 agreement)
- Scale coverage verified (DG-1 valid + PA-63 agreement)

### Full Verdict Matrix

| PA-05 | Tier 5 | Criteria | Verdict |
|-------|--------|----------|---------|
| >= 3.5 | >= 7/9 | All MET | **SHIP** |
| >= 3.5 | 5-6/9 | All MET | **SHIP WITH RESERVATION** |
| >= 3.5 | 0-4/9 | All MET | **NOT FLAGSHIP** (rescope) |
| 3.0-3.4 | any | any | **FIX CYCLE** |
| < 3.0 | N/A | N/A | **REBUILD** |

## 9. OUTPUT SUMMARY

Write `[output-dir]/_run-manifest.md` containing: run timestamp (ISO 8601), content file path, builder model (Opus), gate pass/fail count with failing gate IDs, PA-05 score with sub-criterion breakdown, Tier 5 score with verdict label, fix cycles used (N/3), total agents spawned, overall verdict, and list of all produced files.

Also report the summary to the user in chat.

## 10. PRACTICAL DETAILS

### Agent Models

| Role | Model | Count |
|------|-------|-------|
| Orchestrator | You (team lead) | 1 |
| TC Analyst | Opus | 1 |
| Builder | Opus | 1 |
| PA Auditors | Opus | 9 (initial), 4 (cycle 2), 3 (cycle 3) |
| PA Weaver | Opus | 1 |

IMPORTANT: ALWAYS set `model: "opus"` explicitly when spawning agents. Every agent MUST be Opus.

### Playwright Scheduling

ZERO concurrent Playwright usage. All Playwright operations (gates, screenshots) done by the orchestrator sequentially. PA auditors NEVER touch Playwright -- they read saved screenshots via Read tool.

### File Structure

`[output-dir]/` contains: `_tc-brief.md`, `output.html`, `_build-log.md`, `_cascade-value-table.md`, `_lock-sheet.md`, `_run-manifest.md`, `_gate-results.json`, `_screenshots/` (cold + scroll PNGs at 1440/1024/768), `_pa/` (9 auditor reports + `_pa-report.md` + `_pa-matrix.md`), `_fixes/` (fix-instructions per cycle).

## 11. RE-STATEMENT OF NON-NEGOTIABLES

1. Container: 940-960px. Every page. No exceptions.
2. Warm palette: R >= G >= B on every background color. No cool grays.
3. Perceptible CSS: Every value the builder writes must be visible to a human. >= 15 RGB background delta. >= 2px font-size delta. No sub-perceptual micro-typography. No letter-spacing below 0.025em. No stacked gaps above 120px.
4. Builder model: Opus. Always. Never Sonnet for the CSS-writing agent.
5. Same builder for fixes: The agent that built the page fixes the page. No handoffs.
6. PA auditors are fresh-eyes: Zero build context. Perceptual language only.
