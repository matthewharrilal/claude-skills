---
name: home-is-always-one-tap-away
levels: [L10]
mechanisms:
  - UITabBarController re-tap behavior (popToRootViewController + scrollToTop)
  - persistent tab bar across all depths
sources:
  - Apple Music: tab re-tap pops to root then scrolls to top
  - Instagram: home tab re-tap behavior is canonical
  - Apollo: tab re-tap is a two-stage gesture (scroll-to-top, then pop-to-root)
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Home is always one tap away

From any depth, the user can return to the app's primary surface in a single tap — usually by re-tapping the active tab.

## What it means

The tab bar must remain visible and active at every depth, and re-tapping the current tab must collapse the entire navigation stack and return the user to the top of that pillar. This single-tap return is the user's escape hatch — the gesture they reach for when they're disoriented or when they want to start over. Hiding the tab bar at depth or making the re-tap a no-op is a betrayal of this contract.

## Exemplars

- **Apple Music** — tab re-tap pops to root and scrolls to top in one gesture
- **Instagram** — the canonical one-tap-home behavior
- **Apollo** — same two-stage gesture (scroll-to-top first, then pop-to-root on second tap)

## Violators (apps that pay the price)

- **Sidebar-only apps on iPhone** — Notion before tab additions required swiping a drawer to return
- **Apps that hide the tab bar at depth** — force a back-button journey to escape

## Why it matters at AAA quality

Without a one-tap return, users feel trapped at depth, which is the cardinal IA sin. The escape hatch is what gives users the courage to explore — without it, exploration becomes a commitment.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
