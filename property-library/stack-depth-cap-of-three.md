---
name: stack-depth-cap-of-three
levels: [L10]
mechanisms:
  - UINavigationController push budget
  - UISheetPresentationController for branching
  - UISplitViewController detail panes
  - in-place expansion / disclosure
sources:
  - Things 3: Areas → Project → Task — three pushes maximum
  - Halide: camera → settings is a single sheet, not a stack
  - Apple Mail: mailbox → thread → message is three, then composer becomes a sheet
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Stack depth cap of three

Beyond three navigation pushes, the user is lost and the IA has failed. AAA apps flatten with sheets, detail panes, or in-place expansion before allowing a fourth push.

## What it means

Each push is a cognitive load: the user must remember where they came from and trust that the back stack will return them. After three layers, that trust degrades to the point that users prefer to force-quit and restart over navigating back. The cap is a design discipline that forces the team to invent flatter structures — sheets, splits, expansion — instead of stacking deeper.

## Exemplars

- **Things 3** — three-level cap (Areas → Project → Task) is enforced product-wide
- **Halide** — settings are a single sheet, not a multi-level stack

## Violators (apps that pay the price)

- **Notion iOS** — routinely reaches five-plus pushes inside a workspace tree
- **Stripe Dashboard mobile** — deep stacks for transactional drill-down

## Why it matters at AAA quality

Each push erodes back-stack confidence. After three, users force-quit instead of navigating back. The forced reset destroys session continuity and is a strong signal that the IA is wrong, not that the user is wrong.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
