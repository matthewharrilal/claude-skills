---
name: pull-to-refresh-as-embedded-gesture
levels: [L4, L5]
mechanisms:
  - UIRefreshControl attached to UIScrollView
  - SwiftUI .refreshable { } modifier
sources:
  - apple-mail: pull-down refresh with system spinner and timing
  - tweetbot-ivory: refresh integrates with timeline scroll
  - apollo: pull-to-refresh respects system curve and haptic
  - reeder: feed refresh embedded in the list's negative space
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Pull-to-refresh as embedded gesture

You pull the list down past its top, a tasteful spinner appears in the negative space, release and it refreshes. The chrome doesn't change.

## What the user perceives

The refresh affordance is part of the scroll itself. There's no button, no menu — pulling further than the rubber-band reveals a spinner in the space above the list, and releasing commits the refresh. The chrome stays put, the spinner appears in the gap created by the pull, and the timing matches the system rhythm exactly.

## Exemplars

- **Apple Mail** — pull-down refresh with the system spinner and timing
- **Tweetbot/Ivory** — refresh integrated with timeline scroll feel
- **Apollo** — respects the system pull curve and concluding haptic
- **Reeder** — feed refresh lives in the list's negative space above the top

## Mechanisms

- UIRefreshControl attached to UIScrollView
- SwiftUI .refreshable { } modifier

## What goes wrong without it

Ports use custom spinners that subtly violate the timing. The spinner appears in a slightly wrong place, the deceleration on release is off, the haptic is missing or mistimed, and the whole gesture reads as a knockoff of the native rhythm rather than the rhythm itself.

## Why iOS-native (or domain-defining)

The interaction was invented for iOS (Tweetie) and the system implementation has a specific spinner placement, deceleration curve, and haptic. UIRefreshControl encodes those values exactly — any reimplementation has to match them, and most don't.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
