---
name: continuous-curvature-shape-morph
levels: [L6, L7]
mechanisms:
  - Interpolate CGPath directly (matching control points) with CAShapeLayer
  - Use .continuous corner curve and animate path, not radius
  - Animate via CAKeyframeAnimation on the path property
sources:
  - Dynamic Island: canonical continuous-curvature morph
  - Apple Wallet card edges: squircle-aware geometry
  - iOS system corner-curve specification (.continuous)
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Continuous-Curvature Shape Morph

A capsule morphs into a rounded rect with the corners themselves continuously deforming — not linearly interpolating a numeric corner radius. The silhouette transitions through valid intermediate shapes at every frame.

## What the user perceives

The shape is real. Mid-morph, it still looks like a designed object, not a half-baked rectangle. The corners do not flicker or look "wrong" at any frame. The morph feels like the object reshaping itself organically, not a number being lerped.

## Exemplars / References

- **Dynamic Island** — the canonical example of continuous-curvature morph
- **Apple Wallet card edges** — squircle continuity across states
- **iOS system .continuous corner style** — the platform-level commitment
- **High-quality custom UI** — apps that animate CAShapeLayer paths directly

## Mechanisms

- Interpolate CGPath directly (matching control points) with CAShapeLayer
- Use .continuous corner curve and animate path, not radius
- Animate via CAKeyframeAnimation on the path property
- Pre-compute the path family with matching point counts to enable interpolation

## What goes wrong without it

Corner-radius-only animation makes the shape's silhouette flicker at intermediate states — the corners look "wrong" mid-transition. The shape briefly becomes a thing that nobody designed. The animation reveals its mechanical origin.

## Levels this property spans

- **L6 (animation engineering):** path-level interpolation rather than scalar lerp
- **L7 (transition orchestration):** the morph carries through across whole-view transitions

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
