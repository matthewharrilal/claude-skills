---
name: rubber-band-as-physical-truth
levels: [L1, L5]
mechanisms:
  - UIScrollView.alwaysBounceVertical and bounces = true
  - decelerationRate set to .normal vs .fast
  - SwiftUI inherits bounce behavior via ScrollView
sources:
  - apple-first-party: every list and scroll surface across iOS
  - reeder: article list overscroll
  - tweetbot-ivory: timeline rubber-band at edges
  - things-3: task list pull resistance
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Rubber-band as physical truth

Pulling past the end of a list feels like stretching a rubber sheet — resistance increases, release snaps back with the right damping.

## What the user perceives

The list is not a finite window but a tensioned surface. Pulling past its edge becomes progressively harder, and when you let go the content snaps back with a settle, not a clamp. The overscroll is not a bug or a stop — it's a deliberate physical signal that you've reached the boundary.

## Exemplars

- **Every Apple app** — uniform rubber-band on all scroll surfaces
- **Reeder** — article lists overscroll with proper resistance and settle
- **Tweetbot/Ivory** — timeline edges rubber-band identically to system lists
- **Things 3** — task lists exhibit the same tensioned resistance curve

## Mechanisms

- UIScrollView.alwaysBounceVertical and bounces = true
- decelerationRate set to .normal vs .fast
- SwiftUI inherits bounce behavior via ScrollView

## What goes wrong without it

Ports often disable bounce (it looks "broken" to web devs) or implement linear overscroll. The list reads as a hard wall instead of a tensioned surface, and the absence of a settle on release breaks the felt physicality of the scroll.

## Why iOS-native (or domain-defining)

The exponential resistance curve is the tell. iOS rubber-band is not a constant drag — it gets harder the further you pull, which is what a rubber sheet does. Linear or clamped overscroll instantly reads as non-native because the resistance signature is wrong.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
