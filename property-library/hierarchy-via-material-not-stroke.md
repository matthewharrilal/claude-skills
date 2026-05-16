---
name: hierarchy-via-material-not-stroke
levels: [L2, L4]
mechanisms:
  - UIBlurEffect materials (.systemThin, .systemThick, .systemChrome)
  - .background(.ultraThinMaterial) in SwiftUI
  - vibrancy through UIVibrancyEffect
sources:
  - apple-music: tab bar and now-playing as material layers
  - control-center: stacked frosted tiles with no visible borders
  - wallet: pass stack relies on material weight for depth
  - apple-tv-app: hero areas float on translucent material
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Hierarchy via material, not stroke

You know what's foreground vs background without a single border line. Frosted glass, subtle shadow, and tint do the work that borders do on web.

## What the user perceives

The interface has obvious depth and grouping with no visible rules or boxes. Foreground elements feel forward because they sit on a denser frosted surface, not because they have outlines. Layers separate through material weight — thinner, lighter blurs read as "further back," thicker as "closer."

## Exemplars

- **Apple Music** — tab bar and now-playing layer separated by material thickness alone
- **Control Center** — stacked frosted tiles with no visible borders between them
- **Wallet** — pass stack reads as depth purely from material weight and shadow
- **Apple TV app** — hero areas float forward on translucent material layers

## Mechanisms

- UIBlurEffect materials (.systemThin, .systemThick, .systemChrome)
- .background(.ultraThinMaterial) in SwiftUI
- vibrancy through UIVibrancyEffect

## What goes wrong without it

Ports lean on borders and dividers (Material Design heritage, web CSS reflex). Every group is wrapped in a visible box, every section ends in a stroke, and the interface reads as a wireframe with content stuffed inside rather than as a layered material.

## Why iOS-native (or domain-defining)

iOS-native uses material thickness — visual weight encoded in blur strength, not strokes. The blur material itself is the structural element; the system provides a graded vocabulary of thicknesses precisely so depth can be encoded without resorting to ink.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
