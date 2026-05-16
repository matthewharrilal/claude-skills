# Property Lens Suite

A skill suite for accumulating, retrieving, and applying held design properties — the held-vocabulary-of-intents that distinguishes engineers with taste from engineers with API knowledge.

This document is the canonical reference. Each individual skill file (`~/.claude/skills/<skill>/SKILL.md`) is a self-contained operational spec; this document explains the suite's shape, composition patterns, and design philosophy.

---

## Origin & Philosophy

**The problem:** Mechanism-based holding ("I know `CAGradientLayer` can be a mask") doesn't compound. It's API-shaped and only helps you in the specific context where you originally learned it. Property-based holding ("I know that *focus-through-subtraction* is a design property — and one of the mechanisms that delivers it is gradient-mask edge-fading") compounds because the property is portable and the mapping to mechanisms is flexible.

**The thesis:** Senior-staff design instinct = (held property vocabulary) × (bidirectional fluency between properties and mechanisms) × (continuous discovery loop that keeps adding to the vocabulary).

**The suite's purpose:** Operationalize all three. Build a personal property library, support both directions (property → mechanism for design synthesis; mechanism → property for learning extraction), and make passive discovery cheap enough to do habitually.

---

## Relationship to the 10/90 framework

The existing 10/90 skills handle different parts of the design cognition stack. The new suite extends, doesn't replace:

| Existing skill | What it answers | Layer |
|---|---|---|
| `/gauge` | What tier of thinking am I operating at? | Calibration |
| `/cartography` | Which iOS primitives exist for this domain? | Mechanism enumeration |
| `/ninety` | What hidden Apple-internal knowledge enables these? | Mechanism deep-knowledge |
| `/conjecture` | How do these mechanisms compose into a solution? | Mechanism composition |
| `/lens-check` | Run the full cognition pass | Generic orchestrator |

**Gap:** None of these name properties as first-class objects. They operate at the mechanism level. The Property Lens Suite adds the missing **property layer** on top.

| New suite skill | What it answers | Layer |
|---|---|---|
| `/property-library` | What's in my held vocabulary? | Property storage |
| `/property-extract` | What property is underneath this reference? | Property input (concrete) |
| `/property-inquire` | What property is underneath my intuition? | Property input (Socratic) |
| `/exposure` | What references should I study? | Property input (discovery) |
| `/property-synthesize` | What properties + mechanisms apply to my design? | Property output (design) |
| `/complementary` | What adjacent polish/properties am I missing? | Property output (perimeter) |
| `/contamination-check` | Where did non-iOS instincts bleed in? | Property output (audit) |
| `/level-place` | Which level of the stack am I working at? | Property navigation |
| `/feature-pass` | Full pass on a new feature with active research | Specialized orchestrator |
| `/design-lens-check` | Chain the suite for a full design pass | Generic orchestrator |

The two orchestrators (`/design-lens-check`, `/feature-pass`) are distinct: the first chains existing knowledge cheaply; the second dispatches active research agents and is the entry point for new feature design work.

---

## The Taxonomy (locked)

Properties manifest at multiple levels of the iOS experience stack. The taxonomy gives navigational coordinates for placing a property, a problem, or a reference.

### Vertical levels

| Level | What lives here |
|---|---|
| **L0 Substrate** | OS, hardware, framework, deployment target |
| **L1 Primitive** | Raw API atoms (UILabel, CAGradientLayer, UIPanGestureRecognizer) |
| **L2 Configuration** | A primitive with properties set (a UILabel with specific font/color/line-height) |
| **L3 Micro-composition** | Bundled primitives with internal logic, no public contract (ChatBubbleView's 3-label internals) |
| **L4 Component** | A composition with public API + behavioral contract (a complete reusable widget) |
| **L5 Interaction** | Gesture + response surface (pinch, swipe, tap-and-hold) |
| **L6 Motion** | Animation choreography (timing, easing, springs, sequencing) |
| **L7 Transition** | One state-bundle to another (push, present, morph) |
| **L8 Screen** | A complete feature surface (layout, state, navigation) |
| **L9 Flow** | Multi-screen sequences (onboarding, purchase, recovery) |
| **L10 Information Architecture** | Organization + navigation structure |
| **L11 System Integration** | Widgets, Live Activities, Spotlight, deep links, Shortcuts |
| **L12 Lifecycle** | App states, scene activation, restoration |
| **L13 Substrate Services** | Persistence, network, sync, identity |

### Cross-cutting concerns

These apply at every level:

- **Accessibility** (VoiceOver, Dynamic Type, Reduce Motion, Switch Control)
- **Internationalization** (locale, RTL, variable-length text)
- **Privacy** (data access, permissions, explanations)
- **Performance** (memory, frame rate, energy, launch time)
- **Failure modes** (network failure, low storage, low battery)
- **Observability** (analytics, telemetry, crash signals)

### The key insight

Properties rarely live at one level. A rich property like *velocity preservation* manifests at L1 (primitive choice: which spring implementation), L5 (interaction: gesture velocity injection), and L6 (motion: integration discipline). The taxonomy is a coordinate system, not a partition.

---

## The Library Substrate

Persistent personal artifact at `~/.claude/property-library/`. One markdown file per property:

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

[Optional one-paragraph note — why this property matters to you, where
you've felt it work, what makes it taste-shifting for YOU.]
```

**Conventions:**
- Filename = `kebab-case` of property name + `.md`
- Frontmatter is required; reflection is optional
- Levels are an array tag, even if just one
- Mechanisms list 1-3 concrete UIKit/SwiftUI primitives
- Sources include the specific app and a one-line context
- Related-properties enables graph navigation

**Browsable in:** any editor. Queryable via grep. Version-controllable as plain text. Skill-tool-readable.

---

## The Discovery Loop

Building taste passively is what compounds. The suite supports this via:

`/exposure --pulse` — fires on a weekly cadence (cron-schedulable). Each fire:

1. Picks 2-3 prestige references from **deliberately distant domains**
2. Sources rotated across: Mobbin / Dribbble / Godly / Page Flows / 60fps.design / Apple WWDC / prestige iOS apps across domains
3. **No game sources** (excluded per user preference)
4. Runs `/property-extract` on each
5. Proposes properties for library addition
6. Optionally writes a reflection prompt

Over months, the library accumulates entries from domains you never built in. The cross-domain transfers — the lyrics-mask-applies-to-onboarding move — become available the moment a related design problem appears.

**The compounding mechanic:** taste = vocabulary size = (references encountered × extraction rate). A skill that makes extraction cost approximately zero turns passive observation into compounding taste.

---

## The 10 Skills — Detail

### 1. `/property-library`

**Purpose:** The persistent personal catalog. All other skills read from / write to it.

**Invocation patterns:**
- `/property-library browse` — list all properties, optionally filtered by level/tag
- `/property-library show <name>` — render a specific property in detail
- `/property-library query <natural-language>` — semantic search (which properties apply to X)
- `/property-library add` — manual addition (rare; usually goes through extract/inquire)
- `/property-library prune` — surface candidates for removal (duplicates, outdated, never-referenced)
- `/property-library reflect <name>` — add or edit the reflection field

**When to invoke:** anytime you need to look at, query, or maintain the library. Frequent.

**Input:** command + optional query / property name
**Output:** library content rendered or modified

---

### 2. `/property-extract`

**Purpose:** Backward direction. Take a concrete observed reference and extract its underlying property. **De-domain explicitly** — the output names what the property lets you do that has nothing to do with the source domain.

**Invocation:** `/property-extract <reference-description>` (text / link / screenshot reference)

**When to invoke:**
- You saw a cool thing in an app and want to capture it
- You're walking through a prestige app and want to bank what you observed
- You're studying a WWDC talk and want to extract held principles
- An `/exposure` fire surfaced something interesting

**When NOT to invoke:**
- You only have a half-formed intuition with no concrete reference — use `/property-inquire` instead

**Process:**
1. Identifies the observable behavior
2. Names the underlying property (intent-shaped, not mechanism-shaped)
3. Tags level(s) it manifests at
4. Maps mechanisms that deliver it
5. **De-domains:** "This property lets you do X that has nothing to do with [source domain]"
6. Proposes library addition; confirms before writing

**Output:** a property entry ready for library + de-domained transferability notes

---

### 3. `/property-inquire`

**Purpose:** Socratic mode. You have a half-formed intuition you can't articulate. The skill helps you name it through back-and-forth questioning.

**Invocation:** `/property-inquire` then describe the intuition

**When to invoke:**
- "Something about [observation] feels right but I can't name it"
- You're stuck between two design options and can't articulate why one feels better
- You have a vague sense that a property matters but no reference to anchor it
- Mid-implementation, something feels off but you can't pinpoint it

**When NOT to invoke:**
- You have a concrete reference — use `/property-extract` (faster, more structured)
- You need design output, not articulation — use `/property-synthesize`

**Process:** asks structured questions to surface the held belief; ends with a candidate property name + a check on whether to add to library

**Output:** named property (potentially nuanced) + decision on library addition

---

### 4. `/exposure`

**Purpose:** Discovery — finding new references to study.

**Two modes:**
- `/exposure --topic <area>` — **targeted.** "I'm thinking about empty states this week. Surface prestige iOS empty states."
- `/exposure --pulse` — **non-targeted, cadence-scheduled.** Surfaces 2-3 prestige references from deliberately distant domains.

**When to invoke targeted mode:**
- About to design a feature category you don't have strong references for
- Diving into a new area (motion, IA, materials)
- Trying to expand the property library in a specific direction

**When to invoke pulse mode:**
- On schedule, to build taste passively
- During downtime between active projects
- Manually when you want a "show me something new" surprise

**Sources (locked):**
- Mobbin
- Dribbble
- Godly
- Page Flows
- 60fps.design
- Apple WWDC + HIG resources
- Prestige iOS apps across domains
- **NOT game UIs** (excluded per preference)

**Output:** 2-3 references with brief context; optionally chains into `/property-extract` on each

---

### 5. `/property-synthesize`

**Purpose:** Forward direction — the workhorse. You're designing something; surface relevant properties from the library + mechanism mappings. **Includes cross-domain surfacing** (properties from distant app categories that transfer).

**Invocation:** `/property-synthesize <design intent / brief>`

**Sub-modes (via flags):**
- `--diagnose-transfer` — "I tried to apply property P and it didn't land in my context. Diagnose why and find a version that fits."
- `--surface-tensions` — "Articulate the philosophical tensions in this design choice. Show prestige references that resolved each pole."
- `--decision-lock` — "This decision is about to commit. Flag if it's load-bearing/irreversible and surface what to verify before committing."

**When to invoke:**
- Starting design work on a specific component / interaction / screen
- Reviewing your own design and wanting library-grounded critique
- Two options on the table and you need property language to articulate which

**When NOT to invoke:**
- Starting a NEW FEATURE (use `/feature-pass` — it includes active research)
- You don't have a specific design intent yet (use `/property-inquire`)

**Process:**
1. Reads design intent
2. Pulls relevant properties from library (direct + cross-domain)
3. Surfaces mechanisms for each
4. Optionally runs sub-mode logic (diagnose, tension, decision-lock)

**Output:** property shortlist + mechanism mappings + (optional) sub-mode analysis

---

### 6. `/complementary`

**Purpose:** Surface what you're NOT thinking about. Adjacent polish + adjacent properties + polish ranking.

**Sub-modes:**
- (default) — adjacent polish ideas at the perimeter of your current work
- `--rank` — rank polish opportunities by leverage-per-hour given current state
- `--adjacent-properties` — surface properties at the property-perimeter (what's adjacent to what you're working on)

**When to invoke:**
- Feature is "done" — what perimeter cases am I missing?
- You have polish budget and need to allocate it
- Designing component X and want to know what adjacent properties matter (haptics, motion, state-restoration, accessibility)

**Example:** you're polishing a chat morph. `/complementary` surfaces: keyboard dismissal during morph, haptic at commit, Live Activity behavior, Reduce Motion path, state-restoration mid-morph. These are perimeter cases that bite founding engineers post-ship.

**Output:** ranked or unranked list of adjacent opportunities

---

### 7. `/contamination-check`

**Purpose:** Reactive audit. Surface non-iOS instincts (web/Android/Flutter patterns) that bled into your code or design.

**Invocation:** `/contamination-check <code / screenshot / design description>`

**When to invoke:**
- Reviewing your own code that originated in web/Android instinct
- Pre-shipping audit of a feature surface
- Onboarding a teammate from another platform and reviewing their iOS work

**Detects:**
- Border-heavy hierarchy (web instinct) where tonal step would be iOS-native
- Custom hover states (web instinct) where press states should be iOS-native
- Full-screen modals (web instinct) where sheets would be iOS-native
- Hardcoded font sizes that break Dynamic Type
- Custom icon sets where SF Symbols would do
- Material Design shadows where iOS uses materials
- Tab-bar overuse (Android) or sidebar-on-iPhone

**Output:** flagged items + suggested iOS-native equivalents

---

### 8. `/level-place`

**Purpose:** Navigation. Map a problem onto the L0–L13 taxonomy.

**Invocation:** `/level-place <problem description>`

**When to invoke:**
- Stuck on a design decision; want to check you're working at the right level
- About to over-engineer at L3 when the problem is actually L10
- Mid-conversation with someone and want to clarify "we're discussing different levels"
- Short, fast, used constantly

**Output:** primary level + secondary levels touched + cross-cutting concerns that apply

**Example:** "I'm trying to decide between a tab bar and a sidebar." → "Primary: L10 (information architecture). Touches: L4 (the tab bar component itself), L9 (how tab choice affects flow). Cross-cutting: accessibility (sidebar harder for one-handed use)."

---

### 9. `/feature-pass`

**Purpose:** **Specialized orchestrator with active research dispatch.** The entry point for "I'm starting new feature design work and want the full pass."

**Invocation:** `/feature-pass <feature idea / brief / mockup link>`

**Distinct from `/design-lens-check`:**
- `/design-lens-check` chains existing knowledge cheaply (~30 sec)
- `/feature-pass` dispatches 4-5 parallel research agents; takes ~5-10 minutes; returns a structured design pass with fresh inspiration

**When to invoke:**
- Starting design on a new feature
- Re-thinking an existing feature with fresh eyes
- Pre-quarter planning when scoping multiple features
- Founding-iOS-engineer "blank canvas" moments

**When NOT to invoke:**
- Routine design work where library knowledge is sufficient (use `/property-synthesize`)
- You're just looking for one thing (use the appropriate single-purpose skill)

**Process:**

1. **Philosophical mapping** — articulates feature's intent, brand voice, philosophical tensions
2. **Taxonomy placement** — maps onto L0–L13 (usually crosses 4-6 levels)
3. **Library property mapping** — pulls relevant held properties (direct + cross-domain)
4. **Active research dispatch** — 4-5 parallel agents covering:
   - AAA iOS apps doing same/adjacent feature
   - AAA iOS apps in cross-domain categories whose properties transfer
   - Mobbin / Dribbble / Godly / Page Flows / 60fps.design for screen compositions
   - Apple WWDC + HIG relevant material
   - Complementary perimeter (adjacent properties + polish opportunities)
5. **Synthesis** — structured deliverable
6. **Library update on confirmation** — extracted properties from research get added

**Output:** a structured "feature design pass" document with philosophy + taxonomy + properties + inspiration findings + cross-domain transfers + complementary polish + open tensions + recommended mechanism shortlist

---

### 10. `/design-lens-check`

**Purpose:** Generic orchestrator. Composes the suite (plus optionally the 10/90 skills) for a full property-first design pass on existing work.

**Invocation:** `/design-lens-check <design under review>`

**Distinct from `/feature-pass`:**
- Doesn't dispatch active research
- Faster (~30 sec)
- Used for review of existing/in-progress work, not fresh inception

**Process (configurable chain):**
1. `/level-place` — where does this work live?
2. `/property-synthesize` — which library properties apply?
3. `/complementary --adjacent-properties` — what perimeter is missing?
4. `/contamination-check` — any non-iOS instincts to flag?
5. Optionally chains 10/90 skills (gauge, cartography, ninety, conjecture)

**Output:** structured review pass with property language

---

## Composition Patterns

The skills compose. Some common chains:

### "I saw a cool thing"
```
/property-extract <reference> 
  → (extracted property + de-domaining notes)
  → /property-library add
```

### "I'm starting a new feature"
```
/feature-pass <feature brief>
  → (research agents dispatched in parallel)
  → structured design pass returned
  → optionally /property-library add for new extractions
```

### "I'm reviewing my own design"
```
/design-lens-check <design under review>
  → /level-place
  → /property-synthesize
  → /complementary --adjacent-properties
  → /contamination-check
  → structured review
```

### "I have an intuition but no reference"
```
/property-inquire
  → (Socratic back-and-forth)
  → named property
  → /property-library add (optional)
```

### "I'm exploring a topic"
```
/exposure --topic <area>
  → (references surfaced)
  → /property-extract on each (optional)
  → /property-library add
```

### "I want to build taste passively"
```
/exposure --pulse (auto-scheduled weekly)
  → 2-3 cross-domain references
  → /property-extract on each
  → properties proposed for library
  → user confirms additions
```

### "Stuck on a design decision"
```
/property-synthesize <decision> --surface-tensions
  → philosophical tensions named
  → prestige references resolving each pole
  → recommended direction
```

### "About to commit a load-bearing decision"
```
/property-synthesize <decision> --decision-lock
  → flag if irreversible
  → surface what to verify
  → recommend / warn
```

### "Tried something and it doesn't land"
```
/property-synthesize <attempted-design> --diagnose-transfer
  → identifies why property doesn't fit context
  → suggests context-appropriate version
```

### "What polish should I do next?"
```
/complementary --rank
  → ranked opportunities by leverage/hour
  → recommendation
```

---

## Workflows by Scenario

Real-world scenarios from a founding iOS engineer's job, with the skill chain that addresses each:

### Scenario: "I just joined the company and got the iOS-from-scratch mandate"
1. `/exposure --topic "founding iOS app from scratch"` — see how prestige indie apps shipped their v1
2. `/feature-pass "the core product loop"` — full pass on the heart of the app
3. `/property-library browse --level L10` — see IA properties to choose from
4. Make navigation choice + first feature surface choices

### Scenario: "I have to build feature X by next week"
1. `/feature-pass <feature X brief>` — get the full inception pass with research
2. (during build) `/property-synthesize <specific component>` for component-level decisions
3. (pre-ship) `/complementary` — what's the perimeter I haven't thought about
4. (pre-ship) `/contamination-check <my code>` — am I shipping non-iOS instincts?

### Scenario: "I have a moment to think about an interaction that's not landing"
1. `/property-inquire` — articulate what feels off
2. `/property-synthesize --diagnose-transfer` — diagnose why a known property didn't fit
3. `/property-library query <related>` — find adjacent properties
4. Iterate

### Scenario: "Weekly Friday — develop taste with no specific goal"
1. `/exposure --pulse` (or auto-fires)
2. For each reference: `/property-extract`
3. Add to library
4. Optionally write reflection on the most striking one

### Scenario: "Saw a cool thing in [unrelated app]"
1. `/property-extract <description>` — capture it with de-domaining
2. Library entry added
3. Later, when a related design problem appears, `/property-synthesize` will surface it automatically

### Scenario: "Reviewing shipped work to improve next version"
1. `/design-lens-check <shipped feature>` — full review pass
2. `/contamination-check` — any non-iOS bits to clean
3. `/complementary --rank` — polish priorities for v2
4. Plan v2 work

### Scenario: "Pre-quarter planning across multiple features"
1. For each feature: `/feature-pass <brief>` (parallelizable)
2. `/property-library query "patterns across these features"` — find shared properties to leverage
3. Build a shared design system from the union of properties used

### Scenario: "Teammate from web background wrote some UI"
1. `/contamination-check <their code>` — surface non-iOS patterns kindly
2. `/property-synthesize <each finding>` — show the iOS-native version
3. Code-review with property language, not personal-style language

---

## Orchestrator Differentiation

Two orchestrators exist. They serve different moments:

| Aspect | `/design-lens-check` | `/feature-pass` |
|---|---|---|
| **When to use** | Review existing/in-progress work | Start new feature design work |
| **Cost** | ~30 seconds | ~5-10 minutes (parallel agents) |
| **Active research?** | No, reads library | Yes, dispatches agents |
| **Input shape** | Design under review | Feature brief / idea |
| **Output shape** | Property-first review pass | Full feature design pass with inspiration |
| **Library impact** | Reads only | Reads + proposes additions from research |
| **Frequency of use** | Often | Less often, but at meaningful moments |

Rule of thumb: **`/feature-pass` for inception, `/design-lens-check` for review.**

---

## When to Use Which Skill — Quick Reference

| Situation | Skill |
|---|---|
| Saw something cool; want to capture | `/property-extract` |
| Half-formed intuition; want to articulate | `/property-inquire` |
| Want to browse what I've learned | `/property-library` |
| Starting a new feature from scratch | `/feature-pass` |
| Designing a component / interaction now | `/property-synthesize` |
| Reviewing my own design | `/design-lens-check` |
| What perimeter am I missing? | `/complementary` |
| What polish has highest leverage? | `/complementary --rank` |
| Auditing for non-iOS instincts | `/contamination-check` |
| Stuck — what level am I at? | `/level-place` |
| Want to research a topic | `/exposure --topic` |
| Want continuous-education | `/exposure --pulse` (scheduled) |
| Have two design options; can't decide | `/property-synthesize --surface-tensions` |
| Tried a known pattern, doesn't land | `/property-synthesize --diagnose-transfer` |
| About to commit a load-bearing decision | `/property-synthesize --decision-lock` |
| Specific property's content | `/property-library show <name>` |

---

## Glossary

- **Property** — an intent-shaped, mechanism-portable named design principle. E.g., "focus through subtraction" (not "use a gradient mask").
- **Mechanism** — the API-level primitive that delivers a property. E.g., `CAGradientLayer` as `layer.mask`.
- **De-domaining** — extracting a property such that it's described in terms portable to other domains. The lyrics-mask is about "focus through subtraction," not about "lyrics."
- **Cross-domain transfer** — applying a property from one app category to a different category. The high-leverage move.
- **Adjacent property** — a property that lives at the perimeter of the one you're currently working on; often missed.
- **Auxiliary design sense** — the part of taste that comes from references in domains unrelated to what you're building. The hardest to cultivate; highest compounding.
- **Discovery loop** — the passive-education mechanism: scheduled cross-domain exposure → extraction → library accumulation → compounding taste.
- **Held belief / held property** — a property you've internalized to the point that you reach for it instinctively when designing, without re-deriving each time.

---

## Future Extensions

Reserved for skills the suite might grow into:

- `/property-audit` — periodic library quality pass (find duplicates, outdated entries, never-referenced)
- `/property-graph` — visualize the property library as a graph; surface clusters and gaps
- `/team-share` — export/import subsets of the library for team-level taste alignment
- `/design-retrospective` — post-shipped audit using the property library as the rubric
- `/property-evolution` — track how your held vocabulary has changed over time

---

## Integration with Memory System

The library at `~/.claude/property-library/` is distinct from `~/.claude/memory/`. The memory system tracks conversation-derived facts about you/projects; the property library is a deliberate design-knowledge artifact.

The two interoperate:
- When a `/property-extract` invocation captures something significant, it can write a memory pointer (`reference_property_library.md`) so the assistant remembers to consult the library for design questions
- When `/memory` notes design preferences ("matt prefers serif body in editorial contexts"), that observation can be promoted to a property library entry

---

*End of suite reference.*
