---
name: micro-scale-press-feedback
levels: [L4, L5]
mechanisms:
  - UIButton.Configuration automatic press behavior
  - UIView.animate on touchDown with transform: .init(scaleX: 0.97, y: 0.97)
sources:
  - Apollo: every action has micro-scale acknowledgment
  - Apple Music: play button responds on touch-down
  - Cash App: primary CTA dips on press
related-properties: []
added: 2026-05-16
category: component-composition
---

# Micro-scale press feedback

Tappable elements respond to touch with a tiny scale (~0.97) or opacity dip (~0.85). Visible, not theatrical. The interaction is acknowledged before the action completes.

## What it means

A press is acknowledged the instant the finger lands, not when the action completes. This decouples perceived responsiveness from actual work. The scale or opacity dip is subtle enough not to feel like animation, large enough to register as "received."

## Exemplars

- **Apollo** — every action has micro-scale acknowledgment
- **Apple Music** — play button responds on touch-down
- **Cash App** — primary CTA dips on press

## Mechanisms in UIKit/SwiftUI

- UIButton.Configuration automatic
- UIView.animate on touchDown with transform: .init(scaleX: 0.97, y: 0.97)

## What goes wrong without it

Taps feel laggy or unregistered. The user re-taps and the action double-fires. Trust in the UI erodes.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
