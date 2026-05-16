---
name: elevation-via-tonal-step-not-shadow
levels: [L2, L4]
mechanisms:
  - Asset catalog systemBackground / secondarySystemBackground / tertiarySystemBackground
  - 1px 6% shadow only if tonal step is insufficient
sources:
  - Apple Wallet: cards layer by tone
  - Things 3: sheets elevate by tonal step
  - Linear: tonal hierarchy throughout
related-properties: []
added: 2026-05-16
category: component-composition
---

# Elevation via tonal step not shadow

Hierarchy comes from a small step in surface lightness (e.g., page #fafafa → card #ffffff), not a drop shadow. If shadow is used, it's near-imperceptible (1px blur, 6% opacity).

## What it means

Depth is signaled by the relationship between two surface tones, not by the simulation of a light source. A card sits on a page because its tone is a half-step brighter (light mode) or darker (dark mode). Shadows, when used at all, are whisper-thin and serve as edge-definition rather than depth illusion.

## Exemplars

- **Apple Wallet** — cards layer purely by tone
- **Things 3** — sheets elevate without shadows
- **Linear** — tonal stack throughout

## Mechanisms in UIKit/SwiftUI

- Asset-catalog systemBackground / secondarySystemBackground / tertiarySystemBackground
- 1px / 6% shadow only when tonal step alone is insufficient

## What goes wrong without it

Heavy shadows make the UI feel like 2014 Material Design. Surfaces feel pasted on instead of integrated. The interface ages immediately.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
