---
name: accumulated-cgimage-paint-to-reveal-mask
levels: [L1, L4, L5]
mechanisms:
  - CALayer.contents set to a CGImage built up at runtime via UIGraphicsImageRenderer
  - Each touch event appends strokes to the bitmap; the image becomes the mask
sources:
  - Lightroom Mobile: brush mask painting where red overlay is masked by accumulated stroke image
  - Pixelmator: stroke previews where destination color/texture is masked by growing stroke geometry
  - Messages: "Invisible Ink" where dragging paints into a shape-layer mask on the noise layer
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Accumulated CGImage paint-to-reveal mask

The mask is a CGImage built up at runtime as the user paints. Each touch event appends to a bitmap context, and the resulting image is assigned as the mask layer's `contents`. The mask grows with the user's gesture.

## What the user perceives

Dragging a finger across the screen reveals (or hides) content along the brushed path — Lightroom's brush mask paints a red overlay where edits will apply, Messages' Invisible Ink clears noise particles to expose the hidden message. The interaction feels like literal painting: the mask is wherever the finger has been.

## How the mask works

A UIGraphicsImageRenderer (or CGContext) maintains a bitmap that starts blank. On each touch event, a stroke segment is drawn into the bitmap with appropriate brush parameters (radius, hardness, opacity). The resulting CGImage is assigned to a mask layer's `contents`, which then masks the destination content layer. Because the mask is bitmap, the brushstroke can be any arbitrary shape the user produces — no pre-baked geometry required.

## Exemplars

- **Lightroom Mobile** — brush mask painting where the red overlay is masked by the accumulated stroke image
- **Pixelmator** — stroke previews where the destination color or texture is masked by the growing stroke geometry
- **Messages** — Invisible Ink effect where dragging across the noise paints into a mask layer, clearing the noise where the finger has been

## Code sketch

```swift
private var maskImage: UIImage?
func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let p = touches.first?.location(in: self) else { return }
    let renderer = UIGraphicsImageRenderer(size: bounds.size)
    maskImage = renderer.image { ctx in
        maskImage?.draw(in: bounds)
        ctx.cgContext.setFillColor(UIColor.white.cgColor)
        ctx.cgContext.fillEllipse(in: CGRect(x: p.x - 20, y: p.y - 20,
                                             width: 40, height: 40))
    }
    maskLayer.contents = maskImage?.cgImage
}
overlayLayer.mask = maskLayer
```

## When this matters / when alternatives won't work

The brushstroke shape is only known at runtime — pre-baked path geometry cannot represent an arbitrary freeform stroke without sampling it into a vector path, which gets expensive for brushes with hardness falloff or texture. A bitmap mask handles all of these naturally because every pixel of the brush carries its own alpha.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
