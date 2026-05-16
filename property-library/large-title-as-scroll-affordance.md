---
name: large-title-as-scroll-affordance
levels: [L4, L6, L8]
mechanisms:
  - navigationItem.largeTitleDisplayMode = .always
  - UINavigationBar.prefersLargeTitles
  - SwiftUI .navigationBarTitleDisplayMode(.large)
sources:
  - apple-mail: large title shrinks into nav bar as you scroll
  - notes: title and search collapse cleanly into chrome
  - settings: continuous coupling between title and scroll offset
  - app-store: chrome and content treated as one surface
  - reeder: list title compresses on scroll with proper coupling
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Large-title-as-scroll-affordance

The screen title is huge when you arrive, then shrinks and slides into the nav bar as you scroll — the chrome and the content are one continuous surface.

## What the user perceives

When you land on a list screen, the title is bold and large, occupying the top of the scrollable content. As you scroll up, the title shrinks continuously into the navigation bar, and the chrome and content merge into a single coordinated motion. There's no abrupt swap — the title's compression is the scroll position made visible.

## Exemplars

- **Apple Mail** — large title compresses smoothly into the nav bar on scroll
- **Notes** — title and search field collapse into chrome as one motion
- **Settings** — continuous coupling between title size and scroll offset
- **App Store** — chrome and content read as a single surface, not two layers
- **Reeder** — list title compression is gesture-coupled, not stepped

## Mechanisms

- navigationItem.largeTitleDisplayMode = .always
- UINavigationBar.prefersLargeTitles
- SwiftUI .navigationBarTitleDisplayMode(.large)

## What goes wrong without it

Ports use a static header bar; native uses the title's own scroll-coupling as a navigational signal. The chrome stays a constant height and detached from the scrolling content, which makes the screen feel like a fixed frame with a separate scroll window inside it rather than a unified surface.

## Why iOS-native (or domain-defining)

This IS the iOS 11+ list-screen idiom. The large-title-into-compact-title transition is one of the system's most identifiable visual signatures, and any port that omits it immediately reads as foreign.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
