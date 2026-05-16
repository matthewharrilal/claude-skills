---
name: single-shared-clock-for-composite-state
levels: [L6, L7]
mechanisms:
  - One CADisplayLink driving all properties of a composite animation
  - UIViewPropertyAnimator group with shared duration and timing
  - Custom animator that ticks all springs from one tick source
sources:
  - Wave E02: emphasises single-clock composition for unified motion
  - Dynamic Island morphs: all properties land in a single perceptual moment
  - Apple Wallet card lift: scale, shadow, and corner radius share one timeline
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Single Shared Clock for Composite State

When a card moves, scales, rounds, and shadows simultaneously, all properties land together — never one property arriving two frames before another. The animation has one clock, one tick source, one moment of arrival.

## What the user perceives

The object feels like a single unified thing changing state, not a stack of independent properties each animating on its own schedule. The user cannot decompose the motion into parts; everything resolves as one event. This is what separates "shape that morphs" from "properties that drift."

## Exemplars / References

- **Wave E02** — demonstrates a single-tick animator running multiple springs in lockstep
- **Dynamic Island** — all geometry, color, and content land at the same frame
- **Apple Wallet card lift** — composite property change with no perceptible drift
- **iOS app icon press** — scale and shadow co-arrive

## Mechanisms

- One CADisplayLink driving all properties of a composite animation
- UIViewPropertyAnimator group with shared duration and timing
- Custom animator that ticks all springs from one tick source
- Drive properties off a single progress value 0..1 rather than independent CABasicAnimations

## What goes wrong without it

"Drift" — corner radius finishes before transform, or shadow lags scale by a frame or two. The shape feels mechanically assembled out of independent properties rather than expressing one unified change. The eye catches the lag even when it cannot name it.

## Levels this property spans

- **L6 (animation engineering):** the explicit decision to share a clock across properties
- **L7 (transition orchestration):** whole transitions composed of many sub-animations all arrive together

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
