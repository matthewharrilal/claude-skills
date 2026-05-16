---
name: pre-prompt-before-system-prompt
levels: [L9]
mechanisms:
  - custom pre-permission explanation screen
  - explicit opt-in CTA before invoking system authorization API
sources:
  - Cash App: location and notifications pre-prompts
  - Spark: notification pre-prompt with rationale
  - Spotify: pre-prompt for notifications and location
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Pre-prompt before system prompt

When asking for a sensitive permission, run a custom screen first that explains why. The system dialog only fires after the user has opted in conceptually.

## What it means

The iOS system permission dialog is terse, neutral, and offers no room for context. Apps that fire it cold burn their one shot. A pre-prompt is a custom screen the app controls: it explains the value of the permission, shows the trade, and lets the user opt in conceptually with a CTA. Only after the CTA is tapped does the system prompt appear — and at that point, the user is already aligned with granting it.

## Exemplars

- **Cash App** — location and notifications get custom pre-prompts before the system dialog
- **Spark** — notifications pre-prompt with explicit rationale
- **Spotify** — pre-prompts for both notifications and location

## Violators (apps that pay the price)

- **Apps that fire the system dialog cold** — get denied and lose the ability to re-ask
- **Apps that pre-prompt but with no rationale** — waste the screen on a "Please allow" with no value framing

## Why it matters at AAA quality

iOS gives one shot at the system prompt. Wasting it costs the feature forever — and that feature may be core. The pre-prompt is the single highest-leverage flow in any app that depends on sensitive permissions.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
