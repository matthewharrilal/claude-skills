---
name: optimistic-ui-for-user-initiated-actions
levels: [L8]
mechanisms:
  - local state mutation on tap, network reconciliation in background
  - rollback animation on rare failure
  - no blocking spinner on user-initiated actions
sources:
  - Apple Messages: blue bubble appears instantly on send
  - Tweetbot / Ivory: like animates locally before server confirms
  - Things 3: check-off is instant
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Optimistic UI for user-initiated actions

When the user taps "send," "like," "save" — the UI commits immediately. Rollback on failure (rare); never block on the network.

## What it means

A user-initiated tap is a moment where the user's intent is unambiguous: they want the action to happen. AAA apps honor that intent by reflecting it in the UI immediately and reconciling with the server in the background. The rare failure case is handled by a rollback (revert the bubble, un-like the post), but the common case — where the action succeeds — feels instant. Blocking on the network punishes the ninety-nine percent of cases that succeed in order to protect the one percent that fail.

## Exemplars

- **Apple Messages** — the blue bubble appears instantly; delivery state is decorated over time
- **Tweetbot and Ivory** — like animates locally before the server confirms
- **Things 3** — check-off is instant and reversible

## Violators (apps that pay the price)

- **Apps that show a spinner on every tap** — train users that the app is "thinking" and feel slow even on fast networks

## Why it matters at AAA quality

Latency on user-initiated actions is the single biggest "feels cheap" signal. The user's perception of an app's quality is set by how the app responds in the first hundred milliseconds after a tap.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
