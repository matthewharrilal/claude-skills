---
name: affordance-scarcity
levels: [L4, L8]
mechanisms:
  - UISwipeActionsConfiguration
  - UIContextMenuInteraction
  - SwiftUI .swipeActions, .contextMenu
sources:
  - Apple Mail: swipe actions, no inline buttons
  - Things 3: long-press for secondary actions
  - Reeder: gestures replace button clutter
related-properties: []
added: 2026-05-16
category: component-composition
---

# Affordance scarcity

Don't put a button next to everything tappable. Make rows tappable. Use long-press, swipe, context menu for secondary actions. Toolbars get 3–5 actions, not 8.

## What it means

Primary action is implicit in the row itself; secondary actions live in gesture-revealed menus. A toolbar with eight buttons is a sign that the design failed to identify which actions are actually primary. Hide secondary actions behind discovery gestures — swipe, long-press, context menu.

## Exemplars

- **Apple Mail** — swipe-to-archive, no inline button
- **Things 3** — long-press for secondary task actions
- **Reeder** — gestures replace button clutter

## Mechanisms in UIKit/SwiftUI

- UISwipeActionsConfiguration
- UIContextMenuInteraction
- SwiftUI .swipeActions, .contextMenu

## What goes wrong without it

Toolbar sprawl. User paralysis. Every screen looks like an admin panel. Primary action gets lost among equals.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
