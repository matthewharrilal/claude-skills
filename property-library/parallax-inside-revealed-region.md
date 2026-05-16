---
name: parallax-inside-revealed-region
levels: [L5, L6]
mechanisms:
  - Reveal-region content uses transform proportional to swipe progress at a fraction (e.g., 0.5x)
  - Independent transform on icons within the swipe container
  - Use CATransform3D translate on the icon layer relative to the reveal layer
sources:
  - Apollo: parallax icons inside swipe-to-reveal
  - Mail swipe: action icons emerge from behind
  - iOS Notifications swipe: timestamps reveal with parallax
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Parallax Inside Revealed Region

As the user swipes to reveal hidden actions, the action icons translate at a different rate than the swipe — they "emerge" from behind rather than being dragged along. The reveal has depth.

## What the user perceives

Actions feel like they are stored "behind" the row, not painted onto its trailing edge. The swipe reveals layered space rather than flat content. The interface has thickness; the row is something with a behind.

## Exemplars / References

- **Apollo swipe actions** — explicit parallax on revealed action icons
- **Mail swipe** — actions emerge from behind the row
- **iOS Notifications swipe** — depth in the reveal
- **High-quality custom swipeable cells**

## Mechanisms

- Reveal-region content uses transform proportional to swipe progress at a fraction (e.g., 0.5x)
- Independent transform on icons within the swipe container
- Use CATransform3D translate on the icon layer relative to the reveal layer
- Clip the parent so the parallax content only shows in the reveal window

## What goes wrong without it

Actions feel "painted on" the swipe — they ride 1:1 with the finger and the reveal feels flat, with no depth. The row becomes a flat strip with stuff appearing on its edge rather than a layered surface.

## Levels this property spans

- **L5 (interactive feel):** the swipe gesture and its perceptual depth
- **L6 (animation engineering):** independent transforms with proportional driving

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
