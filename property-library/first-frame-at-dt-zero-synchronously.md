---
name: first-frame-at-dt-zero-synchronously
levels: [L6, L7]
mechanisms:
  - Apply initial transform/state inside same CATransaction as animation start
  - Force layout (layoutIfNeeded) before commit
  - Use UIViewPropertyAnimator started in .active state
sources:
  - Apple Music Now Playing transitions: no first-frame flash
  - Wallet card transitions: pristine start frames
  - WWDC sessions on Core Animation transaction model
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# First Frame at dt=0 Synchronously

The animation starts with no "blank frame" — the first paint already shows motion underway from the initial state, not the model-layer final state. The synchronous transaction guarantees no race between layout and animation.

## What the user perceives

Transitions begin cleanly. No flicker. No "wait, what was that?" microflash of the final state appearing before the animation kicks in. The on-screen image is always coherent.

## Exemplars / References

- **Apple Music Now Playing** — flawless first frame on tap-up
- **Wallet card transitions** — no flicker between still and animated states
- **High-quality custom modal presentations** — no pre-animation flash
- **System app launches** — first frame is mid-zoom, never pre-zoom

## Mechanisms

- Apply initial transform/state inside same CATransaction as animation start
- Force layout (layoutIfNeeded) before commit
- Use UIViewPropertyAnimator started in .active state with explicit fractionComplete
- Disable implicit actions during the setup, re-enable for the animation

## What goes wrong without it

A one-frame flash of the final state before the animation kicks in — the dreaded "Core Animation flicker." The transition looks broken even when the animation itself is correct, because the user's eye catches that single wrong frame.

## Levels this property spans

- **L6 (animation engineering):** transaction-level discipline around initial conditions
- **L7 (transition orchestration):** whole transitions begin coherently across many views

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
