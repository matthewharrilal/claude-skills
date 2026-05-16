---
name: drag-and-drop-as-system-citizen
levels: [L5, L11]
mechanisms:
  - UIDragInteraction and UIDropInteraction
  - NSItemProvider for typed payloads
  - SwiftUI .draggable() and .dropDestination()
sources:
  - photos: drag a photo into Mail or Notes via the dock
  - files: drag documents into any drop target
  - notes: receive drops from other apps as a system citizen
  - safari: drag URLs and images as typed items
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Drag-and-drop as system citizen

Long-press a photo, it lifts under your finger, you can switch apps via the dock, drop it into another app. The OS, not your app, is the drag host.

## What the user perceives

Drag is not bounded by the app. Once an item lifts, you can carry it anywhere — switch apps via the dock, open another window in Split View, drop it into a completely different context — and the drag session survives the journey. Items have types, and drop targets accept or reject based on those types. The whole OS participates in the gesture.

## Exemplars

- **Photos** — drag a photo into Mail or Notes via the dock while holding
- **Files** — drag documents to any compatible drop target in any app
- **Notes** — accept drops from other apps as a system-level participant
- **Safari** — URLs, images, and selections drag as typed items system-wide

## Mechanisms

- UIDragInteraction and UIDropInteraction
- NSItemProvider for typed payloads
- SwiftUI .draggable() and .dropDestination()

## What goes wrong without it

Ports implement in-app reorder via custom gesture handlers. Drag works only inside one screen — it can't cross apps, can't cross windows, and offers no type information about what's being dragged. The user has to fall back to copy/paste or share sheets for cross-app movement.

## Why iOS-native (or domain-defining)

iOS-native uses the system drag service so the same gesture works across apps. The drag is mediated by the OS, not the app, which is what allows it to survive app switches, dock interactions, and Split View transitions.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
