---
name: property-library
description: Browse, query, and maintain the persistent personal catalog of held design properties at ~/.claude/property-library/
---

# /property-library

The persistent personal catalog of held design properties — storage, query, and manual edits over the markdown files at `~/.claude/property-library/`.

## When to invoke

- You want to browse what properties you've accumulated (by level, tag, or recency)
- You need to look up a specific property's mechanisms / sources / reflection before applying it
- You want a semantic query like "what properties apply to onboarding" against your held vocabulary
- You're manually curating: pruning duplicates, editing a reflection, renaming an entry

## When NOT to invoke

- You saw a reference and want to capture it → use `/property-extract` (it writes here, but extraction is its job)
- You have an intuition but no concrete reference → use `/property-inquire`
- You're designing something and want properties + mechanisms applied → use `/property-synthesize`
- You want fresh references surfaced → use `/exposure`

This skill is the substrate. It does not extract, synthesize, or discover — it stores, retrieves, and curates.

## Input

A sub-command plus its arguments. No design intent, no reference description, no intuition — those belong to sibling skills.

## Sub-commands

- `browse [--level Lx] [--category foo] [--recent N]` — list properties as a table; filter by level tag, cross-cutting category, or recency
- `show <property-name>` — render one property's full markdown (frontmatter + body + reflection)
- `query <natural-language-question>` — semantic search across the library; returns ranked property names with one-line relevance notes
- `add` — interactive manual entry (rare; most additions flow through `/property-extract` or `/property-inquire`)
- `prune` — surface candidates for removal: duplicates, stale entries, properties never referenced by other entries' `related-properties`
- `reflect <property-name>` — append to or edit the reflection section of one entry

## Output

- `browse` — a compact table: name, levels, mechanism count, source count, added date
- `show` — the full markdown rendered inline
- `query` — ranked list of property names with one-line "why it matches" notes; offers to chain into `show`
- `add` — confirms the new file written, with its path
- `prune` — list of removal candidates with the reason flagged; user confirms each before deletion
- `reflect` — confirms the entry updated, shows the new reflection text

## Library file format

Path: `~/.claude/property-library/<kebab-case-name>.md`. One file per property. All entries must validate against this shape; `add` and writes from sibling skills must conform.

```markdown
---
name: focus-through-subtraction
levels: [L2, L3, L5, L7]
mechanisms:
  - gradient-as-mask (edge-fade scroll views)
  - per-row alpha damping
  - inverse-cutout dim with even-odd path
sources:
  - apple-music: lyrics view scroll fade
  - linear: command palette spotlight
  - reeder: search highlight pill
related-properties:
  - photometric-continuity
  - time-varying-mask-coupled-to-input
added: 2026-05-16
---

# Focus through subtraction

Don't amplify the focal element; demote everything around it. The eye's
contrast-detection does the work for free.

## Manifestations across levels

- **L2 (configuration):** edge-fade gradient mask on a scroll view
- **L3 (composition):** per-cell alpha damping in a list
- **L5 (interaction):** tap dims everything except the focal row
- **L7 (transition):** modal presentation dims the parent

## Your reflection

[Optional one-paragraph note — why this property matters to you.]
```

Rules:
- Filename = kebab-case of `name` + `.md`
- Frontmatter required; reflection optional
- `levels` is always an array, even if one element; values from `L0`–`L13`
- `mechanisms`: 1–3 concrete UIKit / SwiftUI / Core Animation primitives
- `sources`: `app-slug: one-line context` (specific, not generic)
- `related-properties`: kebab-case names that exist (or are about to exist) in the library
- `added`: ISO date

## Composes with

- `/property-extract` — writes new entries here after de-domaining a reference
- `/property-inquire` — writes new entries here after Socratic articulation
- `/property-synthesize` — reads from here to surface properties matching a design brief
- `/complementary` — reads `related-properties` graph to surface adjacent perimeter
- `/exposure` — pulse-mode chains into `/property-extract` which writes here

## Example invocation

```
/property-library query "what should I reach for in onboarding"
```

Returns:

```
1. progressive-commitment       — L9 manifestation: tiny choices precede asks
2. focus-through-subtraction    — L7 manifestation: dim parent on present
3. velocity-preservation        — L5/L6: carry input energy into next state
4. tonal-stepping               — L2: hierarchy without borders

Run `/property-library show <name>` to expand.
```

Another:

```
/property-library browse --level L6
```

Returns a table of every property whose `levels` array contains `L6`, sorted by `added` descending.

## Anti-patterns

- Calling `/property-library add` when you have a fresh reference — the extraction work (de-domaining, mechanism mapping, level tagging) belongs in `/property-extract`. Manual `add` is for entries you've already drafted by hand.
- Asking this skill "which properties apply to my design?" expecting analysis — that's `/property-synthesize`. This skill returns matches; it does not reason about fit.
- Storing mechanisms as top-level entries. The library holds properties (intent-shaped). Mechanisms live inside a property's frontmatter.
- Letting `related-properties` point to nonexistent entries. `prune` flags these as broken edges.
- Editing files outside the documented frontmatter shape — sibling skills assume the schema and will fail silently on malformed entries.
