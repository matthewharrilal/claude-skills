---
name: radius-expansion-radial-reveal-mask
levels: [L4, L6, L7]
mechanisms:
  - CAShapeLayer with circular path whose radius animates from 0 to full
  - CABasicAnimation on path keyPath of the mask layer
sources:
  - Things 3: checkbox fill where accent color fills via radial wipe from bottom-center over ~150ms
  - Overcast: chapter art transitions appear from center outward over ~400ms
  - Instagram: double-tap heart with faint radial light flash inside heart silhouette
  - Headspace: breathing exercise pastel circle expanding via animating circular shape
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Radius expansion radial reveal mask

A circular CAShapeLayer path animates its radius from 0 to full size while serving as a mask of underlying content. The reveal has a moving boundary growing from a point — distinct from a fade-in, which has no boundary at all.

## What the user perceives

Color, art, or imagery appears to grow outward from a specific point rather than fading uniformly. There is a perceptible front — an expanding edge — that sweeps across the masked region. The motion reads as "born here and growing" rather than "appearing everywhere at once."

## How the mask works

A CAShapeLayer is given a circular path defined by `arcCenter` and `radius`. As the mask of the destination layer, only pixels inside the circle are visible. A CABasicAnimation on the `path` keyPath interpolates from a zero-radius circle (at the origin point) to a full-radius circle large enough to cover the destination. Soft-edge versions place a radial gradient inside the mask itself so the expanding boundary is feathered rather than hard.

## Exemplars

- **Things 3** — checkbox accent color fills the circle via a radial wipe from bottom-center
- **Overcast** — chapter art transitions reveal new artwork from center outward instead of crossfading
- **Instagram** — double-tap heart sends a faint radial light flash that radiates only inside the heart silhouette
- **Headspace** — breathing exercise circle expands and contracts with a soft pastel edge

## Code sketch

```swift
let mask = CAShapeLayer()
let origin = CGPoint(x: bounds.midX, y: bounds.maxY)
let finalRadius = hypot(bounds.width, bounds.height)
mask.path = UIBezierPath(arcCenter: origin, radius: 0,
                         startAngle: 0, endAngle: .pi * 2,
                         clockwise: true).cgPath
fillLayer.mask = mask
let expand = CABasicAnimation(keyPath: "path")
expand.fromValue = mask.path
expand.toValue = UIBezierPath(arcCenter: origin, radius: finalRadius,
                              startAngle: 0, endAngle: .pi * 2,
                              clockwise: true).cgPath
expand.duration = 0.15
mask.add(expand, forKey: "expand")
```

## When this matters / when alternatives won't work

An alpha fade has no moving boundary — the eye reads "appearing" rather than "growing from a point." Without an expanding mask, the directional origin of the reveal is lost, and the affordance feels disconnected from the touch location that triggered it.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
