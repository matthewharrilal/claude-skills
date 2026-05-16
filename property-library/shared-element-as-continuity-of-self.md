---
name: shared-element-as-continuity-of-self
levels: [L6, L7]
mechanisms:
  - UIViewControllerAnimatedTransitioning with snapshot views
  - SwiftUI matchedGeometryEffect(id:in:)
  - custom transitioning delegate for hero-style transitions
sources:
  - photos: thumbnail expands smoothly into full-screen viewer
  - apollo: media viewer preserves the tapped image's identity
  - instagram: tile-to-detail uses the same image, just resized
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Shared element as continuity-of-self

Tap a photo thumbnail and that same photo expands smoothly to fill the screen — same identity, new size, no fade-cross.

## What the user perceives

When you navigate to a detail, the thing you tapped travels with you. The thumbnail doesn't disappear and a new image doesn't fade in — instead, the very same element grows, moves, and reshapes into its new position. The transition reads as a change of size and place for one persistent object, not as a swap between two screens.

## Exemplars

- **Photos** — thumbnail expands smoothly into the full-screen viewer
- **Apollo** — tapped media keeps its identity through the transition into the viewer
- **Instagram** — feed image scales into detail view as the same element

## Mechanisms

- UIViewControllerAnimatedTransitioning with snapshot views
- SwiftUI matchedGeometryEffect(id:in:)
- custom transitioning delegate for hero-style transitions

## What goes wrong without it

Ports cross-fade between screens. The thumbnail and the detail are obviously two different rendered images blending into each other, and the spatial continuity is lost — you don't feel like you opened the thing, you feel like the screen swapped.

## Why iOS-native (or domain-defining)

iOS-native preserves identity through transitions — the element is the same element, just somewhere else. The matchedGeometryEffect primitive (and its UIKit equivalent via snapshot views) is designed exactly for this: one logical view, animating its frame across containers.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
