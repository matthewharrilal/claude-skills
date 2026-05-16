---
name: dashed-line-marching-ants-mask
levels: [L4, L6]
mechanisms:
  - Stroked CAShapeLayer with lineDashPattern [6, 6]
  - CABasicAnimation on lineDashPhase (0 -> 12, repeating, infinite)
sources:
  - Procreate: freeform selection outlines during digital painting
  - Pixelmator Pro: lasso and selection outlines on iPad
  - Files: text selection outlines in certain contexts
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Dashed-line marching ants mask

A stroked CAShapeLayer with a dashed pattern animates its `lineDashPhase` continuously, producing the classic "marching ants" outline. Used as a mask cutting into an inverse dim, the selected region acquires a moving boundary that reads unmistakably as "active selection."

## What the user perceives

A selected region — freeform lasso, rectangle, polygon — is outlined by a dashed line whose segments crawl steadily around the perimeter. The motion never stops; the eye reads it as "this is selected right now" rather than "this used to be selected."

## How the mask works

A CAShapeLayer is stroked with `lineDashPattern: [6, 6]` (or similar) to render alternating drawn and empty segments along its path. A CABasicAnimation on the `lineDashPhase` keyPath continuously shifts the phase offset — typically from 0 to the sum of one dash and one gap (e.g., 12) — repeating forever. The path itself does not change; only the dash offset does, so the ants march along whatever geometry the selection has.

## Exemplars

- **Procreate** — freeform selection outlines during digital painting
- **Pixelmator Pro** — lasso and selection outlines on iPad
- **Files** — text selection outlines in certain contexts

## Code sketch

```swift
let ants = CAShapeLayer()
ants.path = selectionPath.cgPath
ants.strokeColor = UIColor.white.cgColor
ants.fillColor = nil
ants.lineWidth = 1
ants.lineDashPattern = [6, 6]
view.layer.addSublayer(ants)
let march = CABasicAnimation(keyPath: "lineDashPhase")
march.fromValue = 0
march.toValue = 12
march.duration = 0.5
march.repeatCount = .infinity
ants.add(march, forKey: "march")
```

## When this matters / when alternatives won't work

A static dashed line carries no sense of motion — the eye does not register the region as "actively selected" the way it does with marching ants. Animating the path itself or simulating motion with multiple subviews is far more expensive and does not preserve the precise spacing that makes the effect read.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
