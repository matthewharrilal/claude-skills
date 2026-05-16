---
name: 8pt-base-unit-discipline
levels: [L1, L2]
mechanisms:
  - Constant table (Spacing.s, Spacing.m, Spacing.l enum)
  - 4pt fine-tune only as exception
sources:
  - Apple HIG-conformant apps: all spacing on the 8pt grid
  - Things 3: rigorous 8pt rhythm
  - Linear: 8pt grid throughout
related-properties: []
added: 2026-05-16
category: component-composition
---

# 8pt base unit discipline

All spacing is a multiple of 8 (4 allowed for fine-tuning). 4, 8, 12, 16, 24, 32, 48, 64, 80. No 7s, no 13s, no 19s.

## What it means

Every margin, padding, and gap chooses a value from the 8pt grid. This isn't aesthetic preference — it's a discipline that prevents the drift of arbitrary spacing choices. With a finite spacing vocabulary, decisions become quick and the result is rhythmically consistent.

## Exemplars

- **Apple HIG-conformant apps** — all spacing on the 8pt grid
- **Things 3** — rigorous 8pt rhythm
- **Linear** — 8pt grid throughout

## Mechanisms in UIKit/SwiftUI

- Constant table (Spacing.s, Spacing.m, Spacing.l enum)
- 4pt fine-tune only as exception

## What goes wrong without it

Drift accumulates. Spacing decisions become ad-hoc per screen. The rhythm of the interface dissolves into noise.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
