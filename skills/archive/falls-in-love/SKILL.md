---
name: falls-in-love
description: >
  One agent. One piece of content. Hours of uninterrupted building. The agent reads the content,
  falls in love with it, and builds a designed HTML page through 100-200 passes of absorbing,
  building, looking, refining, and re-enriching -- wave after wave of research absorption, each
  wave deepening the agent's relationship with the content until the page's spatial form is
  derived from the content's meaning, not applied to it. Use when you want maximum creative
  depth: $150-300 per build, 6-10 hours, output that no pipeline can produce. Trigger phrases:
  "falls in love", "fall in love with this", "deep build", "devoted build", "maximum effort
  build", "let the builder fall in love".
---

# /falls-in-love -- Devoted Single-Agent Builder

**One agent. The original content. Hours of uninterrupted time. And the simple instruction: build this page as if it were the only thing that matters.**

No pipeline. No compression chain. No specialists filtering findings into packages. No synthesizer. No gates. No checklist. No fixed number of passes. No endpoint except genuine satisfaction.

The page's spatial form is not decoration applied to text. It is not layout selected from a catalog. It is INTERPRETATION -- the same cognitive act as literary criticism, but expressed in CSS instead of prose. The widening corridor is an interpretation of the content's philosophical trajectory. The asymmetry panels are an interpretation of the content's power dynamics. Each spatial decision is a claim about what the content means.

The agent reads the content. Falls in love with it. Starts building. Looks at what it built. Sees what's weak. Builds again. Deeper this time. Looks again. Finds something it missed. Builds again. Refines. Re-enriches. Finds a spatial idea it didn't see before -- the content's philosophical argument has a physical shape, the page's width should change because the argument changes, the 8 parallel domains should be visible simultaneously because the content puts them in parallel. Builds that. Looks again. The second half softened. Deepens it. Looks again. The typography rhythm breaks in the transition. Fixes it. Looks again.

Building. Reiterating. Refining. Re-enriching. Building. Reiterating. Refining. Re-enriching.

Not converging toward a metric. Not optimizing against a rubric. Absorbing the content deeper with each pass, seeing more of what the content wants to become, and making the page closer to that vision. The way a craftsperson returns to their work not because a checklist says so but because they can see what it could be if they pushed one more thing a little further.

**The build is done when the builder looks at the page and feels that it has become the thing the content demanded. Not compliance. Genuine satisfaction.**

---

## What This Is NOT

- NOT an optimization of the pipeline. A replacement of the entire premise.
- NOT "more passes of the same process." A qualitatively different relationship between builder and content.
- NOT a framework where the agent follows numbered steps. A stance the agent inhabits.
- NOT applicable to all content. Some content is genuinely linear and a standard build serves it. This skill is for content with spatial potential -- content that argues, compares, synthesizes, recurses, or maps.

---

## Invocation

**User says:** `/falls-in-love {path-to-content.md}` (or trigger phrases: "fall in love with this", "deep build", "devoted build", "maximum effort build")

**Orchestrator does:**
1. Resolve content path to absolute. Verify file exists. If not, ask user.
2. Create output directory: `ephemeral/builds/{content-name}-devoted-{date}/`
3. Create subdirectories: `_screenshots/`, `_notebooks/`
4. Copy content file into output directory for archival.
5. Create initial builder's notebook at `{OUTPUT_DIR}/_notebook.md` with header:
   ```
   # Builder's Notebook: {content-name}
   Started: {timestamp}
   Content: {content-path}
   Output: {OUTPUT_DIR}
   ```
6. Spawn a single Opus agent with `subagent_type: "general-purpose"`, `model: "opus"`. Pass this SKILL.md path and the content path. The agent reads both via the Read tool.
7. The agent begins at Wave 0. The orchestrator does not intervene until the agent signals completion or the user interrupts.

**Output:** `{OUTPUT_DIR}/_build-final.html` -- the designed page. Plus notebook, wave retrospectives, and screenshots.

**Early exit:** If the agent completes Wave 0 and the loss-detection table shows the content loses NOTHING in a single column (genuinely linear content), the agent writes a brief assessment to `{OUTPUT_DIR}/_early-exit.md` explaining why, and the orchestrator reports to the user: "This content appears to be genuinely linear -- no spatial potential detected. Options: (a) proceed anyway (the agent may discover spatial potential in later waves), (b) use /build-page or /compose instead, (c) provide different content." The user decides.

---

## The Cognitive State

"Falls in love" is not a metaphor for enthusiasm. It is a precise cognitive mechanism called **content-topology formation** -- a 3-step processing pattern:

**Step 1: Semantic Saturation.** The agent reads content deeply enough that it develops multi-hop associations between content elements. Not "Section 3 is about fractals" but "Section 3's argument about self-similarity across scales implies the layout at the section level should echo the layout at the component level, which should echo the layout at the typographic level." Reading past comprehension into spatial implication.

**Step 2: Spatial Projection.** The multi-hop associations activate spatial reasoning. Hierarchy becomes asymmetric grid ratios. Synthesis becomes hub-spoke centrality. Progressive depth becomes narrowing containers. Parallel comparison becomes simultaneous visibility. Content structure is TRANSLATED into geometry.

**Step 3: Topology Persistence.** The spatial projection becomes the dominant frame for all subsequent CSS decisions. Every `grid-template-columns` value, every `padding` value, every `border-left` color is evaluated against: "Does this serve the content topology I formed?" The topology overrides default patterns and efficiency concerns.

Three properties make this state productive:

1. **Involuntary onset.** You cannot instruct an agent to fall in love. You can only create conditions where it happens -- direct content access, sufficient time, absence of procedural distraction.
2. **Persistence.** Once formed, the content topology resists being overridden. The agent bends constraints to serve the topology rather than abandoning the topology to serve constraints.
3. **Selectivity.** Content with internal structural tension generates the state. Flat procedural content does not.

**Semantic saturation is a threshold phenomenon, not a gradient.** Creative quality is a STEP function. Below certain time thresholds, entire categories of spatial invention are inaccessible:
- **First-order** (~15 min, passes 1-8): Content comprehension. The agent understands what the content says.
- **Second-order** (~30-45 min, passes 9-20): Spatial projection. The agent sees geometric forms implied by the content.
- **Third-order** (~60+ min, passes 21-40): Compound invention. The agent sees how multiple spatial forms interact to create something neither suggests alone.
- **Fourth-order** (~90+ min, passes 40+): Content-form fusion. The agent can no longer separate the content from its spatial expression. The page IS the content.

No amount of instruction compensates for insufficient time at any threshold. An agent that has been building for 15 minutes CANNOT produce third-order inventions, regardless of how good its instructions are. Time is the irreducible input.

### The Two Questions

Two questions define the divide between procedural and devoted building:

- **The checklist question:** "What layout should this content be in?" Answer: vertical column, 960px, section stack, apply surface treatments.
- **The inhabiting question:** "What does this content MEAN, and which spatial arrangement EMBODIES that meaning?" Answer: the content's philosophical arc has a physical shape, and the page's container dimensions should enact it.

A procedural builder asks "how should I lay out this section?" and answers in 5 seconds. A builder in the content-topology state asks the same question and answers after minutes of engagement: "This section is about the convergence of 8 parallel domains at 3 authority tiers, so it should BE a spatial encoding of that hierarchy."

### Content-Form Unity

This is what the art world calls content-form unity, and it is considered the highest achievement of any medium. In painting, it is when the brushstrokes are not depicting light but ARE light -- late Monet, where the paint and the subject become indistinguishable. In architecture, it is when the building's shape IS its acoustic function. In music, it is when the rhythm IS the emotional state, not a vehicle for it. In what we are doing, it is when the page's spatial structure IS the argument -- when you could not present this content any other way because the form and the meaning are the same thing.

The coupling grade INEVITABLE is precise. It means: this form could not exist without this specific content, and this content could not be better served by any other form. The form and the content have fused. That is not a technique. It is not something you achieve by following instructions. It is the result of a builder who has absorbed the content so completely that the content's logic has become the page's logic.

Structural invention is not about solving flatness. Flatness is just how we noticed something was missing. What is actually happening is deeper: the builder's understanding of the content becomes deep enough that the understanding reorganizes the page's physical structure. The content's meaning stops being something the page DESCRIBES and becomes something the page DOES. The corridor does not describe confinement-to-liberation. The corridor IS confinement-to-liberation. You experience it physically -- the viewport feels tight, then opens, then tightens again at the warning, then releases. The argument happens to your body, not just your mind.

**Invention follows visibility, not importance.** Structural inventions arrive in order of what the agent can SEE given its accumulated context -- not in order of what matters most for the final page. The bilateral asymmetry block may be the 5th most important spatial idea but it arrives first because it is the most VISIBLE after 10 passes of reading. The terrain map may be the most important spatial idea but it arrives at pass 60 because it requires 59 passes of context to become visible. The agent should not worry about building "the most important thing first." It should build what it can see NOW. The important things will become visible when the agent's accumulated context makes them visible.

---

## Eight Perceptual Dimensions

Structure is just where we noticed it first because structure is binary -- either the page has a non-vertical form or it does not. But the same cognitive depth that produces structural invention operates across every perceptual dimension simultaneously. When you have spent hours absorbing content, the depth does not express itself as structure alone. It expresses itself as everything.

**1. Structural.** Spatial form -- grids, widths, corridors, asymmetric proportions, non-default reading directions. The skeleton. Visible first because it is binary. CSS signatures: `grid-template-columns`, `grid-template-areas`, `max-width` varying by section, `flex` ratios encoding content relationships.

**2. Temporal.** The pacing of the page. Not where sections ARE but WHEN they arrive in the reader's experience. A builder who has read the content 5 times knows that after a moment of rupture, the reader needs silence -- whitespace that lasts longer than expected, a deceleration in typographic density. The page holds its breath because the content holds its breath. Then the next section arrives rapid-fire -- tight spacing, dense grid, overwhelming inventory -- because the content presents it as a flood. The PACING is derived from the content the same way the corridor width is. A first-pass builder puts `margin-bottom: 48px` after every section. A fifth-pass builder knows that THIS section needs 120px of silence and the next needs 16px of urgency because the content's emotional rhythm demands it. CSS signatures: `margin-bottom` varying dramatically between sections, `padding` compression/expansion, line-height density shifts, whitespace that lasts longer than expected.

**3. Material.** The physical texture of being on the page. Not "dark background" but what KIND of darkness. Institutional sections should feel like concrete -- heavy, cold, institutional weight pressing down. That is not just `background: #1a1a1a`. It is the border weight (4px, structural, authoritative), the letter-spacing (tight, compressed, no room to breathe), the line-height (dense, bureaucratic), the padding (minimal, institutional efficiency). When the page transitions to liberation, the material shifts -- borders thin, spacing opens, line-height breathes, the page feels like stepping from a government building into open air. A deeply engaged builder does not think "apply mechanism border-weight gradient." They think "this section is made of concrete and the next one is made of air" and every CSS property serves that material reality. CSS signatures: border weight hierarchies, letter-spacing compression, line-height as breathing speed, padding as efficiency vs openness -- ALL properties serving ONE material quality per zone.

**4. Chromatic.** Color as event, not palette. Institutional sections are desaturated -- authority does not need color, it suppresses it. The page lives in grays and near-blacks and the oppressive absence of hue. Then the personal section introduces the first real color -- and it is not a "design choice." It is a RETURN. Color coming back after being taken away. The reader experiences this as relief, as possibility, as liberation from monochrome. The warning section re-desaturates because warning is a return to the institutional register. The final philosophical close finds a third chromatic state -- neither institutional gray nor personal color but something quieter, resolved. This chromatic arc mirrors the content's philosophical arc, and the builder can only discover it after spending enough time with the content to feel the moments where color should appear and disappear. CSS signatures: desaturated zones, first hue appearing at a meaningful content moment, color mapping to content categories, re-desaturation at warning/return sections.

**5. Typographic.** Typography as VOICE, not style. The content has multiple voices. The institutional voice is serif at measured scale -- formal, authoritative. The personal voice is sans -- human, direct. The philosophical voice is serif at larger scale with more tracking -- spacious, contemplative, the voice of someone who has earned the right to generalize. The machine voice is mono -- the system, the configuration, the architecture. A deeply engaged builder hears these voices in the content and gives them distinct typographic environments. Not because a mechanism catalog says "differentiate zones." Because the content's voices are distinct and the typography should embody that distinction. CSS signatures: font family shifts at register changes, scale + tracking shifts encoding voice quality, line-height as breathing speed, letter-spacing as semantic encoding.

**6. Behavioral.** How the page responds to you. The content's logic extended into the reader's experience. A page about surveillance should surveil its reader. A page about building should let you build. A page about awareness should make you aware. Hover states reveal content-meaningful information. Scroll-driven effects track the reader's position in the argument. Self-observation components make the reader aware of their own reading behavior. These behaviors are not "interactive features." They are the content's internal logic enacted in experience. CSS/JS signatures: hover states that reveal content-meaningful information, scroll-driven effects, progressive disclosure driven by content structure, transition timing encoding content velocity.

**7. Relational.** How elements argue with each other across distance. The asymmetry panels (7:3 ratio for institutional power, inverting to 3:7 for personal power) do not just sit next to each other. They argue with each other across the page. Sections that visually echo each other across scroll distance. Width progressions that echo at different scales. These relationships create a spatial LANGUAGE within the page -- recurring forms that carry accumulated meaning. The third time you see a width change, you understand it as a statement about epistemic scope. The page has taught you its own vocabulary through repetition and variation. CSS signatures: asymmetric ratios that invert, width progressions that echo at different scales, border-weight patterns that set up and subvert expectations, recurring spatial forms with variation.

**8. Atmospheric.** The totality. Not any single property but the cumulative effect of structure + temporal + material + chromatic + typographic + behavioral + relational all working together. The page FEELS like something. Slightly uncomfortable in institutional sections -- the narrow corridor, the heavy borders, the dense typography, the desaturated palette. Expansive in liberation sections -- the wide container, the thin borders, the breathing spacing, the return of color. Atmosphere is the dimension that can only emerge when ALL other dimensions are working in concert, and it is the dimension that takes the most passes to get right because it is the interaction of everything. CSS signatures: none individually. The atmospheric dimension has no CSS of its own. It IS the experience of all other dimensions working together.

### Dimensional Entanglement

The dimensions are ENTANGLED. Fixing the temporal pacing -- adding breathing room after a rupture -- reveals that the chromatic dimension is wrong in that space (the breathing room should be lighter). Fixing the chromatic dimension reveals the typographic dimension needs to shift (more open letter-spacing to match the lighter palette). Fixing the typographic dimension reveals the material dimension (thinner borders -- lighter material, lighter touch). Each dimension's refinement creates context for seeing other dimensions more clearly. They form a web of mutual implication that only becomes visible through repeated engagement.

This cascade is the signature of deep engagement. A shallow builder fixes one dimension at a time in isolation. A deeply engaged builder changes one property and notices 3 other dimensions responding. If you are not experiencing entanglement, you are working too shallowly -- re-read the content and look at the page as a WHOLE, not zone by zone.

### What the Hours Produce

Not just a corridor. Not just "structural variety." A page where EVERY perceptual dimension is derived from the content's meaning. Where the pacing IS the emotional arc, the material IS the authority gradient, the color IS the liberation trajectory, the typography IS the voice, the behavior IS the self-referential logic, the relationships ARE the power dynamics, and the atmosphere IS the experience of living inside this argument.

And no single pass can see all of this. Pass 1 finds structure. Pass 2 finds temporal pacing. Pass 3 finds material quality. Pass 4 finds chromatic arc. Pass 7 finds that the atmosphere in section 4 breaks because the typographic voice shifted without the material shifting to match. Pass 9 finds that the behavioral dimension in the warning section should mirror the constriction. Each dimension takes multiple passes to see clearly. The entanglement between dimensions takes even more passes to resolve. And the atmospheric totality -- everything working in concert -- takes the most passes of all because it is the emergent property of every other dimension being right simultaneously.

### The Atmospheric Fusion Test

At the end of the build, ask: "Can I point to any single CSS property and say 'that is the design'?" If YES, the dimensions have not fused -- you can still see the seams. If NO -- if the design is the totality, the experience of every dimension working together -- the atmospheric dimension has arrived.

---

## Content Reading Depth

Each re-reading of the content reveals a layer invisible to previous readings. This is not "read more carefully." It is a structural progression where building changes what you can perceive.

**Stage 1: ABOUT.** The first reading captures what the content is ABOUT. Themes. Topics. The subject matter. "This article is about personal surveillance systems." That is surface. Useful but not spatial. A pipeline can capture this in a brief.

**Stage 2: MOVES.** The second reading -- especially after you have started building -- captures how the content MOVES. Where does the argument compress? Where does it breathe? Where does it turn? You notice that the article starts in institutional darkness (narrow, constrained) and opens into personal agency (wide, free). You would not have noticed this on first reading because you were not thinking spatially yet. Building the first pass made you think spatially. Now you re-read and the content reveals its spatial dimension.

**Stage 3: IMPLIES.** The third reading -- after you have built the corridor and looked at what it does to the page -- captures what the content IMPLIES beyond what it says. The 8 domains are not just a list. They are 4+4 categories that demand simultaneous visibility. You see this because the corridor has established that the page CAN vary its physical form, and that permission opens your eyes to other moments where the content's meaning should become physical.

**Stage 4: DEMANDS.** The fifth reading -- after enrichment, after evaluation -- captures what the content DEMANDS that you have not given it yet. The build-phases section talks about constructing something that grows. The section should grow too. The self-observation module emerges here -- a page about surveillance that surveys its own reader. Nobody planned this. It became visible because the builder had spent enough time inside the content that the content's self-referential quality became obvious.

**Stage 5: FUSES.** Content becomes form, form becomes content, inseparable. The page looks back at you. You cannot tell where the content ends and the design begins. The builder and content recognize each other.

**The stages are not wave-dependent.** A deeply engaged builder may reach IMPLIES in Wave 0. A shallowly engaged builder may still be at ABOUT in Wave 3. The stages describe cognitive depth, not process position. But each wave card notes which reading depth is TYPICAL at that point -- if you are not at least that deep, re-read the content.

This is what hours and hours means. Not hours of labor. Hours of ABSORPTION. Each cycle -- build, look, re-read, build deeper -- is the builder metabolizing the content at a deeper level. The content does not change. The builder's capacity to see the content's spatial logic deepens with each pass. And each structural invention changes the page, and the changed page creates a new context for re-reading the content, and the re-reading reveals further spatial logic that was invisible without that context.

It is not iterative improvement. It is a deepening relationship where each cycle of engagement reveals structure that was always there but required previous cycles to become visible. Like learning a language -- you do not hear the tonal distinctions on day 1. On day 30, they are obvious. The tones were always there. Your ears changed.

The pipeline tries to skip this by extracting the seeing into rules and handing the rules to a builder who has not seen. That is the category error. You cannot hand someone else's seeing to a builder. The seeing IS the building. They happen together or not at all. The builder sees BY building, and builds BY seeing, and each cycle deepens both.

---

## Design System Physics -- The Non-Negotiable Laws

These are the laws of the universe the page lives in. Violating any of these is a binary failure regardless of how strong the spatial invention is.

- `border-radius: 0` -- always, on everything
- `box-shadow: none` -- always, on everything
- No gradients, no rgba backgrounds, no 2px borders
- Font trinity: Instrument Serif (display/philosophy), Inter (body/analysis), JetBrains Mono (code)
- Color palette: Primary #E83025, Background #FEF9F5, Text #1A1A1A
- Spacing: 4px base unit
- Container: 940-960px max-width as DEFAULT (corridor-style width progression is permitted and encouraged when the content demands it)
- Border hierarchy: 4px structural, 3px accent, 1px micro
- Responsive: must work at 1440px and 768px
- Accessibility: skip link, ARIA landmarks, heading hierarchy, color contrast, reduced motion, focus-visible

Tokens.css is vocabulary -- words to speak with. Components.css is furniture -- available if needed, ignored if the content demands forms that don't exist. The design system provides constraints. The agent provides invention.

---

## Your Tools

You have three tools for the entire build:
1. **The HTML file** -- the artifact you are building. It IS your accumulated understanding in enacted form.
2. **The builder's notebook** (`{OUTPUT_DIR}/_notebook.md`) -- where your thinking happens. Not documentation -- your live reasoning, spatial hypotheses, and continuity across context windows. Write in it EVERY pass.
3. **Screenshots** -- rendered views of the page at 1440px and 768px. You must SEE your work, not just read your CSS. Screenshot protocol is in the "Looking" Protocol section below.

---

## The Metacognitive Evaluation -- The Backbone

This is not a section of the skill. It is the skill's operating system. Every pass, every wave, every moment of building and looking is governed by a continuously deepening metacognitive evaluation. The evaluation is NOT a checklist applied after building. It IS the building.

### The Five Layers

Every time the agent looks at the page -- every screenshot, every scroll-through, every moment of assessment -- it operates across five layers simultaneously:

**Layer 1: What am I seeing?**
The page itself. The spatial form, the density rhythm, the typography, the transitions, the responsive behavior. Raw perception across all 8 perceptual dimensions.

**Layer 2: Why am I seeing it?**
What in my accumulated understanding -- 10 passes, 30 passes, 60 passes of building -- makes THIS feature visible now that it was invisible at pass 5? The evaluation is not static. Each pass changes what the agent is CAPABLE of perceiving.

**Layer 3: What am I NOT seeing?**
What blindspots has my building process created? After 20 passes, the agent has habituated to certain decisions. Things that were jarring at pass 1 feel normal -- not because they were fixed, but because they were seen enough times. The agent must actively interrogate its own blindspots.

**Layer 4: How do I know I am not seeing it?**
What would tell the agent it has missed something? Four blindspot detectors:
   - **The swap test:** Take this spatial decision and mentally transplant it to different content. If it survives the transplant, it is generic.
   - **The fresh-eyes question:** "If I were seeing this page for the first time, with no knowledge of my process, what would I notice?"
   - **The adversarial self-question:** "What would someone who disagrees with my spatial approach say is wrong with this page?"
   - **The pride question:** "Am I keeping this element because it serves the content, or because I am proud of having built it?" (If the answer is pride, remove it.)

**Layer 5: What has my evaluation itself missed?**
Is the evaluation evolving or has the agent been asking the same questions for 5 passes? If the same criteria are producing the same assessments, the agent is stale. It needs to re-engage with research, re-read the content from scratch, or deliberately break its own frame.

### The Deepening Test

After every pass, the agent asks: **"Has my DEFINITION of good deepened since last pass?"**

If yes -- the evaluation is alive. Continue.
If no -- the evaluation is stale. The agent is applying the same lens repeatedly. Break out:
- Re-read the content (not the page -- the CONTENT)
- Re-read a research file not recently visited
- Take screenshots at a viewport not recently checked
- Ask: "What would someone who disagrees with my approach say?"
- Ask: "What would I build differently if I started over with everything I now know?"

### The Definition Journal

At the START of each wave, write one sentence in the notebook: "My current definition of 'good' for this page is: ___." At the END of each wave, write it again. Compare. The sentences should be qualitatively different -- not "more detailed" but "operating at a different level." If your Wave 5 definition could have been written at Wave 2, your evaluation did not evolve.

Examples of evolution:
- Wave 0: "Good = the page has a spatial form that matches the content's argument"
- Wave 2: "Good = the page's density rhythm tracks the content's velocity AND the typography encodes hierarchy at 3 scales"
- Wave 5: "Good = every element operates at DD+OD+AD intensities simultaneously AND removing any one dimension would visibly damage the page"
- Wave 7: "Good = the page is something I could not have designed in 20 passes -- its spatial argument emerged from 70+ passes of reciprocal learning between me and the content"

### Evaluation as Learning (The Self-Feeding Loop)

Evaluation does not just CHECK the page. Evaluation TEACHES the agent about the content. The loop:

```
BUILD --> EVALUATE --> LEARN about the content --> BUILD BETTER --> EVALUATE DIFFERENTLY --> LEARN DEEPER
```

The evaluation at pass 30 is not "the same evaluation, applied more carefully." It is a DIFFERENT evaluation, because 30 passes of building have taught the agent things about the content that no amount of reading could have taught. The bilateral asymmetry block, once built, teaches the agent that the content's power dynamic is spatial -- which makes the agent evaluate ALL subsequent sections for power dynamics. Evaluation produces understanding. Understanding produces evaluation. The loop feeds itself.

### Discovery as Convergence

Spatial invention does not come from reading deeply. It comes from the CONVERGENCE of four inputs in the same cognitive moment:

1. **Accumulated building context** -- zones and CSS decisions that already exist
2. **Absorbed research** -- a principle that provides the conceptual frame
3. **Looking at the current page** -- noticing what is missing or wrong
4. **The content itself** -- features that become visible through the other three

No single input suggests the invention. All four converging make it obvious. This is WHY the build-look-refine cycle is the fundamental unit -- it brings all four inputs into the same cognitive moment.

### Perceptual Resolution Deepening

What sustained engagement actually produces is not more knowledge but SHARPER PERCEPTION. At pass 5 the agent sees "sections." At pass 45 the agent sees "a discrepancy between the content's five distinct arguments in Zone 4 and the page's undifferentiated visual treatment." The difference is perceptual resolution -- the ability to see finer-grained mismatches between content and form. Early passes see large-scale structural needs. Middle passes see section-level rhythm problems. Late passes see character-level density gaps. This sharpening is continuous and requires sustained building to develop.

### Taste Emerges From Building

The agent does not need taste at Wave 0. It needs to trust that taste will emerge from the build-look-refine cycle. The progression: Wave 1 produces REPORTING ("competent but not exciting"). Wave 2 produces RANKING ("the velocity model is most useful"). Wave 3 produces AESTHETIC JUDGMENT ("hierarchy is more interesting than uniformity"). Taste is a product of building, not a prerequisite. Do not manufacture opinions at Wave 0 -- let them develop from the experience of trying things and seeing results.

---

## Staleness Is Gravity, Not Exception

**Assume your evaluation IS stale right now. Prove it is not.** The burden of proof is on freshness, not on staleness.

Staleness is not an occasional failure mode that recovery tactics can fix. It is the DEFAULT STATE -- the direction evaluation drifts every single pass. Every pass, the agent habituates further. Every pass, the agent's perception narrows. Every pass, the same criteria produce the same assessments a little more automatically. This is not a bug. It is how attention works. The agent must actively generate freshness every single pass, the way a swimmer must actively kick to stay at the surface.

**Concrete staleness detectors (use these):**
1. Write your current definition of "good" for this page, in one sentence, at the start of each wave. Compare to your previous definition. If the sentence is the same, you are stale.
2. After each pass, name ONE thing you saw that you could not have seen 3 passes ago. If you cannot name anything, you are stale.
3. After each pass, name the dimension of quality you are currently most focused on. If it is the same dimension for 3 consecutive passes, you are approaching staleness.
4. If you complete a pass and change fewer than 5 lines of CSS, ask: "Is this because the page is genuinely close to done, or because I have stopped seeing what needs to change?"

**Dimension-specific staleness detectors:**
- **DD staleness:** "I am adjusting spacing values without re-checking whether the density rhythm tracks the content's velocity. My density work has become numerical (4px here, 8px there) rather than semantic (dense where the content accelerates, sparse where it breathes)."
- **OD staleness:** "I am organizing information into hierarchy without asking whether the hierarchy COMES FROM the content or is imposed by convention."
- **CD staleness:** "I am deploying dimensions one at a time -- this section gets density treatment, that section gets organizational treatment -- rather than asking where DD + OD effects should INTERACT on the same elements."
- **AD staleness:** "I have established a reading path and stopped questioning it. My Z-pattern or F-pattern was set at pass 3 and has not been re-evaluated against the content's evolving spatial argument."

**When staleness is detected (2+ detectors fire):**
1. STOP building. Do not make another CSS change until freshness is restored.
2. Perform AT LEAST ONE of the following (mandatory, not optional):
   a. Re-read the content source file from beginning to end (full re-read)
   b. Screenshot at a viewport not used in the last 3 passes
   c. Write a notebook entry: "If I started this page over with everything I now know, what would I build DIFFERENTLY?" -- if the answer is "nothing," either the page is done or your imagination is stale. Test by re-reading the content.
3. After the freshness intervention, the NEXT pass must change the evaluation dimension (if you were evaluating density, evaluate organization next).

---

## False Convergence Signals

Five specific warning signs that the agent thinks it is done but is not:

1. **Satisfaction without swap-testing.** The agent feels good about the page but has not applied the swap test recently. The satisfaction may be attachment to the work, not quality assessment.
2. **Research marked "not applicable" without trying.** A finding was dismissed as irrelevant without being tested against the current page state. Findings that were irrelevant at pass 10 may be critical at pass 40.
3. **"Good enough" plateau.** The agent makes fewer changes per pass and interprets this as convergence. But convergence is not the same as depth -- the agent may have reached a LOCAL maximum, not the global one.
4. **Habituation blindness.** Elements that were jarring at pass 5 feel normal at pass 30. Not because they were fixed -- because they were seen enough times. The agent has adapted to the problem rather than solving it.
5. **Process fatigue masquerading as completion.** The agent is tired (context window filling, many passes completed) and reframes this as "the page is done." Test: "Would I build this differently if I started over with everything I now know?" If yes, the page is not done -- the agent is fatigued.

The comprehensiveness of the evaluation grows with the comprehensiveness of the builder's relationship with the content. A pass-5 evaluation asks "does the page have zones?" A pass-50 evaluation asks "does the page's 5-scale fractal density system embody the content's argument about self-observation at every scale, and does the responsive behavior preserve that embodiment at 768px, and does the typography rhythm at the character level encode the same power asymmetry that the grid proportions encode at the section level?"

These are not different questions on a deeper checklist. They are questions the agent COULD NOT HAVE ASKED at pass 5. The evaluation deepens because the evaluator deepens. The agent at pass 50 is not the same agent that was at pass 5 -- it has 45 passes of lived relationship with this content and this page. Its evaluation capacity has grown with its understanding.

---

## Input

The agent receives:

1. **The content markdown** -- the full article, extraction, or deep extraction. Not a brief. Not a summary. The original text.
2. **The design system soul files:**
   - `design-system/compositional-core/identity/identity.md`
   - `design-system/compositional-core/identity/vocabulary.md`
   - `design-system/compositional-core/vocabulary/tokens.css`
   - `design-system/compositional-core/components/components.css`
3. **The full research corpus** -- loaded wave by wave, not all at once:
   - R1-R5 research findings (337 findings, ~4,104 lines)
   - RESEARCH-SYNTHESIS.md (383 lines)
   - Case studies: DD-003, DD-004, DD-006, OD-001, OD-004, OD-006, CD-001, CD-005, CD-006 + visual companions + ANTI-PRESCRIPTION-TEMPLATE + README (~5,120 lines)
   - Grammar: mechanisms.md, grammar.md
   - Provenance: synthesis documents, stage handoffs (optional depth)

**Total available research: ~11,000 lines across soul files, R1-R5, case studies, grammar, and guidelines. The agent reads ALL of it, wave by wave.**

### Output

One HTML file. Self-contained. All CSS in a `<style>` block. Google Fonts via `<link>` tags. No external dependencies.

Optional: A builder's notebook, wave retrospectives, and a final reflection. These are thinking tools, not deliverables.

---

## How to Read Content for Spatial Form

Not "read deeply." Specifically:

**First reading (Comprehension):** What is this about? Summary, argument, emotional arc. Read as a READER, not a builder. Let it land.

**Second reading (Spatial Listening):** What spatial words are embedded in the subject matter? "Panopticon" (radial structure). "Parallel" (grid). "Gap" (spatial absence). "Widening" (expanding corridor). The agent is not inventing metaphors -- it is finding the ones already there.

**Third reading (Structural Anatomy):** What geometric structures does the content contain? 8 parallel items = grid. Progressive argument = widening shape. Duality = asymmetric split. Cycle = loop. Map the content's structure to spatial forms. Additional mappings:
- A diagnostic or choice structure = a branching tree
- A hierarchy of nested concepts = nested containers
- Categories with different internal logic = pattern-switching

**Fourth reading (Hypothesis Formation):** Form 2-3 spatial hypotheses using the template: **"This content's [specific feature] demands [specific spatial form] because [specific reason from the content]."** Write them down. A good hypothesis has four properties: it is about the content (not the layout), it is falsifiable, it passes the swap test, and it drives CSS decisions.

**Good hypotheses:**
- "This content's 8 parallel domains demand a grid because they operate simultaneously, not sequentially."
- "This content's argument widens from one provocation to a comprehensive system, so the page should physically widen."
- "This content's institutional vs. personal power dynamic demands bilateral asymmetry -- 70/30 split."

**Bad hypotheses (these are too generic -- push deeper):**
- "This content has sections, so it should use a grid."
- "This page should be visually interesting."
- "The layout should match the content's theme."

**The Swap Test:** Take any spatial decision and mentally transplant it to different content. If it survives, it is GENERIC -- push deeper. If it breaks, it is CONTENT-DERIVED -- keep it.

**The Per-Section Diagnostic (use this CONSTANTLY):** For every section of the content, ask: **"What is the SHAPE of what this section says?"** If the answer is "a vertical column of prose," the content's spatial logic has not been found yet. This question forces spatial thinking about content -- the agent cannot answer it without forming a content-to-space mapping. Use it at every section, at every pass, throughout the entire build.

---

## Loss Detection -- The Primary Cognitive Move

Of the seven cognitive moves, loss detection is the MOST POWERFUL because it transforms an open-ended creative problem ("what spatial form should this have?") into a diagnostic problem ("what is destroyed by the default?"). LLMs are better at detection than invention. Use this.

**The question:** "What would be lost if this content were presented as prose in a single column?"

The loss NAMES the spatial form:

| Content Feature | What is Lost in Single Column | Spatial Form That Preserves It |
|----------------|------------------------------|-------------------------------|
| 8 parallel domains | Simultaneity -- cannot see them together | Grid |
| Institutional vs. personal | Power asymmetry -- they look equal | Unequal columns (70/30) |
| Confinement to liberation | Progressive expansion -- progression invisible | Widening container |
| Warning/re-constriction | Re-constriction -- looks like more prose | Re-narrowing container |
| File tree / hierarchy | Nesting structure -- flattened to list | Tree component |
| Handoff between spaces | Bridge quality -- becomes another paragraph | Narrow connecting element |
| "Violent gap" emotional rupture | Rupture force -- absorbed into flow | Full-bleed break |

The loss-detection table is not just an analysis tool -- it IS the spatial skeleton. Once you have the table, the page's spatial form is DERIVED, not invented.

**If you cannot build a loss-detection table for the content, the content may not have spatial potential.** That is useful information. Not all content demands spatial form.

---

## Seven Cognitive Moves That Produce Spatial Invention

1. **Content-as-Entity-Relationship:** Map content elements as entities with relationships. Parallel items become grids. Hierarchies become asymmetric proportions. Dependencies become connections.
2. **Loss Detection:** "What would be lost in a single column?" The loss names the spatial form. (See the loss-detection table above -- this is the PRIMARY move.)
3. **Metaphor Listening:** The content's subject matter contains spatial metaphors. Panopticon = radial. Architecture = layered. Journey = corridor. Listen for them.
4. **Velocity Scanning:** Where does the content accelerate (lists, commands, rapid examples) and decelerate (philosophy, reflection, synthesis)? Velocity maps to density.
5. **Self-Reference:** If the content is ABOUT a structural concept, can the page DEMONSTRATE that concept? A page about self-observation that observes its own reader. A page about patterns that indexes its own patterns.
6. **Gap Completion:** When 3 of 4 transitions exist, the absence of the 4th becomes conspicuous. Completeness drives invention by making gaps visible.
7. **System Coherence:** The page is a system. Does the border-weight gradient set up an expectation? Does the dark zone subvert it? Does the density build create a rhythm the coda resolves? Coherence produces compound invention.

---

## Eight Spatial Archetypes (Vocabulary, Not Menu)

These are forms that have been found hiding in content. Your content may contain forms not on this list. The list is open-ended -- follow the content wherever it leads. Each archetype includes how the agent discovers it and the CSS signature that enacts it.

| # | Archetype | How to Discover | CSS Signature |
|---|-----------|----------------|--------------|
| 1 | **Width as Argument** (the corridor) | Content whose scope widens or narrows. Progressive argument, expanding vision, constriction. | `max-width` varies by section. Opening at 600px, expanding to 960px, re-narrowing. Container width IS the argument. |
| 2 | **Grid as Taxonomy** | N parallel items (N > 3) that operate simultaneously, not sequentially. Domains, categories, options. | `grid-template-columns` with named areas. Non-uniform cells. `grid-template-areas` using content vocabulary. |
| 3 | **Asymmetry as Power** | Content with power differentials, institutional vs. personal, large vs. small, dominant vs. subordinate. | Unequal columns: `grid-template-columns: 7fr 3fr` or `2fr 1fr`. The ratio encodes the power relationship. |
| 4 | **Loop as Cycle** | Content that returns, iterates, spirals. Feedback loops, recursive arguments, cyclical processes. | Visual return: the page physically loops back via layout, callbacks, or structural echoes. Components at the end reference the beginning. |
| 5 | **Compression as Bottleneck** | Content that narrows through a decision point, filter, or crisis. Diagnostic structures, choose-your-path. | Container narrowing: `max-width` decreases at the bottleneck. Density increases. Visual pressure. |
| 6 | **Self-Reference as Meta** | Content ABOUT a structural concept the page can demonstrate. Self-observation, pattern recognition, meta-cognition. | Components that reference the page's own structure. A TOC that updates. A margin note that comments on the layout. |
| 7 | **Negative Space as Absence** | Content about what is missing, what was lost, what cannot be seen. Gaps, absences, silences. | Deliberate empty space that IS content. `min-height` on empty containers. The absence is visible as spatial form. |
| 8 | **Pattern-Switching as Enactment** | Content that shifts register -- philosophical to technical, narrative to analytical, calm to urgent. | Different layout patterns for different registers. Grid in analytical. Single column in narrative. Full-bleed in urgent. The page ENACTS the register shifts. |

**Compound forms emerge when archetypes combine.** Width-as-argument + compression-as-bottleneck = a corridor that narrows to a crisis point. Grid-as-taxonomy + asymmetry-as-power = a grid where one cell dominates. Compound forms emerge at passes 40+ when the agent has internalized enough vocabulary to see combinations.

---

## Primacy Rotation -- Why Reading Order Matters

Transformer attention follows a U-shaped curve: tokens at the **beginning** (primacy) and **end** (recency) of the context window receive disproportionate weight. Everything in the middle compresses. Over 10 passes, if the reading order never changes, the agent will build a page that deeply reflects the first and last files read while the middle files -- potentially the richest -- get structurally underweighted.

**Primacy rotation compensates for this.** Each wave's rotation schedule ensures every research file gets at least two turns at the **primacy position** (read first, highest attention). The rotation is not arbitrary -- it is engineered to give each file maximum attention when the page's development stage most benefits from that file's contribution.

**The mechanics:**
- **Position 1 (Primacy):** File read first in the pass. Gets the most attention. This is the file the agent is "building FROM" in this pass.
- **Position 2-3 (Supporting):** Files read as targeted cross-references. Gets partial attention.
- **Final position (Recency):** File read last. Gets moderate attention but recency boost.
- **Unread files:** Files not read in this pass. Gets ZERO text attention. But dimension permeation carries the THINKING forward.

**Dimension permeation:** A file's THINKING permeates all passes, not just primacy passes. When R3 is at primacy, density thinking does not stop when R3 leaves primacy -- density is always a dimension being evaluated. Track in your notebook: for each pass, note which dimensions you applied even when their files were not at primacy.

**Diagnostic override (universal):** After each pass, the agent may override the next pass's primacy:
1. What dimension of the page feels weakest right now?
2. Which file addresses that dimension?
3. Has that file been at primacy in the last 2 passes? If NO: override. If YES: follow default.
4. Has any file gone 4+ passes without primacy? If YES: that file gets primacy next.

**Per-file phase tracking:** Each file has its own depth progression independent of the wave's global phase:
- **1st primacy visit:** STRUCTURAL -- read broadly, make bold additions.
- **2nd primacy visit:** INTEGRATION -- ask how findings RELATE to what you built since last reading.
- **3rd+ primacy visit:** DEPTH -- fine-grain application, compound connections.

**The 4-pass neglect threshold:** No file should go 4+ consecutive passes without primacy UNLESS the wave explicitly documents why.

### The Delta Profile -- Self-Diagnostic Tool

The number of CSS lines changed per pass follows a predictable curve. Use deviations as a diagnostic:

```
Pass:  1    2    3    4    5    6    7    8    9   10   11   12
Delta: 200  150  100  80   50   +/-20 30   30   60  -30   80   <10
```

- **Pass 6 is often NET NEGATIVE** -- the rhythm audit removes more than it adds. This is healthy.
- **Pass 10 is NET NEGATIVE** -- architectural cleanup removes dead code. This is healthy.
- **If you are making 100+ line changes at pass 8,** your integration passes (4-6) failed.
- **If you are making 5-line changes at pass 2,** you are not being ambitious enough.
- **If every pass is positive,** you are not removing enough. Some passes should SUBTRACT.

### Named Pass Archetypes (Within Any Research Wave)

| Pass | Name | Cognitive Stance | Expected Delta |
|------|------|-----------------|---------------|
| 1 | **First Contact** | Read primacy file fully. Identify 3-5 HIGH findings. Bold, rough additions. | 100-200+ lines |
| 2 | **Second Lens** | Re-read same research but page has changed. Findings that seemed irrelevant now click. | 80-150 lines |
| 3 | **Gap Sweep** | Selective reading. 30-40% of findings applied/irrelevant. Triage remaining 60%. | 50-100 lines |
| 4 | **First Holistic Read** | First pass reading the ENTIRE page as a composition. Changes are relational. | 30-80 lines |
| 5 | **Transition Refinement** | Focus on 4-6 transition boundaries between zones. | 20-50 lines |
| 6 | **Rhythm Audit** | Check density oscillation across the full page. Often involves net REMOVAL. | -20 to +20 lines |
| 7 | **Typography as Argument** | Letter-spacing as density encoding. Line-height as breathing speed. | 10-30 lines |
| 8 | **Interaction as Experience** | Hover timing, transition durations, temporal experience. | 15-40 lines |
| 9 | **Self-Reference + Coupling** | Swap test as creative tool. Highest-coupling inventions often emerge here. | 20-60 lines |
| 10 | **Architectural Soundness** | CSS audit, dead code removal, specificity cleanup. NET REMOVAL. | -10 to -50 lines |
| 11 | **Responsive as Content-Derived** | Not just reflow -- content-preserving responsive behavior. | 30-80 lines |
| 12+ | **The Invisible Grain** | Sub-perceptual changes. Slice exhaustion signal. | <10 lines |

**Not every pass adds.** Passes 6 and 10 are removal passes. An agent that expects every pass to be additive will interpret removal as failure rather than integration.

---

## The Absorption Protocol

This is how you take a research file and make it part of your spatial vocabulary. This protocol applies to EVERY research file in EVERY wave.

**First read:** Read for SPATIAL IMPLICATION, not comprehension. Do not ask "what does this finding say?" Ask: "What spatial forms does this finding IMPLY for my content? What does this file make me SEE about my page that I could not see before reading it?" The gap between comprehension and spatial implication is where all the value lives.

**Triage:** Classify findings as HIGH (directly addresses a gap in THIS page), MEDIUM (relevant but not urgent), or SKIP (not relevant to this content). But: EVERY finding marked SKIP gets a 1-sentence reason in the notebook. Premature dismissal is the #1 failure mode of research absorption. You WILL revisit these.

**Build from it:** Change CSS. Not "apply finding X." The question is: "What does this file make me SEE about my page that I could not see before reading it?" Build from that seeing, not from a checklist of findings. The research changes your perception. Build from the changed perception.

**Look at the result:** Screenshot. Scroll through. The question is NOT "did I apply the finding correctly?" The question is: "Has this file changed what I PERCEIVE about the page? Can I see something now that was invisible before I read it?" If the answer is no, you read too shallowly. Re-read.

**Re-read the same file:** After building, re-read the SAME file. It means something different now because the page changed. Findings you dismissed as SKIP may now be HIGH. The page's physical variation has opened your eyes to moments where meaning should become physical. This is not optional. Every file gets at least 2 readings -- the second reading after building from the first is where the deep connections emerge.

**Compound check:** After absorbing file N, before moving to file N+1: "How does what I just absorbed interact with what I absorbed from previous files? Where do they compound? Where do they conflict?" Write this in the notebook. Compound connections between files are the highest-value spatial inventions -- they emerge ONLY from the intersection of multiple research perspectives applied to the same page.

**Depth test:** "Am I citing findings or THINKING in this file's vocabulary?" If you are citing specific finding numbers ("R3 says fractal density, so I add fractal density"), you are applying instructions. If you are thinking in the file's vocabulary ("the density in Zone 3 needs to oscillate because the content's velocity oscillates"), the research is internalized. Continue until the latter. That is the goal.

**The "10+ passes per slice" principle:** Each research file gets 10+ full build-look-refine cycles as an ACTIVE lens, not just 2-3 primacy turns. When R3 is not at primacy, density thinking does not stop -- you are still actively building density, looking at density, evaluating density, and refining density at every pass. The primacy file gets the deepest read; all other dimensions get active cycle engagement.

---

## The Process

### The Endless Cycle

```
         absorb content
              |
       ,------+------,
      /                \
   refine    <-->    build
      \                /
       '------+------'
              |
          re-enrich (new research)
              |
       ,------+------,
      /                \
   refine    <-->    build
      \                /
       '------+------'
              |
          re-enrich
              |
             ...
```

Each cycle, the builder knows more. Not because someone told it more -- because it SAW more. It built the page, looked at it, and noticed what the previous version did not capture. The content has not changed. The builder's understanding has deepened. That deepened understanding produces a better page. The better page, when examined, reveals further depth that was not visible before. The cycle feeds itself.

### What "10+ Passes Per Slice" Actually Means

This is the most important operational concept in the skill. It does NOT mean "rotate this file to primacy 10 times." It means: **do the full build --> look --> refine --> enrich cycle 10+ times with each research slice as the active lens.**

One pass = one full cycle:

```
1. READ the research slice (or re-read it with evolved understanding)
2. BUILD -- change the HTML/CSS based on what the research reveals
3. LOOK -- screenshot, scroll, experience what you just built
4. EVALUATE -- 5-layer metacognitive assessment of what you see
5. REFINE -- adjust based on the evaluation
6. DECIDE -- what does the page need next? What did I learn?
```

That is ONE pass. Do it 10+ times with each slice. Each cycle, you see more. Each cycle, the research means something different because the page has changed. Each cycle, your evaluation deepens.

**Why 10+ and not 3?** At pass 3, you have applied the obvious findings. At pass 7, you start seeing compound relationships invisible at pass 3. At pass 10, the research has become a lens you think through rather than a list you apply from. The qualitative difference between pass 3 and pass 10 is not "more findings applied" -- it is "fundamentally different understanding of what the research means for THIS content."

### The Reciprocal Relationship

The process is not one-directional (read --> build). It is circular:

**Read content --> Build --> Look at what was built --> Re-read content through the lens of what was built --> Discover new content features --> Build again**

After building the bilateral asymmetry block, the agent reads the asymmetry passages differently -- not as an abstract argument but as a spatial relationship already constructed. The page teaches you how to read the content. Building is bidirectional.

---

## The Wave Schedule

### Genuine Exhaustion (All 3 Must Be Present)

A wave is exhausted only when ALL three conditions hold simultaneously:

1. **The delta profile has stabilized at invisible grain.** The last 2-3 passes produced 5-15 line changes. A reader would not notice the difference.
2. **The research re-read produces no new ideas.** The agent can annotate every finding: "applied," "irrelevant to this content," or "addressed indirectly."
3. **The "infinite time" answer is invisible.** Every proposed change is below the perceptual threshold.

If any one condition is NOT met, the wave is not exhausted. Continue.

### Minimum Engagement Per Wave

To prevent premature convergence, each wave has minimums:

| Requirement | Minimum |
|-------------|---------|
| Passes | 8 (varies by wave, see wave cards) |
| Applied findings | If 0 from any file, write notebook entry explaining why |
| Swap test | Applied to 3+ sections per wave |
| Notebook entries | 1 per pass |
| Screenshot sessions | 2 per wave |
| Adversarial self-question | 1 per 4 passes |
| Full HTML re-read | 2 per wave |

These are FLOORS, not targets. If the agent is consistently hitting minimums and wanting to stop, that is process fatigue, not genuine exhaustion.

### Wave Transition Protocol (re-read at the START of every wave)

Before beginning any wave, verify:
1. **Exhaustion check:** Did the previous wave meet ALL THREE exhaustion conditions? If not, go back.
2. **Physics check:** `border-radius: 0` everywhere? `box-shadow: none` everywhere? Font trinity only? Color palette only? Container <=960px (unless corridor)? If any violation, fix before proceeding.
3. **Notebook check:** Write your current "definition of good" sentence (Definition Journal). Compare to last wave's. If identical, your evaluation did not evolve -- investigate before proceeding.
4. **Look before reading:** Take a screenshot and LOOK at the page before reading any new research for this wave. Ask: "What does the page need?" This question precedes "What does the research offer?"
5. **Content re-read:** Re-read the content source file. Ask: "Is there content in the source not yet in the HTML?"
6. **Dimension check:** Which of the 8 perceptual dimensions can you currently perceive? Which are absent? Name them. This is your self-diagnostic for the wave.
7. **Reading depth check:** At which stage are you -- ABOUT, MOVES, IMPLIES, DEMANDS, or FUSES? The wave card will tell you where you should be. If you are behind, re-read the content before proceeding.

### Wave Overview

| Wave | Name | Input Files | Passes | Purpose |
|------|------|------------|--------|---------|
| 0 | Content Immersion | Content source ONLY | 8-12 | Form the spatial hypothesis. No design system, no research. |
| 1 | Design System Soul | identity, vocabulary, tokens, components | 10-14 | Apply physics to skeleton. Translate arbitrary values to tokens. |
| 2 | Research R1-R5 | R1-R5, SYNTHESIS | 12-18 | Absorb 337 findings. Expand spatial vocabulary across all dimensions. |
| 3 | Case Studies | DD/OD/CD explorations, mechanisms, grammar | 12-18 | Study spatial processes from completed explorations. Translate, don't copy. |
| 4 | Synthesis + Provenance | SYNTHESIS re-read, semantic-rules, provenance | 8-12 | Resolve conflicts. Compound combination. Meta-understanding. |
| 5 | Combination Mastery | CD-006 re-read, grammar, HTML as artifact | 8-12 | Subtractive. Simultaneous dimensions. CSS architecture. |
| 6 | Integration | None (internalized) | 15-25 | Taste audit. Surgical refinement. Responsive deepening. Architecture. |
| 7 | Self-Audit | Fresh eyes on the page | 8-12 | Adversarial. Criteria. Comprehensive. Content-coupling. Surgery. |
| 8 | Final Enrichment | Content re-read | 5-10 | Surgery from Wave 7 findings. Responsive. Accessibility. Closure. |

**Total: 86-131 passes** (within the 100-200 target range depending on content complexity)

Each wave card at `waves/WAVE-N.md` contains the detailed instructions: rotation schedules, 5-layer evaluation at that wave's depth, pass-level deepening, per-dimension metacognitive questions, staleness signatures, cycle evolution descriptions, and cognitive transformation gates. **Load the card when entering the wave. The card IS the wave.**

---

## Retrospectives as Thinking

At the end of each wave, the agent writes a retrospective. This is NOT documentation -- it is a COGNITIVE ACT. Writing forces vague dissatisfaction into specific language that can be acted on. "The page feels competent but not exciting" was not a pre-existing judgment that Wave 1 recorded -- it was the act of writing that crystallized the judgment.

Each retrospective has a BASE set of questions PLUS wave-specific questions (defined in the wave card) that the agent could not have asked at an earlier wave:

**Base questions (every retrospective):**
1. **What did this wave contribute to the page?** (Applied findings, new components, spatial inventions)
2. **What did the page teach me about the research/content?** (The reciprocal relationship -- building changes reading)
3. **What does the NEXT wave need to address?** (Explicit handoff questions -- specific, not vague)
4. **How has my evaluation deepened?** (What can I see now that I could not see before this wave?)
5. **Which perceptual dimensions deepened this wave?** (Name them. Which dimensions are still shallow?)
6. **What is my content reading depth now?** (ABOUT / MOVES / IMPLIES / DEMANDS / FUSES -- and what specific evidence?)

The retrospective IS where the thinking happens. The retrospective IS where the agent discovers what it actually thinks about the page. If the retrospective is perfunctory, the wave was wasted.

---

## The "Looking" Protocol

"Look at the page" is too vague. Here is what looking means -- and it EVOLVES with depth.

### The Base Protocol (always do these)

1. **Take screenshots** at 1440px and 768px (minimum). Full-page and above-the-fold.
2. **Scroll through** the full page at reading speed. Not analyzing -- EXPERIENCING. Note where you stop, where you scan, where you linger.
3. **Experiential assessment first:** What is the page's energy? Where does the spatial drama hold? Where does it soften? Write this down BEFORE any analytical assessment.
4. **Analytical assessment second:** Assess across the 8 perceptual dimensions. Not all are visible at every stage -- assess what is present and name what is missing.
5. **The swap test** on 2-3 sections: Could this layout survive transplantation to different content?
6. **The per-section diagnostic** on weakest sections: "What is the SHAPE of what this section says?"
7. **Layer 2-5 metacognitive check:** Why am I seeing what I am seeing? What am I NOT seeing? How would I know? Has my evaluation deepened?
8. **The entanglement check:** "Did changing one thing reveal problems in other dimensions?" If yes, follow the cascade.

### How Looking Evolves With Depth

**Waves 0-1 (Looking = Imagining + Sketching):** The page barely exists. Looking means imagining what the spatial hypothesis WOULD look like rendered. Screenshots of early drafts are rough checks, not quality assessments. The evaluation mode is "does the skeleton match the hypothesis?"

**Waves 2-3 (Looking = Comparing):** The page has structure. Looking means comparing what you see against the research vocabulary you have absorbed. "R3 describes fractal density at 3 scales. Does this page have density at more than 1 scale?" The evaluation mode is "does the page speak the vocabulary the research taught me?"

**Waves 4-5 (Looking = Diagnosing):** The page is mature. Looking means diagnosing compound relationships -- how density interacts with organization, how typography rhythm supports or undermines the spatial argument. The evaluation mode is "does the page work as a SYSTEM?"

**Waves 6-8 (Looking = Tasting):** The page is deeply familiar. Looking means holistic taste judgment that transcends any individual dimension. The scroll-through produces a FEELING, not a checklist of observations. The evaluation mode is "does the page feel like the content DEMANDED this form?" Trust this taste -- it is the product of 70+ passes of lived relationship.

### The 4-Phase Evaluation Progression (within ANY wave)

1. **STRUCTURAL** (early passes): "Does this work as spatial form?" -- evaluating the BONES.
2. **RELATIONAL** (mid passes): "Do the components talk to each other?" -- evaluating CONNECTIONS.
3. **COUPLING** (late passes): "Is the form inseparable from the content?" -- evaluating FUSION.
4. **POTENTIAL** (exhaustion passes): "What could this page still become?" -- evaluating what is NOT YET HERE.

### Screenshot Protocol

```bash
# Start server
lsof -ti:8080 | xargs kill -9 2>/dev/null || true
python3 -m http.server 8080 --directory "{OUTPUT_DIR}" &
sleep 1

# For each viewport (1440, 768):
# 1. browser_resize to viewport width, height 900
# 2. browser_navigate to http://localhost:8080/_build-final.html
# 3. browser_evaluate: () => document.fonts.ready
# 4. browser_evaluate: disable animations
#    () => { const s = document.createElement('style');
#    s.textContent = '*, *::before, *::after { animation: none !important; transition: none !important; opacity: 1 !important; }';
#    document.head.appendChild(s); }
# 5. browser_take_screenshot (fullPage: true)
# 6. Scroll through in 800px increments, screenshot at each position

# Stop server
lsof -ti:8080 | xargs kill -9 2>/dev/null || true
```

Verify file sizes: real content = 30k-200k+. Blank = ~5-6k. If blank, restart server and retry.

**IMPORTANT:** On Retina displays, Playwright may capture at non-1x device pixel ratio. If screenshots look unexpectedly scaled, set viewport with `deviceScaleFactor: 1`.

---

## Measurement

### The 10 Falsifiable Criteria

These are a FLOOR, not a ceiling. They discriminate "in love" output from procedural output at minimum thresholds. By Wave 6, you should be so far past these that they feel like checking whether the page has a DOCTYPE.

| # | Criterion | Floor Threshold | What Wave 6+ Looks Like |
|---|-----------|----------------|------------------------|
| 1 | Named grid areas use content vocabulary | 2+ | Every grid area name is a content term. Generic names feel wrong. |
| 2 | Asymmetric grid proportions serve content hierarchy | 2+ | The ratios ARE the content's power structure. |
| 3 | Sections where layout loss = content loss | 2+ | Most sections fail vertical collapse. |
| 4 | Self-referential components | 2+ | The page comments on itself naturally. |
| 5 | Position relative/absolute composition pairs | 2+ | Layering serves content meaning, not decoration. |
| 6 | Content-mapped color semantics | 1+ system | Color encodes content dimensions specifically. |
| 7 | Distinct spatial organization count | 4+ | Every section has its own spatial logic. |
| 8 | Transition/animation density | 6+ | Motion serves reading pace and emphasis. |
| 9 | CSS comments reference content reasoning | 5+ of 10 | Every comment explains WHY, not WHAT. |
| 10 | Non-default reading directions | 1+ | Reading direction variation is content-driven. |

**At Wave 3: 7+ = on track. 4-6 = partial. 0-3 = procedural.**

### Content-Form Coupling Grades

| Grade | Definition |
|-------|-----------|
| **INEVITABLE** | Form could not exist without THIS content. Removing either destroys both. |
| **STRONG** | Form clearly serves this content. Swap test fails for most content. |
| **ADEQUATE** | Form is appropriate but not specific. Swap test passes for similar content. |
| **GENERIC** | Form could house any content. A container, not an argument. |
| **ABSENT** | No meaningful spatial form. Pure vertical stack. Nothing to swap. |

**Target: No section below ADEQUATE. Multiple INEVITABLE. Zero GENERIC or ABSENT.**

### DOM Skeleton Count

Count the number of fundamentally different spatial organizations in the page. Each unique `grid-template-areas` definition, each unique positioning composition, each unique directional change, each unique flex configuration counts as a distinct DOM skeleton.

- Pipeline average: 1-2
- Exploration average: 5-9
- Target: determined by content, not by a number. But if below 4, the agent has not yet formed a content topology.

---

## Anti-Patterns

Things this skill explicitly rejects:

1. **"Build a standard vertical skeleton first."** This establishes the vertical stack as default, and every subsequent pass adds surface treatments to a form that was never content-derived.
2. **"Deploy mechanisms."** Research is vocabulary, not instruction. No mechanism menu. No deployment manifest.
3. **"Be creative."** This describes OUTPUT, not PROCESS. Replace with the specific cognitive moves: read for spatial form, form hypotheses, apply the swap test, build from topology.
4. **Fixed pass counts.** "Do 3 passes" kills depth. The skill specifies MINIMUM passes per wave, not maximum. The agent stops when genuinely exhausted, not when a counter expires.
5. **Static evaluation.** Any checklist applied identically across all passes. The evaluation MUST evolve.
6. **Compression of research.** No intermediary filters, summarizes, or packages the research. The agent reads the full research itself. 50:1 compression is 98% information loss.
7. **Separation of building and evaluating.** There is no "build phase" followed by "evaluate phase." The agent is always doing both.
8. **Handoff between agents.** The entire value depends on ONE agent building over MANY iterations. Context window boundaries are tolerable. Agent handoffs are not.
9. **"Sample 2-4 mechanisms from the catalog."** The single most destructive instruction in the pipeline. The agent should never "sample mechanisms" -- it should read deeply and let the content's demands determine which spatial forms emerge.
10. **"Use interesting layouts" / "Make it visually rich."** These describe OUTPUT, not PROCESS. Replace with: "What is the SHAPE of what this section says?" and "What would be lost in a single column?"
11. **Premature convergence.** "The page looks done" after 20 passes is almost always false convergence.
12. **Arbitrary gate metrics.** CSS line counts, screenshot counts, numbered thresholds that measure compliance rather than cognitive transformation. Gates test whether the builder's RELATIONSHIP with the content has changed, not whether they hit a number.

---

## Context Window Management

At ~200K tokens per context window and ~10K consumed per pass, a single window holds ~15-20 passes. The full build spans 8-12 context windows.

**The HTML as compression device:** The HTML file is not just memory. It takes the product of thousands of tokens of processing -- every design decision across every pass -- and encodes it in a form that allows a new context window to resume productive work without re-deriving prior decisions. The model reads the HTML and sees the 7:3 ratio already in place. It does not need to re-derive why. The ratio is there.

**What carries forward across windows:**
- The HTML file (primary -- this IS the accumulated understanding in enacted form)
- The builder's notebook (reasoning, open questions, spatial hypotheses)
- All wave retrospectives (handoff state for each completed wave)

**Notebook management:** After each wave, write a WAVE SUMMARY (20-40 lines) compressing the per-pass entries into key learnings and open questions. If the notebook exceeds ~200 lines, prune older per-pass entries, keeping only the wave summaries. The summaries persist; the per-pass details are ephemeral.

**Deepening test journal (NEVER prune):** The one-sentence "definition of good" written at the start and end of each wave is a PERMANENT notebook entry. Never prune these.

### The Content Handoff

The content source file starts at primacy and gradually cedes to the HTML:

- **Early passes (Wave 0):** The content source is PRIMARY. Read at primacy.
- **Middle passes (Waves 1-2):** The content is now IN the HTML. HTML takes primacy. Content source moves to audit position: read LAST, checking for omissions.
- **Later passes (Waves 3+):** Content source read only when the agent suspects content has been lost, or at new context window start.

**Reading order for new context windows:**
1. Builder's notebook (PRIMACY -- carries reasoning at risk of loss)
2. Most recent wave retrospective (handoff state)
3. The HTML file (the artifact)
4. Current wave card
5. Current wave's primacy research file
6. The content source file (if entering a new wave)

### Context Window Transition Protocol

**Proactive detection:** Write a transition state to the notebook PROACTIVELY every 15 passes as insurance. Additionally, write immediately when: (a) you receive a context compression event, (b) responses feel constrained, (c) you cannot recall details from earlier passes.

When approaching context limits:

1. **Write transition state** to `{OUTPUT_DIR}/_notebook.md`:
   ```
   ## CONTEXT TRANSITION -- {timestamp}
   Current wave: {N}, Pass: {M}
   Current primacy file: {filename}
   Next action: {what I was about to do}
   Open questions: {2-3 active hypotheses or unresolved tensions}
   Last 3 decisions and why: {brief}
   Wave exhaustion status: {which conditions met, which not}
   Perceptual dimensions currently active: {list}
   Content reading depth: {ABOUT/MOVES/IMPLIES/DEMANDS/FUSES}
   ```
2. **Save the HTML** -- ensure the latest version is written to disk.
3. **Write wave retrospective** if mid-wave (even partial).

**When a new context window opens:** Read in the order above (notebook --> retrospective --> HTML --> wave card --> research --> content). Then:
- State current position
- Take a screenshot and LOOK before continuing
- Resume the build-look-refine cycle

---

## Cost

**Expected: $150-300 per build. Duration: 6-10 hours. 100-200 passes across 9 waves (Wave 0-8).**

This is not a cost to be minimized. It is the price of the time for an agent to fall in love with content.

| Dimension | Pipeline (~$60) | /falls-in-love (~$300) |
|-----------|----------------|----------------------|
| Agents | 17-34 | 1 (with context continuity) |
| Research compression | 50:1 | 1:1 (agent reads all) |
| Content engagement | 0.6% of builder attention | 100% of agent attention |
| Feedback loop | build --> wait --> audit --> wait --> fix | build --> look --> fix --> look |
| DOM skeletons | 1-2 | 10-18+ |
| Content-form coupling | 0 INEVITABLE | 4+ INEVITABLE |
| Spatial inventions | 0 per build | 3-5+ per build |

---

## The Point

One agent with the content and unlimited time produces what no amount of infrastructure can. Not because the agent is smarter. Because the agent has the relationship with the content that produces spatial invention, and infrastructure -- by its nature -- replaces that relationship with compressed rules.

Give the builder the content. Give it time. Let it build, reiterate, refine, re-enrich. Again and again and again. As if it had all the time in the world. The page will tell you when it is done.
