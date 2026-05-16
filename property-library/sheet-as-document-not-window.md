---
name: sheet-as-document-not-window
levels: [L4, L7, L8]
mechanisms:
  - UISheetPresentationController with detents
  - SwiftUI .sheet() with .presentationDetents()
  - system-provided scale and corner-radius transform on the parent
sources:
  - apple-maps: place sheet rising over the recessed map
  - mail: compose sheet with the inbox visibly behind glass
  - fantastical: event detail as a stacked document
  - things-3: add task sheet with parent receding
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Sheet-as-document-not-window

A sheet rises from the bottom edge, the underlying view recedes and tilts back as if behind glass. You feel two documents in a stack, not a popover floating above a page.

## What the user perceives

When a sheet appears, the page behind it visibly moves backward in space — its corners round, it scales down slightly, and it tilts as though receding into the device. The sheet itself sits forward, and you read the relationship as two layered documents, both present, with one temporarily on top. Dismissing the sheet returns the parent to its original position.

## Exemplars

- **Apple Maps** — place sheet rises while the map recedes into a back layer
- **Mail** — compose sheet stacks over a visibly demoted inbox
- **Fantastical** — event detail presented as a forward document over a back document
- **Things 3** — add task sheet pushes the list backward in z

## Mechanisms

- UISheetPresentationController with detents
- SwiftUI .sheet() with .presentationDetents()
- system-provided scale and corner-radius transform on the parent

## What goes wrong without it

Web/Android modals are overlays — full-screen scrim, content on top. The parent disappears or sits behind a flat scrim, breaking the felt sense that you can return to it. The interaction collapses into a single-document model where the previous context is hidden rather than demoted.

## Why iOS-native (or domain-defining)

iOS-native sheets push the parent backward in z, signaling that the parent still exists and you can return to it. The behavior is built into UISheetPresentationController itself — the parent transform is not opt-in styling but the default presentation grammar.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
