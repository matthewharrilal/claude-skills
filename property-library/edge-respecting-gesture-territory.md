---
name: edge-respecting-gesture-territory
levels: [L5, L11]
mechanisms:
  - honoring interactivePopGestureRecognizer on UINavigationController
  - UIScreenEdgePanGestureRecognizer for app-specific edge gestures
  - preferredScreenEdgesDeferringSystemGestures used minimally
sources:
  - apple-first-party: every app honors the leftmost edge as back
  - bear: edge-pan-back works alongside in-app gestures
  - things-3: navigation never fights the home indicator
  - reeder: pop gesture survives inside complex scroll surfaces
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Edge-respecting gesture territory

Swiping from the very left edge goes back. Swiping from the bottom edge goes home. The app never fights the system for these edges.

## What the user perceives

The screen has invisible margins that belong to the OS. No matter what an app does in its interior, the leftmost sliver always pops back, and the bottom edge always swipes home. You can rely on these gestures absolutely, and they coexist peacefully with everything the app implements inside its content area.

## Exemplars

- **All Apple first-party** — uniform edge gesture behavior across the system
- **Bear** — in-app gestures defer to the system edges
- **Things 3** — drag gestures stay inside the content area, leaving edges clean
- **Reeder** — pop gesture survives even on complex scrolling article views

## Mechanisms

- honoring interactivePopGestureRecognizer on UINavigationController
- UIScreenEdgePanGestureRecognizer for app-specific edge gestures
- preferredScreenEdgesDeferringSystemGestures used minimally

## What goes wrong without it

Ports often capture full-width pans for their own navigation and break edge-back. The user reaches for the system gesture, finds it intercepted, and loses trust in the navigation contract entirely. The whole-OS feeling of "left edge always means back" collapses.

## Why iOS-native (or domain-defining)

iOS-native treats the leftmost 20pt as sacred system territory and routes its own gestures through UIScreenEdgePanGestureRecognizer or inset margins. The discipline is architectural: app-level gesture recognizers explicitly fail in favor of the system pop, rather than competing with it.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
