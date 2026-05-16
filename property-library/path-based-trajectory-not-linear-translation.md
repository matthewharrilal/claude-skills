---
name: path-based-trajectory-not-linear-translation
levels: [L6, L7]
mechanisms:
  - Drive position along a CGPath
  - Use a 2D spring with independent x/y components
  - Or use UIDynamicAnimator with snap + push behaviors
sources:
  - Wallet card dismiss: arcing trajectory respecting flick vector
  - Dynamic Island expand-collapse: path-driven motion
  - iOS app dismiss back to home: arc trajectory
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Path-Based Trajectory, Not Linear Translation

A dismissed card does not just slide off-screen — it arcs along a path that matches the gesture direction and velocity vector. The exit respects the gesture.

## What the user perceives

The card goes where it was sent. A flick up-and-to-the-right exits up-and-to-the-right, not just down. The motion feels obedient to the gesture's full 2D direction, not collapsed to one axis. The system reads the throw, not just the speed.

## Exemplars / References

- **Wallet card dismiss** — arcs in the direction the user flicked
- **Dynamic Island expand-collapse** — path-driven, not linear
- **iOS app dismiss back to home** — arc trajectory
- **iOS app switcher swipe-up to close** — exits along the flick vector

## Mechanisms

- Drive position along a CGPath
- Use a 2D spring with independent x/y components
- Or use UIDynamicAnimator with snap + push behaviors
- Convert gesture velocity vector directly into the spring's initial velocity CGVector

## What goes wrong without it

Cards exit on rails — always straight down, regardless of how the user flicked. The motion feels scripted; the user's directional intent is discarded the moment the gesture ends. The exit feels like a default rather than a response.

## Levels this property spans

- **L6 (animation engineering):** the 2D solver and trajectory math
- **L7 (transition orchestration):** the exit/dismiss is a whole-view transition

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
