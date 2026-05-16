---
name: tab-bar-as-identity-persistence
levels: [L4, L9, L10]
mechanisms:
  - UITabBarController with per-tab UINavigationController
  - SwiftUI TabView with persistent navigation stacks per tab
  - tap-active-tab behavior (pop to root, then scroll to top)
sources:
  - apple-music: tabs preserve their full navigation depth
  - instagram: each tab holds its own stack
  - apollo: tap-active-tab pops to root, second tap scrolls to top
  - apple-tv: tab state persistent across app lifetime
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Tab bar as identity persistence

The tabs stay put. Tapping the active tab pops to root. Tapping it again scrolls to top. You never lose your place inside a tab.

## What the user perceives

Each tab is a separate world that remembers where you were. Switching tabs and returning brings back the same screen, the same scroll position, the same drilled-in navigation depth. Tapping the active tab is a learned shortcut — once for root, again for top — that the user picks up across all iOS apps without instruction.

## Exemplars

- **Apple Music** — every tab preserves its full navigation depth across switches
- **Instagram** — each tab holds its own stack, no resets
- **Apollo** — tap-active-tab pops to root, second tap scrolls list to top
- **Apple TV** — tab state remains persistent across the app's lifetime

## Mechanisms

- UITabBarController with per-tab UINavigationController
- SwiftUI TabView with persistent navigation stacks per tab
- tap-active-tab behavior (pop to root, then scroll to top)

## What goes wrong without it

Android ports often reset stacks on tab switch. You drill into a tab, switch away to check something, come back, and find yourself back at the root — losing context with no way to recover it. The tabs read as routes rather than as persistent contexts.

## Why iOS-native (or domain-defining)

iOS-native preserves the full navigation stack per tab as inviolable state, and the tap-active-tab idiom (root, then top) is a learned native reflex. The system-provided UITabBarController has this behavior built in — apps inherit it for free rather than reimplementing it badly.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
