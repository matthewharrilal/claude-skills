---
name: proximity-rule-2x-gap-ratio
levels: [L2, L4]
mechanisms:
  - SwiftUI VStack(spacing:) with section-level outer spacing
  - UIKit nested stack views
sources:
  - Apple Settings: sections grouped by space, not by lines
  - Things 3: project structure communicated via spacing
  - Apple Notes: groups by space alone
related-properties: []
added: 2026-05-16
category: component-composition
---

# Proximity rule 2x gap ratio

Elements within a group are spaced ≤16pt apart. The gap between groups is ≥32pt — at least 2× the internal spacing. Grouping is created by space, not by lines.

## What it means

The eye groups elements that are close and separates elements that are far. A 2× ratio between within-group and between-group spacing is the threshold at which grouping becomes perceptually unambiguous. With this ratio, no borders or backgrounds are needed to communicate structure.

## Exemplars

- **Apple Settings** — sections grouped by space, not by lines
- **Things 3** — project structure communicated via spacing
- **Apple Notes** — groups by space alone

## Mechanisms in UIKit/SwiftUI

- SwiftUI VStack(spacing:) with section-level outer spacing
- UIKit nested stack views

## What goes wrong without it

Need separator lines to communicate grouping. UI becomes line-heavy. Visual weight competes with content.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
