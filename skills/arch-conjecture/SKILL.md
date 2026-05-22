---
name: arch-conjecture
description: Compose the architectural recommendation. Takes the outputs of /arch-gauge (tier + gap) + /arch-cartography (primitive menu) + /arch-ninety (90% craft findings) and produces a concrete architectural proposal — file layout, types, wiring story, call-site experience, rejection list, implementation order. Parallel sibling to `/conjecture` (which composes 10% primitives under 90% Apple-substrate lens); this skill composes architectural primitives under principal-tier craft lens.
---

# Arch-Conjecture — Compose the Architectural Recommendation

This skill is the **composition move** of the architecture 10/90 framework — parallel sibling to `/conjecture` for the architecture domain. It takes the outputs of the prior three skills (gauge baseline + cartography menu + ninety findings) and composes them into a concrete shipping architectural recommendation.

**Critical framing:** A conjecture is not a survey of options. The cartography surveyed; the ninety researched; the conjecture **chooses and composes**. Conjecture output is a specific, defensible architectural design with named types, wiring decisions, and a rejection list.

---

## Posture Check (Precondition)

<!-- ID: arch-conjecture.posture-check -->
<!-- INVARIANT: arch-conjecture.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check.

### Output declaration

`POSTURE: janum` or `POSTURE: senior` (halt if senior).

### Skill-specific addendum

For `/arch-conjecture`, senior posture manifests as either:
- **Underclaiming**: producing a conjecture that defers all decisions to "consult an expert" or "try multiple approaches" — refusing to commit to a position
- **Overclaiming**: producing a conjecture that recommends maximalist principal-tier abstractions without grounding in /arch-gauge's required tier — recommending Pointfree-witness everything when Tier 2A suffices

Janum-tier posture manifests as: a specific, tier-calibrated recommendation grounded in cited findings from /arch-ninety, with an explicit rejection list that names what's NOT being built and why.

---

## What This Skill Concretely Enables
<!-- ID: arch-conjecture.concrete-capabilities -->

- **The ability to produce a defensible architectural recommendation.** Not "here are options," but "here is the architecture, here's why each piece, here's what we're refusing to build."
- **The ability to thread 90% craft findings into concrete code.** Wave's animator-on-view pattern becomes the actual `extension UIView { var animator: WaveAnimator { ... } }` declaration. Pointfree's witness pattern becomes the actual `struct APIClient: Sendable { var fetch: @Sendable ... }` declaration.
- **The ability to scope the recommendation to the required tier.** Tier 2A and Tier 3B recommendations look fundamentally different. The conjecture matches the gauge's tier verdict.
- **The ability to produce a migration plan from current state to recommended state.** Not just the destination — the commit-by-commit path.
- **The ability to ground every recommendation in citation IDs.** ARCH-CARTO-* for primitives, ARCH-NINETY-* for craft rules. Each load-bearing decision is traceable.

---

## When to Use This Skill

After `/arch-gauge` + `/arch-cartography` + `/arch-ninety` have produced their outputs, AND the user wants a concrete recommendation. If the problem genuinely is "I just want to understand the landscape," conjecture is not needed.

---

## The Conjecture Move

The architectural conjecture move is the COMPOSITION of:
1. The required tier (from gauge)
2. The available primitives (from cartography)
3. The applicable 90% craft rules (from ninety)

Into a single coherent architecture. The composition is constrained:

- Every primitive used must appear in `/arch-cartography`'s enumeration (cited by ARCH-CARTO-* ID)
- Every craft rule applied must appear in `/arch-ninety`'s findings (cited by ARCH-NINETY-* ID)
- The recommended tier of the composition must match `/arch-gauge`'s required tier
- The rejection list must name what was deliberately NOT included, with cited reasons

If any of these constraints can't be satisfied, the conjecture is either improvising (citing rules/primitives not in prior outputs) or under-supported (omitting available craft).

---

## The Skill Workflow

### Phase 1 — Verify input completeness

Confirm `/arch-gauge`, `/arch-cartography`, `/arch-ninety` outputs are available (either from prior sub-skill invocations OR from the user's input). If any is missing, halt and recommend running the missing sub-skill first.

### Phase 2 — Anchor to required tier

State the required tier explicitly. The conjecture's posture is calibrated against this tier.

### Phase 3 — Compose the module structure

What Swift packages / modules / files does this architecture need? Be specific. Public vs internal. Separate package vs internal namespace.

### Phase 4 — Compose the type-level architecture

Every named type with its signature + role. Generic constraints, protocol conformances, value vs reference type, actor isolation.

### Phase 5 — Compose the wiring story

How do the types connect? What's injected via swift-dependencies? What lives on views (animator-on-view)? What lives on coordinators? What's ambient via Environment / UITraitDefinition?

### Phase 6 — Compose the call-site experience

How does the consumer USE this architecture? Show specific code snippets for the load-bearing call sites.

### Phase 7 — Compose the rejection list

What abstractions are explicitly NOT being built, and why? Each refusal cited.

### Phase 8 — Compose the migration plan

If anchoring to a current codebase, the commit-by-commit migration path with tests added at each step.

### Phase 9 — Validate via coherence tests

Six checks (mirroring `/lens-check`'s Phase 5):

1. **Primitive-usage check.** Every primitive used has an ARCH-CARTO-* citation.
2. **Rule-application check.** Every craft rule applied has an ARCH-NINETY-* citation.
3. **Parameter-consistency check.** Embedded values (spring fingerprints, durations, etc.) match `/arch-ninety` findings.
4. **Tier-match check.** Conjecture's recommended tier matches `/arch-gauge`'s required tier.
5. **Confidence-propagation check.** Conjecture's confidence doesn't exceed the minimum source-confidence of cited findings.
6. **Rejection-completeness check.** Every notable abstraction the user might expect is either included or explicitly refused.

---

## Agent Dispatch Protocol
<!-- ID: arch-conjecture.agent-dispatch -->

`/arch-conjecture` MAY dispatch agents for validation of the composition. Unlike `/arch-cartography` and `/arch-ninety` which research evidence, `/arch-conjecture` synthesizes — but the synthesis may benefit from agent validation:

- **Validator Agent A** — Cross-check the conjecture against a reference shop's published architecture. "Would Krzysztof / Janum / Brandon recognize this as their pattern?"
- **Validator Agent B** — Check for over-abstraction or under-abstraction relative to required tier.
- **Validator Agent C** — Verify the rejection list is complete (no major abstractions silently skipped without explicit refusal).

Dispatch is OPTIONAL for conjecture. The composition itself doesn't require new research; it requires composition discipline. Use agents when the composition crosses unfamiliar territory or when validation against principal-tier published practice is desired.

---

## Output Format

```
ARCH-CONJECTURE — [PROBLEM DOMAIN]

POSTURE: [janum / senior]

=== Inputs verified ===
- /arch-gauge output: [present / absent — halt if absent]
- /arch-cartography output: [present / absent]
- /arch-ninety output: [present / absent]

=== Required tier ===
[The target tier from /arch-gauge — the conjecture's calibration anchor]

=== Module structure ===
Swift packages / modules / files needed:
```
[Directory tree]
```

=== Type-level architecture ===
For each named type:
**[TypeName]**
- Generic constraints: [...]
- Conformances: [...]
- Value/reference + isolation: [...]
- Role: [...]
- Citation: [ARCH-CARTO-X or ARCH-NINETY-Y]

=== Wiring story ===
[Ownership graph + dependencies + what's injected via what mechanism]

=== Call-site experience ===
[Code snippets for the load-bearing call sites — how the consumer USES this]

=== Rejection list ===
For each abstraction NOT being built:
- [Abstraction name]: REFUSED
- Reason: [...]
- Citation: [ARCH-NINETY-X — the 90% finding that supports this refusal]

=== Migration plan (when anchoring to current codebase) ===
Commit-by-commit:
1. [Commit 1: characterization tests / scaffolding]
2. [Commit 2: ...]
3. [...]

=== Coherence test results ===
1. Primitive-usage check: [PASS / FAIL — flagged primitives]
2. Rule-application check: [PASS / FAIL — flagged rules]
3. Parameter-consistency check: [PASS / FAIL]
4. Tier-match check: [PASS / FAIL]
5. Confidence-propagation check: [PASS / FAIL]
6. Rejection-completeness check: [PASS / FAIL]

=== Implementation readiness ===
[Ready to implement / outstanding work blocking implementation]

=== Bottling Destination (if applicable) ===
- Bottle / library: [name if module candidate for shared library]
- Module name: [name]
- File path: [path]
- Apprenticeship value: [what this module's structure teaches]

=== Source-confidence summary ===
[Per major load-bearing decision: HIGH / MEDIUM / LOW]
```

---

## Blind-Spot Diagnostics

- **Prompt 1 — Improvisation detection.** "Did I cite primitives or rules that don't appear in prior sub-skill outputs? If so, the conjecture is improvising rather than composing."
- **Prompt 2 — Tier-mismatch.** "Did I recommend a more elaborate architecture than the required tier warrants? Or a simpler one than required tier requires?"
- **Prompt 3 — Rejection-list omission.** "Did I name what I'm NOT building, or did I produce additive-only recommendations?"
- **Prompt 4 — Call-site experience handwaving.** "Did I show the actual API surface, or did I describe it abstractly? The call-site code IS the conjecture's most concrete artifact."
- **Prompt 5 — Migration plan absence.** "If anchoring to a current codebase, did I produce the commit-by-commit path, or did I jump to the destination only?"
- **Prompt 6 — Coherence-test bypass.** "Did I run the six coherence tests, or did I declare 'ready to implement' without checking?"

---

## Dimensionality Completeness Check

- **Dimension 1 — Module structure specificity.** Concrete file paths, not abstract gestures.
- **Dimension 2 — Type-level concreteness.** Every named type has signature + role.
- **Dimension 3 — Wiring concreteness.** Specific injection mechanisms, not "depends on X."
- **Dimension 4 — Call-site concreteness.** Actual code, not prose description.
- **Dimension 5 — Rejection completeness.** Every notable abstraction handled (used or refused).
- **Dimension 6 — Migration plan presence.** When anchoring to current state, commit-by-commit path produced.

---

## Notes on Use

- **Conjecture is composition, not enumeration.** The cartography enumerated; this composes.
- **The rejection list is non-negotiable.** Without it, the conjecture isn't principal-tier — it's just a longer recommendation.
- **Citation density matters.** Every load-bearing decision should be traceable to a prior sub-skill's output.
- **Migration plan is essential when anchoring to current state.** "Here's where you should go" without "here's how you get there from where you are" is incomplete.
- **The Bottling Destination subsection feeds /lens-check.** When the conjectured module is a candidate for shared-library extraction, this subsection captures it.
