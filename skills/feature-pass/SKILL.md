---
name: feature-pass
description: Full property-first feature design pass with active research dispatch — for new feature inception
---

# /feature-pass

Specialized orchestrator that takes a new-feature brief, runs a structured 6-phase design pass, and dispatches 4-5 parallel research agents to ground the design in fresh, cross-domain inspiration.

## When to invoke

- Starting design on a new feature (the founding-engineer "blank canvas" moment)
- Re-thinking an existing feature with fresh eyes
- Pre-quarter planning when scoping multiple features
- Translating a web/Android/Flutter product to iOS-native
- Inheriting a Figma mockup and wanting deep grounding before building
- The first hour on a feature you'll be living inside for weeks
- After a strategy shift when the inherited design no longer fits the new direction

## When NOT to invoke

- Routine design work where library knowledge is sufficient — use `/property-synthesize`
- Reviewing existing/in-progress work — use `/design-lens-check`
- You just want to look up properties — use `/property-library`
- Small polish decisions — use `/complementary`
- Single-component decisions inside an already-scoped feature — use `/property-synthesize`

## Input

A feature idea / brief / mockup. Concrete examples:

- "We're building a chat composer for a meditation app"
- "Onboarding for a money-management app"
- A Figma link
- A user-need description ("users need to feel the day's progress at a glance")
- A web-product description ("we have this web feature; build the iOS version")
- A competitor reference ("something like Headspace's player but for our brand")

## Cost / latency

This skill is **heavy** — dispatches 4-5 parallel research agents. Expect:

- ~5-10 minutes wall-clock
- ~4-5x agent cost vs single-skill invocations
- Returns a structured deliverable, not just text

Invoke at meaningful design moments, not for routine questions. The ROI is highest when you'll spend days or weeks inside the feature being scoped.

## Process

### Phase 1 — Philosophical mapping (instant, before research)

1. Articulate the feature's intent — what user need does it serve?
2. Articulate the brand voice it must carry
3. Surface philosophical tensions (calm vs fast; discoverable vs minimal; instant vs considered; quiet vs expressive)
4. State the "philosophy" the feature embodies BEFORE picking mechanisms

This phase is non-negotiable. Skipping it produces apps without identity — mechanism-perfect surfaces with no center.

### Phase 2 — Taxonomy placement (instant)

1. Run `/level-place` mentally — which L0–L13 levels does this feature touch?
2. Identify cross-cutting concerns that apply (accessibility, i18n, privacy, performance, failure, observability)
3. Flag any level where excellence is load-bearing for this feature (e.g., onboarding is L9-load-bearing; a chat composer is L5+L6 load-bearing)

### Phase 3 — Library property mapping (fast)

1. Query `/property-library` for direct (same-domain) matches
2. Query for cross-domain matches — the auxiliary design sense in action
3. Surface properties plus their mechanism mappings
4. Note properties you'd expect to apply but that aren't in the library yet — flag these for Phase 6

### Phase 4 — Active research dispatch (the load-bearing capability)

Dispatches 4-5 parallel agents covering distinct, non-overlapping lanes:

1. **Same-domain iOS apps** — what do prestige iOS apps do for this exact feature? Goal: see the strong baseline of what's expected in-category.
2. **Cross-domain iOS apps** — what do prestige iOS apps in DIFFERENT categories do whose properties might transfer? Goal: surface the auxiliary-sense moves (lyrics-mask-applies-to-onboarding).
3. **Reference galleries** — Mobbin / Dribbble / Godly / Page Flows / 60fps.design for screen compositions, motion studies, and unconventional treatments. No game sources.
4. **Apple authoritative** — WWDC talks + HIG content relevant to this feature. Goal: anchor the design in what Apple has explicitly endorsed and how the system frameworks expect to be used.
5. **Complementary perimeter** — adjacent properties + polish opportunities at the perimeter (haptics, Reduce Motion path, Live Activity, Dynamic Type behavior, state restoration, keyboard interaction).

Each agent returns a focused brief, not an exhaustive dump. Agents must have distinct, non-overlapping scope — instructed explicitly so findings don't duplicate.

### Phase 5 — Synthesis

1. Compile findings from all agents into a single coherent view
2. Surface cross-domain transfers explicitly — name the property and the source category, so the auxiliary sense is visible as it works
3. Identify open philosophical tensions still to resolve
4. Recommend a mechanism shortlist — concrete, named UIKit/SwiftUI primitives
5. Flag decisions that are load-bearing or irreversible

### Phase 6 — Library update (on confirmation)

1. Extracts properties from research findings via `/property-extract` logic
2. Proposes additions to `/property-library` — each with name, levels, mechanisms, sources, de-domaining note
3. User confirms which to write
4. This is what makes the suite compound — every feature pass leaves the library richer

## Output structure

```
# Feature Pass: <Feature Name>

## Philosophy
[1-2 paragraph statement of what this feature is, philosophically. The intent
and brand voice it carries. The tensions it must resolve.]

## Taxonomy placement
- Primary: L<N>
- Touches: L<N>, L<N>, L<N>
- Cross-cutting: <concerns>
- Load-bearing levels: <which levels excellence is non-negotiable at>

## Library properties that apply
### Direct (same-domain)
- <property> — <mechanism shortlist>
### Cross-domain
- <property from distant category> — <mechanism shortlist + transfer rationale>

## Research findings
### Same-domain references
- <app> — <observation> — <property surfaced>
### Cross-domain references
- <app from distant category> — <observation> — <property + why it transfers>
### Reference galleries (Mobbin et al)
- <link / description> — <observation>
### Apple authoritative
- <WWDC talk / HIG section> — <relevance>

## Complementary perimeter
[Properties + polish opportunities at the feature's perimeter you might miss:
haptics, Reduce Motion, Dynamic Type, state restoration, Live Activity, etc.]

## Open philosophical tensions
- <Tension>: <pole A> vs <pole B>; references resolving each pole

## Recommended mechanism shortlist
- <concrete UIKit/SwiftUI primitive> — <why> — <which property it delivers>

## Load-bearing / irreversible decisions
- <decision> — <why it locks in> — <what to verify before committing>

## Proposed library additions (confirm to write)
- <new property extracted from research> — <one-line rationale>
```

## Composes with (under the hood)

- `/level-place` — Phase 2
- `/property-library` — Phase 3 + 6
- `/property-synthesize` — Phase 3 logic
- `/property-extract` — Phase 6
- `/exposure --topic` — Phase 4 lane 3
- `/complementary` — Phase 5 perimeter logic

## Distinct from /design-lens-check

| Aspect | `/design-lens-check` | `/feature-pass` |
|---|---|---|
| When | Review existing/in-progress work | Start new feature design work |
| Cost | ~30 seconds | ~5-10 minutes (parallel agents) |
| Active research | No, reads library | Yes, dispatches agents |
| Input | Design under review | Feature brief / idea |
| Output | Property-first review pass | Full feature design pass with inspiration |
| Library impact | Reads only | Reads + proposes additions |
| Frequency | Often | Less often, at meaningful inception moments |

Rule of thumb: **`/feature-pass` for inception, `/design-lens-check` for review.**

## Example invocation

User: `/feature-pass — we're building a daily-habit-tracking screen for a wellness app`

The skill walks through phases:

- **Phase 1:** "Philosophy — this is about *quiet daily honesty*. The screen must feel like a private mirror, not a leaderboard. Tensions: motivating vs non-judgmental; rich-with-history vs today-focused."
- **Phase 2:** "Primary L8 (screen). Touches L3 (the row composition), L5 (tap-to-complete interaction), L6 (completion motion), L11 (widget mirroring). Load-bearing: L6 — the completion moment is the emotional payoff."
- **Phase 3:** Pulls *focus-through-subtraction*, *velocity-preservation*, *temporal-grain* from library. Notes that a *muted-celebration* property would apply but isn't held yet.
- **Phase 4:** Dispatches agents — same-domain (Streaks, Reflectly, Daylio), cross-domain (Things 3, Linear, Apple Fitness rings), galleries (Mobbin wellness flows), Apple (WWDC sessions on Charts + Live Activities), complementary perimeter (haptic at completion, Reduce Motion fallback, widget timeline).
- **Phase 5:** Synthesizes — recommends the Things-3 row-collapse-on-completion as the cross-domain transfer; calls out the calm-vs-celebratory tension and how each pole's references resolve it.
- **Phase 6:** Proposes *muted-celebration* and *daily-temporal-anchor* as library additions.

Returns structured deliverable in ~7 minutes.

## Anti-patterns

- Invoking for small decisions — over-research; cost not justified. Use `/property-synthesize` instead.
- Skipping Phase 1 (philosophy) and going straight to mechanisms — produces apps without identity.
- Skipping cross-domain in Phase 4 — defeats the auxiliary design sense, which is the highest-leverage move the suite enables.
- Treating Phase 6 (library additions) as optional — this is what makes the suite compound over months.
- Not specifying agent dispatch lanes clearly — agents need distinct, non-overlapping scope or findings duplicate and waste cost.
- Using as a substitute for `/property-inquire` when you have a vague intuition and no brief — `/feature-pass` needs a concrete starting point.
- Invoking mid-build when scope is already locked — the value is in inception, not execution.
