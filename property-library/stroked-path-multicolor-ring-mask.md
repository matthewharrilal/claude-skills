---
name: stroked-path-multicolor-ring-mask
levels: [L2, L4]
mechanisms:
  - CAGradientLayer (or conic gradient) providing color
  - CAShapeLayer mask with strokeColor = .black, fillColor = nil, lineWidth = N
sources:
  - Instagram: story rings with red-orange-magenta-purple gradient sweep around unread avatars
  - Health: activity rings using a conic gradient masked by stroked arc
  - Apple Wallet: foil rings around boarding pass/movie ticket card art
  - Snapchat: unread story indicators
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Stroked-path multicolor ring mask

A CAShapeLayer configured with `fillColor = nil`, a stroked path, and used as a mask cuts a gradient layer into a ring or arc shape. Because the color comes from the underlying CAGradientLayer rather than from the stroke itself, the ring carries a smooth multi-color transition that a Core Graphics stroke (single color) cannot produce.

## What the user perceives

A ring or arc whose color shifts smoothly around its circumference — Instagram's hot-pink-to-orange-to-purple story indicator, Apple Health's activity rings shading from one hue to another along the arc. The color feels like part of the ring itself, not a tint applied to it.

## How the mask works

A CAGradientLayer (linear, conic, or radial) provides the color field. Its mask is a CAShapeLayer with a stroked circular or arc path: `strokeColor` is opaque black, `fillColor` is nil, and `lineWidth` sets the ring's thickness. The result is that only the ring-shaped region of the gradient is visible, so the gradient's colors fill the ring with continuous transitions. The stroke parameters control the ring; the gradient controls the colors.

## Exemplars

- **Instagram** — story rings with a red-orange-magenta-purple gradient sweeping around unread avatars
- **Apple Health** — activity rings using a conic gradient masked by a stroked arc whose `strokeEnd` is the progress
- **Apple Wallet** — foil rings around boarding pass and movie ticket card art
- **Snapchat** — unread story indicators with gradient rings

## Code sketch

```swift
let gradient = CAGradientLayer()
gradient.frame = bounds
gradient.type = .conic
gradient.colors = [UIColor.systemPink, UIColor.systemOrange,
                   UIColor.systemPurple, UIColor.systemPink].map { $0.cgColor }
gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
gradient.endPoint = CGPoint(x: 1, y: 0.5)
let ring = CAShapeLayer()
ring.path = UIBezierPath(ovalIn: bounds.insetBy(dx: 3, dy: 3)).cgPath
ring.strokeColor = UIColor.black.cgColor
ring.fillColor = nil
ring.lineWidth = 3
gradient.mask = ring
view.layer.addSublayer(gradient)
```

## When this matters / when alternatives won't work

A single-color stroked CAShapeLayer cannot carry a gradient — its stroke is one color. Stacking multiple stroked sublayers with different colors produces visible joins rather than a smooth gradient. Only masking a gradient layer with a stroked path delivers a continuously-colored ring.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
