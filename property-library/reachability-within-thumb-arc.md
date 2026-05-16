---
name: reachability-within-thumb-arc
levels: [L10]
mechanisms:
  - UIToolbar / bottom bar placement
  - floating action button positioning
  - tab bar as primary action anchor
sources:
  - Things 3: new-task button in bottom-right thumb arc
  - Halide: capture controls ring the shutter at bottom
  - Apollo: action bar lives at the bottom of the post
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Reachability within thumb arc

Primary controls live in the bottom third of the screen — toolbar, tab bar, floating action. The top is for context, not action.

## What it means

A right-handed user holding the phone one-handed has a comfortable thumb arc that covers roughly the bottom two-thirds of the display. Anything in the top corners requires a grip shift or a second hand. AAA apps place every action a user might tap repeatedly within that arc, and reserve the top for orienting information — page title, status, breadcrumb. The top is read; the bottom is touched.

## Exemplars

- **Things 3** — new-task button anchored bottom-right
- **Halide** — capture and modal controls ring the shutter at the bottom
- **Apollo** — action bar (vote, reply, save, share) sits at the bottom of the post

## Violators (apps that pay the price)

- **Settings-heavy apps** — critical CTAs sit in nav bars at the top
- **Old Twitter** — compose button was top-right for years before moving down

## Why it matters at AAA quality

Top-corner CTAs force a grip shift or a second hand — the single largest one-handed friction. On modern large phones, the top is increasingly out of reach even with a full hand-shift.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
