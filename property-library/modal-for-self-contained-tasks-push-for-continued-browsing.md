---
name: modal-for-self-contained-tasks-push-for-continued-browsing
levels: [L10]
mechanisms:
  - UIViewController modalPresentationStyle (sheet/formSheet)
  - UINavigationController push for hierarchical navigation
  - SwiftUI sheet vs NavigationLink discipline
sources:
  - Apple Mail: composing is a modal sheet; reading a thread is a push
  - Things 3: Quick Entry is a sheet; project navigation is a push
  - Apple Calendar: event detail is push; new event is modal
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Modal for self-contained tasks, push for continued browsing

A modal/sheet says "you're doing one thing — finish or cancel." A push says "you're going deeper into the same world." Mixing them confuses the iOS back-gesture grammar.

## What it means

iOS has two distinct dismissal grammars: swipe-back (for pushes) and swipe-down-to-dismiss (for sheets). The gesture grammar only works if modal/push semantics are honored at the design level. Modals are bounded tasks with a clear commit/cancel outcome. Pushes are hierarchical movement through a continuous space. Confusing them breaks the user's reflex for getting back.

## Exemplars

- **Apple Mail** — composing a message is a modal sheet; reading a thread is a push
- **Things 3** — Quick Entry is a sheet (one task, commit or cancel); project navigation is a push (continuous browsing)

## Violators (apps that pay the price)

- **Many startup apps** — modal a profile screen that should be pushed, breaking the swipe-back gesture
- **Apps that push a composer** — leave the user unsure whether their draft is held

## Why it matters at AAA quality

The gesture grammar of iOS (swipe-back vs swipe-down-to-dismiss) only works if modal/push semantics are honored. Once broken, the user has to read every screen carefully to know how to leave it — which is the opposite of fluency.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
