---
name: self-sizing-all-the-way-down
levels: [L4]
mechanisms:
  - intrinsicContentSize + Auto Layout
  - SwiftUI default content-driven sizing with .fixedSize() as exception
sources:
  - Apple Mail: message cells self-size to content
  - Things 3: task rows expand with content
  - Linear: list items adapt to text and Dynamic Type
related-properties: []
added: 2026-05-16
category: component-composition
---

# Self-sizing all the way down

No component takes a fixed frame. It declares an intrinsic content size (UIKit) or lets its content drive sizing (SwiftUI). Parents lay out children; children never assume parent size.

## What it means

Every view declares "I need this much space for my content." The parent decides whether to grant that or constrain it. Children never hard-code dimensions, because they cannot know in advance what content, language, or Dynamic Type setting will arrive.

## Exemplars

- **Apple Mail** — message cells self-size to content
- **Things 3** — task rows expand with content
- **Linear** — list items adapt to text and Dynamic Type

## Mechanisms in UIKit/SwiftUI

- intrinsicContentSize + Auto Layout
- SwiftUI default content-driven sizing with .fixedSize() as exception

## What goes wrong without it

Dynamic Type breaks layout. Localization breaks layout. Long content truncates silently. The UI fails in production for users it should serve.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
