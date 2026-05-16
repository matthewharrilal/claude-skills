---
name: exposure
description: Surface 2-3 prestige iOS references — targeted by topic or cross-domain pulse — for property extraction
---

# /exposure

Discovers new prestige references worth studying — either targeted to a topic you're actively designing for, or as a non-targeted weekly pulse from deliberately distant domains to keep the property library compounding.

## When to invoke

**Targeted mode (`--topic`):**
- About to design a feature category you don't have strong references for
- Diving into a new area (motion, IA, materials, empty states, onboarding, etc.)
- Trying to expand the property library in a specific direction
- You can name what you want to study but don't have specific apps in mind

**Pulse mode (`--pulse`):**
- On weekly cadence (cron-schedulable) to build taste passively
- During downtime between active projects
- Manually when you want a "show me something new" surprise
- Anytime the library hasn't grown in a while

## When NOT to invoke

- You already have a specific reference to extract from — use `/property-extract` directly
- You're designing actively and need to consult held vocabulary — use `/property-synthesize`
- You have a half-formed intuition without references — use `/property-inquire`
- You want to browse what you already have — use `/property-library browse`

## Modes

### `--topic <area>`
- **Input:** a topic area as text (e.g., "empty states", "modal dismissal motion", "onboarding without forms")
- **Output:** 2-3 curated prestige references in that area, each with one-line context on why it's interesting from a property perspective
- **Default chain:** offers to run `/property-extract` on each before exiting

### `--pulse`
- **Input:** none (typically cron-fired or manually invoked for serendipity)
- **Output:** 2-3 prestige references from **deliberately distant domains** — chosen to be far from whatever the user has been working on recently
- **Default chain:** runs `/property-extract` on each by default (this is the compounding loop); user confirms which extractions become library additions

## Sources (locked)

- **Mobbin** — iOS pattern reference gallery
- **Dribbble** — visual references (filter aggressively for prestige iOS)
- **Godly** — curated web/mobile gallery
- **Page Flows** — UX flow recordings
- **60fps.design** — motion/interaction captures
- **Apple WWDC + HIG** — first-party authoritative content
- **Prestige iOS apps across domains** — Things 3, Linear, Apollo, Bear, Fantastical, Halide, Procreate, Reeder, Tot, Soulver, Overcast, Carrot Weather, Apple first-party (Music, Notes, Mail, Maps, Photos), etc.

**NOT in scope:** game UIs are explicitly excluded per user preference. Do not surface mobile games, game launchers, or game-derived patterns even when they would technically match the topic.

## Process

### Targeted mode
1. Receive topic
2. Survey locked sources for prestige references on that topic
3. Return 2-3 references — each with: app/source, the specific surface or moment, one-line context naming what's property-interesting about it
4. Ask if user wants to chain into `/property-extract` on each

### Pulse mode
1. Read recent activity signals (what the user has been working on) — chat, calendar, notes, project files, recent conversations
2. Rotate through sources (track which source was used last fire; do not repeat the same source two fires in a row)
3. Pick references from **deliberately distant domains** — if user has been working on chat, surface music, art tool, hardware-product, audio, or photography apps; if user has been working on productivity, surface entertainment or creative-tool apps
4. Each reference gets a brief "why this is interesting from a property perspective" hint
5. Chain into `/property-extract` on each by default
6. User confirms which extractions become library additions

## Cross-domain rotation logic (pulse mode)

The cross-domain rotation is **the load-bearing capability** of pulse mode. Without it, pulse degenerates into "more references in the domain I'm already saturated in," which adds little.

The auxiliary-design-sense rationale: the highest-leverage property transfers come from domains the user is NOT working in. The lyrics-mask insight doesn't live in chat apps — it lives in music apps. The pinch-to-resize-with-velocity insight doesn't live in productivity apps — it lives in photo editors. The compounding mechanic only works if pulse deliberately samples across domains the user isn't currently swimming in, because:

1. Same-domain references mostly confirm existing intuitions (low marginal vocabulary gain)
2. Cross-domain references force de-domaining at the moment of extraction (high marginal vocabulary gain)
3. The library accumulates portable properties precisely because the source domain and use domain are different

If pulse can't read recent-activity signals to determine "what the user is working in," default to rotating across an internal domain wheel (productivity → music → photography → reading → finance → creative-tool → hardware-product → communication → utility → editorial) and pick something 4+ steps away from the last pulse's domain.

## Cadence (pulse mode default)

Weekly. Adjustable via `--cadence weekly|biweekly|monthly`. The `/schedule` skill can wire this to cron.

## Composes with

- `/property-extract` — runs on each reference surfaced (the compounding loop)
- `/property-library` — extracted properties land here
- `/property-inquire` — if a surfaced reference triggers a vague intuition rather than a clean extraction
- `/feature-pass` — distinct: `/feature-pass` dispatches active research agents for a specific feature; `/exposure` is the lightweight passive-discovery skill

## Example invocation (targeted)

```
User: /exposure --topic "empty states"

Output:
1. Things 3 — Today screen when zero tasks. The empty state is a single
   centered illustration with a hairline-light hint string. No CTA, no
   "Add your first task" button. Property-interesting: confidence-as-restraint;
   the empty state trusts the user already knows what the app does.

2. Linear — issue board with no issues in a status column. Column header
   stays full-strength; the body shows a single greyed-out micro-line of
   text. Property-interesting: structural-continuity across states (column
   doesn't visually collapse just because it's empty).

3. Apple Mail — empty inbox after archive-all. Shows a system-illustration
   sized to ~1/3 the screen, anchored above mid-line, with a status string
   in secondary text color. Property-interesting: vertical-anchoring above
   center (gives the illustration "presence" without making it dominate).

Run /property-extract on each? [y/N]
```

## Example invocation (pulse)

```
User: /exposure --pulse

(Detected recent activity: chat / messaging UI work)
(Last pulse source: Mobbin. Rotating to: 60fps.design)
(Domain wheel: chat is in communication. Sampling: photography, creative-tool, hardware-product)

Output:
1. Halide — capture-mode switcher (photography). The mode wheel uses
   distance-from-center to fade non-selected modes. Property-interesting:
   focus-through-subtraction at a control surface, not a content surface.

2. Procreate — color picker pull-and-rest (creative-tool). The picker
   appears under the finger and stays there with sub-pixel precision until
   release. Property-interesting: control-anchored-to-finger, no drift,
   no implicit center-snap.

3. Nothing X — earbud battery state (hardware-product). The battery
   visualization breathes at a rate proportional to remaining charge.
   Property-interesting: time-varying-state-encoding-via-rhythm, no number,
   no bar.

Running /property-extract on each by default. Confirm additions after each.
```

## Anti-patterns

- Pulse mode that always pulls from the same source — kills the cross-domain benefit
- Pulse mode that stays in the user's current working domain — defeats the entire point
- Pulling references the user has already seen many times — surface fresh material; rotate
- Targeted mode that just lists apps without curating to the topic — every reference must include why it's interesting for THIS topic
- Surfacing references without a property hint — the property-perspective context is what makes the reference extractable
- Including game references — explicitly excluded per user preference, no exceptions
- Surfacing 5-10 references — 2-3 is the discipline; more dilutes attention and breaks the extract loop
- Letting pulse mode skip the extraction chain — the extraction IS the compounding mechanic; references without extraction are just bookmarks
