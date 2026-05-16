---
name: gradient-mask-dim-legibility-overlay
levels: [L2, L4, L8]
mechanisms:
  - Black dim CALayer with CAGradientLayer mask (clear -> black vertically)
  - Mask shape concentrates dim near UI controls and falls off into clear content
sources:
  - TikTok: caption legibility dim from rgba(0,0,0,0) at top to rgba(0,0,0,0.55) at safe-area edge, ~140pt tall
  - Instagram Reels: same trick on top ~80pt for status bar and bottom ~140pt for captions
  - Snapchat: camera preview UI fade-to-dark at top under close button and bottom under capture controls
  - Airbnb: listing detail hero photo bottom fades into white content sheet over ~60pt
  - Apple Music: Now Playing album art feathers via gradient mask into background color
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Gradient mask dim legibility overlay

A dim CALayer that sits over content (video, photo) is itself masked by a vertical alpha gradient — opaque where UI sits, transparent where content should stay clean. The dim appears only where it is needed and falls off smoothly into the surrounding image.

## What the user perceives

UI controls and captions remain readable against bright or busy underlying imagery without the whole image being darkened. Looking at the result, the eye sees full-strength imagery transitioning into a softly darkened band where text or buttons live — there is no visible edge of the dim, just a gradient of attention.

## How the mask works

A black CALayer covers the region where controls and captions sit. Its `mask` is a CAGradientLayer with alpha going from clear (where content should be untouched) to opaque (where the dim is needed). The dim itself is uniform black; what shapes it is the mask. Because the gradient is per-pixel, the falloff is smooth — the dim layer has no visible edge regardless of underlying content.

## Exemplars

- **TikTok** — bottom 140pt dim under captions, vertical gradient from clear to ~55% black
- **Instagram Reels** — top ~80pt dim under status bar and bottom ~140pt dim under captions
- **Snapchat** — camera preview dim fades to dark at top under close button and bottom under capture controls
- **Airbnb** — listing detail hero photo bottom edge dims into white content sheet over ~60pt with no seam
- **Apple Music** — Now Playing album art feathers via gradient mask into background color

## Code sketch

```swift
let dim = CALayer()
dim.frame = CGRect(x: 0, y: bounds.height - 140, width: bounds.width, height: 140)
dim.backgroundColor = UIColor.black.cgColor
let gradient = CAGradientLayer()
gradient.frame = dim.bounds
gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.55).cgColor]
gradient.startPoint = CGPoint(x: 0.5, y: 0)
gradient.endPoint = CGPoint(x: 0.5, y: 1)
dim.mask = gradient
view.layer.addSublayer(dim)
```

## When this matters / when alternatives won't work

A flat dim layer dulls the whole bottom of the photo or video uniformly, eating contrast that should remain. Animating the dim layer's own opacity changes brightness everywhere rather than concentrating darkness where text needs to sit. Only a gradient-masked dim concentrates attention where the UI is while leaving the rest of the image untouched.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
