---
name: complementary
description: Surface what you're NOT working on — adjacent polish, adjacent properties, leverage-ranked perimeter
---

# /complementary

Surface what you're not thinking about at the perimeter of your current work — adjacent polish ideas, adjacent properties in the property graph, and leverage-ranked allocation of polish budget.

## When to invoke

- Feature is "done" and you want to surface perimeter cases you may have missed
- You have polish budget (hours, a sprint, a Friday) and need to allocate it intelligently
- Designing component X and want to know what adjacent concerns matter (haptics, motion, state-restoration, accessibility)
- Senior reviewer voice: "what nice things could we add that aren't core?"
- Pre-ship audit moment, after the feature works but before anyone has touched the seams
- Post-ship retro: ranking what to invest in for v2

## When NOT to invoke

- You're designing the core feature itself — use `/property-synthesize`
- You don't have a specific feature in scope yet — use `/exposure` or `/feature-pass`
- You want to audit for non-iOS instincts — use `/contamination-check`
- You're scoping a brand-new feature from blank canvas — use `/feature-pass`

## Input

Current state of your work — specific enough that "perimeter" has a center to be perimeter-of. Examples:

- "I'm polishing the chat morph; what perimeter is missing?"
- "I have 8 hours of polish budget for the destination card before Thursday — what gets the most leverage?"
- "Designing a list view with swipe-to-archive; what adjacent properties matter?"
- "Onboarding flow is shipped; what perimeter cases bite us next month?"

## Sub-modes

### Default — adjacent polish at perimeter

Surfaces nice-to-have polish ideas that live AT THE PERIMETER of the current work — the things AAA apps add that founding engineers often miss because they were focused on the core. The discipline is **perimeter, not core extension**: ideas must be adjacent to (not part of) the central design.

Categories the default mode walks through:

- **Haptic feedback** at commit moments / transitions / errors
- **Live Activity / Dynamic Island** behavior if the feature has stateful progress
- **Reduce Motion path** — what does this look like with animation disabled
- **State restoration mid-interaction** — kill the app mid-morph, what happens
- **Keyboard dismissal** behavior during the interaction
- **Background / foreground transitions** mid-flow
- **Spotlight / handoff / Shortcuts** integration if applicable
- **Quick Look / share sheet / drag-and-drop** affordances
- **Empty states, error states, loading states** for the edges
- **Dynamic Type / Larger Text** behavior at extreme sizes

### `--rank`

Ranks polish opportunities by **leverage-per-hour**, given current state and stated budget. The ranking calculation is the load-bearing part of this mode:

```
leverage = (visibility × user-hit-rate × compounding) / (hours × risk)
```

- **Visibility** — how perceptible the polish is when it lands (0.1 for nice-but-invisible; 1.0 for "users notice on first use")
- **User-hit-rate** — fraction of users who'll encounter it (0.05 for edge-case; 1.0 for happy-path)
- **Compounding** — does this polish unlock OTHER polish? (1.0 for terminal; 3-5x for foundational like haptic-token-system or motion-timing-library that enables many subsequent polish moves)
- **Hours** — honest engineering estimate including verification time
- **Risk** — does it touch load-bearing systems? (1.0 for isolated; 2-4x for touching nav stack / data layer)

The output names the top 3-5 with the leverage breakdown shown, plus a "skip these" list for explicitly deprioritized ideas with the reason.

### `--adjacent-properties`

Surfaces properties at the **property-perimeter** — not screen-space adjacent, but adjacent in the property graph. Reads `related-properties` field from current property's library entry, then walks one hop out. **Cross-domain adjacency is the goal** — properties from distant app categories that happen to share structural neighbors.

Different framing from default mode: this is about WHAT properties to consider, not WHICH polish ideas. If you're working on "focus-through-subtraction," this mode surfaces "photometric-continuity" and "time-varying-mask-coupled-to-input" — not "add haptics."

## Composes with

- `/property-synthesize` — usually run AFTER synthesize to check the perimeter of the synthesized design
- `/property-library` — `--adjacent-properties` mode queries the `related-properties` frontmatter field
- `/level-place` — perimeter often spans levels above/below the current work (a chat morph at L7 has perimeter at L11 Live Activities and L5 haptics)
- `/design-lens-check` — chains `/complementary --adjacent-properties` as step 3 of the review pass

## Example invocation (default)

**User:** "I'm polishing the chat morph; what perimeter is missing?"

**Skill returns:**

1. **Haptic at commit** — `.impactOccurred(.soft)` when morph reaches end-state; users feel completion before the visual settles. Standard pattern in iMessage, Things.
2. **Reduce Motion path** — currently the morph IS the affordance; with Reduce Motion the user gets nothing. Add cross-fade fallback that preserves the state-change signal.
3. **State restoration mid-morph** — kill the app at 50% morph progress; on relaunch you should land on the committed end-state, not the interrupted middle.
4. **Keyboard dismissal during morph** — if keyboard is up when morph starts, dismiss timing matters; dismissing before morph starts feels different from during.
5. **Live Activity hand-off** — if the chat is a long-running conversation, the morph commit could update a Live Activity. Adjacent, not core.
6. **Velocity injection from gesture** — if the morph follows a gesture, injecting the gesture's terminal velocity into the spring makes the commit feel earned vs. arbitrary.
7. **Dynamic Type at xxxLarge** — does the morph still land geometrically when text height is 2x?

## Example invocation (--rank)

**User:** "I have 8 hours of polish budget for the destination card before Thursday."

**Skill returns:**

| Rank | Polish | Hours | Leverage | Notes |
|---|---|---|---|---|
| 1 | Haptic-token system + apply to card commit | 3 | **9.2** | Compounding 4x: unlocks haptics on every other interaction shipped this quarter. High visibility on first tap. |
| 2 | Reduce Motion fallback for card expansion | 1.5 | **6.4** | Hits 8% of users (real data) but those users get nothing today. High visibility for that segment. Isolated change. |
| 3 | Skeleton state during card image load | 2 | **4.1** | Happy-path visibility but only on cold cache; compounding 1.5x (skeleton style reusable). |
| 4 | VoiceOver custom rotor for card actions | 1.5 | **2.8** | High user-hit for that segment but small segment; terminal (no compounding). |

**Skip these (named explicitly):**
- *Card flip animation refinement* — 4 hours, low leverage, touches gesture stack (risk 3x). Defer.
- *Custom share sheet for card* — system sheet is fine; engineering vanity, not user-visible win.

**Recommendation:** Take items 1-3 (6.5 hours). Item 1 alone justifies the budget via compounding into the next quarter's polish.

## Example invocation (--adjacent-properties)

**User:** "I'm working on focus-through-subtraction for the lyrics-style view. What's adjacent?"

**Skill returns (walking the property graph):**

**One hop out (from `related-properties` field):**
- *photometric-continuity* — keeping luminance/chroma stable across the focus boundary so the subtraction reads as attention, not as a hard cut. Cross-domain source: Procreate's brush palette dim.
- *time-varying-mask-coupled-to-input* — the mask edge moves with scroll velocity, not just position. Cross-domain source: Reeder's search-pill drift.

**Two hops (via shared `related-properties` of those):**
- *velocity-preservation-across-state-transitions* — adjacent to the mask-velocity property; relevant when the focus moves between modes (scroll → tap-to-select).
- *perceptual-anchor-during-motion* — keep one element stable so the eye has a reference; pairs with subtraction because the un-dimmed thing IS the anchor.

**Cross-domain neighbor (deliberately distant):**
- *progressive-revelation-as-spatial-metaphor* — from doc-reader apps (PDF Expert, Highlights). Distant from lyrics but structurally adjacent: both demote-the-context to elevate-the-current.

**Suggested reading:** if you only had time to internalize one, *photometric-continuity* — it's the failure mode that makes naive subtraction look like a bug rather than design.

## Anti-patterns

- **Default mode that suggests CORE FEATURE additions** instead of perimeter — defeats the purpose. "Add a reply button to the chat" is not perimeter; "haptic when the morph commits" is.
- **`--rank` that ignores compounding** — some polish (haptic token system, motion timing library, color-token migration) unlocks 10x downstream polish; static cost-benefit ranking misses this and recommends low-compounding items first.
- **`--adjacent-properties` that surfaces only same-domain neighbors** — cross-domain adjacency is more valuable. If you're working on a chat morph and the mode only returns "other chat properties," it failed.
- **Treating "complementary" as "more features"** — this is polish + adjacency, not feature creep. The discipline is staying at the perimeter, not extending the core.
- **Polish suggestions with no reason attached** — every item should answer "why does this matter at the perimeter of THIS work specifically." Generic polish lists are worse than no list.
- **Ranking without a budget input** — leverage-per-hour needs a denominator. If no budget is stated, ask before ranking.
