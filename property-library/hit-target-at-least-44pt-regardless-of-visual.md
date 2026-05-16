---
name: hit-target-at-least-44pt-regardless-of-visual
levels: [L1, L4]
mechanisms:
  - hitTest(_:with:) override
  - SwiftUI .contentShape(Rectangle()) with padding
sources:
  - Apple Mail: small toolbar icons with generous hit areas
  - Things 3: small checkboxes, large tap zones
  - Tweetbot: tight visual buttons, forgiving hit-test regions
related-properties: []
added: 2026-05-16
category: component-composition
---

# Hit target at least 44pt regardless of visual

Visual element may be 16pt, hit area is 44pt. The visual is not the affordance — the hit-test region is.

## What it means

The visible glyph and the touchable region are decoupled. A 16pt icon can have a 44pt invisible hit area extending around it. This lets visual design stay restrained and elegant while the touch surface remains forgiving. The user's finger doesn't know about pixel boundaries.

## Exemplars

- **Apple Mail** — small toolbar icons with generous hit areas
- **Things 3** — tiny checkboxes, large invisible tap zones
- **Tweetbot** — tight visual buttons with forgiving hit-test

## Mechanisms in UIKit/SwiftUI

- hitTest(_:with:) override
- SwiftUI .contentShape(Rectangle()) with padding

## What goes wrong without it

Users miss-tap, blame themselves, build distrust of small UI. They abandon the affordance and the feature beyond it.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
