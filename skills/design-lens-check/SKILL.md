---
name: design-lens-check
description: Lightweight orchestrator — chains property-lens skills for a fast property-first review of existing design work.
---

# /design-lens-check

Chain the property-lens suite (and optionally the 10/90 skills) over existing design work to produce a structured, property-first review without dispatching active research.

## When to invoke

- Reviewing your own design with a property-first lens
- Pre-PR audit of a feature you've built
- Mid-implementation sanity check before committing to a direction
- Reviewing a teammate's work
- Wanting to chain multiple suite skills in one pass without manual orchestration
- Post-ship retrospective on a shipped feature
- Quick "is this any good?" check before showing work to stakeholders

## When NOT to invoke

- Starting a fresh feature from scratch → use `/feature-pass` (includes active research)
- Single-skill questions → use the specific skill directly
- You want to add to the library → use `/property-extract`
- Quick taxonomy-only question → use `/level-place` directly
- You only need contamination flags → use `/contamination-check` alone

## Input

Design under review. Could be:
- A description of an in-progress feature
- A code reference (file path or snippet)
- A screenshot or mockup
- "Review the [feature name] I just built"

## Cost / latency

**Light** — chains existing skills using current library knowledge. No external research dispatch.

- ~30 seconds to 2 minutes
- Single-pass invocation
- No additional agent dispatch
- Reads `~/.claude/property-library/` but does not write to it

For the heavier active-research version, use `/feature-pass` instead.

## Process — default chain

1. **`/level-place`** — confirm what level(s) the work is at (L0–L13 + cross-cutting)
2. **`/property-synthesize`** — surface relevant library properties + mechanism shortlist
3. **`/complementary --adjacent-properties`** — what's at the property-perimeter that's missing?
4. **`/contamination-check`** — any non-iOS instincts to flag?

**Optional — chain with 10/90 skills (via `--full`):**

5. **`/gauge`** — what tier of thinking is the work operating at?
6. **`/cartography`** — which primitives are available for this domain?
7. **`/ninety`** — what hidden Apple-internal knowledge applies?
8. **`/conjecture`** — propose the composition

## Configurable depth

- `/design-lens-check` (default) — chains the 4 suite skills (level-place + synthesize + complementary + contamination-check)
- `/design-lens-check --full` — additionally chains the 10/90 skills (gauge, cartography, ninety, conjecture)
- `/design-lens-check --quick` — runs only level-place + synthesize (fastest; ~30 sec)

## Output structure

```
# Design Lens Check: <Subject>

## Level placement
- Primary: L<N>
- Touches: ...
- Cross-cutting: ...

## Library properties that apply
- <property>: <mechanism shortlist>
- ...

## Adjacent properties at perimeter
- <property>: <why it's missing here>
- ...

## Contamination findings
- <finding>: <iOS-native alternative>
- ...

## (If --full) Tier / cartography / ninety / conjecture
- ...

## Recommendations
- <prioritized actions>
```

## Composes with

This skill IS a composer. It chains:

- `/level-place`
- `/property-synthesize`
- `/complementary`
- `/contamination-check`
- (optionally) `/gauge`, `/cartography`, `/ninety`, `/conjecture`

## Distinct from /feature-pass

| Aspect | `/design-lens-check` | `/feature-pass` |
|---|---|---|
| Purpose | Review existing work | Start new feature work |
| Active research | No | Yes — dispatches 4-5 agents |
| Cost | Light (~30 sec) | Heavy (~5-10 min) |
| Input | Existing design | Feature brief |
| Output | Property-first review | Full design pass with research |
| Library impact | Reads only | Reads + proposes additions |
| Use case | "Is what I built good?" | "What should I build, deeply?" |

Rule of thumb: **`/feature-pass` for inception, `/design-lens-check` for review.**

## Example invocation

User: `/design-lens-check — review the destination card emergence animation I just built`

Skill chains the 4 sub-skills:

1. `/level-place` → Primary: L6 (motion). Touches: L4 (the card component), L5 (interaction trigger). Cross-cutting: accessibility (Reduce Motion path), performance (frame rate during emergence).
2. `/property-synthesize` → relevant properties: *velocity preservation*, *photometric continuity*, *focus through subtraction* + mechanism shortlist.
3. `/complementary --adjacent-properties` → missing: haptic at commit, state-restoration mid-animation, keyboard dismissal coupling.
4. `/contamination-check` → flags hardcoded duration (web instinct) where a spring would be iOS-native; flags a custom shadow where a material would do.

Returns structured review document.

## Anti-patterns

- Invoking when you should use `/feature-pass` — skipping active research for new work undersells the moment
- Always using `--full` when default is sufficient — wastes invocation depth on routine reviews
- Treating it as a substitute for thinking — the skill surfaces findings; YOU decide what to act on
- Skipping `--quick` mode when you just want fast level+synth feedback
- Using it on something with no concrete artifact — needs a design under review, not a vague intent
