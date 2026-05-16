---
name: haptic-visual-pairing
levels: [L0, L5]
mechanisms:
  - UIImpactFeedbackGenerator(style:)
  - UINotificationFeedbackGenerator
  - SwiftUI .sensoryFeedback()
sources:
  - Apple Wallet: card-add pairs haptic with visual settle
  - Things 3: task-complete pairs check-flip with haptic
  - iMessage: send-with-effect synchronizes haptic and motion
  - Camera: shutter haptic with shutter flash
related-properties: []
added: 2026-05-16
category: component-composition
---

# Haptic-visual pairing

Significant state changes pair a haptic with a visual transition. Toggle flips: light impact. Destructive confirm: medium. Success: notification-success. Never haptic without visual or vice versa.

## What it means

Haptics confirm what visuals already showed; visuals show what haptics already felt. The two channels reinforce one event. Haptics in isolation feel gimmicky; visuals in isolation feel sterile. Together they create a sense of physicality and certainty.

## Exemplars

- **Apple Wallet** — card-add: haptic plus visual settle
- **Things 3** — task complete: check-flip plus haptic
- **iMessage** — send-with-effect: haptic synced to motion
- **Camera** — shutter haptic timed with shutter flash

## Mechanisms in UIKit/SwiftUI

- UIImpactFeedbackGenerator(style:)
- UINotificationFeedbackGenerator
- SwiftUI .sensoryFeedback()

## What goes wrong without it

Either feels gimmicky (haptic alone, with no visual to explain it) or sterile (visual alone, lacking physical confirmation). Paired, they assert the event.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
