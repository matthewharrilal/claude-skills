---
name: undo-is-the-confirmation
levels: [L9]
mechanisms:
  - toast / banner with Undo CTA
  - UIResponder motionEnded shake-to-undo
  - reversible action queue
sources:
  - Apple Mail: delete then "Undo Trash" toast
  - Things 3: shake to undo
  - Apollo: toast-based undo for destructive actions
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Undo is the confirmation

Instead of "Are you sure?" dialogs, perform the action and offer undo. The user gets speed; the action remains reversible.

## What it means

Confirmation dialogs train users to dismiss them — every "Are you sure?" gets a reflexive "Yes" after the third repetition, at which point the dialog is no longer a safety net but a tax. Undo inverts the contract: the action happens immediately, the user keeps their momentum, and a short-lived toast offers a one-tap reversal. The user is protected by the option to undo, not by being asked to confirm something they already decided to do.

## Exemplars

- **Apple Mail** — delete shows an "Undo Trash" toast for a few seconds
- **Things 3** — shake-to-undo as a system-wide affordance
- **Apollo** — toast-based undo for destructive actions

## Violators (apps that pay the price)

- **Apps with confirmation modals on every delete** — train dismissal reflex, defeat the purpose

## Why it matters at AAA quality

Confirmation dialogs train users to dismiss them. Undo respects the user's time AND protects them — the rare reversal pays for the common no-friction case.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
