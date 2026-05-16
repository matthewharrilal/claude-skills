---
name: even-odd-inverse-cutout-spotlight-mask
levels: [L2, L4]
mechanisms:
  - CAShapeLayer with fillRule = .evenOdd
  - Compound UIBezierPath (outer rect + inner shape) used as mask
sources:
  - Photos: crop mode dims area outside crop rect at ~60%
  - Camera: QR scanner dims everything except detected code's quad
  - Linear: command palette dims everywhere except highlighted result row
  - Pinterest: pin zoom-to-detail with rounded-rect cutout around the focused pin
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Even-odd inverse cutout spotlight mask

A full-screen dim layer is masked by a CAShapeLayer whose path consists of the outer screen rect plus an inner shape, using `fillRule = .evenOdd`. The entire screen dims except one specific region — the inner shape becomes a true "hole" in the dim layer.

## What the user perceives

The screen darkens to draw attention to one specific region — a crop frame, a scanned QR, a search result row. The held-out region remains at full brightness with no visible seam between it and the dimmed surround. The eye reads "everything else is the background, this is the subject."

## How the mask works

A semi-transparent black layer fills the screen. Its mask is a CAShapeLayer whose path appends the outer bounds rectangle and the inner cutout shape into one compound path. With `fillRule = .evenOdd`, points inside the outer rect but inside the inner shape are excluded — so the inner region punches a hole. Because a single layer carries the entire dim, there is no seam where two siblings would meet.

## Exemplars

- **Photos** — crop mode dims everything outside the adjustable crop rectangle
- **Camera** — QR scanner darkens the frame except for the detected code's quad
- **Linear** — command palette dims everywhere except the highlighted result row, sliding between rows in ~120ms
- **Pinterest** — pin zoom-to-detail dims grid with rounded-rect cutout around the focused pin

## Code sketch

```swift
let dim = CAShapeLayer()
let path = UIBezierPath(rect: view.bounds)
path.append(UIBezierPath(roundedRect: cutoutRect, cornerRadius: 12))
dim.path = path.cgPath
dim.fillRule = .evenOdd
let dimLayer = CALayer()
dimLayer.frame = view.bounds
dimLayer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
dimLayer.mask = dim
view.layer.addSublayer(dimLayer)
```

## When this matters / when alternatives won't work

Composing the dim from four sibling rectangles around the cutout produces a visible seam where any two rectangles meet — especially at non-axis-aligned edges or rounded corners. Only the even-odd fill rule on a single compound path gives a layer a real "hole" without seams.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
