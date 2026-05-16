---
name: compound-shape-path-operations-mask
levels: [L2, L4]
mechanisms:
  - CAShapeLayer with compound UIBezierPath combining sub-shapes
  - append() for union; .reversing() with even-odd for subtraction
sources:
  - Messages: speech bubbles with tails as one compound path
  - Apple Wallet: card hardware cutouts where rounded-rect joins magnetic-strip cutout
  - Apple Maps: direction-arrow chevrons filled with gradients
  - iOS notification banner: shadow clipped to avoid the device's actual display corner curve so shadow never spills past rounded screen edge
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Compound shape path operations mask

A CAShapeLayer whose path is the result of combining two or more sub-shapes using union (append) or subtraction (append + reverse with even-odd fill). Used whenever the masked region cannot be expressed as a single rect, oval, or rounded rect — bubble with tail, card with notch, banner with screen-corner clip.

## What the user perceives

A surface that has a non-primitive silhouette feels seamless and intentional — a message bubble's tail flows into its body without a visible join, a notification banner's shadow stops cleanly at the device's display curve, a Wallet card has the right hardware cutout for its category. The compound shape reads as one object, not as a collage.

## How the mask works

A UIBezierPath is built up by calling `append()` with successive sub-paths. For a union, all sub-paths are added with default winding — the result is the area covered by any of them. For a subtraction, the sub-path to remove is reversed (`.reversing()`) before being appended and the layer's `fillRule` is set to `.evenOdd` — the reversed sub-path cancels its overlap with the surrounding shape, producing a hole. The resulting compound path is assigned to a CAShapeLayer's `path`, which then masks a host layer.

## Exemplars

- **Messages** — speech bubble body and tail as a single compound bezier so the join is invisible
- **Apple Wallet** — card hardware cutouts combine the card rounded rect with a magnetic-strip cutout
- **Apple Maps** — direction-arrow chevrons used as masks of gradient layers
- **iOS notification banner** — banner's shadow is masked to clip against the device's display corner curve so the shadow never spills past the rounded screen edge

## Code sketch

```swift
let body = UIBezierPath(roundedRect: bubbleRect, cornerRadius: 18)
let tail = UIBezierPath()
tail.move(to: tailTip)
tail.addQuadCurve(to: tailJoinLeft, controlPoint: tailControl1)
tail.addQuadCurve(to: tailJoinRight, controlPoint: tailControl2)
tail.close()
body.append(tail) // union
bubbleMask.path = body.cgPath
bubble.layer.mask = bubbleMask

// Subtraction example:
let card = UIBezierPath(roundedRect: cardRect, cornerRadius: 12)
let notch = UIBezierPath(rect: notchRect).reversing()
card.append(notch)
cardMask.fillRule = .evenOdd
cardMask.path = card.cgPath
```

## When this matters / when alternatives won't work

Custom-shape regions cannot be assembled cleanly from multiple subviews with clipping — joins are visible, corner curvature breaks at boundaries, and shadow casting becomes inconsistent. Path-level composition before rasterization lets the entire compound shape participate in shadows, corner radii, and animation as a single geometric object.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
