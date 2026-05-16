---
name: loading-states-use-skeletons-not-spinners
levels: [L8]
mechanisms:
  - skeleton placeholder views matching final layout
  - shimmer animation on placeholder geometry
  - avoidance of UIActivityIndicatorView for content loads
sources:
  - Apple News: skeleton article rows during load
  - Instagram: skeleton feed cards
  - Apollo: skeleton post layouts
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Loading states use skeletons, not spinners

Show the shape of the content that's coming. Skeleton placeholders match the eventual layout; spinners are an admission of "we don't know what's next."

## What it means

Perceived performance beats actual performance for the user's sense of speed. A spinner says "something is happening, but I have no idea what" — the user waits in an information vacuum. A skeleton says "this is the shape of what's coming" — the user's eye begins parsing layout before the content arrives, and the apparent wait shrinks. AAA apps build skeleton layouts that match the populated state so the transition is a fill, not a swap.

## Exemplars

- **Apple News** — skeleton article rows during initial load
- **Instagram** — skeleton feed cards anticipate the populated layout
- **Apollo** — skeleton post layouts with shape-accurate placeholders

## Violators (apps that pay the price)

- **Apps with full-screen spinners** — vacuum the user's attention with no orientation
- **Apps with "Loading..." text** — confirm something is happening but communicate nothing useful

## Why it matters at AAA quality

Perceived performance is greater than actual performance. Skeletons reduce perceived wait by roughly thirty to forty percent — and the user's first impression of speed determines whether they trust the app.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
