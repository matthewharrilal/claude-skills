---
name: property-synthesize
description: Given a design intent, surface library properties (direct + cross-domain) and mechanism mappings
---

# /property-synthesize

The workhorse forward-direction skill. Given a design intent, surfaces relevant properties from your library plus their mechanism mappings — including cross-domain transfers from distant categories that apply to the current work.

## When to invoke

- Starting design work on a specific component / interaction / screen
- Reviewing your own design and wanting library-grounded critique
- Two options on the table; need property language to articulate which is better
- Trying to find which library properties apply to your current work
- Mid-build and stuck on a small decision (which mechanism, which feel)
- Pre-spec, when you want to name properties before writing the brief

## When NOT to invoke

- Starting a NEW FEATURE from scratch → use `/feature-pass` (includes active research)
- You don't have a design intent yet → use `/property-inquire`
- You want to add a property to library → use `/property-extract` or `/property-inquire`
- You're auditing for non-iOS instincts → use `/contamination-check`
- You want a full review pass, not just property surfacing → use `/design-lens-check`

## Input

A design intent / brief / description. Be specific:

- "Designing the empty state of a saved-items list"
- "Building the onboarding's permission ask for notifications"
- "Re-thinking how a modal dismisses"
- "The list-row tap-to-expand interaction in the inbox"

Vague intents ("make a nice settings screen") yield vague output. The more specific the intent — what level, what surface, what feel — the higher-signal the return.

## Output

A property shortlist + mechanism mappings, structured:

- **Direct properties** — same-domain matches from library
- **Cross-domain properties** — properties from distant categories that transfer (the auxiliary design sense; high-leverage)
- **Mechanisms per property** — concrete UIKit / SwiftUI primitives that deliver each property
- **Brief rationale** — one line per property, why it applies
- **(Optional sub-mode output)** — depending on which flag was passed

## Default mode

1. Parse design intent + tag with taxonomy level(s) it touches (L0–L13)
2. Query library for **direct matches** — properties whose levels and source domains align with the intent's category
3. Query library for **cross-domain matches** — properties from distant categories whose intent-shape transfers (this is the load-bearing step; do not skip it)
4. Surface mechanisms for each property (1–3 concrete UIKit / SwiftUI primitives)
5. Return ranked shortlist with one-line rationale per property

The cross-domain surfacing is what makes this skill more than a library lookup. Direct matches are what library browsing already gives you. The auxiliary design sense — pulling a property from lyrics-rendering into onboarding, from a music app into a finance app — is what taste-shifts the design pass. If the output skips it, the skill has failed.

## Sub-modes

### `--diagnose-transfer`

**When:** You tried to apply property P (from prestige App X) but it didn't land in YOUR context. Something feels off; you can't tell if the property is wrong or the mechanism is wrong.

**Process:**
1. Identifies P's load-bearing context in the source — what supports it where it works (audience, content density, frequency, brand voice, hardware, accompanying motion)
2. Compares to your context — what's mismatched
3. Decides: is this a *property mismatch* (wrong property for your intent) or a *mechanism mismatch* (right property, wrong delivery)?
4. Surfaces context-appropriate variants — either a different mechanism that delivers the same property, or a related property that fits your context better

**Output:** named diagnosis + alternative recommendation + the principle that explains why

Anti-pattern: blaming the user's execution. The skill diagnoses the *context mismatch*, not the engineer.

### `--surface-tensions`

**When:** Two design impulses pulling opposite directions (calm vs fast; minimal vs discoverable; consistent vs delightful; restrained vs expressive). Need to name the tension before choosing.

**Process:**
1. Articulates the philosophical poles — what each side is actually optimizing for
2. Pulls library properties + prestige references that resolved each pole successfully
3. Surfaces the tradeoffs explicitly — what each pole costs
4. Recommends a direction, with explicit confidence level and what would change the recommendation

**Output:** named tension + pole-by-pole references + tradeoffs table + recommendation

### `--decision-lock`

**When:** About to commit a decision that ossifies — navigation pattern, motion budget, persistence model, tokenization scheme, modality choice, hierarchy of objects. These are the decisions that calcify and are expensive to undo.

**Process:**
1. Flags whether this decision is load-bearing / irreversible (or how reversible, on what timescale)
2. Surfaces apps that regretted committing too early to this kind of decision (with what they had to refactor)
3. Lists what to verify before committing — questions to answer, references to consult, tests to run
4. Issues a go / no-go / soft-go signal

**Output:** lock-warning + verification checklist + go / no-go signal

Anti-pattern: ignoring reversibility because the decision feels obvious. If the decision is load-bearing, the obviousness is exactly the trap.

## Composes with

- `/property-library` — primary read source; this skill is one of its largest consumers
- `/property-extract` — synthesize's output may surface library gaps; extract fills them
- `/level-place` — often invoked first to confirm what level the work is at, sharpening the synthesis query
- `/complementary` — after synthesize identifies the core properties, complementary surfaces perimeter properties you didn't ask about
- `/design-lens-check` — orchestrator that wraps synthesize with level-place, complementary, and contamination-check

## Example invocation (default mode)

**Input:** "I'm designing the empty state of a saved-items list."

**Output (abridged):**

*Direct properties:*
- **calm-first-encounter** (L2, L8) — empty states shouldn't shout. Mechanism: muted secondary-text color, generous vertical padding, no illustrations heavier than an SF Symbol.
- **inviting-action** (L4, L5) — empty state implies a next step. Mechanism: a single soft-style button (`.borderedTinted`) anchored low, not a CTA-loud `.borderedProminent`.

*Cross-domain properties (the auxiliary move):*
- **focus-through-subtraction** (from Apple Music lyrics; L2) — the empty-state copy can feel "lit" if surrounding chrome (toolbar, tab bar) dims slightly while the screen is empty. Mechanism: conditional `.tint` darkening of bar items when the list count is 0.
- **photometric-continuity** (from Reeder; L6, L7) — when content first arrives, fade it in over 200ms rather than appearing instantly. Mechanism: `.transition(.opacity)` keyed on the list's first non-empty state.

*Recommended shortlist:* lead with calm-first-encounter + inviting-action; layer photometric-continuity for the arrival moment. Skip focus-through-subtraction unless the app's chrome is visually noisy enough to compete.

## Example invocation (`--surface-tensions`)

**Input:** "Modal dismissal — should it dismiss on tap-outside, or only via an explicit close button?"

**Output (abridged):**

*Named tension:* **forgiveness vs commitment**

- **Forgiveness pole:** the modal is lightweight; the user wandered in; let them leave the same way. References: Things 3 quick-entry, Linear's inline issue creation. Property: *escape-route-symmetry* — entry effort and exit effort match.
- **Commitment pole:** the modal represents a unit of work that deserves explicit closure. References: Apple Notes deletion confirmation, Stripe checkout. Property: *deliberate-state-change* — destructive or consequential transitions require explicit acknowledgment.

*Tradeoffs:* forgiveness costs accidental dismissal of in-progress work; commitment costs friction on lightweight flows.

*Recommendation:* tap-outside dismiss IF the modal has no in-progress destructive state, ELSE explicit-close-only. Confidence: high — this aligns with iOS sheet conventions where `.interactiveDismissDisabled` is opt-in based on dirty state. Would change recommendation if the modal contained payment / sensitive data, in which case commitment wins unconditionally.

## Anti-patterns

- Returning only direct (same-domain) properties — the cross-domain transfer is the auxiliary design sense; skipping it cuts taste in half
- Recommending mechanisms before naming properties (mechanisms without properties don't compound)
- In `--decision-lock` mode, ignoring reversibility just because the decision feels obvious
- In `--diagnose-transfer` mode, blaming the user's execution instead of diagnosing the context mismatch
- In `--surface-tensions` mode, hedging without recommending — naming the tension is necessary but not sufficient
- Surfacing more than 5–7 properties total — the workhorse is a shortlist, not a dump; ranking is the value
- Ignoring the taxonomy levels — every property should be tagged with the L0–L13 levels it manifests at, so the engineer knows where the work lives
