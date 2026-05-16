---
name: keyboard-as-participating-surface
levels: [L1, L5, L8]
mechanisms:
  - UIScrollView.keyboardDismissMode = .interactive
  - keyboard frame notifications driving content insets
  - SwiftUI .scrollDismissesKeyboard(.interactive) and safe area handling
sources:
  - messages: insertion point stays visible as keyboard rises
  - mail: compose view shifts cleanly with keyboard frame
  - notes: scroll inset adjusts so cursor is never occluded
  - bear: editor cooperates with keyboard as a layout participant
related-properties: []
added: 2026-05-16
category: ios-identity
---

# Keyboard as participating surface

The keyboard rises and your content rises with it — your insertion point never gets occluded, the scroll view inset adjusts, the dismiss-by-pan gesture works.

## What the user perceives

The keyboard is part of the layout, not on top of it. When it appears, the content shifts so that whatever you're editing stays visible above the new surface. When you drag the content downward, the keyboard slides with your finger and can be dismissed by gesture rather than by tapping a button. The keyboard reads as a moveable wall, not an opaque overlay.

## Exemplars

- **Messages** — insertion point remains visible above the rising keyboard
- **Mail** — compose view shifts cleanly with keyboard frame changes
- **Notes** — scroll inset adjusts so the cursor is never occluded
- **Bear** — editor cooperates with keyboard as a real layout participant

## Mechanisms

- UIScrollView.keyboardDismissMode = .interactive
- keyboard frame notifications driving content insets
- SwiftUI .scrollDismissesKeyboard(.interactive) and safe area handling

## What goes wrong without it

Ports treat the keyboard as an overlay that occludes content. Your cursor disappears behind the keyboard, you can't see what you're typing, the only way to dismiss the keyboard is to tap a "Done" button somewhere — and dragging down does nothing, because the scroll view doesn't know the keyboard is there.

## Why iOS-native (or domain-defining)

iOS-native treats it as a layout participant that pushes content and supports interactive dismiss-by-drag. The keyboard's frame is exposed via system notifications precisely so the scroll view can adjust its insets in lockstep with the keyboard's motion.

## Your reflection

<!-- Optional one-paragraph note — why this property matters to you, where you've
felt it work, what makes it taste-shifting for YOU. Leave empty if no reflection. -->
