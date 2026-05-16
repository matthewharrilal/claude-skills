---
name: borders-as-last-resort
levels: [L2, L4]
mechanisms:
  - UITableView.separatorStyle = .none + spacing
  - 1 / UIScreen.main.scale hairlines only when unavoidable
sources:
  - Apple Settings: zero-border list separators, tonal grouping
  - Things 3: borderless throughout
  - Apple Notes: groups by space, not by lines
related-properties: []
added: 2026-05-16
category: component-composition
---

# Borders as last resort

A border is an admission that spacing alone was insufficient. Reach for whitespace first, tonal step second, hairline border only when both have failed.

## What it means

The hierarchy of separation tools is: whitespace, then tonal step, then border. Each step is a fallback when the prior was inadequate. Borders are heavy — they add visual weight that competes with content. Use them only when grouping cannot be communicated any other way.

## Exemplars

- **Apple Settings** — list sections grouped by space and tone, hairline separators barely visible
- **Things 3** — borderless throughout
- **Apple Notes** — groups by space alone

## Mechanisms in UIKit/SwiftUI

- UITableView.separatorStyle = .none + spacing
- 1 / UIScreen.main.scale hairlines as last resort

## What goes wrong without it

UI starts to look like a tax form — boxes within boxes within boxes. Visual weight competes with content; reading becomes labor.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
