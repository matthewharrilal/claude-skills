---
name: tabular-figures-for-in-place-numerics
levels: [L2]
mechanisms:
  - UIFont.monospacedDigitSystemFont(ofSize:weight:)
  - SwiftUI .monospacedDigit()
sources:
  - Apple Stopwatch: tabular digits hold position as time ticks
  - Castro: playback timestamp doesn't jitter
  - Cash App: balance figures stay aligned
  - Stocks: ticker values don't dance
related-properties: []
added: 2026-05-16
category: component-composition
---

# Tabular figures for in-place numerics

Any number that changes while visible — timers, scores, prices, counters, durations — must use monospaced digits so the layout doesn't jitter.

## What it means

When a digit changes from "1" (narrow) to "8" (wide), proportional figures shift the entire number's bounding box. The eye registers this as motion and tries to interpret it. Tabular figures fix every digit to the same advance width, so changing values stay typographically still.

## Exemplars

- **Apple Stopwatch** — running time digits hold position
- **Castro** — playback timestamp stable
- **Cash App** — balance figures aligned across screens
- **Stocks** — ticker values don't shimmy

## Mechanisms in UIKit/SwiftUI

- UIFont.monospacedDigitSystemFont(ofSize:weight:)
- SwiftUI .monospacedDigit()

## What goes wrong without it

Timer digits dance left/right. The eye treats motion as semantic when it's just noise — distracting from the actual value.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
