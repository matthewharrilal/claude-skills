---
name: background-as-suspension
levels: [L12, L13]
mechanisms:
  - sceneDidEnterBackground snapshot capture
  - applicationDidEnterBackground checkpointing
  - BGTaskScheduler for deferred work
sources:
  - procreate: canvas state and brush stroke buffers preserved
  - halide: camera state and capture session resume cleanly
  - things-3: in-progress edits survive long backgrounding
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Background-as-suspension

Switch away mid-task, come back hours later, everything is exactly as you left it including in-progress animations and scroll inertia preserved as a snapshot.

## What the user perceives

Leaving the app is a pause, not a stop. You can switch away for hours, take a call, charge the phone overnight, and come back to find the app exactly as you left it — same screen, same selection, same scroll position, even the same in-progress edits. There is no warmup, no reload, no missing state.

## Exemplars

- **Procreate** — canvas, brush strokes, and tool state survive long backgrounding
- **Halide** — camera session and capture state resume cleanly on return
- **Things 3** — in-progress edits and selections survive hours away

## Mechanisms

- sceneDidEnterBackground snapshot capture
- applicationDidEnterBackground checkpointing
- BGTaskScheduler for deferred work

## What goes wrong without it

Web has no concept; Android relies on saved instance state that frequently fails. Switching away and returning often forces a cold start — the app reloads from scratch, the previous state is gone, and any in-progress work that wasn't explicitly saved is lost.

## Why iOS-native (or domain-defining)

iOS-native treats backgrounding as freeze-frame, not teardown. The system snapshots the running app and resumes it from memory whenever possible, and apps that participate in scene lifecycle correctly inherit this behavior with checkpointed restoration as a fallback.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
