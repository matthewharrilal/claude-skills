---
name: two-weight-discipline
levels: [L2, L4]
mechanisms:
  - UIFont.systemFont(ofSize:weight: .medium)
  - SwiftUI .fontWeight(.medium)
sources:
  - Things 3: hierarchy carried by size and 500-weight medium alone
  - Linear iOS: regular body, medium for titles, bold only for genuine events
  - Apple Notes: two-weight rhythm across note list and editor
related-properties: []
added: 2026-05-16
category: component-composition
---

# Two-weight discipline

Use only regular (400) and medium (500/600). Bold is reserved for genuine emphasis events — a single price, a single CTA.

## What it means

Restrict the weight palette to two values across the entire interface, letting SF's optical sizing handle the rest. Bold appears so rarely that its arrival constitutes an event — a single price, a confirmation button, a critical alert. When everything can shout, nothing can.

## Exemplars

- **Things 3** — regular body with medium project titles; bold only on the "Today" hero count
- **Linear iOS** — medium for issue titles, regular for everything else
- **Apple Notes** — two-weight rhythm carries the entire note list hierarchy

## Mechanisms in UIKit/SwiftUI

- UIFont.systemFont(ofSize:weight: .medium)
- SwiftUI .fontWeight(.medium)

## What goes wrong without it

"Important" decays. Every heading shouts equally, the eye finds no entry point, and the user scans visually-flat noise.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
