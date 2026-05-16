---
name: continuous-curvature-sheet-corner-mask
levels: [L2, L4, L7]
mechanisms:
  - CAShapeLayer with continuous-curvature rounded-rect path
  - Applied as mask of both sheet content and its blurred backdrop
sources:
  - System: modal sheets (.sheet, .formSheet) at multiple detents
  - Apple Maps: bottom card with multiple detents
  - Stocks: bottom card detail expansion
  - Apple Music: Now Playing presentation when pulling player down to dismiss
  - Notes: share sheets and contextual action sheets
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Continuous-curvature sheet corner mask

A CAShapeLayer whose path is a rounded rect with only top corners rounded (and, ideally, continuous-curvature/squircle math) is used as the mask of both a sheet's content and the dim or blur layer that sits behind it. As detents change, the mask path interpolates and both surfaces stay perfectly aligned.

## What the user perceives

A bottom sheet pulls up with continuously-curved top corners that feel sculpted rather than stamped. As the user drags between detents, the corner radius and frame both interpolate without any visible mismatch between the sheet, its shadow, and the dimmed surface behind it. The whole presentation feels like one physical object.

## How the mask works

A CAShapeLayer is given a UIBezierPath constructed with `byRoundingCorners: [.topLeft, .topRight]` (or, for continuous curvature, a hand-built superellipse path). The same shape layer — or one with identical geometry — is applied as the mask of both the sheet's content layer and the backdrop layer that needs to share the cutout. When the sheet's frame or corner radius changes between detents, animating the path keyPath on the mask keeps both surfaces' corners in lockstep, so they never separate.

## Exemplars

- **System modal sheets** — `.sheet` and `.formSheet` presentations
- **Apple Maps** — bottom card with multiple detents
- **Stocks** — bottom card detail expansion
- **Apple Music** — Now Playing when pulling the player down to dismiss
- **Notes** — share sheets and contextual action sheets

## Code sketch

```swift
let corners = CAShapeLayer()
corners.path = UIBezierPath(
    roundedRect: sheet.bounds,
    byRoundingCorners: [.topLeft, .topRight],
    cornerRadii: CGSize(width: 22, height: 22)
).cgPath
sheet.layer.mask = corners
// For continuous curvature, build a custom superellipse path with matching point count
// then animate via CABasicAnimation on path keyPath as detents change.
```

## When this matters / when alternatives won't work

Using `view.layer.cornerRadius` with `maskedCorners` does not keep the sheet's corners and the backdrop's corners perfectly aligned during a drag — there is often a visible white shadow leak between sheet and dim. Continuous curvature (squircle math) also is not available from `cornerRadius` alone, so the shapes look "stamped" instead of organically curved.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
