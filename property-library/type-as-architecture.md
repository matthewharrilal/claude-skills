---
name: type-as-architecture
levels: [L2, L4, L8]
mechanisms:
  - UIFont.preferredFont(forTextStyle:) with Dynamic Type styles
  - semantic style tokens (.largeTitle, .title2, .body, .caption1)
  - SwiftUI .font(.largeTitle) with semantic styles
sources:
  - apple-mail: title, sender, preview at obvious different elevations
  - notes: folder, note title, body lines as type-hierarchy alone
  - reeder: article list reads as architecture via weight and size
  - bear: tag tree and content layered through type only
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Type as architecture

Navigation titles, section headers, and metadata sit at obvious different elevations without any boxes or rules. Weight and size do the layout work.

## What the user perceives

Hierarchy is unmistakable from typography alone. You scan a screen and instantly know what's the title, what's a section, what's metadata, what's the body — and there are no borders, backgrounds, or dividers doing the work. The structure is in the type, not in the chrome around it.

## Exemplars

- **Apple Mail** — title, sender, preview lines read as three distinct elevations
- **Notes** — folder name, note title, and body separated by type alone
- **Reeder** — article list architecture is entirely typographic
- **Bear** — tag tree and content distinguished through size and weight only

## Mechanisms

- UIFont.preferredFont(forTextStyle:) with Dynamic Type styles
- semantic style tokens (.largeTitle, .title2, .body, .caption1)
- SwiftUI .font(.largeTitle) with semantic styles

## What goes wrong without it

Ports specify points (16px, 14px) and break Dynamic Type. The hierarchy is brittle — it works at one size and falls apart at any other — and it usually requires boxes, lines, or background fills to compensate for the typographic flatness.

## Why iOS-native (or domain-defining)

iOS-native uses semantic text styles that scale together when a user changes their type size — preserving the ratios that define hierarchy. The styles are not fixed sizes but relationships, so the architecture survives at any accessibility setting.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
