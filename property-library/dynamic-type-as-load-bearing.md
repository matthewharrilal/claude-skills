---
name: dynamic-type-as-load-bearing
levels: [L2, L4, L8]
mechanisms:
  - adjustsFontForContentSizeCategory = true on UILabel
  - UIContentSizeCategoryAdjusting conformance for custom views
  - SwiftUI Dynamic Type is automatic when using semantic styles
sources:
  - things-3: layout recomposes cleanly at large accessibility sizes
  - apple-mail: rows grow taller without truncation under big type
  - fantastical: calendar text scales without breaking the grid
  - reeder: article layout survives extreme type sizes
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Dynamic Type as load-bearing

A user with large-text accessibility settings opens your app and the layout recomposes — labels wrap, rows grow taller, nothing clips.

## What the user perceives

The app respects the system text size as a real input. Bumping the slider doesn't just enlarge a few labels — every text surface adjusts, rows reflow, and the layout still makes architectural sense. The interface treats the user's chosen size as an authoritative parameter, not a styling hint.

## Exemplars

- **Things 3** — task rows grow taller at large sizes with no clipping
- **Apple Mail** — entire list layout recomposes as type scales up
- **Fantastical** — calendar text and grid coexist correctly at any size
- **Reeder** — article and list layouts survive extreme accessibility settings

## Mechanisms

- adjustsFontForContentSizeCategory = true on UILabel
- UIContentSizeCategoryAdjusting conformance for custom views
- SwiftUI Dynamic Type is automatic when using semantic styles

## What goes wrong without it

Ports ignore Dynamic Type or cap it. At large sizes, text overflows fixed-height rows, gets truncated, or simply doesn't scale at all — and users who rely on accessibility text sizes are excluded from significant portions of the app's content.

## Why iOS-native (or domain-defining)

iOS-native designs for a 200% type-size user as a first-class case. Layouts are built around content-driven heights and auto layout from the start, so Dynamic Type isn't a special case but the same mechanism that handles every text rendering.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
