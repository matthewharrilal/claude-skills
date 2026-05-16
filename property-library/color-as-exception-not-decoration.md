---
name: color-as-exception-not-decoration
levels: [L2]
mechanisms:
  - Asset catalog with semantic names (Color.destructive, not Color.red)
sources:
  - Linear: single purple accent, otherwise achromatic
  - Things 3: blue tint only on the action affordance
  - Apple Reminders: red only for destructive
  - Apple Mail: unread blue dot is the only chromatic element in the row
related-properties: []
added: 2026-05-16
category: component-composition
---

# Color as exception not decoration

Base palette is achromatic. Color appears only when it carries meaning — destructive red, success green, interactive tint, unread badge. When color appears in a gray field, it has alarm-weight.

## What it means

The default state of the UI is grayscale. Color is a semantic event: it tells the user "this is interactive," "this is destructive," "this is new." Because the base field is achromatic, a single colored pixel carries enormous perceptual weight — it pulls the eye instantly and unambiguously.

## Exemplars

- **Linear** — single purple accent, otherwise monochrome
- **Things 3** — blue only on the tap target
- **Apple Reminders** — red exclusively for destructive
- **Apple Mail** — the unread dot is the only chromatic pixel in the row

## Mechanisms in UIKit/SwiftUI

- Asset catalog with semantic names (Color.destructive, not Color.red)

## What goes wrong without it

When everything is colorful, nothing is signal. Important states become invisible because they have to compete with decorative color elsewhere.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
