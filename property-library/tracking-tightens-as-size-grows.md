---
name: tracking-tightens-as-size-grows
levels: [L2]
mechanisms:
  - UIFont.preferredFont(forTextStyle:) (automatic optical sizing)
  - NSAttributedString.Key.kern (manual)
sources:
  - Apple Music: large headers with tight tracking
  - Wallet: card titles use negative letter-spacing
  - Fantastical: event names tighten at display sizes
related-properties: []
added: 2026-05-16
category: component-composition
---

# Tracking tightens as size grows

Display-size text uses negative letter-spacing (-0.02em to -0.025em); body text uses 0; small caps/labels can use slight positive tracking.

## What it means

Letter-spacing is inversely proportional to type size. Big type wants tighter tracking — it reads confident and intentional. Small type wants neutral or slightly positive tracking to remain legible. SF handles this automatically through optical sizing, but custom type and manual values must respect the same rule.

## Exemplars

- **Apple Music** — large playlist headers tightened to -0.02em
- **Wallet** — card titles use tracked-in display weight
- **Fantastical** — event names compress optically at title sizes

## Mechanisms in UIKit/SwiftUI

- UIFont with .preferredFont(forTextStyle:) (automatic)
- NSAttributedString.Key.kern for manual override

## What goes wrong without it

Large titles look airy and untrustworthy — like a website mock rather than a native screen. Small text looks cramped and amateur.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
