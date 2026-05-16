---
name: depth-matte-subject-aware-mask
levels: [L1, L4, L11]
mechanisms:
  - CALayer with contents = depth or segmentation matte CGImage updated per frame
  - Matte layer applied as mask of background blur or effect layer
sources:
  - Camera: Portrait mode preview where depth matte masks the blurred background
  - Photos: iOS 16+ subject lift where glow follows segmentation matte outline before lifting
  - FaceTime: Portrait mode applied to live video using the same primitive
  - iOS 17 Stand-By: subject portraits on the lock screen
related-properties: []
added: 2026-05-16
category: mask-mechanism
---

# Depth-matte subject-aware mask

The mask is a CGImage texture derived from sensor data or ML output — a depth map, segmentation matte, or matting estimate. Applied as the mask of a blur or color effect layer, it confines the effect to background pixels while leaving the foreground subject sharp.

## What the user perceives

A photo or live preview shows the subject in crisp focus while the background blurs softly behind them. The boundary between subject and blur follows the actual silhouette — hair, ear edges, glasses — not a circular or rectangular approximation. The effect tracks the subject in real time as the camera or person moves.

## How the mask works

Per frame, the system produces a matte image where pixel values encode "this is subject" vs "this is background" (often from a TrueDepth depth map, dual-camera disparity, or an on-device segmentation model). That matte image is assigned to a CALayer's `contents` and the layer is set as the `mask` of a blurred copy of the scene. Wherever the matte is opaque, the blurred layer shows; wherever it is clear, the sharp foreground shows through. Updating the matte each frame keeps the effect tracking with the subject.

## Exemplars

- **Camera** — Portrait mode preview where the depth matte continuously masks the blurred background preview
- **Photos** — iOS 16+ subject lift where glow follows the outline before lifting the subject onto another surface
- **FaceTime** — Portrait mode on live video uses the same matte-as-mask primitive
- **iOS 17 Stand-By Mode** — subject portraits on the lock screen with separation between subject and background

## Code sketch

```swift
let blurLayer = CALayer()
blurLayer.contents = blurredSceneImage.cgImage
blurLayer.frame = bounds
let matteLayer = CALayer()
matteLayer.frame = bounds
matteLayer.contents = segmentationMatte.cgImage // updated per frame
blurLayer.mask = matteLayer
preview.layer.addSublayer(blurLayer)
// when a new frame arrives:
matteLayer.contents = nextFrameMatte.cgImage
```

## When this matters / when alternatives won't work

Applying a blur to the whole image makes the subject part of the blurred background — no Portrait effect is possible. Approximating the subject region with a path mask cannot capture hair, fingers, or transparent boundaries; only a bitmap matte derived from sensors or ML carries the per-pixel alpha required for a believable subject/background separation.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
