---
name: conjecture
description: Execute the conjecture move — compose the latter end of the 10% under the lens of 90% knowledge. Produce a compositional plan whose implementation layer is 100% public-API and whose value system is 90%-derived. The output is shipping code where the 90% appears as intelligence (structure, parameter choices, compositional rules), not as symbols (private API calls).
---

# Conjecture — The Composition Move

This skill is the **heart of the 10/90 framework**. It is the operation that produces Janum-tier output. The previous skills — `/gauge` (baseline), `/cartography` (macro vocabulary), `/ninety` (micro vocabulary) — feed into this one. `/conjecture` is where their outputs become a compositional plan.

The conjecture is a specific operation: composing the latter end of the 10% (the public-API deep end any developer can ship) under the lens of 90% knowledge (Apple's internal compositional intelligence). The shipping binary is 10%-only. The soul is 90%-derived. The output looks like Apple shipped it.

The full framework is documented at `/Users/spacewizardmoneygang/Desktop/XcodeInstall/THE_10_90_FRAMEWORK.md`. Read Section V (The Conjecture Move) and Section VII (Wave — The Significance, the Anatomy, the Apprenticeship) before invoking this skill.

**Critical framing:** the conjecture move is not "mix some private API with public code." It is "compose public APIs in the way Apple's internal teams compose them." The 90% appears in the output as **intelligence, not symbols**. The shipping binary contains no `dlsym`-loaded private classes, no entitlement-gated calls, no class-name strings reaching for private types. It contains: public APIs called in a specific order, with specific parameter values, with specific architectural decisions, all of which are informed by 90%-derived compositional rules.

If the conjecture output contains private symbol calls, the conjecture failed. The point of the conjecture move is precisely that you do not need to ship private symbols to ship Apple-grade output.

---

## Posture Check (Precondition)

<!-- ID: conjecture.posture-check -->
<!-- INVARIANT: conjecture.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement
<!-- ID: conjecture.output-declaration -->
<!-- INVARIANT: conjecture.output-declaration -->

After performing the Posture Check (per inherited protocol), this skill's output MUST contain an explicit line:

`POSTURE: janum` — when the Janum-tier posture is confirmed.
`POSTURE: senior` — when the senior posture is detected. In this case, halt and recalibrate before producing further output beyond this declaration.

The Stop hook scans for this line to write a session-level posture artifact that downstream skill invocations consult. Skipping this declaration breaks the framework's posture-propagation guarantee.

### Skill-specific addendum

For `/conjecture` specifically, senior-posture engineers attempting this skill produce **one of two failure modes**, and both are dishonest outputs:

1. They wrap private API calls in their composition and claim it's a conjecture. It isn't — it's a **private-API translation** with the conjecture move's vocabulary bolted on. The shipping binary contains private symbols; the App Store risk is real; the framework's central claim (Apple-grade output from public-API code) is unmet.
2. They compose pure-10% mechanics without 90%-informed structure and claim it's a conjecture. It isn't — it's **senior-tier composition with extra documentation**. The Layer 2 annotations are retrofitted; the structure itself does not encode the rules. Phase 7.5's implicit-in-structure test fails.

Both failure modes are detected by walking Phase 5 (shipping-binary purity) and Phase 7.5 (Layer 2 implicit in structure) honestly. From the wrong posture, those phases get rubber-stamped rather than executed.

---

## What This Skill Concretely Enables
<!-- ID: conjecture.concrete-capabilities -->
<!-- INVARIANT: conjecture.concrete-capabilities -->

`/conjecture` is not invoked for the sake of producing more documentation. The compositional engineering work it performs only pays off if the engineer can name the concrete capabilities the output unlocks. Specifically:

- **The ability to ship Apple-grade output from outside Apple, using public APIs.** This is the framework's central claim, and the conjecture move is what makes it concrete. The composition produced by `/conjecture` is the shipping artifact: code that behaves like Apple's internal version while linking only against public symbols. Wave is the canonical example. Our `LiquidGlassView` is another. The conjecture move makes more examples reachable.
- **The ability to produce code that teaches its readers the compositional philosophy it encodes.** When a future engineer reads the composition, the architectural decisions are legible: "this layer wraps `CATransaction.setDisableActions(true)` because Apple's animation server disables implicit animations during explicit ones; this `target.didSet` preserves velocity because the iPhone X switcher does; this color matrix mirrors `platformContentGlass.materialrecipe`'s coefficients because Apple's iOS 18 Liquid Glass uses them." Reading the composition is apprenticeship. The capability is: the code is a bottle.
- **The ability to compound capability across our app portfolio.** A conjectured composition is reusable. Once `LiquidGlassView` is built, every app we ship that needs a Liquid Glass surface imports it. Each conjecture move is upstream of every subsequent app that uses its output. The capability is: leverage.
- **The ability to survive iOS version transitions without rework.** Compositions built on public APIs and informed by perceptual-physical 90% rules (velocity preservation feels alive because of how perception works; OKLab interpolation produces clean crossfades because of how color perception works) are anchored to invariants that do not change per release. iOS version transitions break private-API users; they do not break properly-conjectured compositions. The capability is: durable code.
- **The ability to articulate exactly what makes our composition Apple-grade rather than senior-grade.** The conjecture output names, for each compositional decision, the 90% rule informing it. This is the antidote to vague "this just feels better" claims. The capability is: defensible architectural choices.
- **The ability to ship without App Store risk while still achieving private-API-grade output.** The composition's binary surface contains no private symbols. Static analysis finds nothing to flag. The output is review-tolerant indefinitely. The capability is: shippability.

These are the concrete capabilities the conjecture move provides. If after running `/conjecture` you cannot point to one of these being newly enabled, the conjecture was performed wrong or was not needed.

Each phase below, and each section of the output format, includes an explicit statement of what specific capability that operation enables.

---

## When to Use This Skill

**User-invoked triggers** — the user types `/conjecture` when:

- They have a UX/UI goal and want the compositional plan that achieves it at Apple-grade depth.
- They have completed `/gauge`, `/cartography`, and `/ninety` and want those outputs synthesized into a compositional plan.
- They are about to build a new module of the bottle (the library that encodes our accumulated compositional intelligence) and want the module's architecture conjectured before implementation.
- They are reviewing an existing composition and want to verify it actually executes the conjecture move rather than being a 10%-only composition that the engineer mistakenly labeled as conjectured.

**Self-invoked triggers** — the assistant invokes `/conjecture` automatically when:

- The user has approved proceeding to implementation after `/gauge` + `/cartography` + `/ninety` have produced their outputs.
- A specific architectural decision is being made (which primitive, which parameter, which composition order) and the conjecture move would inform it.
- The assistant detects it has been about to ship a 10%-only composition for a task where the goal requires Apple-grade feel, and the conjecture move is the corrective.
- Implementation code is about to be written and the conjecture output is needed as the architectural plan.

In all cases, `/conjecture` consumes the outputs of the previous framework skills and produces a compositional plan. The plan is the bridge from research to implementation.

---

<!-- ID: conjecture.operation-mechanics -->
## The Conjecture Operation Mechanically

The conjecture move has a specific mechanical structure. The skill executes this structure explicitly.

<!-- ID: conjecture.two-layers -->
### The Two Layers Every Conjectured Line of Code Participates In

Every line of code produced by the conjecture move participates in two layers simultaneously:

**Layer 1 — Implementation layer (10%).** What API is being called, what type is being instantiated, what parameter is being set, what value is being written. This layer is public, App-Store-legal, recoverable by any developer with SDK access.

**Layer 2 — Compositional layer (90%-informed).** *Why* this API is being called in this position, *why* this parameter value, *why* this composition order. This layer is the encoding of internal Apple compositional rules that the engineer absorbed through `/ninety` research.

A reader of the code sees only Layer 1 directly. Layer 2 is implied by the structure of the implementation. The conjecture output names both layers explicitly so the implementation is legible as both a working program and as a philosophical document.

### The Conjecture's Necessary Inputs

`/conjecture` cannot run cleanly without:

- A clearly stated UX/UI goal (what experience is being produced).
- The output of `/cartography` for the relevant domain (what 10% primitives are in the menu).
- The output of `/ninety` for the relevant domain (what 90% compositional intelligence applies, across whatever manifestations and intentions were active).

If any of these is missing, `/conjecture` flags the missing input and recommends running the corresponding upstream skill before proceeding.

### The Conjecture's Output Form

The conjecture output is a structured compositional plan with these properties:

- It names which 10% primitives are being used (Layer 1).
- It names the order of operations, the parameter values, and the architectural decisions (Layer 1 structure).
- For each significant Layer 1 decision, it names the 90% rule informing it (Layer 2).
- It distinguishes "compositional decisions informed by 90% intelligence" from "compositional decisions that would have been the same under pure-10% reasoning."
- It states explicitly that the shipping binary contains no private symbols.
- It identifies where the composition departs from a hypothetical Tier 2B senior-engineer version of the same work, to make the value of the 90% lens explicit.

---

<!-- ID: conjecture.workflow -->
## The Skill Workflow

<!-- STEP: conjecture.workflow.phase-1-restate-goal -->
### Phase 1 — Restate the Goal

State the UX/UI goal in concrete, behaviorally-specific terms. Not "smooth animation" but "a card-stack carousel where the user can pinch to collapse with mid-flight velocity-preserving retarget, hit-test at destination during the morph, and OKLab crossfade of the gradient backdrop."

→ This enables: the composition is anchored to a specific outcome that can be tested against. Vague goals produce vague compositions.

<!-- STEP: conjecture.workflow.phase-2-inventory-inputs -->
<!-- ID: conjecture.input-contract -->
<!-- INVARIANT: conjecture.input-contract -->
<!-- DEPENDS_ON: _shared/citation-id-schema -->
### Phase 2 — Inventory the Inputs (with Partial-Inputs Handling)

Confirm the prerequisites are present:

- `/gauge` output: what tier was the baseline, what blind spots were named, what was the recommended depth for this work?
- `/cartography` output: what primitives are in the menu (with citation IDs)? What was the completeness assessment? What `90%-dependency` annotations did it produce?
- `/ninety` output: what 90% findings are available (with citation IDs)? Which manifestations were investigated? Which intentions were active? What lenses were applied?

**Partial-Inputs Handling:**

- **All three inputs present:** proceed normally.
- **`/gauge` missing:** cannot proceed — without tier baseline, the conjecture cannot calibrate its depth. Halt and request `/gauge`.
- **`/cartography` missing but `/gauge` present:** acceptable only if `/gauge` confirmed Tier 1 work or strict front-of-10% primitives are sufficient. Otherwise halt and request `/cartography`. The conjecture cannot enumerate primitives it has not been given.
- **`/ninety` missing but `/gauge` and `/cartography` present:** acceptable only if `/cartography`'s sufficiency check confirmed pure-10% composition is adequate for target tier. Otherwise halt and request `/ninety` — the conjecture cannot apply 90% lens that has not been audited.
- **Cited findings missing IDs:** flag explicitly. Upstream-skill output was unstructured; the conjecture's traceability degrades. Recommend re-running the upstream skill with citation-ID format enforced.
- **Inputs are thin (low confidence in upstream skills):** the conjecture inherits that confidence. The conjecture's confidence cannot exceed the minimum of its input confidences. Flag this as a quality limit.

Do not improvise upstream-skill outputs inside `/conjecture`. Run them upstream or proceed with explicit partial-inputs disclosure.

→ This enables: the conjecture is built on documented foundations, not on the assistant's improvised assumptions. Improvised foundations produce structurally fragile compositions.

<!-- STEP: conjecture.workflow.phase-3-identify-decisions -->
### Phase 3 — Identify the Load-Bearing Compositional Decisions

For the goal, enumerate the architectural decisions that will shape the composition. These are typically:

- **Primitive selection.** Which primitives from the cartography menu are being used?
- **Composition order.** In what order are the primitives wired? (E.g., snapshot → downsample → blur → colorMatrix vs. snapshot → colorMatrix → downsample → blur.)
- **Parameter values.** What specific values are being set? (E.g., blur radius, color matrix coefficients, spring damping ratio.)
- **State management.** What state is being maintained, and where? (E.g., single shared display link, per-animator value+velocity state.)
- **Rule encoding.** What runtime rules are being encoded? (E.g., velocity preservation through retarget, hit-test at destination, OKLab interpolation for crossfades.)

Each of these is a load-bearing decision. The conjecture explicitly addresses each.

→ This enables: the composition's architecture is decomposable into named decisions, each of which can be reviewed, defended, and updated independently.

<!-- STEP: conjecture.workflow.phase-4-name-90-rule -->
### Phase 4 — For Each Decision, Name the 90% Rule (Or Acknowledge Pure-10%)

For each load-bearing decision identified in Phase 3, name the 90% rule informing it. The 90% rule comes from the `/ninety` output. If a decision is not informed by a 90% rule (i.e., it would have been the same under pure-10% senior reasoning), acknowledge that explicitly.

The format for each decision:

```
Decision: [name]
Layer 1 (10% mechanics): [API calls, parameter values, code structure]
Layer 2 (90% rule informing this): [the specific compositional rule, with source]
Source of the rule: [behavioral observation / class-dump / recipe extraction / escaped artifact / etc.]
Confidence in the rule: [high / medium / low]
Pure-10% alternative: [what the senior engineer without 90% awareness would have done instead]
Why this matters: [the specific UX/UI effect that comes from the 90%-informed choice]
```

→ This enables: every Layer 1 decision is grounded in a Layer 2 rule, and the alternative (pure-10% reasoning) is explicit. The composition is defensible decision-by-decision.

<!-- ID: conjecture.phase-5-purity -->
### Phase 5 — Verify Shipping-Binary Purity (Procedural)

Before producing the final output, walk through the proposed composition and verify that no private symbols appear in the shipping binary. This is a *procedural* check — specific patterns to scan, not just verbal assertion. For each line of the proposed composition, run the following pattern scans:

**Pattern scan checklist** (every match is a hard flag):

1. `NSClassFromString("_UI...")` — flag. Private class reach via reflection.
2. `NSClassFromString("MT...")`, `NSClassFromString("SBF...")`, `NSClassFromString("SBUI...")`, `NSClassFromString("MR...")`, `NSClassFromString("CARemote...")` — flag. Private framework classes by name prefix.
3. `dlsym(` against any non-public symbol — flag.
4. `objc_getClass("_...")` or `objc_getClass` with underscore-prefixed names — flag.
5. `performSelector:` with selector strings not in the public SDK — flag. Specifically: selectors with leading underscore, or selectors known from private class-dumps.
6. `valueForKey:@"_..."` — yellow flag. KVC with underscore-prefixed key. Verify this is documented-private-property-on-public-class (acceptable, e.g., `MPMediaItemArtwork._colorAnalysis`) versus reaching into a private class.
7. Direct class-name literals matching `nst/iOS-Runtime-Headers` private-class catalog — flag. Even without `NSClassFromString`, hardcoded private class names indicate intent.
8. Entitlement-gated framework imports (`CarPlay`, `HomeKit` background modes, etc.) without the required entitlement declared — flag.
9. SPI symbols (Swift) from private modules — flag.

**Acceptable elements** (no flag):
- Public-API symbol calls (any documented or class-dumpable-but-public symbol).
- KVC on public classes for documented-or-undocumented properties where the receiver is public (verify per item).
- Numeric constants extracted from 90% data files (recipe colorMatrix bytes as Swift `simd_float4x4` constants — values are 90%-derived, but as numbers in the binary they are unflaggable).
- Compositional patterns mirroring 90% architectures (structure reflects 90% knowledge; no private symbols linked).
- SF Symbol names, public asset references.

If any pattern scan produces a flag, the composition is not yet a conjecture. Replace the flagged line with a public-API peer-rebuild approach and re-scan. Repeat until the scan is clean.

The full acceptable/unacceptable matrix:

- Public-API symbol calls.
- KVC on public classes for documented-or-undocumented properties (`valueForKey:@"_colorAnalysis"` is acceptable — the property is private but the access path uses public KVC machinery).
- Numeric constants extracted from 90% data files (recipe colorMatrix bytes as Swift `simd_float4x4` constants — the values are 90%-derived, but as numbers in the binary they are unflaggable).
- Compositional patterns mirroring 90% architectures (the structure of the code reflects 90% knowledge, but no private symbols are linked).
- SF Symbol names, public asset references.

The unacceptable elements:

- `NSClassFromString("_UI...")` or `NSClassFromString("MT...")` or any class-name string referencing a private class.
- `dlsym`-loaded private framework symbols.
- `performSelector:` against undocumented selectors.
- Entitlement-gated API calls without the required entitlement.

If the proposed composition includes unacceptable elements, flag them explicitly and replace with peer-rebuild approaches. The conjecture is not complete until shipping-binary purity is verified.

→ This enables: the composition ships through App Store review without static-analysis flagging. The conjecture's central claim — Apple-grade output as public-API code — is structurally enforced by this phase.

<!-- ID: conjecture.phase-6-contrast -->
<!-- DEPENDS_ON: _shared/tier-ladder -->
### Phase 6 — Articulate the Tier 2B Contrast (Criteria Checklist)

For the composition to be visibly Janum-tier rather than just well-built senior work, the contrast with what a Tier 2B engineer would have built must be explicit. The contrast must be concrete, not vague.

**Concrete-contrast criteria — every Tier 2B contrast must cover all four dimensions:**

1. **API delta:** which specific APIs would the Tier 2B engineer have called instead? Name them. ("CASpringAnimation directly" vs. "manual spring integration in Swift," not "different animation approach.")

2. **Parameter delta:** which specific parameter values would the Tier 2B engineer have used? Name them. ("`stiffness: 200, damping: 20`" vs. "`response: 0.5, dampingRatio: 1.0`," not "different parameters.")

3. **Compositional pattern delta:** which structural patterns would the Tier 2B engineer have organized differently? Name them. ("One CADisplayLink per animation" vs. "single shared display link," not "different architecture.")

4. **UX outcome delta:** which specific UX/UI properties would users perceive differently? Name them. ("Velocity reset on retarget produces visible snap" vs. "preserved velocity feels alive," not "feels worse.")

If a Tier 2B contrast lacks any of the four dimensions, it is vague and the Janum-tier claim is unfalsifiable. Re-do the contrast until all four dimensions are concrete.

**Then state:**

- Which of our Phase 4 decisions are the ones that produce the Janum-tier output?
- For each, which of the four contrast dimensions does the decision drive?

→ This enables: the composition's quality is judgeable against a baseline. "Apple-grade" is not a vague claim; it is a specific delta from the senior-engineer composition.

<!-- ID: conjecture.phase-7-apprenticeship -->
### Phase 7 — Document the Composition As Apprenticeship Material

The final phase makes the composition readable as apprenticeship material. For each significant decision, include a brief comment-style annotation explaining the rule. Future engineers reading the code will absorb the compositional philosophy by reading these annotations.

The composition is now a bottle in microcosm. Each module conjectured by this skill is a piece of the larger bottle (the library).

→ This enables: the composition teaches. Subsequent engineers internalize the compositional rules by reading the code. The chain of apprenticeship extends.

<!-- ID: conjecture.phase-7-5-implicit-in-structure -->
### Phase 7.5 — Layer 2 Implicit-in-Structure Verification

The conjecture move's quality test: read the composition without the Layer 2 annotations. Can a careful reader still infer the compositional rules from the architecture alone?

For each Phase 4 decision, mentally strip the annotation and ask:
- Does the code's structure *force* the reader toward the same compositional rule the annotation names?
- If the annotation were absent, would a reader at Tier 3 think to ask "why this composition order? why this parameter space?"
- Or does the structure read as arbitrary, with the annotation doing all the philosophical work?

If a decision passes this check, the rule is encoded in structure — Layer 2 lives in the code. If a decision fails (the structure is arbitrary without the annotation), the rule is *only* in the annotation, which means the composition has not actually encoded the rule. The annotation is teaching but the code is not.

When a decision fails the check, revise the composition until the structure itself implies the rule. The annotation is then redundant-but-helpful, not load-bearing. The composition's apprenticeship value lives in the code, not in commentary on the code.

→ This enables: the bottle's compositional intelligence is durable. Annotations age and get pruned; the structural rules persist as long as the code does.

---

## Output Format

```
CONJECTURE — [GOAL]

=== Goal ===

[Concrete, behaviorally-specific statement of the UX/UI goal.]

=== Inputs ===

Gauge baseline: [Tier classification, blind spots noted]
Cartography output: [primitive menu summary, completeness assessment]
Ninety output: [90% findings summary, manifestations engaged, intentions active]

[Flag any missing or thin inputs.]

=== Load-Bearing Compositional Decisions ===

[For each decision:]

**Decision: [name]**
- Layer 1 (10% mechanics): [API calls, parameter values, code structure]
- Layer 2 (90% rule informing this): [the specific compositional rule]
- Source of the rule: [/ninety finding citation]
- Confidence: [high / medium / low]
- Pure-10% alternative: [what Tier 2B would have done]
- Why this matters: [the specific UX/UI effect that the 90%-informed choice produces]

=== Shipping-Binary Purity Verification ===

✓ Acceptable elements only: [list of element types confirmed present]
✓ No unacceptable elements: [list of categories explicitly verified absent]

[If any unacceptable element was initially proposed, flag the replacement.]

=== Tier 2B Contrast ===

What the senior-engineer composition would look like for the same goal: [description]

Specific UX/UI properties that would be different: [list]

Decisions that produce the Janum-tier output: [list of decisions from above that distinguish this composition]

=== Composition As Apprenticeship Material ===

[Annotated code skeleton or architectural diagram. For each significant decision, include a brief inline comment naming the 90% rule encoded.]

=== Implementation Readiness ===

The composition is ready to implement. Outstanding open questions: [list, if any]
Recommended validation after implementation: [behavioral tests, frame-step comparison against Apple-grade benchmark, etc.]

=== Bottling Destination ===

- **Bottle / library:** [name of the library this module belongs to, e.g., `AmbientUI`, `MotionKit`, `MaterialPeers`. If no library exists yet, propose the name and indicate "new bottle"]
- **Module name:** [the module's name within the bottle, e.g., `LiquidGlassView`, `WaveTierAnimator`, `AmbientPaletteExtractor`]
- **File path (proposed):** `/Users/spacewizardmoneygang/Desktop/XcodeInstall/[bottle-name]/Modules/[module-name]/`
- **Adjacency:** which sibling modules in the bottle does this depend on or compose with? [list]
- **Apprenticeship value:** what compositional rules does this module bottle that future engineers reading it will absorb? [brief list — the rules this module's structure teaches]

If this module is for a one-off app rather than a bottled artifact, state explicitly: "Not for bottling — single-app use." Rare; the default is bottling.

=== Cited Inputs ===

- `/cartography` primitives cited: [list of CARTO-* IDs used in this composition]
- `/ninety` findings cited: [list of NINETY-* IDs used in this composition]
- Any input cited without an ID indicates upstream-skill output that was unstructured; flag for upstream-skill output-format upgrade.
```

---

<!-- ID: conjecture.blind-spot-diagnostics -->
## Blind-Spot Diagnostics — Stepping Outside the Composition

The conjecture move has its own specific failure modes. The blind spots are different from those of `/gauge`, `/cartography`, or `/ninety` — they are about whether the composition actually executes the conjecture or merely claims to.

### The Meta-Perspective Prompts

**Prompt 1 — The shipping-binary purity audit prompt.** "If I produced the proposed composition's binary right now and ran Apple's static analyzer over it, would it flag any private symbol references? Specifically, have I accidentally proposed a `NSClassFromString` reach for a private class somewhere, or am I about to call `setValue:forKey:` with a key that requires a private class to be the receiver?"

→ This enables: detection of the failure where the composition imagines itself as 10%-only but actually contains private symbol references hidden behind reflection.

**Prompt 2 — The encoding-versus-calling prompt.** "For each Layer 2 rule I have named, am I *encoding the rule* in the structure of my public-API code, or am I *calling the API* that implements the rule? The conjecture move is the former. If I am doing the latter — for example, calling `MTMaterialView` instead of building a peer Metal pipeline that reproduces its behavior — I have shipped a private-API translation, not a conjecture."

→ This enables: detection of the failure where the engineer assumes "I am using Apple's internal approach" when actually they are linking against Apple's internal API. The conjecture composes; the translation calls.

**Prompt 3 — The reverse-pure-10% test prompt.** "If I removed the Layer 2 annotations from my composition and showed only the Layer 1 code to a Tier 2B engineer, would they recognize the composition as something they could have produced themselves? If yes, the conjecture has failed — the 90% intelligence is not actually informing the structure. If no, what specifically in the structure would they not have produced, and why?"

→ This enables: the test that the 90% intelligence is actually load-bearing in the structure. If the composition is indistinguishable from senior work, the conjecture has not done its job.

**Prompt 4 — The Tier 2B contrast adequacy prompt.** "Have I named the Tier 2B alternative for each load-bearing decision, and is the named alternative concretely different from my chosen composition? Vague contrasts ('Tier 2B would have done something less smooth') are insufficient. Specific contrasts ('Tier 2B would have used CASpringAnimation directly, accepting velocity reset on retarget') are the bar."

→ This enables: the contrast section is meaningful, not performative. Without concrete contrasts, the claim of being Janum-tier is unfalsifiable.

**Prompt 5 — The implementation-feasibility prompt.** "Is the proposed composition actually implementable with the resources we have? Or have I conjectured something that depends on access we do not have (entitlements, system services, cross-process composition we cannot achieve)? Or that requires hardware features unavailable on our deployment targets?"

→ This enables: detection of compositions that look good on paper but cannot be shipped. The conjecture must be implementable; aspirational compositions are not conjectures.

**Prompt 6 — The validation-against-Apple-grade-benchmark prompt.** "After the composition is implemented, what specific test would verify that it actually behaves like Apple's internal version? Have I named the benchmark? If I cannot name a benchmark, the conjecture's quality claim is unfalsifiable."

→ This enables: the composition's quality is testable. Implementation is followed by validation; without a named benchmark, validation is impossible.

### Named Approaches for Addressing Identified Blind Spots

| Blind spot surfaced | Named approach to address |
|---|---|
| "Composition contains hidden private symbol references" | Walk the composition explicitly. For each line, ask: is this calling a private class or selector? If yes, replace with a public-API peer. If no, confirm. |
| "I am calling the private API instead of encoding the rule" | For each `MTMaterialView`-equivalent call, design the public-API peer that reproduces the same compositional behavior. The peer becomes the actual composition. |
| "The composition is indistinguishable from senior work" | Strengthen the 90% lens. Return to `/ninety` to extract more specific compositional rules. The composition was built on thin 90% input; deeper input produces stronger compositional decisions. |
| "Tier 2B contrast is vague" | Name the specific alternative composition explicitly. What APIs would the senior engineer have called? What parameters would they have used? Make the alternative concrete. |
| "Composition is aspirational, not implementable" | Either acquire the missing resource (entitlement, hardware) or simplify the composition to fit current constraints. A composition that cannot be shipped is not a conjecture. |
| "No named benchmark for validation" | Add to `/ninety` output: what specific Apple-shipped behavior is the validation target? Frame-step it. Document measurements. The measurements become the benchmark. |

→ This enables: the conjecture is not stuck when blind spots surface. The skill carries its own toolkit for correcting them.

### When the Conjecture Cannot Complete Honestly

When the conjecture move surfaces that the composition cannot meet the goal as 10%-only code — when the 90% knowledge required to inform the composition is unrecoverable, or when the implementation feasibility is in question — the honest output is acknowledgment:

"Conjecture cannot complete for [goal]. [Specific blocking factor]. Approaches to address: [list]. Marking as `pending: requires [X]`. Composition decisions made before resolution should be flagged as `tentative pending [X]`."

→ This enables: implementation does not proceed on a faulty composition. Unfinishable conjectures are recognized as such rather than shipped as confidently-finished compositions.

---

<!-- ID: conjecture.dimensionality-completeness -->
## Dimensionality Completeness Check

Before declaring the conjecture complete, walk through the multi-dimensional territory of the skill.

**Dimension 1 — Decision coverage.** Has the conjecture addressed all load-bearing compositional decisions, or only the most obvious ones? Hidden decisions (the choice of pixel format, the choice of color space for intermediate buffers, the threshold for stability filters) are often more load-bearing than the visible ones.

→ This enables: the composition's architecture is complete at every level, not just the visible surface.

**Dimension 2 — 90% lens application coverage.** For each decision, has the 90% lens actually been applied, or has the decision been made on pure-10% reasoning and the 90% citation added retrospectively? The lens applies during the decision, not after.

→ This enables: the conjecture is genuine, not a senior-engineer composition with 90% annotations bolted on.

**Dimension 3 — Layer separation clarity.** Are Layer 1 (10% mechanics) and Layer 2 (90% rule) actually distinct for each decision, or have they collapsed into the same statement? If Layer 1 and Layer 2 read identically, the layers are not separated; the conjecture has not been articulated cleanly.

→ This enables: the composition is legible as two layers, which makes it teachable to future engineers.

**Dimension 4 — Purity verification rigor.** Has the shipping-binary purity check actually been performed, or has the conjecture asserted purity without auditing? Asserted purity without audit is a common failure mode.

→ This enables: the composition's shippability is verified, not assumed.

**Dimension 5 — Tier 2B contrast specificity.** Is the named Tier 2B alternative concretely different from the chosen composition, or is the contrast vague? Vague contrasts produce vague Janum-tier claims.

→ This enables: the conjecture's Janum-tier claim is grounded in specific deltas, not in general assertions.

**Dimension 6 — Validation benchmark presence.** Has the composition named a specific benchmark for post-implementation validation? Without a benchmark, the composition's quality is unprovable.

→ This enables: implementation is followed by measurable validation, not by hope.

**Dimension 7 — Apprenticeship-material quality.** Are the Layer 2 annotations rich enough that a future engineer reading them absorbs the compositional rules, or are they thin pointers? Thin annotations fail the bottle move.

→ This enables: the composition is teachable; future engineers absorb philosophy by reading the code.

If any dimension is unexamined, state explicitly: "Dimension X unexamined; [action] would address." Then perform the action or flag as outstanding.

→ This enables: the conjecture is structurally complete across the territory of the skill, not merely along the dimensions that came to mind first.

---

## Worked Example

**Invocation:** `/conjecture` for the goal "ambient artwork backdrop for a music player's Now Playing screen, peer of Apple Music's animated artwork."

**Phase 1 (goal):** A backdrop that renders four scaled copies of the album artwork (0.25x, 0.50x, 0.80x, 1.25x) with per-layer radial twist shaders, independent wall-clock rotation timers (20s and 14s periods, non-commensurate), composited and then Kawase-blurred and saturation-boosted (~1.4x). Wall-clock rotation continues during paused playback. Track changes crossfade between two complete composites over 750ms with cubic ease-in-ease-out in OKLab color space, with stability filter skipping crossfades for ΔE<10.

**Phase 2 (inputs):**
- Gauge baseline: Tier 1 starting point (the engineer was about to ship a static blurred image), no 90% awareness for this domain. Recommended depth: Tier 3.
- Cartography output: enumerated `.layerEffect` with stitchable Metal shaders, `TimelineView(.animation)`, `Image` with `.scaledToFill`, `CADisplayLink`, `MPCMediaItemArtworkColorAnalysis` via KVC, OKLab color conversion via manual matrix.
- Ninety output: 90% findings include 4-copy twist composition pattern, OKLab crossfade rule, wall-clock-rotation rule, saturation-after-blur rule, stability-filter threshold ΔE<10 rule, "atmosphere is content at low spatial frequency" philosophy.

**Phase 3-4 (decisions and rules):**

**Decision: Four scaled copies at {0.25, 0.50, 0.80, 1.25}.**
- Layer 1: four `Image(uiImage: artwork).resizable().scaledToFill().frame(width: size*scale, ...)` views, composited in `ZStack`.
- Layer 2: four scales provide broadband spatial-frequency coverage without saturating the GPU. Apple Music uses exactly this scale set.
- Source: frame-step analysis of Apple Music + `/ninety` finding.
- Confidence: high.
- Pure-10% alternative: a Tier 2B engineer would blur the artwork once and ship.
- Why this matters: single-blur reads as flat wallpaper; 4-copy stack reads as living atmosphere.

**Decision: Independent wall-clock rotation timers with 20s and 14s periods.**
- Layer 1: `TimelineView(.animation)` driving rotation as `t * angularVelocity[i]` per copy.
- Layer 2: non-commensurate periods ensure the composite never repeats. Wall-clock independence makes the gradient stay alive during paused playback.
- Source: behavioral observation of Apple Music (gradient continues drifting when paused) + `/ninety` finding.
- Confidence: high.
- Pure-10% alternative: a Tier 2B engineer would link rotation to playback time, producing a gradient that freezes on pause and feels like a frozen app.
- Why this matters: continued rotation signals "the app is alive" even when audio is paused.

**Decision: Kawase blur over the composite, not per-layer.**
- Layer 1: a series of `.layerEffect(ShaderLibrary.default.kawaseBlur(...), ...)` modifiers applied to the `ZStack` containing the four copies.
- Layer 2: blurring per-layer wastes texture bandwidth and produces a different look (inter-layer compositing is not preserved). Blurring the composite preserves the inter-layer color blending.
- Source: frame-step + Metal performance reasoning.
- Confidence: medium-high.
- Pure-10% alternative: a Tier 2B engineer would apply `.blur(radius: ...)` per layer.
- Why this matters: composite blur produces broadband color blending; per-layer blur produces blocky multi-color regions.

**Decision: Saturation boost AFTER blur, not before.**
- Layer 1: a final `.layerEffect(ShaderLibrary.default.saturate(amount: 1.4), ...)` after the blur stack.
- Layer 2: blurring desaturates (averaging colors trends to neutral). Boost after blur compensates without producing noise that boost-then-blur would.
- Source: `/ninety` finding from observable Apple Music behavior.
- Confidence: high.
- Pure-10% alternative: a Tier 2B engineer would either skip saturation entirely or boost before blur.
- Why this matters: post-blur boost preserves smoothness while restoring perceived vividness.

**Decision: OKLab interpolation for track-change crossfade.**
- Layer 1: convert source and target colors to OKLab via manual matrix; interpolate in OKLab space; convert result back to sRGB for display.
- Layer 2: RGB interpolation passes through muddy intermediate colors (red→blue passes through brown). OKLab interpolation passes through clean perceptual intermediates (red→blue passes through clean purple).
- Source: `/ninety` finding from frame-step observation of Apple Music.
- Confidence: high.
- Pure-10% alternative: a Tier 2B engineer would interpolate in RGB and accept the muddy intermediates.
- Why this matters: clean crossfades feel professional; muddy ones feel cheap.

**Decision: Stability filter (ΔE<10 skips crossfade).**
- Layer 1: compute ΔE between current and new backdrop palettes; if below threshold, hold current state without animation.
- Layer 2: avoids visible flicker on near-identical track changes (e.g., consecutive tracks from the same album).
- Source: `/ninety` finding (behavioral observation).
- Confidence: medium (exact threshold inferred from observation; needs validation).
- Pure-10% alternative: a Tier 2B engineer would crossfade every track change regardless, producing visible flicker on same-album sequences.
- Why this matters: the chrome reads as stable rather than skittish.

**Phase 5 (purity verification):**

✓ Acceptable elements only:
- Public SwiftUI APIs: `TimelineView`, `Image`, `ZStack`, `.layerEffect`, `.scaledToFill`, `.frame`, `.offset`, `.opacity`, `.compositingGroup`, `.clipped`.
- Metal stitchable shaders: `[[ stitchable ]]` Metal functions defined in `.metal` files in the target.
- Public CoreML / Vision APIs if palette extraction is integrated.
- Manual OKLab matrix transformations as SIMD operations in Swift.

✓ No unacceptable elements:
- No `NSClassFromString` reaches for `_UI`-prefixed or `MT`-prefixed classes.
- No `performSelector:` against private selectors.
- No `dlsym`-loaded private symbols.
- No entitlement-gated calls (no `CARemoteLayerServer` use; the composition is in-process only).

**Phase 6 (Tier 2B contrast):**

The Tier 2B engineer's version: `Image(uiImage: artwork).blur(radius: 60).opacity(0.6).animation(.linear(duration: 0.3), value: artwork.id)`. One layer, one blur, RGB crossfade, no rotation, no wall-clock independence, no stability filter.

Specific UX/UI properties that would be different:
- The Tier 2B version is static; ours rotates.
- The Tier 2B version freezes on pause; ours stays alive.
- The Tier 2B version produces muddy track-change colors; ours produces clean perceptual intermediates.
- The Tier 2B version flickers on near-identical track changes; ours holds stable.
- The Tier 2B version reads as wallpaper; ours reads as atmosphere.

Decisions that produce the Janum-tier output: all six decisions above. Each is the specific delta from the Tier 2B version.

**Phase 7 (apprenticeship material):**

The composition's source code, when implemented, includes brief annotations for each load-bearing decision. Example annotation pattern:

```swift
// Four scales: 0.25, 0.50, 0.80, 1.25.
// 90% rule: broadband spatial-frequency coverage (Apple Music's choice).
// Pure-10% alternative: single blurred copy. That reads as wallpaper.
private static let copies: [Copy] = [...]

// Wall-clock rotation independent of playback.
// 90% rule: gradient stays alive on pause (Apple Music's behavior).
// Pure-10% alternative: link to playback time. That freezes the gradient.
TimelineView(.animation) { ctx in ... }
```

Each future engineer who reads this composition absorbs the rules. The composition is a bottle in microcosm.

**Output: implementation ready.** Validation after implementation: frame-step the resulting backdrop and compare against Apple Music's at 240fps. Verify rotation continuation during pause. Verify OKLab crossfade visible-purple intermediate on red→blue track changes. Verify stability filter prevents same-album flicker.

---

## Notes on Use

- **Conjecture cannot run on missing inputs.** If `/gauge`, `/cartography`, or `/ninety` outputs are not available, `/conjecture` does not improvise them. It flags the missing input and requests the corresponding upstream skill.
- **The conjecture is implementable.** A conjecture that cannot be shipped is not a conjecture; it is speculation. The implementation-feasibility check is structural.
- **Confidence calibration travels with the conjecture.** If a 90% rule is low-confidence in `/ninety`, the corresponding decision in `/conjecture` is also low-confidence. Confidence does not magically improve at the conjecture stage.
- **Conjectures are revisable.** As `/ninety` findings deepen over time (new behavioral observations, new escaped artifact readings), conjectures built on the old `/ninety` outputs are updated. The conjecture is a snapshot at a point in time.
- **Conjectures build the bottle.** Each module of our library is the output of a conjecture move. Over time, the bottle accumulates conjectured compositions; reading the bottle teaches the rules they encode.
- **Conjectures compose.** Two conjectured modules can be combined into a larger conjectured composition. The framework is recursive.
