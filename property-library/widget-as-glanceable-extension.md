---
name: widget-as-glanceable-extension
levels: [L11]
mechanisms:
  - WidgetKit with SwiftUI views
  - TimelineProvider for scheduled updates
  - App Group container for shared data
sources:
  - fantastical: at-a-glance day plan on the home screen
  - things-3: today's tasks rendered as a static tile
  - carrot-weather: forecast tile updates throughout the day
  - apollo: subreddit preview as a glanceable widget
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Widget as glanceable extension

The app's data lives on your home screen as a static, beautiful tile that updates throughout the day without you opening anything.

## What the user perceives

A piece of the app lives outside the app. The widget shows the same data with the same care for hierarchy and type, refreshes itself on a sensible schedule, and answers most quick questions without requiring you to launch anything. It's not a shortcut icon — it's a tile of information that earns its place on the home screen.

## Exemplars

- **Fantastical** — at-a-glance day plan tile on the home screen
- **Things 3** — today's tasks rendered as a clean static tile
- **Carrot Weather** — forecast tile that refreshes on its own timeline
- **Apollo** — subreddit preview widget for glance-and-go reading

## Mechanisms

- WidgetKit with SwiftUI views
- TimelineProvider for scheduled updates
- App Group container for shared data

## What goes wrong without it

Ports treat widgets as afterthought icons. The widget is either missing entirely or shows a logo with a "tap to open" prompt — there's no actual data on the home screen, and the user gains nothing from pinning the widget over the app icon.

## Why iOS-native (or domain-defining)

iOS-native designs widgets as a first-class surface with their own information hierarchy. WidgetKit forces a SwiftUI-based, timeline-scheduled design — apps must commit to the widget as a real product surface, not a marketing badge.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
