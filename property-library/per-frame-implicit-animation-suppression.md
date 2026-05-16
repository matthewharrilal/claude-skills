---
name: per-frame-implicit-animation-suppression
levels: [L6]
mechanisms:
  - Wrap explicit updates in CATransaction.begin / setDisableActions(true) / commit
  - Set layer.actions = [:] for layers driven by explicit animators
  - Use CALayer.delegate hook to return NSNull for specific properties
sources:
  - Custom transition controllers: classic source of implicit-animation bugs
  - Wave-style custom animators: explicit disabling of implicits
  - CATransaction documentation
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Per-Frame Implicit-Animation Suppression

When an explicit driver (gesture, custom animator) is moving a layer, no parasitic 0.25s UIView.animate defaults sneak in for adjacent property changes. The explicit driver owns the property completely.

## What the user perceives

Composite animations land together. Nothing lags. The shape changes as one. No mysterious 0.25-second tail on the corner radius or shadow when everything else has already arrived.

## Exemplars / References

- **Custom transition controllers** — the canonical place this bug shows up
- **Wave-style explicit animators** — explicit teardown of implicits
- **Dynamic Island** — coordinated multi-property change with zero parasitic implicits
- **High-quality system transitions** — clean, lag-free composite property changes

## Mechanisms

- Wrap explicit updates in CATransaction.begin / setDisableActions(true) / commit
- Set layer.actions = [:] for layers driven by explicit animators
- Use CALayer.delegate hook to return NSNull for specific properties
- Set every property in the same transaction; do not split across runloops

## What goes wrong without it

Composite animations have one property "lagging" — usually corner radius or shadow — because UIKit's implicit animation kicked in at 0.25s while the explicit driver was at 0.4s. The user sees the shape arrive in parts; the shape feels seam-stitched.

## Levels this property spans

- **L6 (animation engineering):** the transaction-level discipline of suppressing implicits

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
