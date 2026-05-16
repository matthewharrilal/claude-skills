---
name: latency-as-feedback-under-finger
levels: [L5, L6]
mechanisms:
  - UIButton.Configuration with configurationUpdateHandler
  - highlighted state animations on UIControl
  - SwiftUI .buttonStyle() with custom PrimitiveButtonStyle
sources:
  - apple-music: cover art darkens the instant a press begins
  - linear-ios: row press states confirm contact before commit
  - apollo: post tap shows a pre-commit highlight
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Latency-as-feedback under finger

The cell darkens before you've finished pressing. The button scales down 2% the instant your finger lands. The system is listening, not waiting.

## What the user perceives

Touch is acknowledged immediately, before commit. The moment a finger lands, the target subtly changes — a dim, a shrink, a tint — and you know the system has registered the contact even though nothing has actually fired yet. The interface feels attentive rather than reactive.

## Exemplars

- **Apple Music** — cover art darkens at touch-down before any navigation occurs
- **Linear iOS** — row press states appear immediately on contact
- **Apollo** — post tap produces a pre-commit highlight that confirms the target

## Mechanisms

- UIButton.Configuration with configurationUpdateHandler
- highlighted state animations on UIControl
- SwiftUI .buttonStyle() with custom PrimitiveButtonStyle

## What goes wrong without it

Ports apply hover/active states from web (no concept of pre-commit press) or fire on touchUp only. The result is a dead interval between touch and action — the finger lands, nothing happens, and then the screen finally responds when you lift. The interface feels unresponsive even when it isn't.

## Why iOS-native (or domain-defining)

iOS-native acknowledges the down event with a visual change before any commit. The distinction between touch-down and touch-up is treated as semantically significant — touch-down is a "you are aimed at this" signal, separate from the touch-up that commits the action.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
