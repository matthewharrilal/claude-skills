---
name: mid-flight-reversibility
levels: [L5, L6]
mechanisms:
  - Animation reads presentation().value as truth at grab time
  - Cancel in-flight animation without resetting to model layer
  - Gesture takes over with current velocity preserved
sources:
  - Wave: demos grabbing a settling animation and pulling it back
  - iOS interactive sheet dismissal: half-dismissed sheet can be pulled back
  - Apple Maps card: any detent in motion can be re-grabbed
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Mid-Flight Reversibility

The user grabs an object that is currently animating away and pulls it back — the grab is honored instantly with no fight against the existing animation. The animation cancels in place; the gesture continues from there.

## What the user perceives

Touching an animating object is the same as touching a still one. There is no "wait until it lands" friction, no jump-to-model-layer flash, no battle between the gesture and the system. The on-screen pixel IS the object, and the object can be grabbed at any moment of its trajectory.

## Exemplars / References

- **Wave demos** — explicit "grab the moving thing" examples
- **iOS interactive sheet dismissal** — half-dismissing sheet can be re-grabbed and reverted
- **Apple Maps card** — detents can be intercepted at any point of their travel
- **iOS notifications** — partially-dismissing notifications can be pulled back

## Mechanisms

- Animation reads presentation().value as truth at grab time
- Cancel in-flight animation without resetting to model layer
- Gesture takes over with current velocity preserved
- UIView.animate with .allowUserInteraction or UIViewPropertyAnimator in .active state

## What goes wrong without it

"Ghost snap" — the object jumps to its model layer position the instant the gesture begins, then follows the finger from there. This breaks the illusion that the on-screen pixel is the object; suddenly the user is dragging a teleported ghost.

## Levels this property spans

- **L5 (interactive feel):** the grab is honored without any visible cost
- **L6 (animation engineering):** the underlying animator cleanly hands off state to the gesture

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
