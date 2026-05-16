---
name: system-tint-vs-brand-tint
levels: [L2]
mechanisms:
  - UIView.tintColor cascade
  - SwiftUI .tint() at app root
sources:
  - Linear: single purple accent throughout
  - Cash App: single green throughout
  - Things 3: single blue throughout
related-properties: []
added: 2026-05-16
category: component-composition
---

# System tint vs brand tint

First-party Apple tone uses tintColor (blue by default, user-customizable in iOS 18+). Branded apps establish one accent and never deploy a second.

## What it means

An app has one accent color. Period. That color means "interactive." If you introduce a second accent, the user must learn a second meaning, and the first accent's signal degrades. Multi-accent apps read as toy-like because they violate the one-accent rule.

## Exemplars

- **Linear** — purple is the only accent
- **Cash App** — green is the only accent
- **Things 3** — blue is the only accent

## Mechanisms in UIKit/SwiftUI

- UIView.tintColor cascade from window down
- SwiftUI .tint() applied at app root

## What goes wrong without it

Visual chaos. The user can't learn what "tinted = tap me" means because every color is tinted differently in different places.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
