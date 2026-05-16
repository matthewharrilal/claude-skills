---
name: continuous-curvature-mask-paths
levels: [L2]
mechanisms:
  - RoundedRectangle(cornerRadius:style:.continuous) as .clipShape()
  - UIBezierPath via CAShapeLayer with continuous-curvature math
sources:
  - Messages: contact thumbnails clipped continuously
  - Apple Music: album-art tiles use continuous masks
  - Wallet: pass crops use continuous-curvature paths
related-properties: []
added: 2026-05-16
category: component-composition
---

# Continuous-curvature mask paths

Masks (avatar circles, image clips, capsule labels) follow the same curvature grammar as surfaces. A "rounded rectangle" image clip uses .continuous, not a plain cornerRadius.

## What it means

The grammar of corners extends to masks. When clipping an image to a rounded rectangle, the corner-curvature math must match the surface-corner math — otherwise the mask reads as out of system. This consistency is what makes the iOS visual vocabulary cohere.

## Exemplars

- **Messages** — contact thumbnails clipped with continuous mask
- **Apple Music** — album-art tiles use continuous-curvature masks
- **Wallet** — pass crops follow continuous-curvature paths

## Mechanisms in UIKit/SwiftUI

- RoundedRectangle(cornerRadius:style:.continuous) as .clipShape()
- UIBezierPath constructed via CAShapeLayer with continuous-curvature math

## What goes wrong without it

Masked images feel like web border-radius — out of grammar with surrounding surfaces. The mismatch is subliminal but readable.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
