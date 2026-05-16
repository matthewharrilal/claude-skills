---
name: public-api-minimalism
levels: [L4]
mechanisms:
  - Swift internal/private strictness
  - Protocol-driven configuration types
sources:
  - SwiftUI Toggle: isOn + label, nothing else
  - PencilKit: minimal public surface, rich internal complexity
related-properties: []
added: 2026-05-16
category: component-composition
---

# Public API minimalism

A component exposes the smallest surface that lets it be used. Internal mechanics — state, formatting, layout — are private. If a property doesn't help the caller express intent, it doesn't belong public.

## What it means

The public API is the contract. Every additional public property is a future-debt commitment. A component should ask: "what does the caller need to say to use me correctly?" — and expose exactly that, nothing more. Internal state, layout choices, and formatting decisions stay private.

## Exemplars

- **SwiftUI Toggle** — `isOn` + label, that's the entire API
- **PencilKit** — minimal public surface, rich internal complexity

## Mechanisms in UIKit/SwiftUI

- Swift internal/private strictness
- Protocol-driven configuration types

## What goes wrong without it

Components become un-refactorable. Every consumer depends on internals. Changes ripple unpredictably.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
