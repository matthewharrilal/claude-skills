---
name: search-as-pull-down-property
levels: [L4, L5, L8]
mechanisms:
  - UISearchController assigned to navigationItem.searchController
  - SwiftUI .searchable(text:) modifier on navigation root
sources:
  - apple-mail: pull-down reveals search integrated with the nav
  - notes: search emerges from above the list as an attribute of it
  - messages: conversation search lives as a pull-down property
  - settings: list search accessed via the same scroll gesture
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Search as pull-down property

No search button. You pull down on the list and a search field reveals itself, integrated into the navigation surface.

## What the user perceives

Search is not a destination but an attribute of the list itself. You reach it by extending the scroll gesture past the top of the content — pulling further than the rubber-band would normally allow — and a search field slides down out of the navigation chrome. The whole interaction stays inside one motion vocabulary.

## Exemplars

- **Apple Mail** — pull-down reveals a search field above the inbox
- **Notes** — search emerges as an attribute of the note list, not a separate screen
- **Messages** — conversation search lives as a pull-down property
- **Settings** — same gesture reveals a system-wide settings search

## Mechanisms

- UISearchController assigned to navigationItem.searchController
- SwiftUI .searchable(text:) modifier on navigation root

## What goes wrong without it

Ports stick a magnifying glass icon in the top bar. Search becomes a separate destination — tap an icon, navigate to a screen, type — rather than an attribute reachable through the scroll gesture itself. The interface fragments into more screens than it needs.

## Why iOS-native (or domain-defining)

iOS-native treats search as an attribute of the list itself, accessed by the same gesture vocabulary as scrolling. The gesture economy is tight: one motion (the downward pull) gives you both overscroll feedback and search affordance depending on how far you go.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
