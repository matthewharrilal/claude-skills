---
name: destructive-actions-require-a-deliberate-physical-motion
levels: [L9]
mechanisms:
  - UISwipeActionsConfiguration for swipe-to-delete
  - UIContextMenuInteraction for long-press destructive options
  - confirmation step with magnetic resistance
sources:
  - Apple Mail / Notes: swipe-to-delete with revealed action
  - Things 3: swipe with magnetic resistance before commit
  - Messages: long-press to delete a thread
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Destructive actions require a deliberate physical motion

Delete, trash, archive are never single taps from the surface. They require a swipe, a long-press, or a confirmation — a motion the muscle won't perform by accident.

## What it means

The cost of an accidental destructive action is asymmetric: one wrong tap can lose hours of work or precious content. AAA apps protect against that by requiring a motion the user cannot execute accidentally — a horizontal swipe that overcomes resistance, a long-press that holds for hundreds of milliseconds, a two-step confirm. The motion itself is the safety; it's slow enough that the user has time to realize what they're doing and reverse course.

## Exemplars

- **Apple Mail and Notes** — swipe-to-delete with a revealed red action
- **Things 3** — swipe with magnetic resistance before commit
- **Messages** — long-press to delete a thread; no surface-level destructive tap

## Violators (apps that pay the price)

- **Apps with a trash icon adjacent to a primary action** — fat-finger zone destroys content

## Why it matters at AAA quality

One accidental delete destroys trust permanently. Even if the data is recoverable, the user now mistrusts every tap. The cost of being too easy to delete is unbounded.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
