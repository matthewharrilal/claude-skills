---
name: frame-animated-rectangular-wipe-mask
levels: [L4, L6, L7]
mechanisms:
  - Solid CALayer mask (no gradient) with animated frame
  - frame.height or frame.width interpolated from 0 to full
sources:
  - 1Password: vault unlock where blurred locked view wipes top-down over 250ms
  - Apollo: swipe-action reveal where colored layer behind cell is masked to show only the exposed strip
  - Tweetbot: "load more" gap expand where new tweets reveal via vertical wipe
  - Robinhood: rolling-digit number animation with fixed-height mask window and translating digit strip
  - Apple Wallet: card stack fan-out where each background card is masked to a top strip ~30pt
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Frame-animated rectangular wipe mask

A solid (non-gradient) CALayer mask whose `frame` height or width animates from zero to full produces a hard-edged wipe revealing or concealing content directionally. The boundary stays crisp throughout — there is no falloff.

## What the user perceives

Content is revealed or hidden behind an invisible moving edge. The wipe direction reads cleanly — top-down for an unlock, side-on for a swipe-action color reveal, bottom-up for a gap expansion. Robinhood's rolling digits feel like a mechanical odometer window where a strip of numbers slides behind a fixed slot.

## How the mask works

A plain CALayer with an opaque background color is set as `layer.mask` on the host. Animating the mask's `frame` (typically height or width) from a starting size of zero to the full host bounds produces a hard-edged reveal. For odometer-style animations, the mask is a fixed-height window and the underlying digit strip is what translates — same primitive, inverted.

## Exemplars

- **1Password** — vault unlock wipes blurred locked view top-down over ~250ms
- **Apollo** — swipe-action reveal masks a colored layer behind the cell to show only the exposed strip
- **Tweetbot** — "load more" gap expand reveals new tweets via vertical wipe
- **Robinhood** — rolling-digit number animation with fixed-height mask window and spring-translating digit strip
- **Apple Wallet** — card stack fan-out where each background card is masked to a top strip

## Code sketch

```swift
let mask = CALayer()
mask.backgroundColor = UIColor.black.cgColor
mask.frame = CGRect(x: 0, y: 0, width: host.bounds.width, height: 0)
host.layer.mask = mask
let wipe = CABasicAnimation(keyPath: "bounds.size.height")
wipe.fromValue = 0
wipe.toValue = host.bounds.height
wipe.duration = 0.25
mask.bounds.size.height = host.bounds.height
mask.add(wipe, forKey: "wipe")
```

## When this matters / when alternatives won't work

A hard-edged directional reveal is not achievable with flat alpha — fading affects all pixels equally and has no boundary. Achieving the same effect with multiple animated subviews requires layered clipping and stops respecting the host's corner radius, breaking the illusion of a single continuous surface.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
