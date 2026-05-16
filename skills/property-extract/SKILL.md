---
name: property-extract
description: Extract the underlying property from a concrete observed reference, de-domain it, and propose library entry
---

# /property-extract

Takes a concrete observed reference (description, link, screenshot, code) and extracts the underlying design property in intent-shaped, mechanism-portable form, with explicit de-domaining so the property is usable anywhere — not trapped in the source context.

## When to invoke

- Saw a cool UX detail in an app and want to capture the underlying property
- Walking through a prestige app and want to bank what was observed
- Studying a WWDC talk and want to extract held principles
- An /exposure fire surfaced something interesting; need to extract from it
- Reviewing code in another project and the pattern feels worth holding
- Reading a design article and a moved-by moment needs to be named

## When NOT to invoke

- You only have a half-formed intuition with no concrete reference → use /property-inquire
- You're designing something and need properties from library → use /property-synthesize
- You want to find new references to study → use /exposure
- You just want to read existing library entries → use /property-library

## Input

A concrete reference. One of:
- Text description of an observed UX
- App screenshot or video reference
- Link to a public talk, article, or design gallery
- Pointer to code in another project

## Output

A property entry ready for library, with:
- Property name (intent-shaped, kebab-case)
- Level tags (L0–L13 from the taxonomy)
- Mechanism mappings (UIKit/SwiftUI primitives that deliver it)
- Source(s) noted (app + one-line context)
- **De-domaining notes** — what does this property let you do that has nothing to do with the source domain?
- Proposed library addition (drafted, asks for confirmation before writing to disk)

## Process

1. Identifies the observable behavior from the reference — what literally happens on screen / in code
2. Names the underlying property — intent-shaped, NOT mechanism-shaped (e.g., "focus through subtraction" not "gradient mask")
3. Tags level(s) it manifests at via the L0–L13 taxonomy (properties often cross 3–5 levels)
4. Maps 1–3 concrete mechanisms that deliver it
5. **De-domains:** writes a "this lets you do X" statement that is portable to other domains
6. Drafts the property markdown file in the library format
7. Shows the draft and asks the user to confirm before writing to `~/.claude/property-library/`

## De-domaining (the load-bearing step)

De-domaining is the step that distinguishes property extraction from generic note-taking. A reference always shows up in a specific domain — lyrics in Apple Music, a spotlight in Linear, a search pill in Reeder. The temptation is to write the property in the language of that domain. Don't.

The Apple Music lyrics scroll fade isn't about LYRICS — it's about focus-through-subtraction, a property usable wherever attention needs modulation: onboarding step focus, modal dimming, list-item highlight, video chapter scrub. The de-domaining step forces the property name and description into language that survives the source-domain stripping. If the property still makes sense after you delete every word about the source app, it's de-domained.

## Composes with

- /property-library — writes new entries here; reads schema from here
- /exposure — extract is the natural next step after each /exposure surface
- /property-inquire — extract is for concrete refs; inquire is for intuitions without refs
- /property-synthesize — properties extracted today become the inventory synthesize draws on tomorrow

## Example invocation

**User:** "/property-extract — in Linear's command palette, when you start typing, everything dims except the matching command. There's no border or color highlight on the match. Just the rest of the world fades."

**Skill response:**

> **Observable behavior:** as query is typed, non-matching commands drop in alpha; the match stays at full opacity. No additive highlight.
>
> **Property:** `focus-through-subtraction` — demote everything around the focal element; the eye's contrast-detection does the work for free.
>
> **Levels:** L2 (configuration), L3 (micro-composition), L5 (interaction)
>
> **Mechanisms:**
> - per-row alpha damping driven by query match
> - gradient-as-mask edge-fade on scroll view
> - inverse-cutout dim with even-odd path
>
> **De-domained:** this property has nothing to do with command palettes or search. It lets you do *attention modulation by demotion* anywhere — onboarding-step focus, video chapter scrub, lyrics scroll, modal presentation, error-state spotlight. Any context where one thing must become focal among many.
>
> **Proposed library entry:** `~/.claude/property-library/focus-through-subtraction.md` (draft below). Write it?

User confirms → file written.

## Library file format

The drafted file matches what /property-library expects exactly:

```markdown
---
name: <kebab-case-property-name>
levels: [L2, L3, L5]
mechanisms:
  - <mechanism 1, concrete UIKit/SwiftUI primitive>
  - <mechanism 2>
  - <mechanism 3>
sources:
  - <app-name>: <one-line context of what was observed>
related-properties:
  - <other property in library, if any>
added: <YYYY-MM-DD>
---

# <Property name in human-readable form>

<One-paragraph intent-shaped description. De-domained — no source-app
vocabulary. Reads as a portable principle.>

## Manifestations across levels

- **L<N> (<level name>):** <how it appears at this level>
- **L<N> (<level name>):** <how it appears at this level>

## Your reflection

<Optional. Left blank by default for user to fill in later via
/property-library reflect.>
```

Filename: `kebab-case-property-name.md` written to `~/.claude/property-library/`.

## Anti-patterns

- Naming the property after the MECHANISM ("gradient mask edge fade") instead of the INTENT ("focus through subtraction")
- Skipping the de-domaining step — leaves the property trapped in its source domain and kills cross-domain transfer
- Writing the file without confirming with the user first
- Tagging only one level when the property actually crosses several
- Listing zero mechanisms (the property must be mappable to API primitives, or it's not yet operational)
- Filing under a name that duplicates an existing entry instead of extending the existing one with a new source
- Letting the source-domain vocabulary leak into the description body even after the name is de-domained
