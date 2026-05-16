---
name: linear-gradient-edge-fade-mask
levels: [L2, L4]
mechanisms:
  - CAGradientLayer used as layer.mask of scroll container
  - 4-stop alpha gradient [clear, black, black, clear] vertical or horizontal
sources:
  - Apple Music: Now Playing lyrics view top/bottom fade
  - Safari/News: toolbar content fades at edges as it scrolls past
  - Carrot Weather: hourly strip with leading and trailing falloffs
  - Bear: search highlights with edge fade
  - Fantastical: month-view event chips fade at cell boundaries
  - Spark Mail: sticky headers feather into list content
  - Notion: block shadow falloffs
  - Things 3: "Today" header edge fade
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Linear gradient edge fade mask

A static CAGradientLayer with opaque middle and transparent edges is assigned as the mask of a scroll container so content dissolves per-pixel at the boundary rather than terminating in a hard line.

## What the user perceives

Content slides under what looks like a soft falloff at the edge of a scroll region. Text and graphics seem to fade into the surrounding surface rather than being cut off at a crisp seam. The boundary feels physical, like content is receding behind glass.

## How the mask works

A CAGradientLayer is configured with a 4-stop alpha ramp ([clear, black, black, clear]) along the scroll axis and assigned to `scrollView.layer.mask`. The mask itself does not animate — it sits at fixed positions in the container's coordinate space. As content scrolls underneath, each pixel's visibility is determined by the alpha of the mask at that location, producing a smooth per-pixel falloff at the edges.

## Exemplars

- **Apple Music** — Now Playing lyrics view fades at top and bottom so off-screen lines dissolve
- **Carrot Weather** — hourly strip dissolves on both leading and trailing edges
- **Fantastical** — month-view event chips feather at cell boundaries instead of being clipped
- **Spark Mail** — sticky headers feather into list content below
- **Things 3** — "Today" header dissolves into scrolled content

## Code sketch

```swift
let fade = CAGradientLayer()
fade.frame = scrollView.bounds
fade.colors = [UIColor.clear.cgColor, UIColor.black.cgColor,
               UIColor.black.cgColor, UIColor.clear.cgColor]
fade.locations = [0.0, 0.08, 0.92, 1.0]
fade.startPoint = CGPoint(x: 0.5, y: 0)
fade.endPoint = CGPoint(x: 0.5, y: 1)
scrollView.layer.mask = fade
```

## When this matters / when alternatives won't work

Setting `view.alpha` fades the entire scroll view uniformly rather than just at edges. A PNG gradient overlay in a sibling view does not respect device width changes, dark mode, or scrolling translation — and produces a visible seam where the overlay ends.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
