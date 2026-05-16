---
name: anchor-point-aware-scale
levels: [L5, L6]
mechanisms:
  - Set layer.anchorPoint before scale transform
  - Compensate position to avoid layout jump when changing anchorPoint
  - Use the touch location to derive a per-tap anchor on buttons
sources:
  - Things 3: list-item press scales from center cleanly
  - Apple Music card scale: anchor-aware scaling
  - iOS home-screen icons: scale from logical center
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Anchor-Point Aware Scale

A list row press scales down from its center; a button tap scales toward its touch point; a card lift scales from a logical center. The anchor point is chosen per-interaction, not left to default.

## What the user perceives

Scales look natural. A pressed button shrinks toward where the finger is, like the finger is pushing it. A row press shrinks toward its own middle, like it's being squeezed evenly. The transform respects spatial intuition.

## Exemplars / References

- **Things 3 list-item press** — clean center scale on row press
- **Apple Music card scale** — anchor-aware card lifts
- **iOS home-screen icons** — scale from center as the haptic happens
- **WWDC 2018 Session 803** — anchor-from-touch demonstrations

## Mechanisms

- Set layer.anchorPoint before scale transform
- Compensate position to avoid layout jump when changing anchorPoint
- Use the touch location to derive a per-tap anchor on buttons
- For SwiftUI, use .scaleEffect(_:anchor:) with appropriate UnitPoint

## What goes wrong without it

Scale animates from the top-left corner producing a diagonal drift; or scale-from-center looks wrong for off-center touches because the button's visual response doesn't match where the finger is. The press feels misaligned with the touch.

## Levels this property spans

- **L5 (interactive feel):** the touch-to-transform mapping decisions
- **L6 (animation engineering):** correct anchor compensation in the transform stack

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
