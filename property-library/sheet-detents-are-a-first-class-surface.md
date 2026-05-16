---
name: sheet-detents-are-a-first-class-surface
levels: [L10]
mechanisms:
  - UISheetPresentationController detents (medium, large, custom)
  - SwiftUI presentationDetents
sources:
  - Apple Maps: place card medium → large detents
  - Apple Find My: device detail sheet with detents
  - Apple Wallet: transaction sheets with progressive detents
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Sheet detents are a first-class surface

Medium and large detents on UISheetPresentationController are a navigation tier, not a polish detail. They let detail coexist with context.

## What it means

A detented sheet is a third navigation mode alongside push and full modal. At medium detent, the user sees both detail and the underlying context (the map, the list, the home tab). At large, the user is committed. The transition between detents is itself a way of saying "I want more detail" or "I want context back" — an interaction grammar that has no analog in pure push or pure modal navigation.

## Exemplars

- **Apple Maps** — the place card glides between detents while the map stays anchored
- **Apple Find My** — device sheet preserves the map below at medium detent
- **Apple Wallet** — transaction sheets reveal detail without losing the card view

## Violators (apps that pay the price)

- **Pre-detent apps** — pushed full screens for what should have been a peek, losing the user's place

## Why it matters at AAA quality

Without detents, every detail demands a full-screen commitment, breaking the user's sense of place. Detents preserve context, which is the foundation of map- and list-driven apps.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
