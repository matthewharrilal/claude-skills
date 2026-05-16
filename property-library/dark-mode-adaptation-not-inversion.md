---
name: dark-mode-adaptation-not-inversion
levels: [L2]
mechanisms:
  - UIColor(dynamicProvider:) returning distinct light/dark values
  - Asset catalog Any/Dark appearances (not runtime inversion)
sources:
  - Apple system apps: hand-tuned dark palette
  - Tweetbot/Ivory: native dark adaptation
  - Apollo: distinct dark tone, not inverted light
related-properties: []
added: 2026-05-16
category: component-composition
---

# Dark-mode adaptation not inversion

Dark mode is a re-pigmenting, not a 1 - lightValue flip. Surfaces shift to neutral darks (#0a0a0a, #1c1c1e), accents desaturate slightly to avoid retinal burn.

## What it means

Each color has two hand-tuned values: a light-mode color and a dark-mode color. Dark accents are slightly desaturated to reduce glare on dark backgrounds. Surfaces choose neutral near-blacks, not pure black, to preserve subtle elevation. The dark palette is designed, not derived.

## Exemplars

- **Apple system apps** — every semantic color has a distinct dark value
- **Tweetbot/Ivory** — accents desaturated for dark
- **Apollo** — neutral dark backgrounds, not inverted

## Mechanisms in UIKit/SwiftUI

- UIColor(dynamicProvider:) returning distinct light/dark values
- Not traitCollection.userInterfaceStyle branching at render time

## What goes wrong without it

Dark mode looks like a CSS filter — washed accents, gray text on near-black, or worse, the whole UI inverted into oversaturated chaos.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
