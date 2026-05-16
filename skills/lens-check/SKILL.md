---
name: lens-check
description: Compound wrapper that orchestrates the four sub-skills of the 10/90 framework (`/gauge`, `/cartography`, `/ninety`, `/conjecture`) in sequence and produces a unified calibration report. Used when a full audit is warranted — typically before any non-trivial iOS architecture commitment, or when calibrating against an external artifact the user wants to understand or reproduce.
---

# Lens-Check — The Compound Calibration

This skill is the **compound wrapper** of the 10/90 framework. It runs `/gauge` → `/cartography` → `/ninety` → `/conjecture` in sequence, threading each skill's output into the next, and produces a single unified report. Used when a complete framework pass is needed rather than ad-hoc invocation of individual sub-skills.

The full framework is documented at `/Users/spacewizardmoneygang/Desktop/XcodeInstall/THE_10_90_FRAMEWORK.md`. Each sub-skill is documented in its own SKILL.md; `/lens-check` is the orchestration layer that coordinates them.

**Critical framing:** `/lens-check` does not replace the sub-skills. It composes them. Each sub-skill retains its full metacognitive structure (capability grounding, blind-spot diagnostics, dimensionality completeness). The compound adds an orchestration layer on top — the blind-spot diagnostics specific to coordination, the dimensionality check that all four sub-skills were appropriately deep, the unified output that integrates four reports into one operational artifact.

---

## Posture Check (Precondition)

<!-- ID: lens-check.posture-check -->
<!-- INVARIANT: lens-check.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement
<!-- ID: lens-check.output-declaration -->
<!-- INVARIANT: lens-check.output-declaration -->

After performing the Posture Check (per inherited protocol), this skill's output MUST contain an explicit line:

`POSTURE: janum` — when the Janum-tier posture is confirmed.
`POSTURE: senior` — when the senior posture is detected. In this case, halt and recalibrate before producing further output beyond this declaration.

The Stop hook scans for this line to write a session-level posture artifact that downstream skill invocations consult. Skipping this declaration breaks the framework's posture-propagation guarantee.

### Skill-specific addendum

For `/lens-check` specifically, the posture **propagates across all four sub-skills** and the compound's coordination layer must catch propagation failures. Run the canonical posture check once at the top of the compound. Then, because each sub-skill performs its own check at invocation, the compound treats any **mid-compound posture drift** detected by any sub-skill as a hard halt: the drift is resolved (typically by re-gauging) before proceeding to the next sub-skill. A compound that papers over a drifted sub-skill produces four sub-skill outputs that *look* complete but are structurally dishonest — they wish rather than research. The compound's coherence test (Phase 5) includes posture-consistency as one of its six checks for exactly this reason.

---

<!-- ID: lens-check.mode-selection -->
## Mode Selection — Forward or Reverse

`/lens-check` runs in one of two modes depending on the work's direction in the operational loop.

<!-- ID: lens-check.forward-mode -->
**Forward Mode** (default): goal → implementation. The user has a UX/UI goal and needs the compositional plan that achieves it. Sub-skill order: `/gauge` → `/cartography` → `/ninety` → `/conjecture`. This is the orchestration the compound was originally designed for; covered in detail in "Orchestration Mechanics" below.

<!-- ID: lens-check.reverse-mode -->
**Reverse Mode**: observation → understanding (and optionally reproduction). The user has dropped an external artifact (a video of an interaction, a competitor app's behavior, a shipped product feature) and wants it reverse-engineered. The sub-skill order *changes*:

1. `/gauge` Mode B-Understand (or Mode B-Reproduce if the user intends to build their own version). Produces a baseline classification of the artifact and lists 90% knowledge likely encoded.
2. `/ninety` audit on the artifact — extract the specific rules, byte values, signatures, behaviors, or tacit positions the artifact encodes. The intentions active are typically 1 (compositional lens for reproduction), 5 (awareness as signal), 7 (taste calibration), and possibly 6 (philosophical inheritance if the artifact is itself bottled).
3. `/cartography` — *constrained* to primitives that could plausibly produce the observed behavior. Not exhaustive enumeration; targeted enumeration informed by `/ninety`'s findings.
4. `/conjecture` — only invoked if Mode B-Reproduce was selected. Produces the peer-rebuild composition. Skipped if the user only wanted understanding.

Reverse Mode's integration emphasis is different from Forward Mode's: instead of "is this composition adequate to ship," the integration asks "is the artifact's tier classification consistent with the extracted 90% rules and the proposed reproduction approach?"

State the mode at the top of the compound's output. Mixed-mode invocations (the user wants both reproduction and broader exploration) are valid but run as two compounds, not one.

---

## What This Skill Concretely Enables
<!-- ID: lens-check.concrete-capabilities -->
<!-- INVARIANT: lens-check.concrete-capabilities -->

`/lens-check` is not invoked for the sake of running all four sub-skills mechanically. The orchestration overhead only pays off if the engineer can name the concrete capabilities the unified output provides over piecemeal sub-skill invocation. Specifically:

- **The ability to recover full framework calibration in a single operation.** When the engineer is about to commit to architecture and needs the full framework lens applied, `/lens-check` produces it in one pass. Without the compound, the engineer would invoke four sub-skills manually, risk forgetting one, and produce four separate outputs that need to be integrated by hand. The capability is: integrated calibration without manual orchestration.
- **The ability to surface cross-skill blind spots that no individual skill catches.** Sometimes the failure mode is not in any one skill but in the coordination between them — e.g., `/cartography` produced a thin menu and `/ninety` was performed against that thin menu, so the `/conjecture` is structurally compromised even though each individual skill was internally correct. The compound surfaces these coordination failures via its own metacognitive layer.
- **The ability to produce a unified output that future engineers can read end-to-end.** When the bottle (the library) is being built and each module is conjectured, the `/lens-check` output for that module is the design document. Future engineers reading the module's source can read its `/lens-check` to understand the full framework lens applied during its design. The capability is: integrated apprenticeship material per module.
- **The ability to detect when the work does NOT require the full framework.** Sometimes a problem genuinely is Tier 1 — pure documentation suffices, no 90% engagement needed. `/lens-check` produces this verdict cleanly: `/gauge` says Tier 1 baseline matches Tier 1 requirement, `/cartography` confirms front-of-10% primitives suffice, `/ninety` is skipped, `/conjecture` becomes a thin "use the obvious primitive" recommendation. The engineer ships with confidence that they did not over-engineer. The capability is: appropriate effort calibration.
- **The ability to maintain framework discipline across time.** When the framework's distinctions feel stale and start to collapse back to bullet-point summaries, running `/lens-check` on any current work re-activates the full framework. The compound is the discipline-maintenance tool. The capability is: framework durability.

These are the concrete capabilities `/lens-check` provides over ad-hoc sub-skill invocation. If after running `/lens-check` you cannot point to one of these being newly enabled, the compound was performed wrong or a single sub-skill invocation would have sufficed.

Each phase below names what specific capability that phase contributes to.

---

## When to Use This Skill

**User-invoked triggers** — the user types `/lens-check` when:

- They want a complete framework pass on a problem (new feature being designed, new module being conjectured for the bottle, new external artifact being studied).
- They suspect their current thinking has regressed to a shallower framework state and want to recalibrate fully.
- They are about to commit to an architectural decision that will have downstream consequences and want the full framework lens applied before commitment.
- They are reviewing a previously-built composition and want to verify it actually executes the conjecture move with the full framework support.
- They want to produce design-document-grade output for a module — the kind of artifact that goes into the bottle alongside the code.

**Self-invoked triggers** — the assistant invokes `/lens-check` automatically when:

- A new significant iOS engineering task is entering the conversation that warrants the full framework lens (rather than just one sub-skill).
- Multiple individual sub-skill invocations have happened in the conversation and they need to be integrated into a unified plan.
- The assistant detects framework regression — the current reasoning has collapsed to a shallower frame and a full lens-check would surface what is being missed.

In all cases, `/lens-check` is heavier than any individual sub-skill. Reserve it for situations where the full pass is warranted; do not invoke for trivial questions.

---

<!-- ID: lens-check.orchestration-mechanics -->
## Orchestration Mechanics

`/lens-check` runs the four sub-skills in a specific sequence. Each sub-skill consumes the output of the previous, refining and extending. The orchestration handles the threading of inputs and the integration of outputs.

<!-- ID: lens-check.phase-1-gauge -->
### Phase 1 — Run `/gauge`

Invoke `/gauge` first. The gauge establishes the baseline:
- What tier is the current thinking at?
- What is the target tier for this work?
- What artifact (if any) is being gauged?
- What blind spots are surfaced from the meta-perspective prompts?

→ This enables: subsequent sub-skills know what depth of engagement is appropriate. A Tier 1 gauge produces lighter cartography and skips `/ninety` entirely; a Tier 3B gauge produces full depth across all four.

<!-- ID: lens-check.phase-2-cartography -->
### Phase 2 — Run `/cartography`

Invoke `/cartography` on the problem domain identified by `/gauge`. The cartography enumerates the macro vocabulary:
- What primitives exist across the 10% gradient?
- What blind spots in the enumeration are surfaced?
- What dimensions of the cartographic territory are unexamined?

If `/gauge` indicated that the problem genuinely needs only front-of-10% primitives, `/cartography` runs lightly — confirming the front suffices and skipping the latter-end research effort.

→ This enables: `/ninety` knows which 10% primitives need 90% support, and `/conjecture` knows the menu it will compose from.

<!-- ID: lens-check.phase-3-ninety -->
### Phase 3 — Run `/ninety`

Invoke `/ninety` on the primitives that `/cartography` flagged as carrying 90% intelligence requirements. The audit engages the 90% across whichever manifestations and intentions apply:
- Which compositional rules apply to the relevant primitives?
- What data-file byte values, private framework signatures, internal behaviors, tacit knowledge inform the composition?
- Which of the eight intentions are active for this work?

If `/gauge` indicated the work is purely Tier 1 and `/cartography` confirmed front-of-10% primitives suffice, `/ninety` is skipped or runs in minimal-form ("no 90% engagement required for this work").

→ This enables: `/conjecture` has the full 90% intelligence as input. The compositional decisions can be made with the full framework lens.

<!-- ID: lens-check.phase-4-conjecture -->
### Phase 4 — Run `/conjecture`

Invoke `/conjecture` with the outputs of the previous three phases as inputs. The conjecture produces the compositional plan:
- Which 10% primitives are used.
- Which 90% rules inform each compositional decision.
- The shipping-binary purity verification.
- The Tier 2B contrast.
- The composition as apprenticeship material.

→ This enables: implementation. The conjecture output is the architectural plan the engineer implements.

<!-- ID: lens-check.phase-5-integration -->
<!-- INVARIANT: lens-check.phase-5-integration -->
<!-- DEPENDS_ON: _shared/citation-id-schema -->
### Phase 5 — Integrate the Outputs (with Explicit Coherence Tests)

Synthesize the four phase outputs into a unified report. The integration is procedural — specific coherence tests, not just verbal cross-reference.

**Coherence test checklist:**

1. **Primitive-usage check.** For each primitive `/conjecture` uses, is it present in `/cartography`'s enumeration (cited by CARTO-* ID)? If `/conjecture` reaches for primitives that `/cartography` did not surface, the cartography was incomplete or the conjecture is improvising. Flag.

2. **Rule-application check.** For each 90% rule `/conjecture` cites, is it present in `/ninety`'s findings (cited by NINETY-* ID)? If `/conjecture` references rules `/ninety` did not extract, the conjecture is improvising. Flag.

3. **Parameter-consistency check.** For each parameter value `/conjecture` embeds (recipe colorMatrix bytes, spring parameters, etc.), does the value match what `/ninety`'s Manifestation B findings produced? Mismatched parameters mean either `/ninety`'s findings were stale or `/conjecture` invented values. Flag either direction.

4. **Tier-match check.** Does `/conjecture`'s output match the required tier `/gauge` identified? An ambitious conjecture that overshoots `/gauge`'s required tier may be over-engineered; a thin conjecture that undershoots may be inadequate. Flag mismatches.

5. **Confidence-propagation check.** The compound's confidence cannot exceed the minimum sub-skill confidence (weighted by relevance). If `/ninety` was medium-confidence and `/conjecture` is asserting high-confidence rules built on those findings, the conjecture has manufactured confidence. Flag.

6. **Posture-consistency check.** Did all four sub-skills run with consistent posture (Janum-tier throughout)? If any sub-skill silently drifted to senior posture, that sub-skill's output is structurally dishonest and the compound inherits the dishonesty. Flag.

If any coherence test produces a flag, the compound is not yet integrated. Resolve the flag (typically by re-running the offending sub-skill, or by explicitly acknowledging the limitation in the unified verdict) before declaring integration complete.

<!-- ID: lens-check.phase-5-5-pivot-diagnostic -->
### Phase 5.5 — Section XII Pivot Diagnostic (Triggered When Regression Suspected)

When integration produces outputs that feel mechanical, when terms are being used as rote rather than active distinctions, or when the user signals that the framework feels stale, run the Pivot Diagnostic. Walk each of the seven epistemological pivots from Section XII of the framework markdown and identify which is currently insufficiently honored:

1. **Anchor + breadth pivot.** Is the work anchored to a concrete capability while exploring broadly, or has it collapsed to either pure-narrow focus or pure-sprawl?
2. **Menu over depth pivot.** Has the cartography enumerated the full menu, or has the work collapsed to going deeper on already-known primitives?
3. **Awareness of the 90% as distinct stratum pivot.** Is the 90% being engaged as a distinct knowledge stratum requiring research, or has it collapsed back to "public API plus complaints about Apple"?
4. **Conjecture not three discrete moves pivot.** Is the conjecture being executed as the joining operation it is, or has it collapsed to one of three discrete moves (use / build-on-top / rebuild)?
5. **Cartography + mechanics + taste pivot.** Are all three axes engaged, or has the work collapsed to one (cartography alone, or mechanics alone, or taste alone)?
6. **Taste as trigger pivot.** Is taste functioning as the trigger that drives the dip into 90%, or has it collapsed to "acquire 90% knowledge in bulk and apply"?
7. **90% as lens not as importable material pivot.** Is the 90% manifesting in shipping code as intelligence (composition, structure, rules), or has it collapsed to "find things to import"?

For each pivot, state: honored / partially honored / collapsed. For any pivot marked partially-honored or collapsed, name what specific recalibration is needed.

The Pivot Diagnostic is the framework's durability mechanism. Run it when regression is suspected; skip it when the framework is operating cleanly.

→ This enables: the framework remains a way of seeing rather than a checklist over time. The compound's integration becomes self-correcting.

---

## Output Format

```
LENS-CHECK — [PROBLEM DOMAIN OR ARTIFACT]

=== Phase 1 — Gauge Output ===

[Full /gauge output, embedded.]

Key conclusions from the gauge: [tier classification, target tier, blind spots, dimensionality completeness status]

=== Phase 2 — Cartography Output ===

[Full /cartography output, embedded.]

Key conclusions from the cartography: [primitive menu summary, completeness assessment, blind spots, dimensionality completeness status]

=== Phase 3 — Ninety Output ===

[Full /ninety output, embedded, or "skipped" with reasoning if not needed.]

Key conclusions from the ninety audit: [manifestations engaged, intentions active, findings summary, blind spots, dimensionality completeness status]

=== Phase 4 — Conjecture Output ===

[Full /conjecture output, embedded.]

Key conclusions from the conjecture: [load-bearing decisions, Tier 2B contrast, shipping-binary purity status, implementation readiness]

=== Phase 5 — Cross-Skill Integration ===

Coherence check: [do the four sub-skill outputs cohere? specific points of consistency and inconsistency]

Cross-skill blind spots surfaced: [blind spots visible only at the integration level, not at any individual sub-skill]

Unified verdict: [the integrated assessment — is the work ready to implement, does it need re-running of a specific sub-skill, does it need additional research before implementation?]

=== Implementation Plan ===

[The actionable plan. Either: "Ready to implement, see Phase 4 conjecture output for the architectural plan." Or: "Not ready to implement; specific outstanding work: [list]."]

=== Bottling Destination ===

(Inherits from `/conjecture`'s Bottling Destination subsection if Forward Mode produced a module candidate.)

- **Bottle / library:** [name]
- **Module name:** [name]
- **File path:** `/Users/spacewizardmoneygang/Desktop/XcodeInstall/[bottle-name]/Modules/[module-name]/`
- **Apprenticeship value:** [rules this module's structure teaches]

For Reverse Mode with B-Reproduce, the same bottling applies — the reproduction is a module candidate. For Reverse Mode with B-Understand, no bottling output (the audit is for comprehension only).

=== Pivot Diagnostic Results (if run) ===

[If Phase 5.5 was triggered:]
- Pivot 1 (anchor + breadth): [honored / partially / collapsed — with reasoning if not honored]
- Pivot 2 (menu over depth): [...]
- ... through Pivot 7
- Recalibration needed: [specific actions to address any non-honored pivots]

=== Recommendations for Subsequent Work ===

After implementation:
- Validation: [specific benchmarks from /conjecture's output]
- Documentation in the bottle: [if this module is going into our library, the design doc points to this lens-check output]
- Future updates: [what would trigger re-running specific sub-skills — new iOS version, new escaped artifact reading, new behavioral observation]
```

---

<!-- ID: lens-check.blind-spot-diagnostics -->
## Blind-Spot Diagnostics — Stepping Outside the Orchestration

The compound's specific failure modes are different from any sub-skill's. They are about coordination, not about individual operations.

### The Meta-Perspective Prompts

**Prompt 1 — The thin-input cascade prompt.** "Did `/gauge` produce a thin baseline that caused `/cartography` to be invoked at insufficient depth? Did the thin cartography then produce a thin `/ninety` input? Did `/conjecture` then build on a thin foundation? Thin inputs cascade through the orchestration; the compound's job is to catch the cascade."

→ This enables: detection of the failure where each sub-skill was correctly invoked but each was given inadequate input from the previous, producing a stack of internally-correct-but-collectively-thin outputs.

**Prompt 2 — The skipped-sub-skill prompt.** "Did the orchestration skip a sub-skill that was actually warranted? Specifically: was `/ninety` skipped because the gauge said Tier 1, but the work actually has Tier 3 implications the gauge missed? Was `/conjecture` skipped because cartography suggested front-of-10% suffices, but the work actually requires Tier 2B+ composition?"

→ This enables: detection of premature skipping. Sub-skills are skipped honestly only when their territory is genuinely irrelevant; otherwise the skip is a coverage failure.

**Prompt 3 — The output-incoherence prompt.** "Do the four sub-skill outputs cohere with each other? Specifically: does the `/conjecture` actually use primitives from `/cartography`? Does the `/conjecture` actually apply rules from `/ninety`? Or has `/conjecture` improvised on top of inputs that did not actually justify its decisions?"

→ This enables: detection of the failure where `/conjecture` cites sources it did not actually use, producing a composition that looks framework-supported but is actually opportunistic.

**Prompt 4 — The dimension-completeness-cascade prompt.** "Each sub-skill has its own dimensionality completeness check. Did each sub-skill actually pass its check, or were dimensions silently skipped to keep the compound running? Failed dimensionality checks in any sub-skill compromise the entire compound."

→ This enables: catching the failure where the compound's runtime pressure (the user is waiting; let's finish faster) caused individual sub-skills to skip their own metacognitive layers.

**Prompt 5 — The integration-layer-blind-spot prompt.** "Is there a blind spot that exists at the integration level that no individual sub-skill catches? For example: the cartography is correct, the ninety is correct, the conjecture is correct, but together they miss that the work actually belongs to a different problem domain than the one originally framed in `/gauge`."

→ This enables: detection of frame-level errors. The orchestration is the only layer that sees all four outputs simultaneously; the integration is where frame-level coherence is checked.

**Prompt 6 — The verdict-honesty prompt.** "Is the unified verdict honest about implementation readiness, or has it papered over outstanding work to declare readiness? Specifically: are the blind spots from any sub-skill being treated as 'will address during implementation' when they should actually block implementation?"

→ This enables: catching the failure where the compound produces premature 'ready to implement' verdicts. Outstanding research that should block implementation is acknowledged as such, not deferred.

### Named Approaches for Addressing Identified Blind Spots

| Blind spot surfaced | Named approach to address |
|---|---|
| "Thin-input cascade" | Re-run the earliest sub-skill that produced thin input. The cascade clears once the upstream input is deep enough. |
| "Sub-skill was skipped prematurely" | Run the skipped sub-skill explicitly. Determine retrospectively whether the skip was justified or whether it produced a coverage gap. |
| "Output incoherence" | Cross-reference the offending sub-skills explicitly. Either the `/conjecture` revises its sources, or the `/cartography`/`/ninety` is re-run to provide the actual sources the conjecture needs. |
| "Sub-skill dimensionality check was skipped" | Re-run the offending sub-skill, this time with the dimensionality check enforced. Do not let the compound's runtime pressure suppress sub-skill metacognition. |
| "Integration-level frame error" | Return to Phase 1. Re-gauge with the corrected frame. The downstream sub-skills will produce different outputs under a different frame; the rerun is necessary. |
| "Verdict prematurely declares readiness" | Revise the verdict. Acknowledge what is outstanding. The user's expectation of 'ready' is not a justification for declaring readiness when blockers exist. |

→ This enables: the compound is not stuck when coordination failures surface. The skill carries its own toolkit for correcting cross-skill issues.

### When the Compound Cannot Complete Honestly

When the orchestration surfaces that the work cannot be readied for implementation within the current pass — when blind spots in any sub-skill or at the integration layer require additional research that cannot be performed in-conversation — the honest output is acknowledgment plus approach:

"Lens-check incomplete. The orchestration produced [N] sub-skill outputs, but [specific blocker] prevents producing a fully ready implementation plan. Outstanding work: [list with approaches]. Marking lens-check as `partial: pending [X]`. Implementation should not proceed until [X] is resolved."

→ This enables: implementation work does not proceed on a faulty foundation. The compound's premature 'ready' is the most expensive failure mode of the framework; the structural acknowledgment prevents it.

---

<!-- ID: lens-check.dimensionality-completeness -->
## Dimensionality Completeness Check

Before declaring the compound complete, walk through the multi-dimensional territory of the orchestration.

**Dimension 1 — Sub-skill coverage.** Did all four sub-skills run, or was at least one skipped? Skips are valid only when the territory is genuinely irrelevant; otherwise they are coverage failures.

→ This enables: the compound is structurally complete — all four lenses applied unless explicitly justified otherwise.

**Dimension 2 — Sub-skill depth.** Did each sub-skill run at appropriate depth, or were any rushed? Rushed sub-skills produce thin output that cascades into the integration.

→ This enables: each sub-skill's value is realized, not abbreviated under time pressure.

**Dimension 3 — Sub-skill metacognitive layer coverage.** Did each sub-skill complete its own blind-spot diagnostics and dimensionality completeness check? Sub-skill metacognition is the bedrock of compound metacognition.

→ This enables: the compound's metacognition is built on sub-skill metacognition, not on its absence.

**Dimension 4 — Integration coherence.** Are the four sub-skill outputs cross-coherent? Does each output use the previous output's findings appropriately?

→ This enables: the unified report is a single coherent artifact rather than four stapled-together documents.

**Dimension 5 — Implementation readiness honesty.** Is the unified verdict honest about whether the work is ready to implement? Outstanding research is acknowledged, not papered over.

→ This enables: the compound's output is operationally trustworthy — what it declares ready actually is, what it declares pending actually is.

**Dimension 6 — Apprenticeship-material quality.** Is the integrated output rich enough that future engineers can read it as a design document for the module being built? Thin integration produces thin apprenticeship value.

→ This enables: the compound's output is durable. The unified report ages well as a design document.

If any dimension is unexamined, state explicitly: "Dimension X unexamined; [action] would address." Then perform the action or flag as outstanding.

→ This enables: the compound is structurally complete across the orchestration territory, not merely along the dimensions that came to mind first.

---

## Notes on Use

- **`/lens-check` is the heavy artifact.** A full pass produces a substantial output. Reserve for situations where the substantial output is warranted (new module design, complex artifact reproduction, framework regression recalibration). Trivial questions do not need lens-check; they need a single sub-skill or no skill at all.
- **Individual sub-skills are still independently invocable.** `/lens-check` does not replace them. When the user wants just a `/cartography` or just a `/ninety`, they invoke the sub-skill directly. The compound is for full passes.
- **The unified report becomes design-doc material.** When a module of our bottle is built from a `/lens-check` output, the output goes into the module's design folder. Future engineers read both the source and the design doc to absorb the full apprenticeship value.
- **Compound runs should be rare.** Daily work does not need lens-check daily. Per-module design, per-feature design, per-significant-decision design — these are the right invocation frequencies. Over-invocation dulls the framework; appropriate invocation keeps it sharp.
- **Compound runs are revisable.** As any sub-skill's output improves (new `/ninety` findings, new `/cartography` primitives surfaced), the compound is re-run for the affected work. The unified report is a snapshot at a point in time; updates produce new snapshots.
- **The compound is the discipline-maintenance tool.** When framework distinctions feel stale, running `/lens-check` on current work re-activates the framework. The framework is durable because it gets re-walked through the compound periodically.
