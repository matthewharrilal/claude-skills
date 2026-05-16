---
name: photometric-continuity-across-surfaces
levels: [L2, L8]
mechanisms:
  - UIColor(dynamicProvider:) with named asset catalog entries
  - SwiftUI Color("Surface/Elevated")
sources:
  - Apple Mail: message list and thread share surface tone
  - Things 3: project, todo, and detail use a single card color
related-properties: []
added: 2026-05-16
category: component-composition
---

# Photometric continuity across surfaces

The same logical surface keeps the same color across screens, sheets, and modal stacks. A "card" doesn't become slightly grayer in detail view.

## What it means

Surfaces of equivalent semantic role share one exact tone, everywhere they appear. The "elevated card" on the home screen is the same color as the "elevated card" inside a sheet. Discrepancies — even single-percent shifts — signal that the user has crossed into a different visual system.

## Exemplars

- **Apple Mail** — message list cell and thread surface match exactly
- **Things 3** — project card and todo detail share tone

## Mechanisms in UIKit/SwiftUI

- UIColor(dynamicProvider:) with named asset catalog entries
- SwiftUI Color("Surface/Elevated")

## What goes wrong without it

Navigation feels like crossing into a different app. Trust erodes invisibly — the user senses inconsistency without being able to name it.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
