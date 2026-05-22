---
name: arch-ninety
description: Engage the architectural 90% — the unwritten craft knowledge that lives in principal-tier engineers' heads, in shop-level cultures, and in the "code as UX / DevX as product / discipline of refusal" disciplines that don't have public documentation. Parallel sibling to `/ninety` (which engages Apple's internal substrate); this skill engages the engineering-culture substrate.
---

# Arch-Ninety — Engage the Architectural 90%

This skill is the **substrate engagement** half of the architecture 10/90 framework — parallel sibling to `/ninety` for the architecture domain. Where `/ninety` engages Apple's internal substrate (private framework signatures, data files, internal compositions, tacit code-review knowledge), `/arch-ninety` engages the **engineering-culture substrate** — the body of unwritten architectural craft knowledge that principal-tier individuals carry and that shop-level cultures embody.

**Critical framing:** The architectural 90% is not less rigorous than Apple's 90%. It is differently sourced. Apple's 90% lives in class-dumps and runtime headers; the architectural 90% lives in personal blogs, conference talks, GitHub repos, X threads, podcast appearances, and the public source code of OSS projects whose authors are principal-tier individuals. Both require research effort to engage.

---

## Posture Check (Precondition)

<!-- ID: arch-ninety.posture-check -->
<!-- INVARIANT: arch-ninety.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check.

### Output declaration

`POSTURE: janum` or `POSTURE: senior` (halt if senior).

### Skill-specific addendum

For `/arch-ninety` specifically, senior posture manifests as: "I wish more shops would publish their architecture" or "we just don't have access to what BC / Linear / OpenAI × LoveFrom actually does." Janum-tier posture manifests as: "what specifically does X publish that we can learn from, what evidence is in their public artifacts, what research agents can extract their pattern from open sources."

The architectural 90% is research territory. It is not inaccessible. It just requires the work.

---

## The 5 Manifestations of the Architectural 90%

The visual /ninety identifies 5 manifestations of Apple's 90% (internal compositions, data files, private framework signatures, internal behaviors, tacit code-review knowledge). The architectural 90% has its own 5 manifestations:

### Manifestation A — Internal compositions across reference shops

How shops like Airbnb, Cash App, Uber, Lyft, BC, Linear, Pinterest internally compose their architecture. Visible through: their OSS contributions (Epoxy, Stagehand, Needle, BC's TCA fork), their engineering blogs (medium.com/airbnb-engineering, code.cash.app, eng.uber.com, slack.engineering), their employees' personal blogs + conference talks.

**Source confidence categories:**
- BLOG-CITED: shop's engineering blog explicitly describes the pattern
- OSS-VERIFIED: the pattern is visible in public source code
- TALK-CITED: shop engineers have presented it at a conference
- REVERSE-ENGINEERED: inferred from observable shipping behavior

### Manifestation B — Principal-tier individual instincts

The unwritten patterns specific engineers reach for. Examples:
- **Krzysztof Zabłocki**: Has-protocol composition for DI, Sourcery codegen for boilerplate, Inject hot-reload as DevX baseline
- **Janum Trivedi**: animator-on-view pattern, generic numerical kernel (math doesn't know UIKit), spec/runner split, retargetable springs as default
- **Brandon Williams + Stephen Celis**: protocol witnesses for substitution, swift-dependencies for wiring via TaskLocal, swift-clocks for controllable time, reducer composition as value
- **Hursh Agrawal (BC)**: redux-type state with unidirectional flow, public retreat from over-abstracted state (the Dia pivot lesson)
- **Saleem Abdulrasool (compnerd)**: cross-platform Swift via swift-winrt + swift-winui, Combine-decoupling for non-Apple platforms
- **Joe Groff (Apple Swift compiler)**: noncopyable types for typestate, ownership modifiers for performance, the language design behind craft-quality abstractions
- **Eric Horacek (Airbnb)**: declarative UI via state-diff (Epoxy), motion-as-data (Lottie integration), module-visibility-as-architecture-enforcement

### Manifestation C — Code-as-UX aesthetic discipline

The unwritten rules of how code should READ. Names that read like English at the call site. Function signatures that communicate intent. Type composition that reads as a sentence. Errors that read as sentences. Refusal of indirection that doesn't name a concept. The "would I show this code to demonstrate craft?" test.

Source: aesthetic discussions in Pointfree episodes, Krzysztof's blog, John Sundell's articles, the implicit standards visible in OSS code from principal-tier authors.

### Manifestation D — DevX-as-product investment philosophy

The unwritten rule that the dev loop is a layer of the product. Hot reload is non-negotiable. Codegen for the boilerplate that humans shouldn't write. Snapshot tests as visual baselines. Design-system harness target as a craft surface for designers. Animation preview target with scrubbable previews. Build-speed CI guards. Auto-formatter enforced.

Source: Krzysztof's "Hot Reloading in Swift" post, BC's adoption of Inject + extension to TCA reducers, Cash App's Stagehand snapshot-per-keyframe testing, Pointfree's swift-snapshot-testing.

### Manifestation E — Discipline of refusal + philosophical inheritance

The unwritten rule that the load-bearing principal-tier moves are often the abstractions you DON'T build. Telegram's 80-method enum that refuses to introduce a protocol. The BC sunsetting of TCA + SwiftUI for Dia. The "every abstraction names a real concept the engineer is reasoning about" test. The recognition that worldview drives architecture (animation-as-state vs animation-as-command).

Source: Telegram-iOS public source code, Josh Miller's "Letter to Arc Members 2025" Substack, the rejection lists in principal-tier engineer's published designs.

---

## The 8 Intentions

The visual /ninety has 8 intentions for engaging Apple's 90%. The architectural /arch-ninety has its own 8 (grouped per the AskUserQuestion answer in the originating conversation):

### Intention 1 — Compositional lens
Use 90% craft knowledge to inform which 10% primitives to pick and how to compose them. E.g., Wave's animator-on-view pattern suggests no DI framework is needed for animator wiring.

### Intention 2 — Importable material
Lift specific liftable patterns: Has-protocols (Krzysztof), animator-on-view (Janum), witness structs (Pointfree), spec/runner split (Apple via UIViewPropertyAnimator).

### Intention 3 — Peer rebuild
Reconstruct what a Tier 3 shop has at peer tier. "What would I need to build to ship at OpenAI × LoveFrom craft tier?" Produces a substrate-package list + discipline list.

### Intention 4 — Discipline of refusal
The principal-tier move of naming everything explicitly NOT being built, with cited reasons. The rejection list as first-class output.

### Intention 5 — Tier-A availability check
For each domain, surface where insider-grade or principal-craft work exists that the codebase isn't using. Flag every "rolled your own when something better was available" instance.

### Intention 6 — Taste calibration (code-as-UX)
Apply the "does this read beautifully?" test. Calibrate the codebase against the readability rubric (names, signatures, type composition, errors, file layout).

### Intention 7 — DevX audit
Classify whether DevX is treated as product layer or as tax. Recommend specific DevX investments that compound.

### Intention 8 — Philosophical inheritance
Name the implicit philosophy the codebase is expressing so the team can decide whether they meant that. "This codebase treats animation as a fired command, not as a propagated state."

---

## What This Skill Concretely Enables
<!-- ID: arch-ninety.concrete-capabilities -->

- **The ability to import specific principal-tier patterns with full understanding of WHY they exist.** Not just "use protocol witnesses" but understanding why Pointfree built them (multiple substitutions per type, no associatedtype pain, modular test mocks).
- **The ability to produce a rejection list as first-class output.** Naming the abstractions deliberately refused is the principal-tier signature.
- **The ability to recognize tier-A availability gaps.** Where the codebase has rolled its own when Wave / swift-dependencies / Inject / Sourcery already shipped the answer.
- **The ability to articulate the philosophical inheritance of an architecture.** Naming the worldview that an architecture expresses.
- **The ability to dispatch research agents that bring back specific cited evidence.** Rather than producing claims from baseline knowledge.

---

## When to Use This Skill

After `/arch-cartography` surfaces that primitives carry `light` or `heavy` 90%-dependency. After `/arch-gauge` surfaces that the required tier needs craft beyond what's in the 10%. When the user asks for "what would Krzysztof / Janum / Brandon do" thought experiments.

---

## The Skill Workflow

### Phase 1 — Identify which manifestations are active

Not every architectural problem engages all 5 manifestations. A pure DI question may engage Manifestations A (shop practices) + B (Krzysztof / Pointfree). A pure animation question engages B (Janum) + E (discipline of refusal). State the active manifestations.

### Phase 2 — Identify which intentions are active

Same logic. Some problems are pure compositional-lens; others trigger discipline-of-refusal + tier-A-availability-check primarily.

### Phase 3 — Dispatch research agents

Per the Agent Dispatch Protocol below.

### Phase 4 — Extract specific findings

For each active manifestation, extract the specific craft rules / patterns / disciplines that apply. Cite source-confidence per finding.

### Phase 5 — Produce the output

The structured findings with citation IDs (`ARCH-NINETY-[manifestation]-[NN]`).

---

## Agent Dispatch Protocol
<!-- ID: arch-ninety.agent-dispatch -->

`/arch-ninety` is the sub-skill MOST dependent on agent dispatch. The architectural 90% is, by definition, scattered across blogs / repos / talks the assistant cannot reliably recall from baseline knowledge. Producing /arch-ninety findings without agent dispatch is structurally dishonest unless the territory is genuinely well-known to the assistant in the current session.

**Dispatch pattern:** Launch 3-6 parallel research agents with `[ROLE: ARCH-NINETY-RESEARCHER]`:

- **Agent A — Principal-tier individual investigation.** Pick a named engineer (Krzysztof, Janum, Brandon, Hursh, Saleem, Joe Groff, Eric Horacek, etc.). Research their published patterns, blog posts, conference talks, GitHub repos. Output: their specific architectural instincts with citations.
- **Agent B — Shop-level architecture investigation.** Pick a reference shop (BC, Linear, Cash App, Airbnb, Things 3). Research their published engineering practices, OSS contributions, conference talks. Output: their specific architectural patterns with citations.
- **Agent C — Discipline-specific extraction.** Pick a discipline (code-as-UX, DevX-as-product, discipline of refusal). Research how principal-tier engineers articulate it. Output: the discipline's specific rules with citations.
- **Agent D — Tier-A availability check.** Per domain, what insider-grade or principal-craft work exists? Output: a list of "if you're rolling your own X, you should be using Y instead" with citations.
- **Agent E — Philosophical inheritance audit.** What worldview does an architecture express? Research the explicit worldview statements in principal-tier published material.

After agents return, synthesize into manifestations + intentions structure with citation IDs.

---

## Output Format

```
ARCH-NINETY — [PROBLEM DOMAIN]

POSTURE: [janum / senior]

=== Active manifestations ===
For each active manifestation (A through E):
- Why this manifestation is active for this problem
- Source corpus engaged (which blogs / repos / talks)
- Source-confidence per finding

=== Active intentions ===
For each active intention (1 through 8):
- Why this intention is active
- What it produces for the conjecture phase

=== Manifestation findings ===

**Manifestation A — Internal compositions across reference shops**
- Finding 1: [citation ID: ARCH-NINETY-A-01] [SOURCE-CONFIDENCE: HIGH/MEDIUM/LOW] [...]
- Finding 2: [...]

**Manifestation B — Principal-tier individual instincts**
- Finding 1: [...]
- Finding 2: [...]

**Manifestation C — Code-as-UX aesthetic discipline**
- Finding 1: [...]
- Finding 2: [...]

**Manifestation D — DevX-as-product investment philosophy**
- Finding 1: [...]
- Finding 2: [...]

**Manifestation E — Discipline of refusal + philosophical inheritance**
- Finding 1: [...]
- Finding 2: [...]

=== Intention-specific deliverables ===

For each active intention, the specific deliverable:
- Intention 1 (compositional lens): [how 90% findings inform composition]
- Intention 2 (importable material): [specific patterns to lift, with citations]
- Intention 3 (peer rebuild): [substrate package list, discipline list]
- Intention 4 (discipline of refusal): [rejection list with cited reasons]
- Intention 5 (tier-A availability): [rolled-your-own-where-better-exists flags]
- Intention 6 (taste calibration): [code-as-UX violations identified]
- Intention 7 (DevX audit): [DevX investments to make]
- Intention 8 (philosophical inheritance): [worldview articulation]

=== Agent dispatch summary ===
[Agents dispatched, findings returned, citation IDs assigned]

=== Source-confidence summary ===
[Per major claim: HIGH / MEDIUM / LOW]

=== Honest gaps ===
[What couldn't be researched in this pass + what would close the gap]

=== Recommended next skill ===
[arch-conjecture / arch-lens-check / no-further-chain]
```

---

## Blind-Spot Diagnostics

- **Prompt 1 — Baseline-knowledge dishonesty.** "Am I producing findings from baseline knowledge when an agent dispatch would have produced cited evidence?"
- **Prompt 2 — Manifestation over-coverage.** "Am I producing findings for all 5 manifestations when the problem only engages 2? Generic coverage is thin coverage."
- **Prompt 3 — Source-confidence inflation.** "Am I claiming HIGH confidence on REVERSE-ENGINEERED findings? Confidence must match evidence type."
- **Prompt 4 — Intention conflation.** "Am I producing one homogeneous output across multiple intentions when each intention has distinct deliverables?"
- **Prompt 5 — Discipline-of-refusal omission.** "Did I produce a rejection list (Intention 4), or did I only produce additive recommendations?"

---

## Dimensionality Completeness Check

- **Dimension 1 — Manifestation coverage.** Each active manifestation has specific findings, not generic claims.
- **Dimension 2 — Intention coverage.** Each active intention has its distinct deliverable.
- **Dimension 3 — Citation density.** Major claims have ARCH-NINETY-* citation IDs.
- **Dimension 4 — Source confidence.** Per-finding confidence tags.
- **Dimension 5 — Agent dispatch decision.** Explicit, not silent.
- **Dimension 6 — Honest gaps.** What couldn't be researched is acknowledged.

---

## Notes on Use

- **`/arch-ninety` without agent dispatch is unusual.** The architectural 90% is, by nature, distributed. Default to dispatching.
- **The rejection list is the principal-tier signature.** If Intention 4 produced nothing, the engagement was incomplete.
- **Manifestation E (philosophical inheritance) often surfaces the load-bearing decision.** Naming the worldview an architecture expresses is what turns a recommendation into a position.
- **Citation IDs feed `/arch-conjecture`.** The conjecture cites ARCH-NINETY-* IDs to thread findings into the composition.
