---
name: drag-handle-as-discoverability-cue
levels: [L4, L5]
mechanisms:
  - UISheetPresentationController automatic grabber
  - Custom 36x5pt rounded indicator view at sheet top
sources:
  - Apple Maps: bottom sheet pill indicator
  - Music: queue reorder handles
  - Every iOS 15+ modal sheet: grabber at top
related-properties: []
added: 2026-05-16
category: component-composition
---

# Drag-handle as discoverability cue

Bottom sheets, reorderable lists, and resizable panels expose a small grab indicator (the "pill"). It's not decoration — it's the only signal that the surface is interactive.

## What it means

The drag pill is a 36x5pt rounded indicator that says "this is grabbable." Without it, the user has no way to know the sheet can be dragged. The pill is the discovery affordance — a small but mandatory bit of communication for any draggable surface.

## Exemplars

- **Apple Maps** — bottom sheet pill is the only grab cue
- **Music** — queue reorder handles signal draggability
- **iOS 15+ modal sheets** — grabber visible at top

## Mechanisms in UIKit/SwiftUI

- UISheetPresentationController automatic grabber
- Custom 36x5pt rounded view at top

## What goes wrong without it

Users don't discover the sheet is draggable. The capability is invisible. A core interaction goes unused.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
