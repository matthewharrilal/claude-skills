---
name: velocity-preserved-across-retarget
levels: [L5, L6, L7]
mechanisms:
  - Spring animator that reads current velocity from the in-flight animation and seeds the new one
  - UIViewPropertyAnimator.continueAnimation(withTimingParameters:durationFactor:)
  - Custom spring re-targeting that preserves dx/dt at the moment of input
sources:
  - Wave (jtrivedi) E01: demonstrates retargeting a sheet mid-flight without resetting velocity
  - UIViewPropertyAnimator: Apple's first-party API for continuing an animation with new parameters
  - Apple Maps: flicking the detent card mid-settle continues smoothly to the new detent
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Velocity Preserved Across Retarget

Mid-flight, the user changes the target (drags a sheet that was already snapping back). The animation does not snap or pop — it continues from current velocity toward the new destination as if it always intended to go there.

## What the user perceives

The on-screen object feels like it has continuous momentum. When the user touches or re-aims something already in motion, the response is seamless: no jerk, no flicker, no rubber-banding back to a "real" position. The object behaves as if its physical state — including velocity — is the source of truth, not the destination.

## Exemplars / References

- **Wave (jtrivedi) E01** — explicit demo of preserving in-flight velocity when retargeting a spring
- **Apple Maps detent flick** — flicking the bottom card to a new detent picks up where it was
- **iOS interactive sheet dismiss** — grabbing a settling sheet preserves its momentum
- **UIViewPropertyAnimator** — first-party API designed exactly for this re-aim case

## Mechanisms

- Spring animator that reads current velocity from the in-flight animation and seeds the new one
- UIViewPropertyAnimator.continueAnimation(withTimingParameters:durationFactor:)
- Custom spring re-targeting that preserves dx/dt at the moment of input
- Sample presentation().value and derive velocity by finite difference if no native source exists

## What goes wrong without it

A visible "stutter" or instantaneous direction change. The object jerks toward the new target with no acknowledgement of its prior motion, breaking the illusion of continuity. The user perceives the system as discrete and stateful rather than continuous and physical.

## Levels this property spans

- **L5 (interactive feel):** the grab-and-retarget gesture is honored without visible cost
- **L6 (animation engineering):** the spring math reads and re-seeds velocity correctly
- **L7 (transition orchestration):** retargeting works across whole transitions, not just single properties

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
