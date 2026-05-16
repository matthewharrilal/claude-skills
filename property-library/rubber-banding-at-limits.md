---
name: rubber-banding-at-limits
levels: [L5]
mechanisms:
  - offset = c * pow(x, 0.55) transfer function applied to displacement past the limit
  - Mirror the transfer function on release for a settled return
  - UIScrollView's built-in bounce as a model
sources:
  - WWDC 2018 Session 803 "Designing Fluid Interfaces": projection and rubber-banding formula
  - UIScrollView: the original rubber-band reference
  - Apple Maps: top-detent overshoot resistance
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Rubber-Banding at Limits

When dragging past a boundary (sheet top, scroll edge), resistance grows non-linearly — the user can push further but it costs more. Past the limit, displacement compresses against a virtual rubber band.

## What the user perceives

The edge is communicated through resistance, not refusal. The user is never stopped abruptly; instead, the surface admits there's an edge by getting "heavier" the further past it the gesture goes. This signals the limit while preserving the sense that the user is in full control.

## Exemplars / References

- **WWDC 2018 Session 803** — Apple's formula for the non-linear transfer
- **UIScrollView bounce** — the original implementation that defined the feel
- **Apple Maps top-detent overshoot** — drag past the top and the card resists
- **iOS scroll views in any app** — universal pattern

## Mechanisms

- offset = c * pow(x, 0.55) transfer function applied to displacement past the limit
- Mirror the transfer function on release for a settled return
- Apply to overflow only — within the legal range, motion is 1:1 with finger
- Use UIScrollView's built-in bounce or replicate the math for custom containers

## What goes wrong without it

A hard stop at the limit feels mechanical and brittle — the system suddenly refuses to obey. Alternatively, unlimited drag with no signal that an edge exists leaves the user lost. Rubber-banding is the negotiation between the two.

## Levels this property spans

- **L5 (interactive feel):** the gesture transfer function — pure touch-to-motion mapping

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
