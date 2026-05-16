---
name: settling-via-energy-threshold
levels: [L6]
mechanisms:
  - Settle when total kinetic + potential energy below epsilon
  - Use closed-form analytic spring math rather than numeric integration
  - Snap the final pixel under threshold to avoid sub-pixel jitter
sources:
  - Wave: closed-form spring animator with energy-based settle
  - High-quality custom spring animators in jtrivedi-style libraries
  - Robert Penner / damped harmonic oscillator literature
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Settling Via Energy Threshold

Springs stop without a perceptible "click" — no final-frame snap to the rest position. Settling is decided by total energy in the system, not by distance from the target.

## What the user perceives

Animations end gracefully. There is no visible last-frame jump, no jitter, no tail of dying sub-pixel oscillation. The motion fades to rest in a way that matches the deceleration leading up to it.

## Exemplars / References

- **Wave's spring animator** — explicit energy-threshold settle
- **High-quality custom libraries** — Pop, ZSDK, jtrivedi's Wave
- **Apple's first-party springs** — implicitly use a similar criterion
- **Damped harmonic oscillator literature** — the mathematical basis

## Mechanisms

- Settle when total kinetic + potential energy below epsilon
- Use closed-form analytic spring math rather than numeric integration
- Snap the final pixel under threshold to avoid sub-pixel jitter
- Energy = 0.5 * m * v^2 + 0.5 * k * x^2; threshold tuned per use

## What goes wrong without it

A visible final-pixel snap as the animation realizes it's "close enough" and jumps to rest. Or interminable jitter as the spring chases sub-pixel positions forever, never quite settling. Both feel cheap.

## Levels this property spans

- **L6 (animation engineering):** the termination criterion of the spring solver

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
