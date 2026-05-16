---
name: z-index-coherence-during-transition
levels: [L7]
mechanisms:
  - Manage zPosition or container view ordering explicitly during transition
  - Never rely on view hierarchy default ordering once layers are animating
  - Hoist transitioning views into a transition container view
sources:
  - iOS app switcher: cards never z-fight
  - iOS Wallet card draw: clean z-ordering during animation
  - Custom transition controllers: classic source of z-fight bugs
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Z-Index Coherence During Transition

Throughout a transition, no element ever appears in front of something it should be behind. The card never clips weirdly into the dismissed view. Z-ordering is managed explicitly through the entire animation.

## What the user perceives

The scene is always coherent. The eye never catches a moment where two layers fight for the same depth. The transition is visually clean from frame one to frame n; no flickers, no clip glitches, no surprise pop-throughs.

## Exemplars / References

- **iOS app switcher** — cards never z-fight even during fast swipes
- **iOS Wallet card draw** — clean ordering across the whole interaction
- **Apple Music transitions** — coherent z-ordering through hero transitions
- **High-quality custom dismissals** — explicit container ordering

## Mechanisms

- Manage zPosition or container view ordering explicitly during transition
- Never rely on view hierarchy default ordering once layers are animating
- Hoist transitioning views into a transition container view
- Use bringSubviewToFront / insertSubview deliberately at transition boundaries

## What goes wrong without it

Flashing z-fights at the transition mid-point; cards appear to "blink" through each other. The transition reveals its layered implementation rather than appearing as a coherent scene. The user catches the seam.

## Levels this property spans

- **L7 (transition orchestration):** the property concerns coordinated cross-view ordering across the whole transition

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
