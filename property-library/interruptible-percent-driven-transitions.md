---
name: interruptible-percent-driven-transitions
levels: [L7]
mechanisms:
  - UIPercentDrivenInteractiveTransition.update(_:) keyed off gesture translation
  - finish() / cancel() on gesture end with velocity-based projection
  - Custom transition coordinator that supports mid-flight reversal
sources:
  - UINavigationController swipe-back: canonical interactive dismiss
  - iOS modal sheet dismiss: percent-driven interruption
  - High-quality custom dismissals in Apple system apps
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Interruptible Percent-Driven Transitions

Edge-pan dismiss can be reversed mid-pan; dismiss progress smoothly responds to back-and-forth without committing prematurely. The transition is a continuous variable, not a binary state.

## What the user perceives

The user can peek. A nervous start to a back-swipe can be aborted halfway. There is no "I've gone too far now, it's committing" moment until the gesture actually ends. The transition listens to the user the entire time.

## Exemplars / References

- **UINavigationController swipe-back** — canonical interactive dismiss
- **iOS modal sheet dismiss** — fully interruptible
- **Photos zoom-out gesture** — can be reversed mid-gesture
- **Apple Maps card** — interruptible detent transitions

## Mechanisms

- UIPercentDrivenInteractiveTransition.update(_:) keyed off gesture translation
- finish() / cancel() on gesture end with velocity-based projection
- Custom transition coordinator that supports mid-flight reversal
- UIViewPropertyAnimator with fractionComplete as the truth source

## What goes wrong without it

Transitions feel binary — either committed or not, with no ability to "peek" and abort. The system enforces commitments the user did not intend; tentative gestures become irreversible navigations. The user learns not to peek.

## Levels this property spans

- **L7 (transition orchestration):** the entire property is about transition coordination

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
