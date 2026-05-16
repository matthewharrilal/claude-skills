---
name: spring-continuity-across-successive-inputs
levels: [L5, L6]
mechanisms:
  - Each input perturbs current spring state (adds velocity)
  - Animator never resets to rest before processing next event
  - Closed-form spring solver that supports state injection
sources:
  - iOS volume HUD: tap-tap-tap integrates into one continuous bounce
  - Wave demo apps: explicit successive-input examples
  - Things 3 plus-button: rapid taps add energy
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Spring Continuity Across Successive Inputs

Tapping a button rapidly does not reset its scale — each tap adds energy into the existing spring system; the visual integrates the rhythm. Successive inputs accumulate into one continuous animation rather than queuing as discrete events.

## What the user perceives

Rhythm matters. Rapid taps build up momentum; the button responds to tempo, not just to each isolated press. The interface acknowledges how the user is interacting, not just what. The system feels alive to the cadence.

## Exemplars / References

- **iOS volume HUD** — tap-tap-tap integrates into one continuous bounce
- **Wave demo apps** — explicit successive-input examples
- **Things 3 plus-button** — rapid taps add energy
- **Some music apps' favorite buttons** — rhythm-aware feedback

## Mechanisms

- Each input perturbs current spring state (adds velocity)
- Animator never resets to rest before processing next event
- Closed-form spring solver that supports state injection
- Velocity is summed with current state, not replaced

## What goes wrong without it

Rapid taps look like a strobe of identical animations; the feel ignores rhythm; the system seems blind to tempo. Each press starts over from scratch, so fast interaction looks like a stuttering loop instead of a flowing response.

## Levels this property spans

- **L5 (interactive feel):** rapid-input handling at the gesture layer
- **L6 (animation engineering):** the spring solver that supports incremental velocity injection

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
