---
name: lists-pick-one-variant-and-commit
levels: [L8]
mechanisms:
  - UICollectionViewCompositionalLayout with a single section style per surface
  - consistent cell type across the list
  - explicit choice of cells vs cards vs grid
sources:
  - Things 3: cells, consistently, with no variant mixing
  - Apple Music Library: sectioned cells with uniform rows
  - Photos: grid with uniform tiles
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Lists pick one variant and commit

A list is cells (dense, scannable) OR cards (visual, breathable) OR sectioned (hierarchical). Mixing variants in one screen signals indecision.

## What it means

The visual variant of a list row carries information. Cells signal "these rows are scannable peers." Cards signal "each row is a destination worth looking at." Grids signal "visual identity matters more than label." When a single screen mixes variants — a cell next to a card next to a grid tile — the visual signal becomes noise: the user can't tell which rows are peers and which are special. AAA apps pick one variant per list and commit, even when the underlying data types differ.

## Exemplars

- **Things 3** — cells, consistently, across every list view in the app
- **Apple Music Library** — sectioned cells with uniform row treatment
- **Photos** — grid with uniform tiles; the photo itself carries identity

## Violators (apps that pay the price)

- **Apps with hybrid lists** — cards mixed with cells mixed with grid tiles in the same surface

## Why it matters at AAA quality

List variant carries information. Inconsistency dilutes the signal of what kind of thing each row is, and the user has to read every row carefully instead of skimming.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
