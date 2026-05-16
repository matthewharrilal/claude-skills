---
name: one-responsibility-per-view
levels: [L3, L4]
mechanisms:
  - ViewModel / Store / Environment injection
  - SwiftUI @Observable models passed in
sources:
  - Linear iOS: presentation and coordination strictly separated
  - Apollo: reactive cells receive data, never fetch
related-properties: []
added: 2026-05-16
category: component-composition
---

# One responsibility per view

A view either presents OR coordinates, never both. The cell that shows a message doesn't fetch the message. Composition replaces inheritance for behavior reuse.

## What it means

Views render. Stores coordinate. ViewModels translate. A view that fetches its own data, formats it, and renders it is doing three jobs and can be tested for none. The boundary is strict: data arrives at the view's input, pixels exit through its output, and nothing else happens inside.

## Exemplars

- **Linear iOS** — presentation and coordination strictly separated
- **Apollo** — reactive cells receive data, never fetch

## Mechanisms in UIKit/SwiftUI

- ViewModel / Store / Environment injection
- SwiftUI @Observable models passed in

## What goes wrong without it

Cells become 800-line god-objects. Impossible to test, impossible to reuse. Every change risks breaking unrelated behavior.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
