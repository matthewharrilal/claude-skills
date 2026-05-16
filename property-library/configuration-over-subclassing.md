---
name: configuration-over-subclassing
levels: [L4]
mechanisms:
  - UIButton.Configuration / UIListContentConfiguration
  - SwiftUI ButtonStyle/LabelStyle protocols
sources:
  - UIKit modern UIButton.Configuration: variants via value type
  - UIListContentConfiguration: cell content as data
related-properties: []
added: 2026-05-16
category: component-composition
---

# Configuration over subclassing

Components are configured via value types (e.g., UIButton.Configuration), not subclassed. A button isn't a `PrimaryButton: UIButton` — it's a UIButton with a `.primary` configuration.

## What it means

Variants are data, not classes. A button has dozens of looks but one class; the look is selected by passing a configuration value. This keeps the inheritance graph flat and the variant space testable. Subclasses for visual variants are an anti-pattern.

## Exemplars

- **UIKit modern UIButton.Configuration** — variants via value type
- **UIListContentConfiguration** — cell content treated as data

## Mechanisms in UIKit/SwiftUI

- Configuration structs
- SwiftUI ButtonStyle / LabelStyle protocols

## What goes wrong without it

Subclass explosion. Every variant becomes a new class. Visual consistency drifts as variants diverge.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
