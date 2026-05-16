---
name: reading-line-height-generosity
levels: [L2]
mechanisms:
  - NSMutableParagraphStyle.lineHeightMultiple
  - SwiftUI .lineSpacing()
sources:
  - Bear: long-form notes set at 1.6+ line-height
  - Reeder: article body breathes generously
  - Apple Notes: long-form mode opens up line-height
related-properties: []
added: 2026-05-16
category: component-composition
---

# Reading line-height generosity

Body copy at 1.5–1.7 line-height. Dense paragraphs feel anxious; spaced ones feel confident.

## What it means

For any text the user is expected to read (not scan), line-height sits well above the default 1.2. The vertical space between lines lets the eye return cleanly to the next line's start without re-finding its place. Generous line-height costs vertical room; that cost is the price of being read.

## Exemplars

- **Bear** — note body set at ~1.6 line-height
- **Reeder** — article reading view opens up to 1.7
- **Apple Notes** — long-form mode breathes

## Mechanisms in UIKit/SwiftUI

- NSMutableParagraphStyle.lineHeightMultiple
- SwiftUI .lineSpacing()

## What goes wrong without it

Long-form reading fatigue. Paragraphs feel like walls of text. The user bounces before scrolling and never returns.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
