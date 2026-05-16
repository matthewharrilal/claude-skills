---
name: settings-depth-caps-at-two-levels
levels: [L8]
mechanisms:
  - flat settings list with at most one push deep
  - sensible defaults baked in, eliminating most knobs
  - grouped UITableView with focused sections
sources:
  - Things 3: flat settings with sensible defaults
  - Bear: shallow settings tree
  - Halide: settings are flat and focused
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Settings depth caps at two levels

Settings is a top-level list and at most one push deep. Anything deeper is a configuration the user shouldn't have.

## What it means

Settings depth is a direct proxy for product indecision — each additional level of nesting represents a decision the team couldn't make on the user's behalf. AAA apps pick strong defaults, eliminate the long tail of knobs, and present the remaining options as a flat or shallow list. A two-level cap forces the team to ask, for every settings screen, "do we really need this, or can we just pick a sensible default?" Most of the time, the answer is the second.

## Exemplars

- **Things 3** — flat settings with sensible defaults
- **Bear** — shallow settings tree
- **Halide** — settings are flat and focused on the few choices that genuinely matter

## Violators (apps that pay the price)

- **Apps with five-deep settings trees** — burying configuration the team couldn't decide on

## Why it matters at AAA quality

Settings depth is a proxy for product indecision. Deep settings equal "we couldn't pick a default." Every additional level is a tax on every user, paid to avoid a decision the product team should have made.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
