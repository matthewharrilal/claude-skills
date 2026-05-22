---
name: arch-lens-check
description: Compound wrapper that orchestrates the four architecture sub-skills (`/arch-gauge`, `/arch-cartography`, `/arch-ninety`, `/arch-conjecture`) in sequence and produces a unified architectural calibration report. Parallel sibling to `/lens-check` (which orchestrates the visual/iOS-framework chain); this skill orchestrates the architecture chain. Used when a full architectural audit or design pass is warranted — typically before non-trivial architectural commitments, when calibrating against a reference shop, or when auditing an existing codebase against the principal-tier discipline.
---

# Arch-Lens-Check — The Compound Architectural Calibration

This skill is the **compound wrapper** of the architecture 10/90 framework. It runs `/arch-gauge` → `/arch-cartography` → `/arch-ninety` → `/arch-conjecture` in sequence, threading each skill's output into the next, and produces a single unified architectural report.

The visual/iOS-framework parallel lives in `/lens-check`. Both skills share the `_shared/posture-check.md` scaffolding but maintain independent framework documents — `/lens-check` lives in the 10/90 visual framework; `/arch-lens-check` lives in the architecture framework.

**Critical framing:** `/arch-lens-check` does not replace the sub-skills. It composes them. Each sub-skill retains its full structure (posture check, blind-spot diagnostics, dimensionality completeness, agent dispatch protocol). The compound adds an orchestration layer on top — cross-skill coherence tests, integration-layer blind-spot diagnostics, the unified output that integrates four reports into one operational artifact.

---

## Posture Check (Precondition)

<!-- ID: arch-lens-check.posture-check -->
<!-- INVARIANT: arch-lens-check.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check.

### Output declaration

`POSTURE: janum` or `POSTURE: senior` (halt if senior).

### Skill-specific addendum

For `/arch-lens-check`, the posture **propagates across all four sub-skills** and the compound's coordination layer must catch propagation failures. Run the canonical posture check once at the top of the compound. Then, because each sub-skill performs its own check at invocation, the compound treats any **mid-compound posture drift** detected by any sub-skill as a hard halt: the drift is resolved (typically by re-gauging) before proceeding to the next sub-skill. A compound that papers over a drifted sub-skill produces four sub-skill outputs that *look* complete but are structurally dishonest — they wish rather than research.

---

## Mode Selection — Forward or Reverse
<!-- ID: arch-lens-check.mode-selection -->

`/arch-lens-check` runs in one of two modes depending on the work's direction.

**Forward Mode** (default): goal → architecture. The user has an architectural goal (design a new feature's architecture, choose a stack for a greenfield app, plan a refactor) and needs the compositional plan. Sub-skill order: `/arch-gauge` → `/arch-cartography` → `/arch-ninety` → `/arch-conjecture`.

**Reverse Mode**: observation → understanding (and optionally reproduction). The user has dropped an external artifact (a reference shop's codebase, a competitor's app, a public engineering blog post about an architecture) and wants it reverse-engineered. Sub-skill order changes:

1. `/arch-gauge` Mode B-Understand (or Mode B-Reproduce). Produces baseline tier classification of the artifact.
2. `/arch-ninety` audit on the artifact — extract the specific 90% craft rules the artifact encodes.
3. `/arch-cartography` — constrained to primitives that could plausibly produce the observed architecture.
4. `/arch-conjecture` — only invoked if Mode B-Reproduce was selected.

State the mode at the top of the compound's output.

---

## What This Skill Concretely Enables
<!-- ID: arch-lens-check.concrete-capabilities -->

- **Recover full architectural framework calibration in a single operation.** One pass produces tier classification + primitive menu + 90% craft findings + concrete conjecture, threaded together.
- **Surface cross-skill blind spots that no individual sub-skill catches.** Coordination failures (thin cartography fed into ninety; ninety findings not cited in conjecture; tier-mismatched conjecture) become visible only at the integration level.
- **Produce a unified architectural design document.** The output is referenceable design-doc material — future engineers reading the architecture can read this output to understand the full framework lens applied.
- **Detect when the work does NOT require the full architecture framework.** Sometimes a feature is Tier 1 — basic SwiftUI suffices. The compound declares this cleanly: gauge says Tier 1, cartography confirms front-of-10% sufficient, ninety skipped, conjecture is thin "use the obvious primitive."
- **Maintain framework discipline across time.** When the architecture framework's distinctions feel stale, running `/arch-lens-check` on any current work re-activates the framework.

---

## When to Use This Skill

**User-invoked**: `/arch-lens-check <problem>` when:
- A new significant architectural decision is being made.
- A codebase audit is warranted.
- A reference shop's architecture is being studied.
- Framework regression is suspected and full recalibration is needed.

**Self-invoked**: when the user enters significant architectural territory and a full framework pass is the appropriate response; reserve for substantial commitments.

In all cases, `/arch-lens-check` is heavier than any individual sub-skill. Reserve for situations where the full pass is warranted.

---

## Orchestration Mechanics
<!-- ID: arch-lens-check.orchestration-mechanics -->

### Phase 1 — Run `/arch-gauge`

Establish the baseline:
- What tier is the current thinking / codebase / artifact at?
- What's the target tier?
- What artifact is being gauged?
- What blind spots are surfaced?

→ Enables: subsequent sub-skills know what depth of engagement is appropriate.

### Phase 2 — Run `/arch-cartography`

Enumerate the architectural primitives across the relevant domains, organized by tier:
- Front of 10%
- Middle of 10%
- Latter end of 10%
- Per-domain coverage
- Citation IDs assigned

→ Enables: `/arch-ninety` knows which primitives carry 90% dependency; `/arch-conjecture` knows the menu.

### Phase 3 — Run `/arch-ninety`

Engage the 5 manifestations + 8 intentions of the architectural 90%:
- Internal compositions across reference shops
- Principal-tier individual instincts
- Code-as-UX aesthetic discipline
- DevX-as-product philosophy
- Discipline of refusal + philosophical inheritance

→ Enables: `/arch-conjecture` has the full 90% craft as input.

### Phase 4 — Run `/arch-conjecture`

Compose the architectural recommendation:
- Module structure
- Type-level architecture
- Wiring story
- Call-site experience
- Rejection list
- Migration plan
- Coherence tests

→ Enables: implementation.

### Phase 5 — Integrate the Outputs (Coherence Tests)

The integration is procedural — specific coherence tests, mirroring `/lens-check`'s Phase 5 but adapted for architecture:

1. **Primitive-usage check.** For each primitive `/arch-conjecture` uses, is it present in `/arch-cartography`'s enumeration (cited by ARCH-CARTO-* ID)?
2. **Rule-application check.** For each 90% craft rule `/arch-conjecture` applies, is it present in `/arch-ninety`'s findings (cited by ARCH-NINETY-* ID)?
3. **Parameter-consistency check.** Embedded values (spring fingerprints, timing parameters, etc.) match `/arch-ninety` findings.
4. **Tier-match check.** `/arch-conjecture`'s recommended tier matches `/arch-gauge`'s required tier.
5. **Confidence-propagation check.** Compound's confidence ≤ minimum sub-skill confidence (weighted by relevance).
6. **Posture-consistency check.** All four sub-skills ran with consistent Janum-tier posture.

If any test produces a flag, the compound is not yet integrated. Resolve before declaring readiness.

### Phase 5.5 — Pivot Diagnostic (Triggered When Regression Suspected)

When integration produces outputs that feel mechanical or terms are being used as rote rather than active distinctions, walk the seven epistemological pivots adapted for architecture:

1. **Anchor + breadth pivot.** Is the work anchored to a concrete capability while exploring broadly?
2. **Menu over depth pivot.** Has the cartography enumerated the full menu, or has the work collapsed to going deeper on already-known primitives?
3. **Awareness of the 90% as distinct stratum pivot.** Is the architectural 90% being engaged as research territory, or has it collapsed back to "what good engineers happen to know"?
4. **Conjecture not three discrete moves pivot.** Is the conjecture composing primitives under craft lens, or has it collapsed to "use library X / build wrapper around X / rebuild X"?
5. **Cartography + craft + taste pivot.** Are all three axes engaged?
6. **Taste as trigger pivot.** Is the "does this read beautifully" trigger driving 90% engagement, or has it collapsed to "acquire patterns in bulk and apply"?
7. **90% as lens not as importable material pivot.** Is the 90% manifesting in the conjecture as intelligence (composition, structure, rejection list), or has it collapsed to "find things to import"?

For each pivot: honored / partially honored / collapsed.

---

## Agent Dispatch Protocol
<!-- ID: arch-lens-check.agent-dispatch -->

`/arch-lens-check` aggregates the agent dispatches of its sub-skills. Each sub-skill makes its own dispatch decision per its protocol. The compound's role is to:

1. **Ensure dispatches happen where warranted.** If `/arch-cartography` skipped agent dispatch when the latter end was thin, the compound flags this.
2. **Coordinate parallel dispatches across sub-skills.** When multiple sub-skills warrant dispatch, the compound can run them in parallel rather than serially.
3. **Surface dispatch results in the integration layer.** Agent findings from one sub-skill may inform another.

The compound's default posture is: **default to dispatching when evidence is thin, especially in `/arch-ninety` (the most evidence-bound sub-skill).**

---

## Output Format

```
ARCH-LENS-CHECK — [PROBLEM DOMAIN OR ARTIFACT]

POSTURE: [janum / senior]

Mode: [Forward Mode / Reverse Mode (B-Understand) / Reverse Mode (B-Reproduce)]

=== Phase 1 — Gauge Output ===
[Full /arch-gauge output embedded]
Key conclusions: [tier baseline, target tier, gap, blind spots, per-domain breakdown]

=== Phase 2 — Cartography Output ===
[Full /arch-cartography output embedded — or skipped with reasoning if Tier 1]
Key conclusions: [primitive menu summary, blind spots, sufficiency assessment]

=== Phase 3 — Ninety Output ===
[Full /arch-ninety output embedded — or skipped with reasoning]
Key conclusions: [manifestations engaged, intentions active, findings summary]

=== Phase 4 — Conjecture Output ===
[Full /arch-conjecture output embedded — or skipped for B-Understand mode]
Key conclusions: [load-bearing decisions, rejection list, migration plan, readiness]

=== Phase 5 — Cross-Skill Integration ===
Coherence test results:
1. Primitive-usage check: [PASS / FAIL]
2. Rule-application check: [PASS / FAIL]
3. Parameter-consistency check: [PASS / FAIL]
4. Tier-match check: [PASS / FAIL]
5. Confidence-propagation check: [PASS / FAIL]
6. Posture-consistency check: [PASS / FAIL]

Cross-skill blind spots surfaced: [blind spots visible only at integration level]

Unified verdict: [integrated assessment]

=== Implementation Plan ===
[Actionable plan from /arch-conjecture, or "not ready" with outstanding work list]

=== Bottling Destination ===
[From /arch-conjecture if Forward Mode produced a module candidate]

=== Pivot Diagnostic Results (if run) ===
[Phase 5.5 output if triggered]

=== Agent Dispatch Summary ===
[All agent dispatches across the compound, their findings, citation IDs]

=== Source-confidence summary ===
[Per major load-bearing decision]

=== Recommendations for Subsequent Work ===
- Validation: [...]
- Documentation: [...]
- Future updates: [...]
```

---

## Blind-Spot Diagnostics — Stepping Outside the Orchestration

The Meta-Perspective Prompts specific to the compound:

**Prompt 1 — The thin-input cascade prompt.** "Did `/arch-gauge` produce a thin baseline that caused `/arch-cartography` to be invoked at insufficient depth? Did the thin cartography then produce a thin `/arch-ninety` input? Did `/arch-conjecture` build on a thin foundation?"

**Prompt 2 — The skipped-sub-skill prompt.** "Did the orchestration skip a sub-skill that was warranted? Was `/arch-ninety` skipped because gauge said Tier 1, but the work actually has Tier 3 implications?"

**Prompt 3 — The output-incoherence prompt.** "Do the four sub-skill outputs cohere? Does `/arch-conjecture` actually use primitives from `/arch-cartography`? Does it apply rules from `/arch-ninety`?"

**Prompt 4 — The dimension-completeness-cascade prompt.** "Did each sub-skill complete its dimensionality check, or were dimensions silently skipped to keep the compound running?"

**Prompt 5 — The integration-layer-blind-spot prompt.** "Is there a blind spot at the integration level that no individual sub-skill catches? E.g., the conjecture composes correctly but the work actually belongs to a different problem domain than `/arch-gauge` framed?"

**Prompt 6 — The verdict-honesty prompt.** "Is the unified verdict honest about readiness, or has it papered over outstanding work?"

**Prompt 7 — The agent-dispatch-coverage prompt.** "Were agents dispatched across sub-skills where evidence was thin, or was the compound produced from baseline knowledge only?"

---

## Dimensionality Completeness Check

- **Dimension 1 — Sub-skill coverage.** All four ran, or skips were justified.
- **Dimension 2 — Sub-skill depth.** Each sub-skill ran at appropriate depth.
- **Dimension 3 — Sub-skill metacognition.** Each completed its own blind-spot diagnostics + dimensionality check.
- **Dimension 4 — Integration coherence.** Six coherence tests passed (or flags surfaced).
- **Dimension 5 — Implementation-readiness honesty.** Verdict honestly reflects readiness.
- **Dimension 6 — Apprenticeship-material quality.** Output is rich enough to serve as a design document.

---

## Notes on Use

- **`/arch-lens-check` is the heaviest artifact in the architecture chain.** Reserve for situations where the substantial output is warranted.
- **Individual sub-skills remain independently invocable.** The compound is for full passes; the user can invoke `/arch-gauge` alone for a quick calibration.
- **The unified report becomes design-doc material.** When a module is built from a `/arch-lens-check` output, the output goes alongside the code as the architectural rationale.
- **Compound runs should be rare.** Per-significant-architectural-decision, per-major-feature-design, per-codebase-audit — these are right invocation frequencies. Daily work does not need lens-check daily.
- **Reverse Mode is for understanding reference shops.** Forward Mode is for designing your own.
- **Compound runs are revisable.** As any sub-skill's output improves, re-run the compound; updates produce new snapshots.
