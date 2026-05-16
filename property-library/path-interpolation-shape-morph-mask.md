---
name: path-interpolation-shape-morph-mask
levels: [L4, L6, L7]
mechanisms:
  - CAShapeLayer with CABasicAnimation on path keyPath
  - Source and destination paths share point count and topology
sources:
  - Dynamic Island: pill morphs into AirPods-connect, timer, Maps-direction shapes via continuous-curvature superellipse
  - Control Center: module long-press expansion where radius and frame change in one continuous mask path
  - Messages: bubble tail as a single compound bezier (body rect unioned with tail) animating on send
  - Apple Pay: card hero where rounded-rect mask interpolates from small card frame+radius to full-screen
  - Marco Polo: video bubble where AVPlayerLayer is masked by CAShapeLayer of chat bubble outline
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Path-interpolation shape morph mask

Two CGPath endpoints share identical point counts and topology, allowing a CABasicAnimation on the `path` keyPath of a CAShapeLayer mask to interpolate point-by-point. One rounded shape continuously morphs into another — corner radius, dimensions, and even tail or spike geometry change in lockstep.

## What the user perceives

A surface fluidly changes shape — a pill becomes a card, a card becomes a full-screen sheet, a bubble grows a tail — without any kink, pop, or visible seam. The geometry feels alive, like a physical substance reflowing. Corner curvature stays continuous across the transition rather than snapping discretely.

## How the mask works

A CAShapeLayer is used as the mask of a host layer. Its `path` is animated via CABasicAnimation on the `path` keyPath. For the interpolation to be smooth, both the source and destination paths must have the same number of control points in the same order — this is why custom path construction (rather than `UIBezierPath(roundedRect:)`) is often required, so corner curvature, radius, and frame can all morph simultaneously inside a single path animation.

## Exemplars

- **Dynamic Island** — pill morphs through superellipse paths into call, timer, and navigation states
- **Control Center** — module long-press expansion where radius and frame change in one continuous animation
- **Messages** — bubble tail and body live in one compound bezier path that animates on send
- **Apple Pay** — card hero transition where the rounded-rect mask path interpolates from card frame+radius to full-screen frame+radius

## Code sketch

```swift
let mask = CAShapeLayer()
mask.path = pillPath(in: smallRect, cornerRadius: 22).cgPath
host.layer.mask = mask
let morph = CABasicAnimation(keyPath: "path")
morph.fromValue = mask.path
morph.toValue = pillPath(in: largeRect, cornerRadius: 38).cgPath
morph.duration = 0.4
morph.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
mask.path = morph.toValue as! CGPath
mask.add(morph, forKey: "morph")
```

## When this matters / when alternatives won't work

Animating `view.layer.cornerRadius` alongside a frame change does not interpolate curvature smoothly — corners visibly kink during the transition, especially with continuous (squircle) curvature. Only path-to-path interpolation with matched point counts keeps the curvature continuous through the morph.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
