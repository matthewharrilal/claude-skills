---
name: corner-radius-interpolation-synced-to-frame
levels: [L7]
mechanisms:
  - Animate cornerRadius and frame in same animation block with identical timing
  - Compute radius as function of size progress
  - Drive both off a shared progress value
sources:
  - Snapchat story open: corners zero exactly at edges
  - Instagram Reels open: synchronized corner straightening
  - iOS app launch zoom: corners match screen progress
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Corner-Radius Interpolation Synced to Frame

A card growing into full-screen has its corners straighten in lockstep with reaching the screen edges — bottom corners hit zero radius exactly when the card reaches the bottom edge. Geometry and corner-state are one signal.

## What the user perceives

The transition lands cleanly. There is no visible mismatch at the moment the card becomes the screen — the corners arrive at the same instant as the edges. The full-screen state begins without correction.

## Exemplars / References

- **Snapchat story open** — corners hit zero radius exactly at edge contact
- **Instagram Reels open** — synchronized corner straightening
- **iOS app launch zoom** — corner state matches screen progress
- **Apple Photos open** — clean corner-frame coupling

## Mechanisms

- Animate cornerRadius and frame in same animation block with identical timing
- Compute radius as function of size progress
- Drive both off a shared progress value
- Use UIScreen.main.displayCornerRadius as the target value

## What goes wrong without it

Corners stay rounded after the card reaches the edge (looking like an inset rectangle) or zero out too early (visible square corners during the transition). The user sees an awkward in-between state where the geometry has finished but the styling hasn't.

## Levels this property spans

- **L7 (transition orchestration):** the property couples two animated states across an entire transition

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
