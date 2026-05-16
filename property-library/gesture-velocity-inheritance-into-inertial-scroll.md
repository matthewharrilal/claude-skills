---
name: gesture-velocity-inheritance-into-inertial-scroll
levels: [L5, L6]
mechanisms:
  - setContentOffset replaced by custom velocity-aware animator
  - UICollectionViewFlowLayout.targetContentOffset(forProposedContentOffset:withScrollingVelocity:)
  - UIScrollView's native deceleration with velocity preserved at release
sources:
  - UIScrollView deceleration: the original reference implementation
  - Snapchat story-card peek: paginated carousel with velocity inheritance
  - Instagram Reels swipe: flick velocity drives the next-card snap
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Gesture-Velocity Inheritance Into Inertial Scroll

Releasing a drag in a paginated carousel continues with the gesture's flick velocity into the snap; releasing a scroll preserves momentum. The post-release motion inherits the pre-release energy.

## What the user perceives

A flick keeps going. The scroll respects the user's push. Hard flicks travel far; gentle releases come to rest nearby. The system feels physically responsive to the energy of the gesture, not arbitrarily resetting to default deceleration.

## Exemplars / References

- **UIScrollView deceleration** — the original reference implementation
- **Snapchat story-card peek** — paginated carousel with velocity inheritance
- **Instagram Reels swipe** — flick speed drives snap travel
- **iOS Photos library scroll** — momentum preserved seamlessly

## Mechanisms

- setContentOffset replaced by custom velocity-aware animator
- UICollectionViewFlowLayout.targetContentOffset(forProposedContentOffset:withScrollingVelocity:)
- UIScrollView's native deceleration with velocity preserved at release
- Read gesture velocity at .ended state; seed the inertial animator with it

## What goes wrong without it

Release snaps independent of flick force — slow drag and hard flick feel identical post-release. The system feels deaf to the user's tempo. Flicks come to rest unexpectedly close; tentative releases overshoot. The handoff feels broken.

## Levels this property spans

- **L5 (interactive feel):** the release moment and the velocity read
- **L6 (animation engineering):** the inertial animator that consumes the velocity correctly

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
