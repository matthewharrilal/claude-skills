---
name: sectioned-lists-use-sticky-headers-not-dividers
levels: [L8]
mechanisms:
  - UICollectionView pinned supplementary views (section header pinning)
  - UITableView plain style with pinned headers
  - sticky section title that updates as user scrolls
sources:
  - Apple Contacts: sticky alphabet section headers
  - Apple Music Library: sticky section titles
  - Messages: pinned section behavior
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Sectioned lists use sticky headers, not dividers

When sections matter, the section header sticks during scroll. When they don't matter, don't section.

## What it means

A section header has two possible roles: a decorative divider (scrolls away with the content) or a sticky orientation cue (pins to the top of the list as the user scrolls). The sticky version preserves the user's sense of where they are in a long list — they always know which section is currently in view. The decorative version provides almost no value: it splits the list into visual groups but loses orientation the moment the user scrolls past it. If sections are worth marking, they're worth pinning.

## Exemplars

- **Apple Contacts** — alphabet headers stick at the top as the user scrolls
- **Apple Music Library** — section titles pin during scroll
- **Messages** — pinned section stays anchored

## Violators (apps that pay the price)

- **Apps with decorative section dividers that scroll away** — lose orientation in long lists

## Why it matters at AAA quality

Sticky headers preserve orientation in long lists. Without them, the user has to scroll back to find which section they're in — a cost that compounds in lists of hundreds or thousands of rows.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
