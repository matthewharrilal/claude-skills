---
name: press-lift-two-stage-response
levels: [L5, L6]
mechanisms:
  - Two separate animators — press is short-duration ease-out scale
  - Lift is spring with dampingRatio < 1.0 and initial velocity from press-end
  - Two distinct timing curves rather than one symmetric curve
sources:
  - Things 3 checkbox: explicit two-stage press-lift
  - iOS home-screen icons: press-and-lift behavior
  - Wallet card: subtle two-stage lift on touch
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Press-Lift Two-Stage Response

A tap has a fast-in compression (press) and a slower spring-out release (lift) — never symmetric. Lift overshoots slightly. The two halves of a tap have different timing because they express different physical events.

## What the user perceives

Taps feel physical. The press is crisp and acknowledges the touch immediately; the lift is a satisfying bounce-back that says "yes, that registered." Together they form a complete event, not a single canned wobble.

## Exemplars / References

- **Things 3 checkbox** — explicit, well-tuned press-lift
- **iOS home-screen icons** — press-shrink, lift-overshoot
- **Wallet card** — subtle but real two-stage response
- **High-quality buttons in Apple apps** — universal pattern

## Mechanisms

- Two separate animators — press is short-duration ease-out scale
- Lift is spring with dampingRatio < 1.0 and initial velocity from press-end
- Two distinct timing curves rather than one symmetric curve
- Press ~0.1s ease-out, lift spring with damping ~0.7

## What goes wrong without it

A symmetric 0.2s ease-in-out scale on tap looks "cheap" — clearly canned, not physical. The lift looks like the reverse video of the press, and the eye reads that as fake. The button feels like a sprite with two states, not an object.

## Levels this property spans

- **L5 (interactive feel):** the touch-down vs. touch-up decision points
- **L6 (animation engineering):** managing two animators per tap with handoff

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
