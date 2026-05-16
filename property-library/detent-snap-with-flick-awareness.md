---
name: detent-snap-with-flick-awareness
levels: [L5, L7]
mechanisms:
  - Combine projected position (velocity * decay) with detent list
  - Pick detent in the projected direction if velocity exceeds threshold
  - Otherwise pick nearest detent to current position
sources:
  - Apple Maps card: canonical flick-aware detent
  - iOS Reminders sheet: detent flicks land in flick direction
  - UISheetPresentationController detents (iOS 15+)
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Detent Snap With Flick Awareness

A bottom sheet has 3 detents; flicking up always lands on the next one, not the nearest. A slow drag lands on the nearest. The snap decision reads gesture energy and direction, not just position.

## What the user perceives

Flicks have meaning. A quick wrist motion up always advances to the next detent, even if the finger barely moved. A tentative drag past the halfway mark lands on the nearest stop. The sheet understands the difference between "go further" and "show me what's there."

## Exemplars / References

- **Apple Maps card** — canonical flick-aware detent behavior
- **iOS Reminders sheet** — flicks advance detents reliably
- **UISheetPresentationController** — first-party detent system
- **Music playback queue sheet** — same pattern

## Mechanisms

- Combine projected position (velocity * decay) with detent list
- Pick detent in the projected direction if velocity exceeds threshold
- Otherwise pick nearest detent to current position
- Sort detents and choose by signed projected delta

## What goes wrong without it

"Nearest detent only" — fast flicks feel weak because they only snap to the nearest stop, not the obviously-intended one. The user flicks confidently and the sheet bounces back to where it was. The sheet feels lazy.

## Levels this property spans

- **L5 (interactive feel):** the gesture-end decision logic
- **L7 (transition orchestration):** transitions between detents are full multi-property animations

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
