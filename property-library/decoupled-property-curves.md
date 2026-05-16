---
name: decoupled-property-curves
levels: [L6, L7]
mechanisms:
  - Multiple CAKeyframeAnimation / property animators sharing duration but with independent timing functions
  - Coordinated via shared clock with per-property easing
  - UIViewPropertyAnimator group with custom timing per property
sources:
  - Apple Music album expand: position springs, opacity eases, blur fades
  - iOS app open animation: multiple curves co-arriving
  - High-quality custom transitions in Apple system apps
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Decoupled Property Curves (Same Duration, Different Easing)

During a single transition, position uses a spring, opacity uses ease-out, and blur uses ease-in — they all land together but feel different per-property. Each property has its own curve while sharing the same arrival moment.

## What the user perceives

The transition has shape. Different aspects of the change feel right for their physical interpretation: position has weight and overshoot, opacity feels light and immediate, blur feels gradual. The animation has texture; it is not one motion with one feel applied to everything.

## Exemplars / References

- **Apple Music album expand** — position springs, opacity eases independently
- **iOS app open animation** — multiple property curves co-arriving
- **High-quality custom transitions** — explicit per-property timing
- **Wave demos** — independent curves with shared duration

## Mechanisms

- Multiple CAKeyframeAnimation / property animators sharing duration but with independent timing functions
- Coordinated via shared clock with per-property easing
- UIViewPropertyAnimator group with custom timing per property
- Drive each property off a shared progress 0..1 transformed through its own curve

## What goes wrong without it

Everything uses one easing curve — feels mechanically uniform; the transition lacks "shape." Opacity bouncing because it shares a spring with position is the canonical tell. The motion has no variety, no expressive grain.

## Levels this property spans

- **L6 (animation engineering):** the per-property curve assignment
- **L7 (transition orchestration):** the whole transition gains expressive variety

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
