---
name: permissions-asked-at-the-moment-of-need
levels: [L9]
mechanisms:
  - AVCaptureDevice authorization triggered by camera tap
  - UNUserNotificationCenter request triggered by reminder action
  - CLLocationManager request scoped to feature entry
sources:
  - Apple's first-party apps: camera permission only when camera opens
  - Halide: permission flows are scoped to the feature
  - Things 3: notifications requested only when first reminder is set
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Permissions asked at the moment of need

Don't bundle permission prompts on launch. Ask for camera when the user taps camera, for notifications when they enable a reminder.

## What it means

iOS permission prompts are a one-shot resource: a denial closes the door, and re-asking requires sending the user to system Settings. The way to maximize the grant rate is to ask only when the user has explicitly invoked the feature that needs the permission, so the prompt arrives with full context. Bundling prompts on launch — before the user knows what they're authorizing — produces denials and locks features out permanently.

## Exemplars

- **Apple's own apps** — camera, location, notifications are all requested at first use
- **Halide** — every permission scoped to its feature entry point
- **Things 3** — notification permission only fires when the user sets their first reminder

## Violators (apps that pay the price)

- **Apps that gate launch on a permission stack** — Instagram historically, many banking apps
- **Apps that ask for notifications before the user has any reason to be notified**

## Why it matters at AAA quality

Front-loaded permissions get denied because the user has no context for what they're authorizing. Just-in-time permissions get granted, and the feature stays usable for the lifetime of the install.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
