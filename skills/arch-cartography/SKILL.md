---
name: arch-cartography
description: Enumerate the full architectural vocabulary — every primitive (library, pattern, abstraction) available for a given architectural problem, organized by tier and by insider-knowledge availability. Maps the landscape across domains (DI, state, animation, navigation, persistence, network, DevX) with documented surface + OSS libraries + reference-shop practices. Parallel sibling to `/cartography` (visual primitives); this skill maps the architecture menu.
---

# Arch-Cartography — Map the Architectural Vocabulary

This skill is the **macro mapping** half of the architecture 10/90 framework — parallel sibling to `/cartography` for the architecture domain. Its job is exhaustive: enumerate every architectural primitive (Apple-blessed pattern, OSS library, principal-tier individual's published practice, reference-shop adoption) that could plausibly address a given architectural problem.

**Critical framing:** An engineer who has not enumerated the cartography for their architectural problem is choosing primitives from a truncated menu and does not know what they are missing. The cartography is the antidote to the truncated menu.

---

## Posture Check (Precondition)

<!-- ID: arch-cartography.posture-check -->
<!-- INVARIANT: arch-cartography.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement

`POSTURE: janum` or `POSTURE: senior` (halt if senior).

### Skill-specific addendum

For `/arch-cartography` specifically, the posture determines whether the **latter end of the architecture 10%** is reachable at all. The latter end here is the body of work principal-tier engineers have published but the broader industry hasn't adopted: Pointfree's protocol witnesses, Krzysztof's Has-protocol composition, Janum's animator-on-view pattern, Stagehand's choreography-as-value, Wave's generic numerical kernel, Brandon Williams's swift-dependencies + swift-clocks. A senior-posture cartography enumerates only the well-documented surface (UIKit MVC, standard SwiftUI, Coordinator pattern); a Janum-tier cartography enumerates the entire body of principal-tier published practice as accessible territory.

---

## What This Skill Concretely Enables
<!-- ID: arch-cartography.concrete-capabilities -->

- **The ability to choose architectural primitives from the full menu rather than default reach.** Without this cartography, the engineer reaches for whatever DI / state / animation library they happened to learn first. With it, they choose from what actually exists at each tier.
- **The ability to discover compositional pairings.** swift-dependencies + protocol witnesses + Has-protocol composition is a stack; Wave + UIPercentDrivenInteractiveTransition + Apple spec/runner is a stack; these compositions are not obvious without enumeration.
- **The ability to recognize when the team has rolled their own where tier-A or tier-B work exists.** The cartography surfaces every existing artifact; the codebase's gaps become visible by comparison.
- **The ability to detect when a problem genuinely requires `/arch-ninety` engagement.** If the cartography is complete and no combination accounts for the required tier, the gap is in 90% craft — which is `/arch-ninety`'s territory.
- **The ability to produce a referenceable enumeration that future engineers consult.** The cartography output becomes the team's standing menu.

---

## When to Use This Skill

**User-invoked**: `/arch-cartography <problem domain>` when the user wants the full menu enumerated.

**Self-invoked**: after `/arch-gauge` surfaces that the menu is incomplete; before committing to a primitive; when the problem domain has not been cartographically mapped in this conversation.

---

## The Documentation Gradient — The Organizing Structure

The cartography is always organized by the architecture domain's three-band gradient (mirroring the visual cartography's front/middle/latter-end of the 10%).

### Front End of the Architecture 10%

**Definition:** Apple-blessed patterns + idiomatic Swift that any senior engineer should know. Documentation is excellent; ChatGPT/Claude/tutorials cover it.

**For each primitive, include:**
- Name and category (DI, state, animation, etc.)
- One-line summary
- Apple-source citation (WWDC session, developer.apple.com)
- Standalone or compositional usage

### Middle of the Architecture 10%

**Definition:** Industry-published patterns + well-known OSS libraries. Documentation exists but may require digging through README + a few blog posts. The Coordinator pattern, MVVM, swift-async-algorithms, Lottie.

**For each primitive, include:**
- Name and category
- One-line summary
- Source (OSS repo URL, blog post, conference talk)
- Documentation quality (good / sparse / depends-on-author)
- Experimentation cost (low / medium / high)

### Latter End of the Architecture 10%

**Definition:** Principal-tier individuals' published practices that the broader industry hasn't standardized on. Pointfree's witnesses, Krzysztof's Has-protocols, Janum's animator-on-view, Cash App's Stagehand, Wave, Hero, FlightAnimator, BC's forked TCA. Reachable but requires engaging with the principal-tier individual's body of work.

**For each primitive, include:**
- Name and category
- Author + source citation
- Adoption status (single-shop / handful-of-shops / niche-but-real)
- Compositional pairings (what other latter-end primitives this combines with)
- 90%-dependency hint (does this primitive require 90% craft awareness to compose correctly?)
- Citation ID for cross-skill traceability: `ARCH-CARTO-[domain]-[NN]`

---

## The Domain Matrix

The cartography is enumerated across these architectural domains. Each gets its own subsection.

### Domain 1 — Application Architecture (composition root, module layout)

Front: AppDelegate / SceneDelegate, App struct + @main, basic SwiftUI Scenes.
Middle: Module-per-feature folder structure, composition root pattern, Coordinator pattern (Khanlou).
Latter end: Bazel + module-type rules (Airbnb, Slack, Lyft, Uber, Spotify), Interface/Implementation module split (Slack), Feature-module + Interface-module pattern (Airbnb), RIBs (Uber), Knit (TikTok).

### Domain 2 — Dependency Injection / Wiring

Front: Singletons, constructor injection, environment values (SwiftUI's `@Environment`).
Middle: Swinject runtime DI, Resolver, manual composition root.
Latter end: swift-dependencies (Pointfree, witness + TaskLocal), Factory (Michael Long, keypath-validated container), Needle (Uber, codegen graph), Cleanse (Square, archived 2024), Inject (Krzysztof, hot-reload + DI integration), Has-protocol composition (Krzysztof's typealias Dependencies = HasX & HasY pattern), Sourcery codegen for DI conformances.

### Domain 3 — State Management

Front: @State, @Binding, @ObservableObject + @Published, NotificationCenter.
Middle: @Observable (iOS 17+), MVVM with @Observable view models, Combine + ViewModels.
Latter end: swift-composable-architecture (Pointfree TCA), modified-MVVM-without-state-diffing (BC's Dia direction), Redux-style state stores with unidirectional flow (BC Arc era), TCA forks with Combine-decoupled cores (BC's fork for Windows).

### Domain 4 — Animation Architecture

Front: UIView.animate, basic SwiftUI .animation modifier, UIViewPropertyAnimator.
Middle: UISpringTimingParameters + spec/runner split (iOS 10+), UIPercentDrivenInteractiveTransition, withAnimation + AnimationCompletionCriteria (iOS 17+), Animatable + VectorArithmetic.
Latter end: Wave (Janum Trivedi, retargetable SpringAnimator<T: SpringInterpolatable>), Stagehand (Cash App, value-typed Animation<T>), Pop (Meta archived), Hero (modifier stack), FlightAnimator, Lottie (designer-authored JSON), bespoke per-effect physics on top of CADisplayLink, Apple's BSAnimationSettings echo (UISpringTimingParameters as value).

### Domain 5 — Navigation

Front: NavigationStack, NavigationLink, sheet/popover/fullScreenCover.
Middle: Coordinator pattern (Khanlou), typed Route enum + NavigationStack(path:), UIViewControllerAnimatedTransitioning + delegate.
Latter end: Server-Driven UI (Robinhood, Reddit), navigationTransition + matchedTransitionSource (iOS 18+), custom Transition protocol with TransitionPhase (iOS 18+), Server-Driven schema → native ViewModel codegen.

### Domain 6 — Persistence

Front: UserDefaults, FileManager, Codable + JSON.
Middle: Core Data, SwiftData (iOS 17+), GRDB (community-tier).
Latter end: Custom persistence-as-witness (PersistenceClient struct of closures), CRDT-backed stores (Linear-tier sync), Realm-style typed stores, KMP-shared persistence (Cash App pattern), actor-isolated persistence layers.

### Domain 7 — Network Layer

Front: URLSession + Codable.
Middle: Wrapper classes with APIRequest + APIClient + APIError model, async/await endpoints.
Latter end: Witness-based APIClient (Pointfree pattern), actor-based NetworkEngine with built-in dedup + retry + auth-coordinator, GraphQL with codegen (Apollo), realtime via AsyncStream subscriptions, cross-process operation queues with serializable NetworkOperation values.

### Domain 8 — Testing Strategy

Front: XCTest unit tests on pure logic.
Middle: ViewInspector / snapshot tests, dependency injection via constructor params, async test helpers.
Latter end: Swift Testing macros (@Test, #expect), withDependencies for test overrides, swift-clocks ImmediateClock + TestClock, Cash App Stagehand-style snapshot-per-keyframe animation testing, characterization tests à la Feathers before refactor, property-based testing for math kernels.

### Domain 9 — DevX

Front: Xcode + SPM + Git.
Middle: CI (GitHub Actions), Fastlane, SwiftLint, SwiftFormat.
Latter end: Inject + InjectionForXcode (Krzysztof's hot-reload, integrates with TCA reducers via custom patches), Sourcery codegen with custom Stencil templates, design-system harness app (separate Xcode target), animation preview target with scrubbable previews, snapshot tests with APNG sweep on PR, Bazel for 100+ engineer build hygiene, build-time CI guards.

---

## The Skill Workflow

### Phase 1 — Define the Problem Domain

State precisely what's being mapped. "I need to map cartography for animation orchestration in a small design-driven iOS app" is specific. "I need a cartography of iOS architecture" is too broad.

### Phase 2 — Enumerate the Front of the Architecture 10%

Walk through every Apple-blessed pattern + idiomatic Swift primitive in the relevant domains. Be exhaustive.

### Phase 3 — Enumerate the Middle

Industry-published OSS + well-known patterns. Use WebFetch / WebSearch to verify current state of any library.

### Phase 4 — Enumerate the Latter End

The principal-tier published practices. This is where most of the value lives, and this is where the assistant's baseline knowledge is most likely incomplete. **Dispatch agents (see Agent Dispatch Protocol).**

### Phase 5 — Surface the Blind Spots

What is NOT yet enumerated? Recent OSS releases the assistant doesn't know? Shops the assistant hasn't researched? Domains adjacent to the named problem that affect the choice?

### Phase 6 — Produce the Output

The structured per-domain × per-tier × per-source enumeration.

---

## Agent Dispatch Protocol
<!-- ID: arch-cartography.agent-dispatch -->

`/arch-cartography` MUST dispatch research agents for the latter-end enumeration when the relevant domains include shops or principal-tier individuals the assistant hasn't deeply researched. Baseline-knowledge-only cartographies are systematically thin at the latter end — this is precisely the territory where insiders publish in places the assistant's training may not cover (personal blogs, conference talks, GitHub repos, X threads).

**When to dispatch:**

- The cartography covers a domain (DI, state, animation, etc.) where the latter end has notable principal-tier individuals (Pointfree, Krzysztof, Janum, Brandon Williams, Joe Groff, Eric Horacek, Tuomas Artman, etc.).
- The cartography includes "what shop X uses" claims that require source verification.
- Recent (last 12-24 months) OSS releases or framework changes may have shifted the menu.

**Dispatch pattern:**

Launch 2-5 parallel research agents, each with `[ROLE: ARCH-CARTO-RESEARCHER]`:

- **Agent A** — Latter-end enumeration in a specific domain (e.g., "all DI options used at principal-tier shops, with citations")
- **Agent B** — Principal-tier individual's published body of work (e.g., "every Krzysztof Zabłocki pattern in his published blog + repos")
- **Agent C** — Shop-level practice (e.g., "what Pointfree's clients use, what BC's TCA fork actually contains")
- **Agent D** — Recent OSS movement (e.g., "what's new in the Swift architecture OSS landscape in 2024-2026")

After agents return, integrate findings into the per-tier enumeration with `ARCH-CARTO-[domain]-[NN]` citation IDs.

---

## Output Format

```
ARCH-CARTOGRAPHY — [PROBLEM DOMAIN]

POSTURE: [janum / senior]

=== Front End of the Architecture 10% ===
For each primitive:
**[Name]** — [category]
- What: [one-line]
- Source: [Apple WWDC / developer.apple.com citation]
- Standalone or compositional: [...]

=== Middle of the Architecture 10% ===
For each primitive:
**[Name]** — [category]
- What: [one-line]
- Source: [OSS repo / blog post / talk]
- Documentation quality: [good / sparse / depends-on-author]
- Experimentation cost: [low / medium / high]

=== Latter End of the Architecture 10% ===
For each primitive:
**[Name]** — [category, author]
- What: [one-line]
- Source: [URL]
- Adoption status: [single-shop / handful-of-shops / niche-but-real]
- Compositional pairings: [what this combines with]
- 90%-dependency: [none / light / heavy]
- Citation ID: ARCH-CARTO-[domain]-[NN]

=== Per-Domain Coverage ===
For each domain (DI / state / animation / navigation / persistence / network / testing / DevX / app architecture):
- Front: [...]
- Middle: [...]
- Latter end: [...]

=== Blind Spots ===
[Specific gaps the cartography didn't reach + research action to address]

=== Agent dispatch summary ===
[What agents were dispatched, what they returned, source-confidence]

=== Cartographic Confidence ===
Overall confidence: [low / medium / high]
What would increase confidence: [specific next research]

=== Sufficiency Check ===
Given the cartography AND the target tier from `/arch-gauge`:
- Are the enumerated primitives sufficient to ship at target tier?
- If sufficient: state explicitly, no `/arch-ninety` needed
- If insufficient: state which primitives have heavy 90%-dependency and what `/arch-ninety` should engage

=== Recommended Next Skill ===
[gauge-only-sufficient / arch-ninety / arch-conjecture / arch-lens-check]
```

---

## Blind-Spot Diagnostics

- **Prompt 1 — Latter-end thinness.** "Did I enumerate the latter end with the same effort as the front and middle? If my latter-end section is thin, the cartography is structurally biased toward what most engineers know."
- **Prompt 2 — Adjacent-domain blindness.** "Is the problem actually domain-X but I cartographically enumerated only domain-Y? E.g., user asked about state management but the real problem is wiring — did I notice?"
- **Prompt 3 — Recent-OSS-blindness.** "Are there libraries released in the last 12-24 months that would shift the menu, but my baseline knowledge doesn't include them? Agent dispatch decision required."
- **Prompt 4 — Inadvertent prescription.** "Did I cartographically enumerate or did I subtly recommend? Cartography is enumeration; recommendation is /arch-conjecture's job."

---

## Dimensionality Completeness Check

- **Dimension 1 — Front coverage.** Documented surface fully enumerated?
- **Dimension 2 — Middle coverage.** Industry OSS + patterns fully enumerated?
- **Dimension 3 — Latter end coverage.** Principal-tier published practices fully enumerated (with citations)?
- **Dimension 4 — Domain coverage.** All requested domains covered, or scoped subset declared?
- **Dimension 5 — Source confidence.** Per-primitive source tags applied?
- **Dimension 6 — Compositional pairings.** Cross-primitive combinations surfaced?

---

## Notes on Use

- **Cartography is enumeration, not recommendation.** The skill maps the menu; `/arch-conjecture` chooses from it.
- **Latter-end enumeration without agent dispatch is structurally thin.** Default to dispatching unless the user has explicitly said "from baseline knowledge."
- **Cartography is per-domain, not all-of-iOS.** Define the domain in Phase 1; resist scope creep.
- **The Sufficiency Check is the routing decision.** Whether `/arch-ninety` needs to run falls out of "are the enumerated primitives enough to ship at target tier."
