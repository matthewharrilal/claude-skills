---
name: animated-gradient-shimmer-sweep-mask
levels: [L2, L4, L6]
mechanisms:
  - CAGradientLayer (3-stop clear/bright/clear) used as layer mask
  - CABasicAnimation on locations or startPoint/endPoint
sources:
  - Apollo: image-loading shimmer on post thumbnails
  - Arc Search: "Browse for me" partial card shimmer during generation
  - Apple Music: karaoke lyric brightness sweep tied to audio timestamp via CADisplayLink
  - Wallet: foil holograms driven by gyro
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Animated gradient shimmer sweep mask

A three-stop diagonal gradient (clear to bright to clear) is used as a mask whose `locations` or `startPoint`/`endPoint` animate, so a bright band sweeps across the masked region. The shimmer feels embedded under the surface rather than painted on top.

## What the user perceives

A soft band of light travels diagonally across a placeholder, card, or word. The light respects the host's rounded corners and shape — it does not spill past the surface. The motion reads as "alive but waiting" or "this thing is being processed."

## How the mask works

A CAGradientLayer is configured with three color stops where the middle stop is bright (or fully opaque when used as a mask) and the outer stops are clear. The gradient is set as `layer.mask` on the host. A CABasicAnimation drives either `locations` (sliding the bright band along the gradient axis) or `startPoint`/`endPoint` (moving the gradient itself), repeating with a brief pause. The mask inherits the host's bounds so corner radii and clipping are automatic.

## Exemplars

- **Apollo** — image-loading shimmer on post thumbnails
- **Arc Search** — partial card shimmer while "Browse for me" generates an answer
- **Apple Music** — karaoke lyric brightness sweep synchronized to audio playback
- **Apple Wallet** — foil hologram on credit cards reacts to device tilt

## Code sketch

```swift
let shimmer = CAGradientLayer()
shimmer.frame = card.bounds
shimmer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
shimmer.locations = [0, 0.5, 1]
shimmer.startPoint = CGPoint(x: -0.2, y: 0.5)
shimmer.endPoint = CGPoint(x: 1.2, y: 0.5)
let anim = CABasicAnimation(keyPath: "locations")
anim.fromValue = [-0.5, -0.25, 0]
anim.toValue = [1.0, 1.25, 1.5]
anim.duration = 1.4
anim.repeatCount = .infinity
shimmer.add(anim, forKey: "shimmer")
card.layer.mask = shimmer
```

## When this matters / when alternatives won't work

An overlay view sliding across cannot respect the host's rounded corners or arbitrary mask shape without an additional clipping layer. The motion has to feel UNDER the surface — applying it as a sibling reads as a decal sliding above, not as light moving through the material.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
