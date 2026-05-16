---
name: composer-is-a-modal-always
levels: [L9]
mechanisms:
  - UIViewController modal presentation for composition flows
  - SwiftUI sheet for editor surfaces
  - explicit Cancel / Send (or Save) bar buttons
sources:
  - Apple Mail: compose is a modal sheet
  - Tweetbot / Ivory: composer modal
  - Drafts: capture is always a modal
  - Things 3: Quick Entry is a modal sheet
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Composer is a modal, always

Writing or creating happens in a sheet that owns the screen. The user isn't navigating — they're committing.

## What it means

Composition is a bounded task with two outcomes: commit (send, save, post) or cancel. A modal frame encodes that contract visually and gesturally — the sheet sits on top of the rest of the app, the Cancel and Send buttons are in canonical positions, and the swipe-down-to-dismiss gesture maps to "cancel with confirmation." Composing in-place inside a feed blurs the read/write boundary and loses the contract that the user's draft is held safely.

## Exemplars

- **Apple Mail** — compose is always a modal sheet with canonical Cancel / Send
- **Tweetbot / Ivory** — composer is a modal that owns the screen
- **Drafts** — capture is always modal, even when launched from a share extension
- **Things 3 Quick Entry** — modal sheet anchored over whatever the user was doing

## Violators (apps that pay the price)

- **Apps that compose in-place inside a feed** — blur read/write modes; the user fears losing the draft on navigation

## Why it matters at AAA quality

The modal frame is a contract: "your work is held; cancel or send." Without it, users fear losing drafts and develop defensive habits like writing in Notes first, then pasting in.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
