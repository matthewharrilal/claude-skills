---
name: state-restoration-as-continuity
levels: [L12]
mechanisms:
  - NSUserActivity with becomeCurrent()
  - scene stateRestorationActivity
  - @SceneStorage in SwiftUI
sources:
  - reeder: relaunch lands on the same article and scroll position
  - apple-mail: drafts and read state restored exactly
  - notes: cursor position and selection preserved across launches
  - bear: editor state recovered including unsaved typing
related-properties: []
added: 2026-05-16
category: ios-identity
---

# State restoration as continuity

You kill the app, relaunch a day later, and find yourself on the exact article you were reading, scrolled to the same paragraph, with the same draft reply.

## What the user perceives

The app does not "open" — it resumes. Launching feels like returning to a paused session: the same screen, the same scroll position, the same in-progress edit, all preserved across the gap. There's no orientation, no re-navigation, no lost work. The app behaves as if it never closed.

## Exemplars

- **Reeder** — relaunch returns you to the same article at the same paragraph
- **Apple Mail** — draft replies and read state are preserved exactly
- **Notes** — cursor and selection state survive launches
- **Bear** — editor state including unsaved typing is recovered

## Mechanisms

- NSUserActivity with becomeCurrent()
- scene stateRestorationActivity
- @SceneStorage in SwiftUI

## What goes wrong without it

Web apps assume reload-to-home; Android often does too. Each launch starts from the root screen with no memory of where you were, and any in-progress work has to be saved explicitly or it's lost. The interface treats every session as fresh rather than continuous.

## Why iOS-native (or domain-defining)

iOS-native treats every app launch as a resumption, with restoration baked into scene lifecycle. The system provides NSUserActivity and @SceneStorage as first-class APIs precisely because restoration is expected of every well-built app, not an optional refinement.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
