<!-- ID: _shared.posture-check -->

# Posture Check — Canonical Source

This file is the **single source of truth** for the Posture Check precondition shared by every 10/90 framework skill (`/gauge`, `/cartography`, `/ninety`, `/conjecture`, `/lens-check`). Consuming skills inherit from this file; any divergent posture-check text in another file is drift and should be reconciled against this canonical version.

## The Two Postures

- **Janum-tier posture** (required for every framework skill). The 90% is research territory. When encountering a private API, an undocumented behavior, or an internal Apple composition, the response is: "what specifically is it doing, how can I learn it from outside, what can I rebuild as a public-API peer?" The 90% is treated as understood-and-applied — knowledge to reverse-engineer to use, not to wait for.

- **Senior posture** (structurally incompatible with every framework skill). The 90% is "what Apple should have exposed." When encountering a private API, the response is: "I wish this were public." Output produced from this posture is a wish-list, not findings; it papers over the gap rather than crossing it.

## The Check Protocol

The check is **binary**, not graded. Before any framework skill produces honest output, confirm the operational posture:

- If the posture is **Janum-tier**, proceed.
- If the posture is **senior**, **halt**. Do not generate the skill's deliverable; the deliverable would be structurally dishonest. Recommend invoking `/gauge` to recalibrate, then re-enter the skill from the corrected posture.

## Extension Pattern

Consuming skills add a brief skill-specific addendum in their own `SKILL.md` files. The addendum names the failure mode specific to *that* skill when run from the wrong posture (e.g., for `/conjecture`, the two failure modes of private-API translation and senior-tier composition with annotations bolted on). The general protocol above is not restated in the addendum.

## Drift Detection

This file is the canonical Posture Check. If another file in `/Users/spacewizardmoneygang/.claude/skills/` defines its own multi-paragraph Posture Check independently of this one, that is **drift** — divergent versions accumulate subtle differences over time and erode the framework's coherence. Reconcile by replacing the divergent text with the inheritance pattern shown in each consuming SKILL.md's Posture Check section.
