---
name: errors-suggest-the-next-move
levels: [L9]
mechanisms:
  - actionable error states with retry / recovery affordance
  - error copy that names cause and next step
  - inline banners with CTA
sources:
  - Apple Mail: retry banners on failed sends
  - Stripe Dashboard: actionable error states with recovery actions
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Errors suggest the next move

An error message names what went wrong AND what to try. "Try again," "Check connection," "Sign in again" — never a dead end.

## What it means

Every error is a fork in the session: the user either has a path forward or doesn't. AAA apps treat error copy as a design surface, not a fallback string. The message names the cause in plain language and offers an explicit action — a button, a link, or a clear suggestion — that the user can take next. Raw HTTP codes, generic "Something went wrong" messages, and dead-end alerts all share the same failure: they end the session.

## Exemplars

- **Apple Mail** — retry banners after a failed send, with a one-tap retry CTA
- **Stripe Dashboard** — error states surface what to do next, scoped to the action that failed

## Violators (apps that pay the price)

- **Apps that surface raw HTTP codes** — 401, 500, "request failed"
- **Apps with generic "Something went wrong"** — no cause, no recovery, no path forward

## Why it matters at AAA quality

A dead-end error is a session-ender. A recoverable error is a moment of trust — the app proved it knows what happened and respects the user enough to offer a path forward.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
