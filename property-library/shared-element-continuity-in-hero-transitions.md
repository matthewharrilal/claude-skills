---
name: shared-element-continuity-in-hero-transitions
levels: [L7]
mechanisms:
  - Snapshot or hand off the actual view to a transition coordinator
  - Animate its frame/transform across container views
  - Hide source and destination underneath until completion
sources:
  - Apple Music Now Playing: artwork-grows hero transition
  - Photos open: thumbnail-to-fullsize continuity
  - Apollo image expand: shared-element transition
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Shared-Element Continuity in Hero Transitions

Tapping an artwork thumbnail makes it grow continuously into the Now Playing hero — the same pixels travel; nothing crossfades. One element is shared by two screens and persists through the boundary between them.

## What the user perceives

The destination screen is the source screen, expanded. There is no scene cut. The user follows a single object through space; the navigation feels like physical movement rather than a switch between views. Context is preserved by visual identity, not by memory.

## Exemplars / References

- **Apple Music Now Playing** — canonical artwork-grows-into-hero
- **Photos open** — thumbnail expands seamlessly into the full image
- **Apollo image expand** — shared-element image transition
- **Calendar event tap** — event card grows into detail

## Mechanisms

- Snapshot or hand off the actual view to a transition coordinator
- Animate its frame/transform across container views
- Hide source and destination underneath until completion
- Coordinate via UIViewControllerAnimatedTransitioning or SwiftUI matchedGeometryEffect

## What goes wrong without it

A crossfade between two unrelated views — feels like a slide deck, not a continuous space. The user has to re-locate the object on the new screen, breaking the chain of attention. The relationship between source and destination becomes purely associative.

## Levels this property spans

- **L7 (transition orchestration):** the entire property is about a coordinated cross-screen transition

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
