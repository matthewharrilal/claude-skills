---
name: projection-based-commit-decision
levels: [L5, L7]
mechanisms:
  - At gesture end, compute projectedPosition = position + velocity * decay
  - Compare projected position against threshold to decide commit vs. revert
  - Use the same decay constant as the eventual settling animation
sources:
  - WWDC 2018 Session 803: introduces the projection function explicitly
  - Apple Maps card flick: short fast flicks commit to next detent
  - Things 3 swipe-to-complete: light flick commits the action
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Projection-Based Commit Decision

A light flick — short distance, high velocity — commits. A slow drag past the same point reverts. The system reads intent, not just position. Commit is decided by where the gesture is going, not where it currently is.

## What the user perceives

The system understands flicks. A confident, quick wrist motion is read as "yes, do the thing," even if the finger barely moved. Conversely, a slow tentative drag past the halfway point is read as exploration, not commitment. The interface respects the energy of the gesture.

## Exemplars / References

- **WWDC 2018 Session 803** — explicit projection function in the talk
- **Apple Maps card flick** — short fast flicks reliably commit to the next detent
- **Things 3 swipe-to-complete** — light flicks complete the task
- **iOS sheet dismiss** — flick down commits dismissal regardless of position

## Mechanisms

- At gesture end, compute projectedPosition = position + velocity * decay
- Compare projected position against threshold to decide commit vs. revert
- Use the same decay constant as the eventual settling animation
- Decay = 0.998 to the power of frames in a typical UIScrollView-style projection

## What goes wrong without it

"Sticky" feel — short flicks bounce back even when clearly intentional. The user has to drag past an arbitrary distance threshold to commit, which means flicks feel ignored. Conversely, slow drags that crossed the line commit when the user was clearly exploring.

## Levels this property spans

- **L5 (interactive feel):** the gesture-end decision logic
- **L7 (transition orchestration):** whole-transition commits (sheets, navigations) inherit this logic

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
