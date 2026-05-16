---
name: stroke-end-draw-on-mask
levels: [L1, L4, L6]
mechanisms:
  - Stroked CAShapeLayer with strokeEnd animated via CABasicAnimation
  - Optionally used as mask cutting a fill into a progress segment
sources:
  - Camera: focus reticle yellow square where each side draws on
  - Health: activity rings using conic gradient masked by stroked arc
  - Things 3: checkbox tick where white checkmark strokes on after circle fills
  - Apple Maps: directional arrows that draw on along route line as you approach turns
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Stroke-end draw-on mask

A stroked CAShapeLayer starts at `strokeEnd = 0` and animates to `1`, causing its line to draw on from start to endpoint over a few hundred milliseconds. The same primitive can be the visible stroke or a mask cutting a fill layer into a progress segment.

## What the user perceives

A line, ring, or glyph appears to be drawn by an invisible pen rather than fading in. There is a moving "tip" that traces the path. For progress rings this reads as "filling up." For glyphs like checkmarks it reads as confirmation being inscribed in real time.

## How the mask works

A CAShapeLayer is given a path and configured as a stroke (`fillColor = nil`, a `strokeColor`, and a `lineWidth`). `strokeStart` and `strokeEnd` control which portion of the path is rendered — `strokeEnd = 0.4` shows the first 40% of the path. Animating `strokeEnd` from 0 to 1 with a CABasicAnimation produces the draw-on. When used as a mask, only the currently-drawn portion of an underlying fill (e.g. a conic gradient) is revealed, giving partial progress on arbitrarily complex paths.

## Exemplars

- **Camera** — focus reticle where each side of the yellow square draws on
- **Health** — activity rings where a conic gradient is masked by a stroked arc whose `strokeEnd` equals progress%
- **Things 3** — checkmark glyph strokes on after the circle fills
- **Apple Maps** — directional arrows draw on along the route line as you approach turns

## Code sketch

```swift
let stroke = CAShapeLayer()
stroke.path = checkmarkPath.cgPath
stroke.strokeColor = UIColor.white.cgColor
stroke.fillColor = nil
stroke.lineWidth = 3
stroke.lineCap = .round
stroke.strokeEnd = 0
view.layer.addSublayer(stroke)
let draw = CABasicAnimation(keyPath: "strokeEnd")
draw.fromValue = 0
draw.toValue = 1
draw.duration = 0.3
stroke.strokeEnd = 1
stroke.add(draw, forKey: "draw")
```

## When this matters / when alternatives won't work

Simulating draw-on with multiple line subviews and alpha animation requires keyframes per segment and breaks for curved paths. A single `strokeEnd` animation handles arbitrary path geometry — including curves and corners — in one parameter.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
