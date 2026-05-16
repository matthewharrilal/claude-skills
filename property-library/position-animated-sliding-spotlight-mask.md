---
name: position-animated-sliding-spotlight-mask
levels: [L4, L8]
mechanisms:
  - CAShapeLayer mask with even-odd cutout path
  - Path animated via CABasicAnimation to slide cutout between target positions
sources:
  - Linear: command palette arrow-key navigation where bright cutout slides while results stay still
  - System UI: quick-settings tile selection focus within Control Center
  - Apple Maps: search-suggestion focus during keyboard navigation
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Position-animated sliding spotlight mask

The same even-odd cutout mask used for inverse spotlights, but with the cutout's path animated to slide between discrete positions. Highlighted targets remain stationary while a single focus indicator translates between them.

## What the user perceives

A bright "window" of attention glides from one row, tile, or suggestion to another. The list contents stay anchored — what moves is the highlight itself. The result reads as "one focus point, moving" rather than "many rows individually changing state."

## How the mask works

A full-screen dim layer carries a CAShapeLayer mask with `fillRule = .evenOdd` and a compound path (outer bounds + inner cutout). To move the spotlight, a CABasicAnimation on the `path` keyPath interpolates the inner cutout's position while the outer bounds remain fixed. As long as the inner shape's point count is preserved, the cutout slides continuously between target frames.

## Exemplars

- **Linear** — command palette arrow-up/down where the bright cutout slides while results stay still
- **System UI Control Center** — quick-settings tile selection focus
- **Apple Maps** — search-suggestion focus during external keyboard navigation

## Code sketch

```swift
func cutoutPath(for rect: CGRect) -> CGPath {
    let p = UIBezierPath(rect: container.bounds)
    p.append(UIBezierPath(roundedRect: rect, cornerRadius: 8))
    return p.cgPath
}
spotlightMask.fillRule = .evenOdd
spotlightMask.path = cutoutPath(for: currentRowFrame)
let slide = CABasicAnimation(keyPath: "path")
slide.fromValue = spotlightMask.path
slide.toValue = cutoutPath(for: nextRowFrame)
slide.duration = 0.12
spotlightMask.path = cutoutPath(for: nextRowFrame)
spotlightMask.add(slide, forKey: "slide")
```

## When this matters / when alternatives won't work

Toggling a tint or background on a "selected" property per row reads as many independent state changes happening simultaneously — the eye loses the sense of a single moving focus. A sliding spotlight mask gives one continuous indicator the entire navigation can track.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
