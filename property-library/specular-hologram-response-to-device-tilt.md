---
name: specular-hologram-response-to-device-tilt
levels: [L5, L6]
mechanisms:
  - CMMotionManager device-attitude reading
  - CATransform3D rotation with m34 perspective applied to a layer
  - Gradient layer position bound to tilt for shine
sources:
  - Apple Pay card hologram: canonical example
  - Wallet pass shine: gyro-driven highlight
  - iOS Lock Screen depth widgets: parallax response
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Specular Hologram Response to Device Tilt

A surface (Apple Pay card, lock-screen depth widget) shifts highlights as the device tilts — gyro drives a subtle parallax that suggests material. The interface is responsive to the physical orientation of the device.

## What the user perceives

The card is a real object behind glass. Tilting the phone reveals a shine that moves like a real holographic foil. The interface gains a sense of materiality that flat designs cannot achieve; the screen becomes a window into something physical.

## Exemplars / References

- **Apple Pay card hologram** — canonical example
- **Wallet pass shine** — gyro-driven highlight
- **iOS Lock Screen depth widgets** — parallax response to tilt
- **Some third-party trading-card apps** — explicit foil simulations

## Mechanisms

- CMMotionManager device-attitude reading
- CATransform3D rotation with m34 perspective applied to a layer
- Gradient layer position bound to tilt for shine
- Throttle motion updates and damp to avoid jitter

## What goes wrong without it

The card looks flat and printed; no sense of "real object behind glass." The interface feels like a screenshot, not a physical artifact. The tactile illusion that the screen contains depth is lost.

## Levels this property spans

- **L5 (interactive feel):** the passive tilt-to-shine response feels like a tactile property
- **L6 (animation engineering):** the gyro-driven transform stack and gradient binding

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
