---
name: context-menu-as-deep-press-grammar
levels: [L5, L4]
mechanisms:
  - UIContextMenuInteraction
  - UIContextMenuConfiguration with previewProvider
  - SwiftUI .contextMenu(menuItems:preview:)
sources:
  - messages: long-press on a bubble lifts it forward with reactions and menu
  - photos: image lifts and surrounding world dims
  - apollo: post preview lifts above the dimmed feed
  - apple-music: track preview and menu emerge on press
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Context menu as deep-press grammar

Long-press on anything substantive — a photo, a message, a link — and a floating tile lifts up with a preview and a menu. The surrounding world dims and blurs.

## What the user perceives

A press-and-hold lifts the touched element forward in space. The rest of the screen recedes, blurs, and dims; the lifted item floats with a soft shadow and a preview, and a list of actions attaches to it. The interaction reads as a physical pick-up of the thing you're acting on, with the world stepping back to make room.

## Exemplars

- **Messages** — long-press on a bubble lifts it forward; reactions and menu attach
- **Photos** — image lifts above a dimmed and blurred surround
- **Apollo** — post preview lifts cleanly above the dimmed feed
- **Apple Music** — track preview and menu emerge on press with the world receding

## Mechanisms

- UIContextMenuInteraction
- UIContextMenuConfiguration with previewProvider
- SwiftUI .contextMenu(menuItems:preview:)

## What goes wrong without it

Ports use right-click metaphors (web) or overflow menus (Android). The menu pops up as a flat list anchored to a corner, with no spatial relationship to the touched element — and there's no preview, no dimming, no sense that you've reached into the interface to pick up a specific thing.

## Why iOS-native (or domain-defining)

iOS-native has a spatial grammar — the item lifts toward you, the world recedes, the menu attaches to the lifted item. The interaction is a 3D pick-up gesture, not a 2D popup, and the system enforces this consistently across every place a context menu can appear.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
