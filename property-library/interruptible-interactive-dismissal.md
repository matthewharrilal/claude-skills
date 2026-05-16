---
name: interruptible-interactive-dismissal
levels: [L5, L6, L7]
mechanisms:
  - UIPercentDrivenInteractiveTransition
  - SwiftUI matchedGeometryEffect with gesture-driven progress
  - custom UIViewControllerInteractiveTransitioning conformance
sources:
  - apple-photos: drag-to-dismiss reverses cleanly at any point
  - instagram: story dismiss can be aborted mid-drag
  - apollo: image viewer dismiss is fully reversible
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Interruptible interactive dismissal

You start dragging a photo down to dismiss, change your mind, slide it back up — it returns home with no animation discontinuity. You feel like you're holding the photo, not triggering a state machine.

## What the user perceives

Dismissal is a continuous gesture, not a fired event. As you drag, the screen tracks your finger position frame-perfectly; if you reverse direction, the screen reverses with you. You can dither at any point — start, stop, partially commit, undo — and the motion is always under your fingertip rather than playing out a pre-recorded animation.

## Exemplars

- **Apple Photos** — interactive dismiss reverses with no discontinuity if you change direction
- **Instagram** — story dismiss can be aborted mid-drag and snaps back home
- **Apollo** — image viewer dismissal is fully reversible up to release

## Mechanisms

- UIPercentDrivenInteractiveTransition
- SwiftUI matchedGeometryEffect with gesture-driven progress
- custom UIViewControllerInteractiveTransitioning conformance

## What goes wrong without it

Ports implement dismiss as discrete states (idle to animating-out). Once the threshold trips, the animation plays through to completion regardless of your finger, and reversing direction either does nothing or fights the in-flight tween. The illusion of holding the element breaks.

## Why iOS-native (or domain-defining)

iOS-native treats dismissal as a continuous percentage controlled by the finger, fully reversible at any point. The transition is parameterized by progress, not by elapsed time — the gesture drives the animation directly rather than triggering it.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
