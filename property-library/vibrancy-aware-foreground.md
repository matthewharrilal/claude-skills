---
name: vibrancy-aware-foreground
levels: [L2]
mechanisms:
  - UIVibrancyEffect(blurEffect:style:)
  - SwiftUI .foregroundStyle(.primary) inside materials
sources:
  - Control Center: vibrant labels over blur
  - Notification Center: vibrant text adapts to wallpaper
  - Apple Music now-playing: track title stays legible over album-art blur
related-properties: []
added: 2026-05-16
category: component-composition
---

# Vibrancy-aware foreground

Foreground content over UIVisualEffectView uses vibrancy-resolved colors, not literal hex. Otherwise text becomes unreadable when the blur substrate shifts.

## What it means

Text on top of a blur material must use system vibrancy or SwiftUI's semantic foreground styles. These resolve at composite time against the actual substrate, ensuring contrast regardless of what's behind the blur. Hardcoded colors fail because the substrate is unknown at design time.

## Exemplars

- **Control Center** — labels resolve against whatever wallpaper sits beneath
- **Notification Center** — text remains legible over any backdrop
- **Apple Music now-playing** — title stays readable over the album-art blur

## Mechanisms in UIKit/SwiftUI

- UIVibrancyEffect(blurEffect:style:)
- SwiftUI .foregroundStyle(.primary) inside materials

## What goes wrong without it

Text over a light wallpaper disappears; over a dark one it glares. The blur surface fails in production for the exact contexts it was designed to handle.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
