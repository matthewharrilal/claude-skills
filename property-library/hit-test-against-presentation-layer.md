---
name: hit-test-against-presentation-layer
levels: [L5]
mechanisms:
  - Override hitTest(_:with:) to consult layer.presentation()
  - Pause animation on touch and resume from current state
  - Use presentation layer geometry for gesture region testing
sources:
  - WWDC 2018 Session 803 "Designing Fluid Interfaces": canonical reference for this technique
  - iOS app switcher: moving cards are tappable wherever they currently appear
  - High-quality custom transitions in Apple system apps
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Hit-Test Against Presentation Layer

A moving element is tappable wherever it currently appears on screen — not where it logically "is" in the model layer. Hit-testing consults the live presentation geometry.

## What the user perceives

If the user can see it, the user can touch it. Moving elements do not have hidden hit regions that drift away from their visual location. The system feels honest: every pixel of interaction matches every pixel of display.

## Exemplars / References

- **WWDC 2018 Session 803 (Designing Fluid Interfaces)** — Apple's canonical demonstration
- **iOS app switcher** — moving cards are tappable mid-flight
- **High-quality custom modal dismissals** — in-flight sheets remain interactive
- **Apple Maps detent card** — moving card remains touchable

## Mechanisms

- Override hitTest(_:with:) to consult layer.presentation()
- Pause animation on touch and resume from current state
- Use presentation layer geometry for gesture region testing
- For transformed layers, project touch through the presentation transform

## What goes wrong without it

Taps miss moving elements; the user feels the system is "fighting" them. The classic dead-zone bug: the eye sees the button at position B but the system still treats it as at position A. Users either learn to wait for animations or develop distrust in moving UI.

## Levels this property spans

- **L5 (interactive feel):** the entire property is a property of the touch surface — gesture and visual coherence

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
