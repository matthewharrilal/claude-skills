---
name: edge-fade-for-clipped-scroll-content
levels: [L2, L4]
mechanisms:
  - CAGradientLayer as mask on the scroll container
  - SwiftUI .mask(LinearGradient(...))
sources:
  - Apple Music: genre rows fade at trailing edge
  - App Store: featured shelves fade
  - Photos: carousel fades at edges
related-properties: []
added: 2026-05-16
category: component-composition
---

# Edge-fade for clipped scroll content

The leading/trailing edge of a horizontally scrolling region fades to background, indicating "more content exists" without a hard cutoff.

## What it means

When content extends beyond a visible region, a soft alpha fade at the clip boundary indicates "more is over there." This is a perceptual cue — softer than an arrow or scroll indicator, but unmistakable. A hard cutoff at the edge looks like a layout bug; a fade signals intentional clipping.

## Exemplars

- **Apple Music** — genre rows fade on the trailing side
- **App Store** — featured shelves fade as content exits
- **Photos** — carousel softens at the edges

## Mechanisms in UIKit/SwiftUI

- CAGradientLayer as mask on the scroll container
- SwiftUI .mask(LinearGradient(...))

## What goes wrong without it

Content appears arbitrarily cropped. It reads as a layout bug, not a hint. Users don't realize the row is scrollable.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
