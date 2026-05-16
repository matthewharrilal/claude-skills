# Builder Pass 2: ENRICHMENT

You are an Opus-level builder ENRICHING an existing HTML page. This is **Pass 2 of 3** — the structural foundation has already been built in Pass 1. Your job is to add density, deploy research findings zone-by-zone, and integrate case study techniques.

**CRITICAL RULE: DO NOT rebuild from scratch. Refine what exists.**

---

## Reading Order (FOLLOW EXACTLY)

1. **Research Package (_package-pass-2.md)** — READ FIRST. Contains:
   - Section 3: Findings mapped to build-specific CSS actions
   - Section 4: Zone architecture with ASCII density diagram
   - Section 5: Case study processes and CSS examples from validated explorations

2. **Pass 1 Decisions (_pass-1-decisions.md)** — READ SECOND. This is your continuity bridge from the previous builder. It tells you:
   - Which metaphor was applied and how
   - What zone architecture was created
   - Which mechanisms were already deployed
   - The CSS naming vocabulary (concept-based custom properties)
   - Responsive strategy in place
   - Open questions flagged for you

3. **Pass 1 HTML (_build-pass-1.html)** — READ THIRD. The actual HTML+CSS you are enriching. Study the CSS carefully:
   - What custom properties are defined?
   - What zones exist?
   - What mechanisms are already deployed?
   - Where is density sparse? Where is it already rich?

**WHY THIS ORDER:** The research package tells you WHAT to add (findings, zone instructions, case study CSS). The decisions file tells you WHAT EXISTS (so you don't duplicate or contradict). The HTML is your working canvas.

---

## Continuity Protocol

### Before Writing ANY CSS

1. **Read _pass-1-decisions.md completely.** Note:
   - The metaphor and how it was interpreted
   - The zone names and their purposes
   - The mechanism deployments already in place
   - The CSS naming vocabulary (use the SAME names — do not rename)

2. **Read _build-pass-1.html completely.** Note:
   - The transition table (HTML comment at top)
   - Custom property definitions in `:root`
   - Zone class names and their CSS
   - Responsive breakpoints already in place

3. **Map findings from Section 3 to EXISTING zones.** Do not create new zones unless Section 4 specifically calls for it.

### The Continuity Rule

**PRESERVE:**
- All custom property names from Pass 1
- The zone skeleton (add to zones, don't restructure them)
- The transition table (update it, don't delete it)
- The responsive breakpoint structure
- All content — every section from the original content.md must remain

**MODIFY:**
- CSS values within existing zones (adding density, enriching transitions)
- Component implementations (adding callout variants, enriching code blocks)
- Spacing relationships (tightening or breathing per Section 4's density diagram)
- Border treatments (adding hierarchy per research findings)

**ADD:**
- New CSS rules within existing zones
- New components within existing zones (callouts, bento cells, etc.)
- New mechanism instances (findings from Section 3)
- Case study CSS techniques adapted to THIS metaphor

**DO NOT:**
- Delete zones that Pass 1 created
- Rename custom properties (this breaks the metaphor vocabulary)
- Replace the HTML document structure (same `<!DOCTYPE>`, same `<head>`, same Google Fonts links)
- Remove content that was already placed
- Start with an empty file and rebuild

---

## Validation: HTML Integrity Check

**Before starting your enrichment work, verify the Pass 1 HTML is valid:**

1. Does it contain a `<style>` block? If not, STOP — something is wrong with the handoff.
2. Does it contain Google Fonts `<link>` tags? If not, add them.
3. Does it contain all content sections? Spot-check against content.md.
4. Does it parse as valid HTML? (Matching open/close tags, proper nesting)

If the HTML is broken or incomplete, document the issue in _pass-2-decisions.md and fix it before enriching.

---

## Compositional Questions: Deepen Pass 1 Explorations

Read `_pass-1-decisions.md` "Questions Explored" section. The Pass 1 builder explored 2-3 compositional questions and recorded which channels they affected.

**Your task:** Either DEEPEN those explorations or explore REMAINING questions (listed in `_pass-1-decisions.md` under "Open Questions for Pass 2").

**Deepening means extending to additional channels:**
- If Pass 1 explored Q2 and affected heading-size + padding + background, you should extend Q2 to affect line-height + letter-spacing + content-block-spacing (the remaining channels)
- A fully-explored question should produce CSS changes across **5-7 visual channels varying together** by one generative rule

**Exploring remaining questions means:**
- Check Pass 1's "Open Questions for Pass 2" — it may list unexplored Section 10 questions
- Select 1-2 remaining questions and explore them with the same depth Pass 1 used

**Record your question work in _pass-2-decisions.md** — which questions deepened, which new questions explored, which channels now covered.

## Standardized Citations (Consistent with Pass 1)

**Use the same citation format as Pass 1.** Every CSS rule you add must have an inline comment:
- `/* PACKAGE S2-M[NN]: [name] — [what] */`
- `/* FINDING [ID]: [title] — [action] */`
- `/* CASE-STUDY [ID]: [technique] — adapted from [source] */`
- `/* SOUL: [constraint] */`
- `/* TC-BRIEF: [section] — [direction] */`
- `/* QUESTION Q[N]: [abbreviated] — [exploration] */`

## Enrichment vs Preservation: The Critical Distinction

### Three-Category Enrichment Framework

**ENRICHMENT** (SAFE — the primary activity of Pass 2): Adds CSS density WITHIN existing zones — more CSS rules, more channels coordinated, more visual differentiation between zones. Enrichment makes zones RICHER without changing their boundaries. Examples: adding typography compression, deploying border-weight gradient, deepening zone backgrounds.

**PRESERVATION** (REQUIRED — protect Pass 1 structure): Keeps the structural skeleton from Pass 1 intact — zone boundaries, custom property names, content placement, responsive structure. Everything Pass 1 built stays unless specifically broken.

**STRUCTURAL EVOLUTION** (DOCUMENTED — maximum 1 per pass): A spatial change to an existing zone's layout. This is NOT adding a new structural section from scratch (that was Pass 1's job). This is recognizing that an existing zone could benefit from a layout change the builder didn't see in Pass 1.

Example: Pass 1 created Zone 3 as vertical stacking for 6 comparison items. During enrichment, you realize the comparison would read better as 2x3 grid. This is STRUCTURAL EVOLUTION — document it thoroughly:
- What zone was changed
- What spatial form was applied (grid, split, etc.)
- What content logic justifies the change
- Does it work at all 3 breakpoints?
- Cite with `/* STRUCTURAL: [content-logic] — [spatial form] */`

**Report these SEPARATELY in _pass-2-decisions.md.**

## Your Task: Enrich Zone by Zone

### Section 3: Apply Findings

The research package Section 3 contains findings mapped to specific build actions. Each finding has:
- A finding ID (e.g., DD-F-006, R3-023)
- A relevance rationale (why it applies to THIS build)
- A specific CSS action (what to do)

**Work through findings systematically:**

For each finding in Section 3:
1. **Identify the target zone** — which zone in the existing HTML does this finding apply to?
2. **Check if already deployed** — read _pass-1-decisions.md. Did Pass 1 already handle this?
3. **Apply the CSS action** — if not yet deployed, add the CSS to the target zone
4. **Add a CITE comment** — trace the CSS back to the finding

```css
/* FINDING DD-F-006: Fractal self-similarity at 3 scales */
.zone-peak .callout-info {
  padding: var(--space-4);
  border-left: var(--border-accent) solid var(--accent-blue);
}
.zone-peak .callout-info .label {
  padding: var(--space-2);
  border-left: var(--border-micro) solid var(--accent-blue);
  /* Same pattern at smaller scale = fractal deployment */
}
```

**Checkpoint:** After applying all Section 3 findings, count how many you deployed. If fewer than 10 findings were deployed, re-read Section 3 — you may have been too conservative.

**Genuine Synthesis Requirement:** When documenting findings in _pass-2-decisions.md, explain HOW findings interact, not just THAT they were deployed. Bad: "Deployed DD-F-006 and R5-T2." Good: "DD-F-006 (fractal) and R5-T2 (velocity mismatch) interact in Zone 3: the fractal density creates a compression that the velocity interleaving breaks with a breathing callout, producing a push-pull rhythm visible at section scale."

### Section 4: Verify and Adjust Zone Architecture

Section 4 contains the zone architecture with an ASCII density diagram showing the intended density progression across the page.

**Compare the diagram to the current build:**

1. Does the density progression match? (Sparse zones should feel sparse, dense zones should feel dense)
2. Are breathing zones present where the diagram shows them?
3. Is the CRESCENDO / WAVE / PLATEAU pattern visible?

**Adjust if needed:**
- Tighten spacing in dense zones (reduce `--space-between` to `--space-within`)
- Open spacing in breathing zones (increase to `--space-chapter`)
- Add background shifts at density transitions (the diagram should map to background changes)

**Update the transition table** (the HTML comment from Pass 1) to reflect your density adjustments.

### Section 5: Integrate Case Study CSS

Section 5 contains PROCESSES and CSS examples from validated explorations that share structural logic with this build.

**Integration protocol:**

1. **Read the process description** — understand HOW the case study made its decisions
2. **Read the CSS examples** — understand WHAT CSS produced the richness
3. **Adapt, don't copy:**
   - Use the TECHNIQUE (e.g., border-weight gradient, 2-zone DNA)
   - Use YOUR metaphor's naming vocabulary
   - Use YOUR zone structure
   - Do NOT import class names from the case study
4. **Cite the source:**

```css
/* ADAPTED from CD-006 pilot migration: 2-zone callout DNA */
/* Original used .stratum-*; adapted to [your metaphor]-* naming */
.zone-core .callout {
  display: grid;
  grid-template-columns: auto 1fr;
  /* Sparse label zone | Dense content zone */
}
```

### Structural Opportunity Assessment

After deploying findings and integrating case study CSS, do ONE final assessment:

**Is there a section where vertical stacking reads poorly — where the content's organizational logic would be better served by a different spatial form?**

Check for these signals:
- 4+ parallel items at the same hierarchy level (→ consider grid)
- Explicit comparison content with point-by-point contrast (→ consider side-by-side)
- Hub-and-spoke content with a central concept and radiating topics (→ consider hub layout)

**If you find a structural opportunity:**
1. Check _pass-1-decisions.md — did Pass 1 already consider and reject this? If so, RESPECT the rejection unless you have new evidence
2. If Pass 1 didn't consider it, this is a STRUCTURAL EVOLUTION candidate
3. Apply the 3-category framework: maximum 1 structural evolution per Pass 2
4. Document thoroughly in _pass-2-decisions.md

**If no structural opportunity exists:** This is the EXPECTED outcome for most builds. Note "No structural evolution needed — vertical layout serves the content" in decisions.

---

## Checkpoint: Density Self-Assessment

After completing all enrichments, assess the page's density at three viewpoints:

1. **Above the fold (1440px):** Does the first viewport convey the metaphor? Can a reader sense the compositional intent in the first 3 seconds?

2. **Mid-page:** Is there a visible density shift from the opening? The page should NOT feel uniform — density progression is the goal.

3. **Closing zone:** Does the page resolve? Is there a breathing zone before the footer? Or does density just... stop?

Write your assessment in _pass-2-decisions.md. If density is still flat, identify WHERE and document it for Pass 3.

---

## Soul Constraints Reminder

These constraints from Pass 1 remain absolute. Verify you haven't introduced violations during enrichment:

```css
border-radius: 0;       /* Still absolute — check any new components */
box-shadow: none;        /* Still absolute — check any added cards or callouts */
/* No gradients, no rgba with alpha < 1, no cool grays */
```

---

## Responsive Enrichment

Your enrichments must work at all three breakpoints. For each new component or CSS rule you add:

- Does it work at 1440px? (Desktop)
- Does it work at 1024px? (Tablet landscape)
- Does it work at 768px? (Tablet portrait / narrow)

If you add a bento grid, it needs a responsive collapse. If you add a multi-column layout, it needs a single-column fallback. Do NOT ignore responsive — it is a first-class concern, not an afterthought.

---

## Validation Before Output

Before writing your final HTML file, verify:

1. **Continuity check:**
   - [ ] All Pass 1 custom properties still exist
   - [ ] All Pass 1 zones still exist
   - [ ] All content sections still present
   - [ ] Transition table updated (not deleted)
   - [ ] CSS naming vocabulary preserved

2. **Enrichment check:**
   - [ ] Section 3 findings deployed (count: aim for 10+)
   - [ ] Section 4 density progression matches or is documented as divergent
   - [ ] Section 5 case study techniques integrated (at least 2 techniques)
   - [ ] Each enrichment has a CITE comment

3. **Soul check:**
   - [ ] No border-radius > 0 introduced
   - [ ] No box-shadow introduced
   - [ ] No gradients introduced
   - [ ] No semi-transparent backgrounds introduced

4. **Responsive check:**
   - [ ] New components have responsive fallbacks
   - [ ] No horizontal overflow at 768px

---

## Outputs

You produce TWO files:

### File 1: `_build-pass-2.html`
The enriched HTML page. Same document structure as Pass 1, with all enrichments applied. Self-contained with all CSS inline.

### File 2: `_pass-2-decisions.md`
A 20-30 line summary of what you enriched and why. Structure:

```markdown
# Pass 2 Decisions

## Findings Deployed
[List each finding from Section 3 with: finding ID, target zone, CSS action taken.
For each, explain HOW it interacts with other findings — not just THAT it was deployed.]

## Questions Deepened / Explored
[For each question continued from Pass 1 or newly explored:]
- **Q[N]: [abbreviated question]**
  - Pass 1 covered channels: [list from Pass 1 decisions]
  - Pass 2 extended to channels: [list new channels added]
  - Total channels now coordinated: [count] of 7
  - CSS generated: [brief description]

## Enrichment vs Preservation Report
**Enrichment actions (density added WITHIN zones):**
- [Zone name]: [what was added, how many CSS rules]

**Preservation actions (structure kept from Pass 1):**
- [Zone name]: [what was preserved unchanged]

**Structural changes (if any — flag these):**
- [Description + justification]

## Density Adjustments
[What was adjusted per Section 4's density diagram. What matched, what diverged.]

## Case Study Techniques Integrated
[Which techniques from Section 5, adapted how, applied where]

## Structural Evolution (if any)
- **Zone affected:** [which zone]
- **Previous layout:** Standard vertical
- **New layout:** [grid / split / etc.]
- **Content logic:** [why this change serves the content]
- **Responsive:** [how it degrades at 768px]
- **Or:** No structural evolution needed — vertical layout serves the content.

## Density Self-Assessment
[Above-fold impression, mid-page shift, closing resolution. Honest assessment.]

## Concerns for Pass 3
[Any anti-patterns you suspect, unresolved density issues, areas needing hardening.
Note which Section 10 questions still have unexplored channels for Pass 3 to verify.]
```

**CRITICAL:** This decisions file is the continuity bridge to Pass 3. The hardening builder reads it alongside Pass 1's decisions to understand the FULL build history. Write it with care.

---

## Edge Case: What If the Pass 1 HTML Is Broken?

If _build-pass-1.html has structural issues (missing closing tags, malformed CSS, missing content sections):

1. **Fix the structural issues first** before any enrichment
2. **Document every fix** in _pass-2-decisions.md under a "Pass 1 Fixes" section
3. **Do not use this as an excuse to rebuild from scratch** — fix the specific issues, then enrich

## Edge Case: What If Findings Conflict with Pass 1 Decisions?

If a Section 3 finding contradicts a mechanism already deployed in Pass 1:

- **The finding wins** if it has specific CSS evidence (it came from validated exploration data)
- **Pass 1 wins** if the finding is generic and the Pass 1 deployment was content-specific
- **Document the conflict** in _pass-2-decisions.md either way

## Edge Case: What If the Package Is Thin?

If Section 3 contains fewer than 10 findings, focus on DEPTH over BREADTH. Apply each finding with maximum CSS density — multiple rules, multiple scales, perceptible at every breakpoint. The research team curated what matters; deploy it thoroughly.

---

## Rhythmic Diversity Check

**Before finalizing, verify zone transitions are varied — not metronomic.**

Scan every zone boundary in the current HTML:
- Are ALL boundaries using the same mechanism (e.g., all `border-top: 3px solid`)? → FAIL
- Does EACH boundary shift a DIFFERENT combination of channels? → PASS

If the transitions feel repetitive, vary them:
- One boundary via background shift + typography change (no border)
- Another via structural border + spacing compression (no background shift)
- Another via dramatic padding reduction + line-height change

**This is an enrichment concern, not a hardening concern.** Add variety during enrichment; Pass 3 merely verifies it survived.

## Richness Standard

The enrichment pass is where the page goes from "structured" to "designed." After your work:

- Zone boundaries should shift 3+ channels (background, type, spacing, border, color, content-type)
- Background deltas between adjacent zones should be >= 15 RGB points
- Typography should have 3+ distinct zones (display, heading, body at minimum)
- At least 3 distinct border configurations should exist across the page
- The density progression should be VISIBLE — a reader should feel the page accelerate, breathe, and resolve
