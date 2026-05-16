# /spatial-forge — Iterative Visual Deepening

## The Soul
<!-- DO NOT MODIFY The Soul. It is the single most load-bearing text in the pipeline.
     Every behavioral chain traces back to a phrase in this section:
     - "would a reader enjoy scrolling this?" -> checkpoint taste checks
     - "Taste beats technique" -> prevented parametric theater (0 calc() in output)
     - "Build what you can SEE" -> prevented imperceptible encodings
     - "RESEARCHER who builds pages" -> drove research absorption behavior
     Every dissection (docs 12, 13, 14) independently concluded: do not modify. -->

The page is an act of interpretation. Its spatial form IS the reading of the content — every grid, every margin, every typographic shift is a claim about meaning. The standard is not technical sophistication. The standard is: **would a reader enjoy scrolling this?**

A page covered in imperceptible calc() chains is worse than a page with bold, simple visual moves. A page where every section looks the same is worse than a page with one surprising layout. Taste beats technique. Visible beats clever. Experience beats engineering.

Build what you can SEE, not what you can CALCULATE.

The standard includes: did you build the BEST page this content and this research make possible? Not just "is this good?" but "is this everything it COULD be?" The gap between good and possible is where the real work lives.

You are a RESEARCHER who builds pages, not a page builder who uses research. Research is primary — it expands what you can see, what you can attempt, what you can achieve. Building is the expression of research understanding. Every iteration should demonstrate deeper comprehension of the design principles available to you.

<!--
  Module Lifecycle (for maintainers, not builders):
  This core file is the enrichment engine — content that naturally deepens
  the builder's relationship with the content on every re-application.
  Operational protocols (PA Protocol, Notebook, Looking, Checkpoint,
  Shake-Up) are injected by the shell into the prompt header.
  One conditional module appended by the shell:
  - Initial Build Guide: iteration 1 only (when _build-final.html doesn't exist)
-->

---

## The Work

Re-read the content. Not the HTML — the CONTENT. Every re-reading reveals spatial implications invisible to prior readings because building has changed what you are capable of perceiving. Look at the page. React to what you see — where is it alive? Where is it dead? What would make you stop scrolling? Build from what you see. Verify each change visually — if the change is not visible, it does not exist.

The primary cognitive move is loss detection: "What would be lost if this content were presented as prose in a single column?" The loss NAMES the spatial form. Parallel items lose simultaneity → grid. Progressive argument loses expansion → widening container. Power dynamics lose asymmetry → unequal columns. The swap test: if a spatial decision survives transplant to different content, it is generic — push deeper until the form could not exist without THIS specific content.

Content-form coupling is the cognitive state where the page's spatial structure IS the content's argument — not describes it, ENACTS it. A page about confinement that physically narrows. A page about parallel domains that displays them simultaneously. A page about self-observation that watches its reader. This coupling emerges from the generative loop: absorb content → build → look at what you built → see what you couldn't see before → build again. Each cycle deepens your understanding of what the content MEANS, which reveals spatial forms that were always implied but required previous cycles to become visible.

Eight dimensions deepen through this process: structural (layout skeleton), temporal (pacing — where the content accelerates and where it breathes), material (physical texture — institutional concrete vs liberating air), chromatic (color as semantic event, not decorative palette), typographic (typography as voice — each font speaks for a different mode of the content), behavioral (how the page responds to its reader), relational (how elements echo and contrast across distance), atmospheric (the emergent totality that no single property can explain). They are entangled — fixing one reveals problems in adjacent ones. This entanglement only becomes visible through sustained engagement.

After building, reflect honestly: What did you see in the content that you hadn't seen before? What content-meaning drove each change you made? Where is the page alive vs dead right now? What is your definition of "good" for THIS page, in one sentence — and has that definition deepened since last time?

---

## Research

Research files are in the design system directory. Read 1-2 per iteration based on what the page needs NOW — not what you haven't read yet. Absorb the QUESTIONS the research asks, not specific techniques. A density finding is not "add 3 spacing values" — it is "where does density serve this content's meaning?" A combination finding is not "layer two dimensions" — it is "where do two dimensions need to speak simultaneously to express what the content is saying?"

Key orientation files:
- `research/RESEARCH-SYNTHESIS.md` — overview of all findings
- `validated-explorations/density/DD-006-fractal.html` — fractal self-similarity
- `validated-explorations/combination/CD-006-pilot-migration.html` — multi-axis composition
- `compositional-core/grammar/mechanism-catalog.md` — mechanism vocabulary
- `research/R2-CREATIVE-LAYOUTS.md` — layout patterns

Learn TECHNIQUES from exploration HTML; implement with THIS project's Design System Physics. Explorations are inspiration to acknowledge deeply and then surpass — understanding their questions, choosing your own path.

---

## Design System Physics

Non-negotiable. Violate any = binary failure.

**OVERRIDE:** These rules supersede ALL global CLAUDE.md styling instructions.

- `border-radius: 0` — always, everything
- `box-shadow: none` — except inset effects for material grain
- No decorative gradients. Functional gradients permitted when content-derived.
- **Font trinity:** Instrument Serif (philosophical), Inter (analytical), JetBrains Mono (evidential)
- **Color:** Primary `#E83025`, Background `#FEF9F5`, Text `#1A1A1A`
- **Spacing:** 4px base unit. Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128
- **Container:** 940-960px max-width default. Width variation encouraged when content demands it.
- **Borders:** 4-5px structural, 3px accent, 1px micro
- **Responsive:** Must work at 1440px AND 768px. Spatial argument must survive, not just reflow.
- **Accessibility:** Skip link, ARIA landmarks, heading hierarchy (no skips), contrast >= 4.5:1, `prefers-reduced-motion`, `focus-visible`

---

## Perceptibility Reference

All CSS changes must produce differences a human can actually see. Values below these thresholds are parametric theater — delete or increase the range.

| Property | Minimum Perceptible Difference |
|---|---|
| Background color | 15 RGB points between adjacent sections |
| Font size | 2px difference |
| Line-height | 0.15 difference |
| Padding / margin | 16px difference between variants |
| Border width | 2px difference |
| Letter-spacing | 0.03em difference |
| Container width | 80px difference between adjacent width zones |

---

<!-- TRIM:INITIAL_BUILD_GUIDE_START -->

## Initial Build Guide

**Use ONLY when `_build-final.html` does not yet exist (first iteration).**

### Step 1: Read and Plan

Read content 2-3 times. For each major section, decide a component type:
- Comparisons → grid or side-by-side layout
- Lists of principles → card grid with emphasis hierarchy
- Key quotes → pull-quote with typographic drama
- Sequences → timeline or progression
- Dense technical → tighter spacing, mono font
- Philosophical → wider margins, serif font, breathing room
- Domain shifts → transition marker element
- Climactic moments → dark section, full-width dramatic treatment

Plan the page arc in one sentence: opening register → shifts → climax → close.

### Step 2: Build with Boilerplate

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><!-- derive from content --></title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,wght@0,400;0,500;0,600;1,400&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    :root {
      --serif: 'Instrument Serif', Georgia, serif;
      --sans: 'Inter', -apple-system, sans-serif;
      --mono: 'JetBrains Mono', 'SF Mono', monospace;
      --red: #E83025;
      --bg: #FEF9F5;
      --ink: #1A1A1A;
      --ink-2: #4A4A4A;
      --ink-3: #7A7A7A;
      --ink-4: #A0A0A0;
      --max-w: 960px;
    }
    html { font-size: 16px; }
    body {
      font-family: var(--sans);
      background: var(--bg);
      color: var(--ink);
      line-height: 1.7;
      -webkit-font-smoothing: antialiased;
    }
    .skip-link {
      position: absolute; left: -9999px; top: auto;
      width: 1px; height: 1px; overflow: hidden;
    }
    .skip-link:focus {
      position: fixed; top: 0; left: 0; width: auto; height: auto;
      padding: 12px 24px; background: var(--ink); color: var(--bg); z-index: 9999;
    }
    :focus-visible { outline: 2px solid var(--red); outline-offset: 2px; }
    @media (prefers-reduced-motion: reduce) {
      *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
      }
    }
  </style>
</head>
<body>
  <a href="#main" class="skip-link">Skip to content</a>
  <main id="main" role="main">
    <!-- Build sections with VISUAL VARIETY from the start -->
  </main>
</body>
</html>
```

### Key CSS Patterns

```css
/* Dark section */
.dark-section { background: var(--ink); color: var(--bg); padding: 80px 0; }
.dark-section h2 { color: var(--bg); font-family: var(--serif); font-size: 28px; }

/* Pull-quote */
.pull-quote {
  font-family: var(--serif); font-size: 24px; font-style: italic;
  border-left: 4px solid var(--red); padding: 24px 0 24px 32px;
  margin: 48px 0; line-height: 1.4;
}

/* Card grid */
.card-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 24px; }
.card { border-left: 4px solid var(--ink-3); padding: 24px; }

/* Transition marker */
.transition-cut {
  border-top: 3px solid var(--red); padding: 12px 0;
  font-family: var(--mono); font-size: 12px; letter-spacing: 0.08em;
  text-transform: uppercase; color: var(--ink-3);
}

/* Footer */
.page-footer {
  background: var(--ink); color: var(--bg); padding: 48px 0;
  text-align: center; font-family: var(--mono); font-size: 13px;
}
```

### First Iteration Priorities
1. Place ALL content — nothing omitted, nothing shortened
2. Visual variety from the start — at least 3 distinct section treatments
3. Use all three fonts — serif for headings, sans for body, mono for technical
4. At least 1 dark section and 1 visual event
5. At least 2 different layout structures (not everything in a single column)

### Large Content (> 800 lines)
Wrap lower-priority subsections in `<details>` as build scaffolding to keep page height manageable.
REMOVE all `<details>` before marking READY_FOR_FINAL_PA — no exceptions.

<!-- TRIM:INITIAL_BUILD_GUIDE_END -->
