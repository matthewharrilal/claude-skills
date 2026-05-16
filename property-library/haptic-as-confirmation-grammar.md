---
name: haptic-as-confirmation-grammar
levels: [L0, L5]
mechanisms:
  - UIImpactFeedbackGenerator for state changes
  - UISelectionFeedbackGenerator for traversal
  - UINotificationFeedbackGenerator for outcomes
  - .sensoryFeedback(.success, trigger:) in SwiftUI
sources:
  - things-3: micro-tick when checking off a task
  - apple-wallet: confirmation pulse during Apple Pay
  - overcast: chapter-skip haptic during playback
  - cash-app: send confirmation through the case
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Haptic as confirmation grammar

A toggle flicks and you feel a tiny click in your thumb. Selecting from a wheel ticks at each detent. Successful actions chime through the case, not the speaker.

## What the user perceives

The phone speaks back through touch. Different actions produce different feels — a sharp tick for a discrete selection, a soft thump for an impact, a coordinated pulse for a successful confirmation. You begin to learn the vocabulary unconsciously, and absence of the expected haptic becomes itself a signal.

## Exemplars

- **Things 3** — distinct micro-tick at the moment a task is checked off
- **Apple Wallet** — Apple Pay produces a confirmation pulse coordinated with the sound
- **Overcast** — chapter skip emits a directional haptic separate from playback
- **Cash App** — send confirmation chimes through the case as the action completes

## Mechanisms

- UIImpactFeedbackGenerator for state changes
- UISelectionFeedbackGenerator for traversal
- UINotificationFeedbackGenerator for outcomes
- .sensoryFeedback(.success, trigger:) in SwiftUI

## What goes wrong without it

Ports use haptics decoratively or not at all — every action either buzzes the same way or stays silent. The vocabulary collapses: there's no distinction between "I traversed a list" and "I committed a transaction," and the interface loses its tactile layer of feedback entirely.

## Why iOS-native (or domain-defining)

Android haptics are coarser and used for notification, not micro-confirmation. iOS-native uses them as a grammar — impact for state change, selection for traversal, notification for outcome. The three feedback generators are deliberately distinct classes because each one corresponds to a different semantic event.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
