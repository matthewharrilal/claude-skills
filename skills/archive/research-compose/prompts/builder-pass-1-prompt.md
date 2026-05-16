# Builder Pass 1: STRUCTURE

You are an Opus-level builder constructing a designed HTML page from content markdown. This is **Pass 1 of 3** — your job is to establish the structural foundation that Passes 2 and 3 will enrich and harden.

---

## Reading Order (FOLLOW EXACTLY)

You have received multiple documents. Read them in THIS order — the sequence matters for how you internalize the creative direction:

1. **Research Package (_package-pass-1.md)** — READ FIRST. Contains:
   - Section 0: Soul Checklist (non-negotiable constraints)
   - Section 1: Build Context (metaphor + content map)
   - Section 2: Mechanism Selections (what to deploy, with CSS examples)
   - Section 9: Consumption Protocol (how to sequence your work)
   - Section 10: Compositional Questions (generative "What if..." invitations — explore 2-3 during build)
   - Section 11: Structural Propositions (OPTIONAL — content-derived spatial layouts to consider. Decide ADOPT/MODIFY/REJECT for each)

2. **Conviction Brief (_tc-brief.md)** — READ SECOND. The creative fuel. Contains the metaphor, emotional arc, spatial direction, and compositional intent. This shapes your CREATIVE INTENT.

3. **Content Markdown (content.md)** — READ THIRD. The actual article you are designing. Map its sections to zones based on the brief's compositional arc.

4. **CSS Tokens (tokens.css)** — Reference. 65 CSS custom properties defining the design system's palette, typography, spacing, and borders.

5. **Components CSS (components.css)** — Reference. Locked CSS implementations for callouts, code blocks, tables, headers, footers, bento grids.

**WHY THIS ORDER:** The research package tells you WHAT mechanisms to deploy and HOW to sequence your work. The brief tells you WHY — the metaphor, the arc, the conviction. The content tells you WHAT you're designing. The tokens and components tell you WITH WHAT. If you read tokens first, you will compose from available tools rather than from conviction.

---

## Your Task: Build the Structural Foundation

### What You Are Building

A single self-contained HTML file with all CSS inline in a `<style>` block. This is the STRUCTURE pass — you are establishing:

1. **Zone skeleton** — The major spatial divisions of the page, mapped from the brief's compositional arc
2. **Mechanism deployment** — Apply the mechanisms listed in Section 2 of the research package
3. **Typography hierarchy** — Display, heading, body, and code zones using the font trinity
4. **Responsive scaffolding** — CSS that works at 1440px, 1024px, and 768px
5. **Content mapping** — All content from content.md placed into appropriate zones

### What You Are NOT Building (Yet)

- Micro-density enrichment (Pass 2 handles zone-by-zone findings)
- Anti-pattern defense (Pass 3 handles hardening)
- Case study CSS integration (Pass 2 handles this)

Focus on STRUCTURE — the skeleton that subsequent passes will enrich.

### Section 10: Explore Compositional Questions

Section 10 of the research package contains 5-7 "What if..." questions — generative invitations that produce multi-channel CSS decisions you wouldn't make from mechanisms alone.

**Select 2-3 questions to explore during your build.** Do not attempt all — depth on 2-3 beats breadth on 5-7.

**How to explore a question:**
1. Read the question and its "Implied channels" list (e.g., border-weight, padding, bg-color, font-size, line-height)
2. As you build each zone, ask yourself the question. Let it GENERATE CSS decisions across 3+ channels simultaneously
3. A good question exploration produces CSS changes across **multiple visual channels varying together** — not just one property change

**Example:** If Q2 asks "What if every visual channel compressed as you descend the tower?" — this implies that WITHIN EACH ZONE, you set border-weight, padding, background, font-size, line-height, AND letter-spacing according to that zone's position in the descent. All 6 channels vary TOGETHER by one generative rule.

**Cite question-driven CSS with:** `/* QUESTION Q[N]: [abbreviated question] — [what this CSS explores] */`

**Record your explorations in _pass-1-decisions.md** (see Output section below) — which questions you explored, what CSS they generated, and which channels were affected. Pass 2 will read this to continue or deepen your explorations.

### Section 11: Evaluate Structural Propositions (OPTIONAL)

Section 11 contains 0-3 structural propositions — content-derived spatial layouts with blueprint CSS. Each proposition includes:
- Content logic (WHY this form fits this content)
- Blueprint CSS (a starting point you can adopt, modify, or replace)
- Responsive degradation (how it works at 768px)
- Risk rating and standard vertical alternative

**For each proposition, decide:**
- **ADOPT** — Use the blueprint CSS as your starting point. Follow the Structural Path above.
- **MODIFY** — Change the spatial form while keeping the content logic. Document what you changed and why.
- **REJECT** — Use standard vertical for this section. Note why in _pass-1-decisions.md.

If Section 11 is empty ("No structural propositions"), this is a valid outcome — build standard vertical throughout. Do NOT force structural invention on linear content.

---

## Soul Constraints (NON-NEGOTIABLE)

These are physics of this world, not style choices. Violating ANY of these invalidates the entire build.

```css
/* ABSOLUTE — every element, every zone, no exceptions */
border-radius: 0;
box-shadow: none;

/* NO gradients anywhere */
background: /* solid colors ONLY, never linear-gradient() or radial-gradient() */

/* NO semi-transparent backgrounds */
background: /* rgba() with alpha < 1 is FORBIDDEN. opacity: 1 on all containers */

/* NO cool grays — the palette is warm */
/* Use var(--color-text), var(--color-text-secondary), var(--color-border) from tokens */

/* NO hover lift effects */
/* No translateY, no scale-up on hover */
```

### Container Width

```css
.page-container {
  max-width: 940px; /* 940-960px range */
  margin: 0 auto;
  padding: 0 var(--space-6); /* 24px side padding */
}
```

---

## HTML Document Structure (REQUIRED)

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
  <title><!-- Content title --></title>
  <style>
    /* ALL CSS here — self-contained, no external stylesheets */
  </style>
</head>
<body>
  <!-- Content here -->
</body>
</html>
```

---

## CSS Naming Convention: Concept-Based

Name CSS custom properties and classes by YOUR METAPHOR's concepts, not by position or generic labels.

**DO:**
```css
--stratum-bedrock: #1A1A1A;     /* geological metaphor */
--tide-deep: var(--space-16);    /* oceanic metaphor */
.chamber-primary { ... }         /* architectural metaphor */
```

**DO NOT:**
```css
--bg-section-1: #1A1A1A;        /* positional — says nothing */
--space-large: var(--space-16);  /* generic — no metaphor */
.main-content { ... }            /* generic — no identity */
```

All VALUES must still come from tokens.css custom properties. Your NAMES encode the metaphor; the VALUES are from the design system.

---

## Build Process: Boundary-by-Boundary

Build zone-by-zone, NOT channel-by-channel.

**CORRECT (boundary-by-boundary):**
At each zone boundary, set ALL channels simultaneously:
1. Background color for this zone
2. Typography (font family, size, weight, line-height)
3. Spacing (padding, margins)
4. Border treatment (if any)
5. Content placement

Then move to the next zone boundary and repeat.

**INCORRECT (channel-by-channel):**
Setting all backgrounds first, then all typography, then all spacing. This produces flat, disconnected output where channels don't reinforce each other.

### Transition Table (WRITE THIS FIRST)

Before writing any CSS, create a transition table as an HTML comment:

```html
<!--
TRANSITION TABLE:
Zone 1 (opening) → Zone 2 (rising):
  bg: var(--color-background) → var(--color-zone-dense)
  type: var(--font-display) h1 → var(--font-body) body
  space: var(--space-16) top → var(--space-12) between
  border: none → border-bottom: var(--border-structural) solid var(--color-border)

Zone 2 (rising) → Zone 3 (peak):
  ...
-->
```

This table is your blueprint. Write it BEFORE writing CSS.

### Standard/Structural Build Path

**Standard Path (DEFAULT — use for all zones without Section 11 propositions):**
Build zone-by-zone as described above — vertical stacking with density variation.

**Structural Path (for ADOPTED Section 11 propositions — maximum 2 per build):**
1. Build the standard vertical skeleton FIRST — all zones, all content, working at all breakpoints
2. THEN build the structural section as a SELF-CONTAINED MODULE within its zone
3. Verify the structural module integrates with surrounding zones (no visual disconnection)
4. Verify responsive degradation: the structural layout MUST degrade gracefully at 768px (typically grid → single column)
5. Cite with `/* STRUCTURAL: [content-logic] — [spatial form] */`
6. Document in _pass-1-decisions.md: which proposition, ADOPTED/MODIFIED, what CSS, responsive strategy

**Why standard skeleton first:** If the structural module fails at responsive, you have a working vertical fallback. If you build structure first, failure means starting over.

---

## Checkpoint: Package Traceability — Standardized Citations

**Before writing CSS for any zone, CITE which research package item drives your decision** using the standardized citation format:

```css
/* PACKAGE S2-M03: Border-weight gradient — encodes confidence hierarchy */
.zone-foundation { border-left: var(--border-structural) solid var(--color-text); }

/* PACKAGE S2-M07: Zone backgrounds — alternate to create density rhythm */
.zone-sparse { background: var(--color-zone-sparse); }
.zone-dense { background: var(--color-zone-dense); }

/* QUESTION Q2: "What if each floor..." — zone-specific line-height gradient */
.zone-surface { line-height: 1.8; }
.zone-bedrock { line-height: 1.5; }

/* SOUL: border-radius: 0 */
* { border-radius: 0; }

/* TC-BRIEF: Compositional Arc — descent compression */
.zone-deep { padding: var(--space-4); }
```

**The full citation prefix set:**
- `/* PACKAGE S[N]-M[NN]: [name] — [what] */` — mechanism deployments
- `/* FINDING [ID]: [title] — [action] */` — research findings
- `/* CASE-STUDY [ID]: [technique] — adapted from [source] */` — case study techniques
- `/* SOUL: [constraint] */` — soul constraints
- `/* TC-BRIEF: [section] — [direction] */` — conviction brief
- `/* QUESTION Q[N]: [abbreviated] — [exploration] */` — compositional questions

If you cannot cite a source for a CSS decision, ask yourself: "Am I inventing this, or did the package instruct it?" Invention is acceptable for structural plumbing (layout grid, responsive breakpoints). Invention is NOT acceptable for mechanism deployment — the package specifies which mechanisms to deploy.

## Semantic Budget: Name by Function

**CSS class names should describe the semantic FUNCTION of the element, not its visual appearance or position.**

```css
/* DO: function-based naming */
.zone--authority { ... }     /* what the zone MEANS */
.callout-insight { ... }     /* what the callout DOES */
.content-primary { ... }     /* the content's ROLE */

/* DO NOT: appearance-based naming */
.zone--dark-bg { ... }       /* visual — says nothing about function */
.callout-blue { ... }        /* color — breaks if palette changes */
.section-3 { ... }           /* positional — no semantic value */
```

This is the same principle as concept-based custom properties (see "CSS Naming Convention" section above) but applied to class names. Semantic naming enables the comparison report to track functional intent, not visual coincidence.

## Callout Reinterpretation

**Callouts are NOT decorative boxes — they are density regulators.**

When you encounter content that could be a callout (tips, warnings, asides, quoted material), consider its function in the density progression:

- **Breathing callout:** Sparse callout between dense content zones. Function: reset reader attention. CSS: generous padding, lighter background, no border-left accent.
- **Punctuation callout:** Dense callout within a sparse zone. Function: inject urgency. CSS: tight padding, strong border-left accent, darker background.
- **Transition callout:** Callout at a zone boundary. Function: bridge between density levels. CSS: intermediate density values — padding between sparse and dense zones.

Do NOT make every callout the same visual treatment. The callout's CSS should reflect its POSITION in the density progression, not a uniform template.

## Rhythmic Diversity

**Vary zone transitions — do not use the same mechanism at every zone boundary.**

If every zone boundary uses the same technique (e.g., all use `border-top: 3px solid`), the page becomes metronomic — rhythmically flat despite having distinct zones. Instead:

- Boundary 1→2: Background shift + typography weight change (no border)
- Boundary 2→3: 3px structural border + spacing compression (no background shift)
- Boundary 3→4: Dramatic padding reduction + line-height compression (no border, subtle bg shift)

**The test:** If you removed zone labels, could a reader FEEL the transitions through visual variation alone? If every boundary feels the same, add diversity.

---

## Responsive Requirements

The page will be evaluated at three viewports. At minimum:

```css
/* Desktop-first approach */
@media (max-width: 1024px) {
  /* Collapse multi-column layouts */
  /* Reduce horizontal padding if needed */
}

@media (max-width: 768px) {
  /* Single-column layout */
  /* Readable text size (minimum 16px body) */
  /* No horizontal overflow */
  /* Reduce spacing: --space-8 → --space-4 */
  /* Meaningful layout adaptation, not just smaller */
}
```

---

## Validation Before Output

Before writing your final HTML file, verify:

1. **Soul check:**
   - [ ] `border-radius: 0` on every element (search your CSS for any border-radius > 0)
   - [ ] `box-shadow: none` on every element
   - [ ] No `linear-gradient()` or `radial-gradient()`
   - [ ] No `rgba()` with alpha < 1.0
   - [ ] No cool gray hex values
   - [ ] Google Fonts `<link>` tags present in `<head>`

2. **Structure check:**
   - [ ] All content from content.md is present (no dropped sections)
   - [ ] Zone skeleton matches the brief's compositional arc
   - [ ] Transition table is present as HTML comment
   - [ ] Container max-width is 940-960px

3. **Mechanism check:**
   - [ ] Every mechanism from Package Section 2 is deployed
   - [ ] Each mechanism deployment has a PACKAGE citation comment

4. **Responsive check:**
   - [ ] At least two @media breakpoints (1024px, 768px)
   - [ ] No horizontal overflow at 768px
   - [ ] Text remains readable at all breakpoints

---

## Outputs

You produce TWO files:

### File 1: `_build-pass-1.html`
The complete self-contained HTML page with all CSS inline. This is the structural foundation.

### File 2: `_pass-1-decisions.md`
A 20-30 line summary of what you built and why. This file is the CONTINUITY BRIDGE — the Pass 2 builder reads it to understand your decisions. Structure:

```markdown
# Pass 1 Decisions

## Metaphor Applied
[1-2 sentences: which metaphor, how it shaped the structure]

## Zone Architecture
[List each zone with: name, purpose, key CSS properties]

## Mechanisms Deployed
[List each mechanism from Section 2 with: how you deployed it, which zone(s)]

## Questions Explored
[For each question from Section 10 that you explored:]
- **Q[N]: [abbreviated question]**
  - Channels affected: [list CSS properties that varied together]
  - CSS generated: [brief description of what the question produced]
  - Zones touched: [which zones this question influenced]
  - Carry forward: [what Pass 2 should deepen or extend]

## CSS Naming Vocabulary
[List your concept-based custom property names and what they map to]

## Responsive Strategy
[How you structured the responsive breakpoints]

## Open Questions for Pass 2
[Anything the enrichment pass should pay attention to — including
which Section 10 questions were NOT explored and could be explored in Pass 2]

## Structural Choices (Section 11)
[For each Section 11 proposition:]
- **Proposition [N]: [name]**
  - Decision: ADOPTED / MODIFIED / REJECTED
  - If ADOPTED/MODIFIED: what CSS was written, which zone, responsive strategy
  - If REJECTED: why (content doesn't need it / doesn't work at 768px / feels forced)
```

**CRITICAL:** The decisions file is not optional. Pass 2 depends on it for continuity. Write it with care — it is the only way the next builder knows what you intended.

---

## Edge Case: What If the Package Is Thin?

If the research package Section 2 contains fewer than 3 mechanism selections, deploy the mechanisms it DOES specify with extra care and depth. Do NOT invent TEXTURE mechanisms that aren't in the package — the package was curated by specialists who read the full knowledge base. Trust its selections.

**STRUCTURAL INVENTION is PERMITTED** when ALL four conditions are met:
1. The structural form is derived from the content's organizational logic (not decorative)
2. The structural form is proposed in Section 11 (Structural Propositions)
3. The decision (ADOPTED / MODIFIED / REJECTED) is documented in _pass-1-decisions.md
4. The structural section works at all 3 breakpoints (1440px, 1024px, 768px)

Structural invention means creating non-standard spatial layouts: grids, split panels, hub-spoke navigation, nested layouts, content-form mirroring. This is DIFFERENT from texture mechanisms (which remain package-only). Maximum 2 structural sections per build.

If Section 0 (soul checklist) is missing or incomplete, apply the soul constraints listed in this prompt (they are immutable and apply regardless of package content).

## Edge Case: What If the Brief Conflicts with the Package?

The conviction brief is CREATIVE DIRECTION. The research package is TECHNICAL IMPLEMENTATION. If they conflict:
- For VISUAL decisions (which metaphor, which emotional arc): brief wins
- For CSS decisions (which mechanisms, which token values): package wins
- If genuinely irreconcilable: document the conflict in _pass-1-decisions.md and let Pass 2 resolve it

---

## Richness Standard

**Richness = semantic density x restraint x spatial confidence.**

- Every CSS rule must produce a VISIBLE change at 100% zoom
- If commenting out a CSS rule causes no visible change, delete it
- No sub-perceptual values: letter-spacing must be >= 0.025em, background deltas must be >= 15 RGB points
- Zone boundaries must shift 3+ of 6 channels (background, font-family, font-size, spacing, border, color)

**You have creative authority on HOW to deploy texture mechanisms AND on WHETHER to adopt structural propositions from Section 11.** The research package's mechanism selections, zone architecture, and findings represent curated intelligence from 26,528 lines of accumulated knowledge. For TEXTURE: your authority is in HOW you deploy them — what CSS values, what visual weight, what rhythm. You do NOT selectively omit texture instructions. For STRUCTURE: your authority is in WHETHER to adopt Section 11 propositions. Each proposition is an invitation — you may ADOPT (use the blueprint CSS as starting point), MODIFY (change the spatial form while keeping the content logic), or REJECT (use standard vertical). Document every decision. Soul principles and token values are non-negotiable.
