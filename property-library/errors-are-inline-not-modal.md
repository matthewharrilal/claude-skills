---
name: errors-are-inline-not-modal
levels: [L8]
mechanisms:
  - inline field validation messages
  - banner-style error surfaces scoped to the affected content
  - UIAlertController reserved for blocking states only
sources:
  - Apple Mail: red banner for failed send
  - Stripe Dashboard: field-level validation messages
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Errors are inline, not modal

Errors appear where the error happened — under the field, as a banner above the affected content. Modals are for blocking states only.

## What it means

An error is a piece of information that belongs to a specific element of the screen. Inline errors point at the cause and keep the user inside the work; modal errors interrupt the flow and force the user to dismiss before continuing. AAA apps reserve modal alerts for genuinely blocking states (account locked, must update, irreversible warning) and treat everything else — validation failures, network hiccups, transient failures — as inline information attached to the affected component.

## Exemplars

- **Apple Mail** — a red banner appears for a failed send, scoped to the affected message
- **Stripe Dashboard** — field-level validation under the input, never a modal

## Violators (apps that pay the price)

- **Apps that interrupt with full-screen alerts for trivial errors** — break flow and train alert-fatigue dismissal

## Why it matters at AAA quality

Modal errors break flow. Inline errors keep the user in the work — they treat the error as information about a specific element, not an interruption requiring acknowledgment.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
