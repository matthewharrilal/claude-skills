---
name: level-place
description: Map a problem, property, or reference onto the L0-L13 iOS taxonomy in seconds
---

# /level-place

Place a problem, property, or reference onto the L0-L13 iOS experience stack so the conversation knows which level it is operating at.

## When to invoke

- Stuck on a design decision; want to verify you're working at the right level
- About to over-engineer at L3 when the problem is actually L10 (or vice versa)
- Mid-conversation with someone and want to clarify "we're discussing different levels"
- Looking at a property and wondering which levels it manifests at
- Looking at a reference and wondering where its excellence is located
- A `/property-synthesize` or `/feature-pass` invocation is about to start and scope needs locking
- The 5-second sanity check before committing to an attack plan

## When NOT to invoke

- You need design output → use /property-synthesize
- You need to extract a property → use /property-extract
- You need polish/perimeter → use /complementary
- You need a full review pass → use /design-lens-check

## Input

A problem description, property name, or reference. Concrete examples:
- "I'm trying to decide between a tab bar and a sidebar"
- "Where does 'photometric continuity' live?"
- "Apple Music's lyrics fade — where's the excellence?"

## Output

Tight, fast response:
- **Primary level:** L<N> — <one-line rationale>
- **Secondary levels touched:** L<N>, L<N> — <brief notes>
- **Cross-cutting concerns that apply:** <list>
- **Implication:** <one-sentence; what does this placement mean for how to attack the problem?>

## The taxonomy reference

### Vertical levels
- **L0 Substrate** — OS, hardware, framework, deployment target
- **L1 Primitive** — Raw API atoms (UILabel, CAGradientLayer)
- **L2 Configuration** — A primitive with properties set
- **L3 Micro-composition** — Bundled primitives, no public contract
- **L4 Component** — Composition with public API + behavioral contract
- **L5 Interaction** — Gesture + response surface
- **L6 Motion** — Animation choreography
- **L7 Transition** — One state-bundle to another
- **L8 Screen** — Complete feature surface
- **L9 Flow** — Multi-screen sequences
- **L10 Information Architecture** — Organization + navigation
- **L11 System Integration** — Widgets, Live Activities, Spotlight, etc.
- **L12 Lifecycle** — App states, restoration
- **L13 Substrate Services** — Persistence, network, sync, identity

### Cross-cutting concerns
- Accessibility (VoiceOver, Dynamic Type, Reduce Motion)
- Internationalization (locale, RTL, variable-length text)
- Privacy (data access, permissions, explanations)
- Performance (memory, frame rate, energy)
- Failure modes (network, low storage, low battery)
- Observability (analytics, telemetry, crash signals)

## Process

1. Parse input
2. Identify primary level (where the load-bearing work lives)
3. Identify secondary levels touched
4. Identify cross-cutting concerns that apply
5. Return one-line implication of this placement

## Composes with

- /property-synthesize — usually run BEFORE synthesize to confirm scope
- /property-library — placement helps query by level
- /design-lens-check — level-place is often the first step in the orchestrator

## Example invocation 1

User: "I'm trying to decide between tab bar and sidebar for navigation."
Skill: "Primary: L10 (information architecture). Touches: L4 (the navigation component itself), L9 (how the choice affects flow patterns), L10 inherits to L8 (screen-level reachability). Cross-cutting: accessibility (sidebar harder for one-handed reach), internationalization (sidebar width varies by language). Implication: this is an irreversible IA-level decision; commit deliberately."

## Example invocation 2

User: "Where does 'velocity sacred across retarget' live?"
Skill: "Primary: L6 (motion). Touches: L5 (interaction — gesture velocity injection), L1 (primitive — which spring implementation). Cross-cutting: performance (per-frame integration cost). Implication: this is a load-bearing motion-level property; absence is felt instantly mid-flight."

## Anti-patterns

- Assigning ONE level when multiple apply — most rich problems span 3-5 levels
- Skipping cross-cutting concerns
- Overly long responses — this skill is SHORT by design
- Missing the "implication" line — placement is only useful if it changes how to attack the problem
- Treating the taxonomy as a partition rather than a coordinate system
