---
name: arch-gauge
description: Calibrate architectural posture. Either introspective (what tier is my current architecture at? what tier does the work demand? what's the gap?) or against an external artifact (an existing codebase, a reference shop's architecture, a proposed design). The diagnostic baseline that every other arch-* skill builds on. Parallel sibling to `/gauge` (which calibrates visual/iOS-framework lens); this skill calibrates the architectural lens.
---

# Arch-Gauge — Calibrate the Architectural Lens

This skill is the **diagnostic baseline** of the architecture 10/90 framework — the parallel sibling to `/gauge` for the architecture domain. Before any non-trivial architectural decision, before mapping the cartography of options, before dipping into the principal-tier substrate, first gauge the current state of architectural thinking.

The full architecture framework is documented at `~/.claude/skills/_shared/arch-framework.md` (when present) and inherits its tier ladder from `~/.claude/skills/_shared/arch-tier-ladder.md`. The visual/iOS-framework parallel lives in `/gauge`; consult that skill's documentation when you need the original framework's structure for reference.

**Critical framing:** `/arch-gauge` is not a generic "audit my code" tool. It applies a specific lens: the architecture-as-craft lens, where the 10% is the documented architectural surface (Apple WWDC patterns, OSS libraries, industry patterns) and the 90% is the unwritten craft knowledge (principal-tier engineer instincts, shop-level cultures, code-as-UX discipline, DevX-as-product philosophy, the discipline of refusal, the tier-A availability check, philosophical inheritance).

---

## Posture Check (Precondition)

<!-- ID: arch-gauge.posture-check -->
<!-- INVARIANT: arch-gauge.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`. The same two postures (Janum-tier vs. senior) apply, transposed to the architecture domain:

- **Janum-tier posture**: principal-tier architectural craft is a research territory. When encountering "I don't know what shop X uses for DI" the response is: "what specifically do they ship, what evidence do I have, what can I find via research agents." The 90% of architecture (unwritten craft knowledge) is treated as discoverable through deliberate investigation, not as inaccessible.
- **Senior posture**: principal-tier architectural craft is "what good engineers happen to know." When encountering an unfamiliar pattern, the response is: "I wish I'd worked at a shop that did that." Output produced from this posture is a wish-list, not findings.

### Output declaration requirement
<!-- ID: arch-gauge.output-declaration -->
<!-- INVARIANT: arch-gauge.output-declaration -->

After performing the Posture Check, this skill's output MUST contain an explicit line:

`POSTURE: janum` — when Janum-tier posture is confirmed.
`POSTURE: senior` — when senior posture is detected. Halt and recalibrate before producing further output.

### Skill-specific addendum

For `/arch-gauge` specifically, the posture determines whether **Tier 3B (Apple-grain insider-tier)** is reachable at all. A senior-posture gauge classifies all unfamiliar craft patterns as Tier 2B (the pre-Janum tier), because everything beyond the gauger's own practice is treated as either "what I happen to know" or "what someone else wishes Apple would expose." A Janum-tier gauge treats the territory beyond current practice as research-able and produces a calibration that names where that research must go.

---

## What This Skill Concretely Enables
<!-- ID: arch-gauge.concrete-capabilities -->
<!-- INVARIANT: arch-gauge.concrete-capabilities -->

`/arch-gauge` is not invoked to produce ceremony. The effort of running a full gauge only pays off when the engineer can name what specific capabilities the calibration unlocks. Specifically:

- **The ability to detect architecture-tier mismatch before commitment.** The work needs Tier 3B (insider-tier consistent), the codebase is operating at Tier 2A (modern Swift composition root). Knowing this BEFORE the commitment is what prevents the rebuild six months later. The calibration is a pre-commitment safety check.
- **The ability to identify which domain is the bottleneck.** A codebase may be Tier 2B for state management, Tier 1 for animation, Tier 0 for DevX. The aggregate tier hides the per-domain truth. `/arch-gauge` produces per-domain classification so the team knows where to invest.
- **The ability to gauge an external reference shop's architecture.** Pointed at The Browser Company or Linear or Things 3, the gauge produces "this is what tier they ship at, this is the 90% craft visible in their public artifacts, this is what would be needed to ship at peer tier." Reference-driven calibration.
- **The ability to declare a problem doesn't need the architecture framework.** Sometimes a feature is Tier 1 — a settings screen, a simple form. The gauge confirms this cleanly and recommends NOT running the rest of the chain. Appropriate effort calibration.
- **The ability to surface "the team has rolled their own where tier-A work exists."** A gauge pass catches places where the codebase reimplements Wave-class spring physics or Pointfree-class dependencies, when adoption of the existing tier-A artifact would have been cheaper.

If after running `/arch-gauge` you cannot point to one of these being newly enabled, the gauge was performed wrong or was unnecessary.

---

## When to Use This Skill

**User-invoked triggers** — the user types `/arch-gauge` when:
- They want a calibration of their current codebase's architectural tier (introspective mode).
- They've dropped an artifact (a reference codebase, a competitor's app, a proposed design document) and want it gauged.
- They are about to commit to a non-trivial architectural decision and want the tier-classification lens applied first.

**Self-invoked triggers** — the assistant invokes `/arch-gauge` automatically when:
- A user request enters architectural territory (DI design, state management choice, animation orchestration design, etc.) and current thinking has not yet been gauged.
- The assistant detects framework regression in architectural reasoning (collapsing back to "use protocols and Coordinator pattern" without tier-awareness).

---

## Two Modes

<!-- ID: arch-gauge.two-modes -->

### Mode A — Introspective Architectural Gauge

Used when gauging the assistant's current architectural thinking or the user's current codebase.

**Operations:**

1. **Name the architectural domain.** State precisely what is being gauged: dependency injection, state management, animation orchestration, navigation, persistence, network layer, testing strategy, DevX, application skeleton, or a specific feature flow.

2. **Identify the current primitives + patterns.** What is the codebase reaching for? Singletons + constructor injection + UIKit MVC? swift-dependencies witnesses + @Observable view models + structured concurrency? Wave + bespoke physics + animator-on-view? List the specifics.

3. **Classify the current tier per the architecture tier ladder:**
   - **Tier 0:** Cross-platform abstractions (RN, Flutter) — non-iOS-native architecture
   - **Tier 1:** Tutorial-grade native iOS (singletons, AppDelegate inheritance, no real DI, UIView.animate chains)
   - **Tier 2A:** Modern Swift composition root + @Observable view models + async/await + structured concurrency + decent constructor injection
   - **Tier 2B:** Pointfree-tier outside-craft — protocol witnesses (struct-of-functions), swift-dependencies, Has-protocols, Inject hot-reload, Sourcery codegen, snapshot testing, design-system harness
   - **Tier 3A:** Insider-tier intermittent — Wave-pattern on some surfaces, Apple-grain abstractions where they fit (e.g., spec/runner split for one animation flow), but inconsistent across the codebase
   - **Tier 3B:** Insider-tier consistent — Apple-grain throughout, design-engineering culture, code-as-UX discipline applied everywhere, tier-A abstractions adopted where they exist, principled refusal everywhere else

4. **Identify the required tier for the work.** What tier does the actual product need to ship at? A craft-tier consumer app aims for Tier 3A/3B. A B2B utility may legitimately ship at Tier 2A. A throwaway prototype is fine at Tier 1.

5. **The gap is the operational output.** If current tier matches required tier: proceed without further calibration. If current is below required: name what work would close the gap and recommend the next sub-skill (`/arch-cartography` to map options; `/arch-ninety` to engage principal-tier substrate). If current exceeds required: flag over-engineering.

6. **Surface assumed architectural patterns.** What rules is the current thinking taking for granted?
   - "Animation is a fired command" vs "animation is a function of state + time"
   - "Dependencies travel via constructors" vs "dependencies are ambient via Environment/TaskLocal"
   - "Module boundaries are enforced by convention" vs "module boundaries are enforced by the build system"
   - "Hot reload is a nice-to-have" vs "hot reload is a layer of the product"
   - "Abstractions earn their place by reducing duplication" vs "abstractions earn their place by naming concepts the engineer is reasoning about"

7. **Flag blind spots.** What craft patterns might be missed because they have not been gauged?
   - Tier-A abstractions that exist and aren't being used (Wave for animation, Apple's spec/runner pattern)
   - Tier-B abstractions that would compose cleanly (swift-dependencies, protocol witnesses, Has-protocols)
   - Code-as-UX violations (names that don't read, signatures that obscure intent)
   - DevX gaps (no hot reload, no snapshot tests, no design-system harness)
   - Discipline-of-refusal violations (protocols with one impl, premature abstractions)

8. **Recommend next sub-skill.** Based on the gap:
   - Gap is zero or negative → no further chain needed
   - Gap surfaces cartographic missing options → `/arch-cartography`
   - Gap surfaces 90% craft missing → `/arch-ninety`
   - Gap surfaces a need to compose a recommendation → `/arch-conjecture`
   - Gap is comprehensive → `/arch-lens-check` (the full compound)

### Mode B — Artifact Gauge

Used when gauging an external artifact: a reference codebase, a competitor's app, a published architecture document, a proposed design.

**Sub-mode bifurcation:**

- **Mode B-Understand:** the user wants to know what tier the artifact operates at and what's interesting about it.
- **Mode B-Reproduce:** the user wants to build their own version at peer tier.

**Operations:**

1. **Describe what the artifact ships.** State observable architectural facts: what's their UI framework, what DI mechanism is visible from outside (open-source repos, blog posts, talks), what's their state-management pattern, what's their build system, what motion engine if any.

2. **Identify visible architectural primitives.** What can be confirmed via public artifacts (OSS code, blog posts, talks)?

3. **Identify visible craft patterns.** What rules are encoded? Examples:
   - "Module visibility enforced by Bazel" (visible because their public Bazel config shows it)
   - "Animator lives on the view" (visible because of Wave-pattern public API)
   - "Hot-reload integrated across SwiftUI + reducer" (visible in their forked TCA)

4. **Classify the artifact's tier.**

5. **Identify the 90% craft likely encoded** (the unwritten knowledge their engineers carry). For each, name the source-confidence: BLOG-CITED, OSS-VERIFIED, REVERSE-ENGINEERED, INFERRED.

6. **Identify what to investigate further.** This often warrants dispatching research agents (see Agent Dispatch Protocol below).

7. **Pose the build question (Mode B-Reproduce only).** If we wanted to reproduce this architecture peer-tier from outside, what would the composition look like?

---

## Agent Dispatch Protocol
<!-- ID: arch-gauge.agent-dispatch -->

`/arch-gauge` must NOT rely solely on the assistant's baseline knowledge of iOS architecture. When the gauge target involves an external shop, a specific named engineer's practice, a domain the assistant hasn't deeply studied, or any artifact whose architecture is not publicly enumerated, the skill **dispatches research agents** to extract evidence before producing the calibration.

**When to dispatch:**

- The artifact is a shop the user named that the assistant has not deeply researched (e.g., a small AI-native startup, a Tier A insider-shop like OpenAI × LoveFrom whose practices are not public).
- The current-codebase gauge requires reading multiple source files across the user's project that the assistant has not yet read.
- The classification depends on evidence (OSS code, blog posts, talks, conference videos) the assistant should fetch rather than recall.

**The dispatch pattern:**

Dispatch 2-4 parallel research agents, each with:
- A clear `[ROLE: ARCH-GAUGE-RESEARCHER]` marker
- The specific scope (one shop, one domain, one principal-tier individual)
- The required output format: tier classification + cited evidence + source-confidence tags
- An explicit instruction NOT to fabricate; flag thin evidence with LOW confidence

**Example dispatch shape:**

```
Agent 1: Investigate [SHOP X]'s iOS architecture — what tier, what evidence, what 90% craft visible
Agent 2: Investigate [PRINCIPAL ENGINEER Y]'s published patterns — their stated positions, their OSS contributions, their conference talks
Agent 3: Investigate the current codebase at [PATH] — what primitives, what patterns, what tier per domain
```

After agents return, synthesize their findings into the per-tier classification. The gauge declares its **source-confidence summary** alongside the tier verdict.

---

## Output Format

```
ARCH-GAUGE — [DOMAIN OR ARTIFACT]

POSTURE: [janum / senior — halt if senior]

Mode: [Introspective / Artifact-Understand / Artifact-Reproduce]

=== Domain ===
[What's being gauged — specific architectural territory]

=== Current state ===
Primitives + patterns visible: [list]
Source evidence: [where this was observed — files, OSS code, blog posts]

=== Tier classification ===
Current tier estimate: [Tier X, confidence: high / medium / low]
Per-domain breakdown (if applicable):
- DI: Tier X
- State: Tier Y
- Animation: Tier Z
- ... etc

Required tier for the work: [Tier Y, with reasoning]

Gap: [delta — Y minus X, or "matched", or "over-engineered"]

=== Assumed architectural patterns ===
[Rules the codebase / thinking takes for granted, with WHY tags]

=== Blind spots ===
[Specific cartographic gaps, 90% craft gaps, tier-A unused, code-as-UX violations, DevX gaps]

=== 90% craft likely encoded (Artifact mode) ===
[For artifact-gauging — what principal-tier knowledge is visible in the artifact]

=== Recommended next sub-skill ===
[Based on the gap — gauge-only-sufficient / arch-cartography / arch-ninety / arch-conjecture / arch-lens-check]

=== Agent dispatch summary (if applicable) ===
[What research agents were dispatched, what they returned, source-confidence]

=== Source-confidence summary ===
[Per major claim: HIGH / MEDIUM / LOW with reasoning]
```

---

## Blind-Spot Diagnostics

The Meta-Perspective Prompts specific to `/arch-gauge`:

**Prompt 1 — The tier-confusion prompt.** "Did I conflate tier 2B (deep public API mastery) with tier 3 (insider-extracted craft)? Is the codebase actually showing principal-tier craft, or is it showing impressive 2B technical sophistication without 90% awareness?"

**Prompt 2 — The aggregate-tier-hides-domain prompt.** "Is my single tier number hiding per-domain variance? A codebase can be Tier 3B for animation, Tier 2A for DI, Tier 1 for DevX. The aggregate misleads."

**Prompt 3 — The reference-shop-overestimation prompt.** "Did I classify an external shop at Tier 3B because they have one excellent feature, when the rest of their codebase is opaque? Confidence-tagging required."

**Prompt 4 — The required-tier-overshoot prompt.** "Is the required tier I named actually warranted, or am I declaring high-tier requirements when the product target is competent-mid-tier?"

**Prompt 5 — The agent-not-dispatched prompt.** "Did I produce a confident classification from baseline knowledge alone when an agent dispatch would have produced cited evidence? Confidence claimed without evidence is structurally dishonest."

---

## Dimensionality Completeness Check

Before declaring the gauge complete:

- **Dimension 1 — Tier coverage.** Was the tier classification produced per-domain, not just aggregate?
- **Dimension 2 — Required-tier honesty.** Was the required tier defended against over-engineering AND under-engineering?
- **Dimension 3 — 90% craft visibility.** Was the principal-tier substrate explicitly named, not just gestured at?
- **Dimension 4 — Source confidence.** Was every major claim tagged with source-confidence?
- **Dimension 5 — Agent dispatch decision.** Was the question "should I dispatch agents?" explicitly considered, not silently skipped?
- **Dimension 6 — Next-skill recommendation.** Is the next-skill recommendation specific and actionable?

---

## Notes on Use

- **`/arch-gauge` is the cheapest sub-skill of the chain.** Run it first; let it determine whether the heavier skills (`/arch-cartography`, `/arch-ninety`, `/arch-conjecture`) need to follow.
- **Per-domain classification is the rule, not the exception.** Aggregate tier numbers are useful for headlines; per-domain numbers are what drive investment decisions.
- **Agent dispatch is not optional when evidence is thin.** The skill's confidence is bounded by the evidence it can cite; baseline-knowledge-only output is honest only when the territory is genuinely well-known to the assistant.
- **Mode B-Reproduce always feeds `/arch-cartography` + `/arch-conjecture`.** Reproducing a shop's architecture peer-tier requires the menu (cartography) and the composition move (conjecture).
- **Sometimes the gauge IS the deliverable.** When the user asked "what tier is X at," the gauge alone answers. No need to run the rest of the chain.
