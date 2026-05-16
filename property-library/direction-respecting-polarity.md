---
name: direction-respecting-polarity
levels: [L5]
mechanisms:
  - Compare current vs. anchor state with signed delta
  - Use copysign() on rubber-banding to preserve direction
  - Never abs() the gesture translation early in the pipeline
sources:
  - Apollo swipe actions: distinct left vs. right action sets
  - Mail swipe: directional polarity for archive vs. flag
  - Things 3 swipe-to-complete: signed swipe handling
related-properties: []
added: 2026-05-16
category: motion-engineering
---

# Direction-Respecting Polarity

Swiping a list row left reveals different actions than swiping right; the same animation primitive cleanly handles both without a sign bug. Polarity is preserved end-to-end through the gesture pipeline.

## What the user perceives

Both swipe directions feel equally polished. There is no "weak direction" where the rubber-banding is broken or the reveal feels off. Every gesture path is fully implemented; the system feels symmetrically alive in both directions.

## Exemplars / References

- **Apollo swipe actions** — different action sets per direction, both polished
- **Mail swipe** — archive left, flag right, both equally well-tuned
- **Things 3 swipe-complete** — signed handling for complete vs. uncomplete
- **iOS Messages swipe** — reveal timestamps with polarity

## Mechanisms

- Compare current vs. anchor state with signed delta
- Use copysign() on rubber-banding to preserve direction
- Never abs() the gesture translation early in the pipeline
- Mirror animation timing curves rather than re-implementing them per direction

## What goes wrong without it

One direction works perfectly; the other has subtle bugs — wrong reveal, broken rubber-band, mirrored timing. The asymmetric feel signals that the developer only tested one direction; the bad direction feels unsupported.

## Levels this property spans

- **L5 (interactive feel):** the gesture-handling pipeline's signed arithmetic

## Your reflection

<!-- Optional one-paragraph note — leave empty if no reflection. -->
