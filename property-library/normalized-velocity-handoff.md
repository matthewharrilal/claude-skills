---
name: normalized-velocity-handoff
levels: [L6]
mechanisms:
  - Convert pixel-velocity to normalized-velocity via pixels_per_sec / remaining_distance per axis
  - Feed as CGVector to UISpringTimingParameters initialVelocity
  - Separate x and y normalization to handle anisotropic motion
sources:
  - WWDC 2018 Session 803 "Designing Fluid Interfaces"
  - UISpringTimingParameters(dampingRatio:initialVelocity:)
  - Apple's documentation on spring handoff
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Normalized Velocity Handoff

The spring's "snappiness" matches the gesture's energy — fast flicks animate with proportionally fast settles, slow releases settle gently. The spring receives the gesture's velocity expressed in its own normalized units.

## What the user perceives

The animation after release feels like a continuation of the gesture, not a canned response. A confident flick lands quickly with appropriate overshoot; a tired release floats gently to rest. The system reads the user's energy and matches it.

## Exemplars / References

- **WWDC 2018 Session 803** — explicit demonstration of the conversion
- **UISpringTimingParameters** — Apple's API designed for this exact handoff
- **iOS sheet dismiss** — flick speed controls settle speed
- **Wave** — explicit demos of velocity-matched springs

## Mechanisms

- Convert pixel-velocity to normalized-velocity via pixels_per_sec / remaining_distance per axis
- Feed as CGVector to UISpringTimingParameters initialVelocity
- Separate x and y normalization to handle anisotropic motion
- Clamp at sane bounds to avoid pathologically fast springs

## What goes wrong without it

Fixed-duration animations regardless of flick force — the system feels like it has a mood unrelated to the user's gesture. Slow releases trigger snappy springs; hard flicks trigger lazy ones. The handoff feels random.

## Levels this property spans

- **L6 (animation engineering):** the math of converting touch velocity to spring velocity correctly

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
