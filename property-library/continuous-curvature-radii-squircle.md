---
name: continuous-curvature-radii-squircle
levels: [L2]
mechanisms:
  - CALayer.cornerCurve = .continuous
  - SwiftUI RoundedRectangle(cornerRadius:style:.continuous)
sources:
  - App icons: the canonical squircle
  - Wallet cards: continuous-curvature corners
  - Photos thumbnails: squircle masks throughout
  - Every system sheet: continuous corners
related-properties: []
added: 2026-05-16
category: component-composition
---

# Continuous-curvature radii squircle

Corners use the iOS superellipse (.continuous), not circular arcs. The curvature accelerates smoothly into the straight edge — the app icon grammar applied everywhere.

## What it means

A continuous-curvature corner is mathematically a superellipse, not a quarter-circle. The curvature ramps up gradually as it leaves the straight edge, then decelerates into the next edge. This is the same shape as the app icon, and applying it everywhere creates a visual grammar across all of iOS.

## Exemplars

- **App icons** — the canonical superellipse
- **Wallet cards** — continuous corners throughout
- **Photos thumbnails** — squircle masks
- **System sheets** — every modal uses continuous corners

## Mechanisms in UIKit/SwiftUI

- CALayer.cornerCurve = .continuous
- SwiftUI RoundedRectangle(cornerRadius:style:.continuous)

## What goes wrong without it

Corners look "stamped" — same radii feel harsher, less native, more web-like. The interface fails the squint test against any first-party app.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
