---
name: capsule-shape-as-semantic-primitive
levels: [L2, L4]
mechanisms:
  - Capsule() in SwiftUI
  - layer.cornerRadius = bounds.height / 2
sources:
  - Apple Music: genre filter pills
  - Photos: memory tags as capsules
  - App Store: category chips
related-properties: []
added: 2026-05-16
category: component-composition
---

# Capsule shape as semantic primitive

Pills/capsules (cornerRadius = height / 2) signal "atomic, taggable, often filter-like." Not interchangeable with rounded rects.

## What it means

The capsule shape carries semantic meaning: it marks something as a discrete, often selectable, often filterable atom. Capsules and rounded rectangles are not interchangeable styling choices — they're different roles. Mixing them blurs role distinctions.

## Exemplars

- **Apple Music** — genre filter pills
- **Photos** — memory tags as capsules
- **App Store** — category chips

## Mechanisms in UIKit/SwiftUI

- Capsule() in SwiftUI
- layer.cornerRadius = bounds.height / 2

## What goes wrong without it

Filter chips read as buttons; nav buttons read as tags. Roles blur. The user can't predict behavior from shape.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
