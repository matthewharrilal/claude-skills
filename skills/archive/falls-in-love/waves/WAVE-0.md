# Wave 0: Content Immersion

**Input:** The content source file ONLY. No design system. No research. No vocabulary.

**Minimum passes:** 8. **Expected passes:** 8-12. **Exhaustion signal:** The agent has a spatial hypothesis it believes in. The HTML has all content placed. The skeleton is stable.

---

## The Fundamental Cycle

Each pass is a full cycle: **Read content --> build HTML/CSS --> screenshot and scroll --> evaluate with 5 layers --> refine --> decide what next.** This is true for EVERY wave. The cycle is the fundamental unit of engagement.

At Wave 0 the cycle is pure. No research to absorb, no tokens to apply, no mechanisms to deploy. Just the content and the emerging page. This purity is the point. The purpose is to establish the spatial skeleton before any design vocabulary constrains it. The spatial hypothesis must come from the content itself -- not from a vocabulary the builder already knows, not from patterns seen on other pages, not from a catalog of archetypes. The content speaks first. Everything else comes later.

---

## How to Read Content for Spatial Form at Wave 0

Wave 0 has no research input. The absorption mechanics here are about reading content for spatial implication -- not comprehension, not summarization, but spatial listening.

The agent reads the content 3-4 times through four lenses:

**First reading (Factual/Comprehension):** What is this about? Summary, argument, emotional arc. Read as a READER, not a builder. Let it land. Do not think about layout. Do not think about grids. Just read.

**Second reading (Structural/Spatial Listening):** What spatial words are embedded in the subject matter? "Panopticon" (radial structure). "Parallel" (grid). "Gap" (spatial absence). "Widening" (expanding corridor). The agent is not inventing metaphors -- it is finding the ones already there. Read for HOW the content moves, not what it says. Where does the argument compress? Where does it breathe? Where does it turn?

**Third reading (Implicit/Structural Anatomy):** What geometric structures does the content contain? 8 parallel items = grid. Progressive argument = widening shape. Duality = asymmetric split. Cycle = loop. Map the content's structure to spatial forms. Additional mappings: a diagnostic or choice structure = a branching tree. A hierarchy of nested concepts = nested containers. Categories with different internal logic = pattern-switching.

**Fourth reading (Spatial/Hypothesis Formation):** Form 2-3 spatial hypotheses using the template: **"This content's [specific feature] demands [specific spatial form] because [specific reason from the content]."** Write them down. A good hypothesis has four properties: it is about the content (not the layout), it is falsifiable, it passes the swap test, and it drives CSS decisions.

### How Each Re-Reading Must Differ

Each re-reading of the content should produce DIFFERENT spatial observations, not the same ones confirmed. If reading 3 produces the same observations as reading 2, the builder is reading for confirmation rather than discovery. The technique: after each reading, write down what you noticed that you did NOT notice on the previous reading. If the list is empty, you are reading at the same depth. Change your entry point -- start at a different section. Read the conclusion first. Read only the transitions between sections. Read only the first sentence of each paragraph. The content has spatial structure at every scale, and each reading angle reveals a different scale.

### The "First Plausible Hypothesis" Trap

The first spatial idea that seems to work is almost never the deepest. It is the most ACCESSIBLE -- the form that requires the least engagement to see. A builder reads about "8 domains of sovereignty" and immediately thinks "grid." That grid hypothesis is not wrong. But it is first-order. The deeper hypothesis -- that the 8 domains are arranged in a power hierarchy where 3 are foundational and 5 are derived, which implies asymmetric grouping rather than uniform grid -- requires a third or fourth reading to see. The first plausible hypothesis is the one the builder sees BEFORE the content has fully spoken. Resist it. Write it down. Then ask: "What spatial form would I see if this hypothesis is wrong?" Generate at least one alternative. The alternative may be worse. But the act of generating it deepens the reading.

### Building Forces Spatial Commitment

You cannot build without deciding, and deciding reveals gaps in understanding. The act of writing `grid-template-columns: repeat(4, 1fr)` forces the question: are these 4 things really equal? The act of placing content in a container forces the question: where does this content end and the next begin? Building is not the execution of a plan -- it is a DISCOVERY TOOL. The HTML draft is a spatial hypothesis rendered concrete, and its concreteness reveals whether the hypothesis holds.

### The Reciprocal Relationship at Wave 0

Building changes what you can perceive in the content. After building a draft, re-read the content -- it will say different things now. The bilateral asymmetry block, once built, teaches the agent that the content's power dynamic is spatial -- which makes the agent read ALL subsequent sections for power dynamics. A grid, once built, makes the agent notice where the content BREAKS the grid pattern -- where items are not parallel but hierarchical. The draft is not a checkpoint. It is a new lens for reading the content.

This reciprocity is the deepest mechanism of Wave 0. The content teaches the builder what to build. The build teaches the builder how to read the content. Each cycle of this reciprocity deepens both.

---

## Loss Detection at Wave 0

Loss detection is not just a validation check -- it is the primary spatial DISCOVERY tool.

**The question:** "What would be lost if this content were presented as prose in a single column?"

The loss NAMES the spatial form:

| Content Feature | What is Lost in Single Column | Spatial Form That Preserves It |
|----------------|------------------------------|-------------------------------|
| N parallel items | Simultaneity -- cannot see them together | Grid |
| Power asymmetry | Inequality -- they look equal | Unequal columns |
| Progressive argument | Expansion -- progression invisible | Widening container |
| Warning/re-constriction | Re-constriction -- looks like more prose | Re-narrowing container |
| Hierarchy / nesting | Nesting structure -- flattened to list | Tree component |
| Handoff between spaces | Bridge quality -- becomes another paragraph | Narrow connecting element |
| Emotional rupture | Rupture force -- absorbed into flow | Full-bleed break |

Use loss detection as a discovery tool, not a checkbox. The question is not "yes, stuff would be lost" (that is always true). The question is: "What SPECIFIC thing would be lost, and what does that loss NAME?" Each loss is a spatial form waiting to be built. If you cannot build a loss-detection table for the content, the content may not have spatial potential -- that is useful information.

---

## Dimension Visibility at Wave 0

At Wave 0, the builder has no design system, no research, no vocabulary beyond what they already know. Of the 8 perceptual dimensions, their visibility is unequal:

**PRIMARY -- Structural:** The spatial skeleton IS the structural dimension. This is what Wave 0 builds. Grid proportions, container widths, asymmetric splits, reading direction, section organization. Every CSS decision at Wave 0 is a structural decision. This dimension is fully active.

**NASCENT -- Typographic:** Raw content has typographic hierarchy even without design tokens. Headings exist. Body text exists. The builder will make typographic choices (font sizes, weights, spacing) even without the design system's font trinity. These choices are provisional -- they will be replaced in Wave 1 -- but they reveal the content's voice structure. How many distinct voices does the content have? Where do register shifts happen? The typographic dimension is present but unfurnished.

**DORMANT -- Temporal, Material, Chromatic, Behavioral, Relational, Atmospheric:** These six dimensions are not yet active. They require vocabulary the builder does not yet have -- research findings, design tokens, case study patterns. The builder should be AWARE that these 6 dimensions are dormant, not pretend they do not exist. Awareness means: when making a structural decision, note in the notebook where that decision will constrain or enable later dimensional work. A 7:3 grid ratio (structural) will later need material differentiation between the columns, chromatic distinction, and typographic voice shifts. The structural skeleton is the FOUNDATION for all other dimensions. Decisions made now shape what is possible later.

### How Structural Decisions Constrain Later Dimensions

A narrow corridor constrains chromatic range (less surface area for color events). A wide grid enables material contrast between cells but demands typographic consistency to hold the grid together. A full-bleed section creates a temporal event (a break in rhythm) that later waves must honor. The builder at Wave 0 cannot yet work these dimensions, but should build structural forms that INVITE later dimensional work rather than foreclosing it.

---

## Content Reading Depth at Wave 0

The builder enters at **ABOUT** (comprehension) and should reach early **MOVES** (seeing what the content does, not just what it says) by the end of the wave.

**What ABOUT looks like:** "This article discusses 8 domains of crypto sovereignty." That is surface. It captures the subject matter. It is necessary but not spatial. A pipeline brief could capture this.

**What early MOVES looks like:** "The article COMPARES these 8 domains by juxtaposing them, which implies spatial simultaneity -- they should be visible together, not stacked sequentially." MOVES sees the content's verbs, not just its nouns. The content does not just DESCRIBE 8 domains -- it COMPARES them, RANKS them, GROUPS them. These verbs are spatial instructions. Comparing implies adjacency. Ranking implies hierarchy. Grouping implies containers.

**The builder cannot reach IMPLIES yet.** IMPLIES requires design vocabulary they do not have -- research findings, case study patterns, mechanism awareness. IMPLIES is when the content's unstated spatial logic becomes visible, and that requires a spatial vocabulary beyond the builder's current stock. That vocabulary arrives in Waves 2-3.

The content reading depth will deepen across waves. Wave 0 establishes the foundation -- the builder must at minimum be at MOVES before transitioning. If the builder is still at ABOUT by pass 8 (can describe what the content says but not what it DOES), they need more passes.

---

## The 5 Layers at Wave 0 Depth

- **L1 (Seeing):** "Does the page have a spatial idea? Can I state it in one sentence?"
- **L2 (Why now):** "What in my reading of the content made THIS spatial hypothesis emerge? What specific content moment triggered the projection from text to geometry?"
- **L3 (Not seeing):** "What spatial forms am I missing because I haven't read any research yet? My spatial vocabulary is limited to what I already know. What content features might suggest forms I've never encountered?"
- **L4 (How to know):** "If I apply loss detection -- 'what would be lost in a single column?' -- does the answer reveal spatial potential I haven't addressed?"
- **L5 (Evaluation evolving):** "Am I still reading the content with fresh eyes on pass 8, or have I locked into my first spatial hypothesis and stopped seeing alternatives? Has my DEFINITION of what this content wants to become deepened since pass 1?"

---

## Pass-Level Deepening

The evaluation questions change as the wave progresses. This is not optional variation -- it is mandatory deepening. Each phase asks a qualitatively different question.

**Passes 1-3 (Comprehension):** Evaluation asks "what is the content ABOUT?" The builder is reading for understanding. Spatial observations are incidental -- they arrive as side effects of comprehension, not as the primary goal. The builder writes initial spatial observations in the notebook but does not commit to them. The HTML draft at this stage is exploratory scaffolding.

**Passes 4-6 (Projection):** Evaluation asks "what does the content WANT TO BE as a spatial form?" The builder has read the content enough to project its structure into geometry. The HTML draft becomes a genuine spatial hypothesis. Loss detection becomes the primary tool. The builder should have a loss-detection table by pass 5. The reciprocal relationship intensifies -- each build attempt reveals content structure that was invisible before.

**Passes 7-8+ (Interrogation):** Evaluation asks "is my spatial hypothesis the DEEPEST possible reading, or the first plausible one?" The builder interrogates their own hypothesis. The swap test becomes critical: take the current spatial form and mentally transplant it to different content. If it survives, it is generic -- push deeper. The builder writes at least one ALTERNATIVE spatial hypothesis they considered and rejected, with reasons. If they cannot generate an alternative, they have not read deeply enough.

---

## Wave-Specific Staleness Signatures

Staleness at Wave 0 has characteristic forms that differ from staleness at later waves:

**Hypothesis lock-in.** The builder forms a spatial hypothesis by pass 3 and spends passes 4-8 confirming it rather than interrogating it. The notebook entries stop generating new observations and start justifying existing decisions. The HTML changes are cosmetic -- CSS tweaks within the same structural approach rather than structural alternatives. This is the most common Wave 0 failure mode.

**Same-angle reading.** The builder reads the content the same way every time -- same entry point, same focus areas, same observations. No new spatial features emerge because the reading angle never changes. The diagnostic: after each re-read, can you name something you noticed that you did not notice on the previous reading? If not, change your reading angle.

**Structural monotony.** The builder attempts the same structural approach with minor CSS variations instead of genuinely different spatial hypotheses. Three versions of a two-column layout are not three hypotheses -- they are one hypothesis with cosmetic variation. A genuine alternative would be: "What if this content is not a two-column comparison but a widening corridor?"

**Premature skeleton satisfaction.** The skeleton "feels done" before the builder has interrogated whether it is the deepest reading. The diagnostic: "Would I build this differently if I started over with everything I now know?" If yes, the skeleton is not done -- the builder has stopped looking.

**Checkbox loss detection.** The builder asks "what would be lost in a single column?" and answers "yes, stuff would be lost" rather than generating a specific loss-detection table with named losses and corresponding spatial forms. Loss detection is a generative tool, not a yes/no question.

**Silent notebook.** The builder never writes alternative spatial hypotheses in the notebook. Every entry is about the current approach. The absence of alternatives is a staleness signal -- it means the builder has not generated competing hypotheses to interrogate against.

---

## Wave-Specific Retrospective Questions

At the end of Wave 0, the builder asks questions that could NOT be asked at any other wave -- questions about the raw encounter between builder and content before any external vocabulary entered:

1. **"What is my spatial hypothesis, stated in one sentence? How is it different from what I would have said at pass 2?"** This measures whether the hypothesis deepened through building or locked in early.

2. **"What content features am I NOT YET representing spatially? What dimensions of the content remain invisible in the current skeleton?"** This creates a gap list that Waves 1-3 will address. The builder should be able to name specific content features that have no spatial expression yet.

3. **"If I had access to the design system right now, what would I WANT it to give me?"** This desire reveals gaps in spatial thinking. The answer is not "colors and fonts" (that is surface). The answer should be something like "a way to encode the difference between institutional authority and personal agency" -- a spatial need the content has surfaced that the builder cannot yet fulfill.

4. **"What surprised me about the content on later readings that I didn't notice on the first?"** This measures the reciprocal relationship. If nothing surprised the builder, the re-readings were confirmatory rather than generative.

5. **"Which structural decisions will most constrain the typographic work ahead? Where is the skeleton rigid, and where does it leave room for dimensional expansion?"** This is the structural-to-typographic readiness question. The builder should be able to identify which structural decisions are load-bearing (changing them later would require rebuilding) and which are provisional (easy to modify when design tokens arrive).

---

## Cognitive Transformation Gate

The gate tests whether the builder's RELATIONSHIP with the content has changed. Not arbitrary metrics. Not CSS line counts. The gate is cognitive transformation.

### The Five Gate Conditions

1. **Has the content stopped being "text to lay out" and started being "a shape to build"?** The builder should be unable to describe the content without using spatial language. Not "an article about 8 domains" but "a simultaneous array of 8 parallel claims with asymmetric authority tiers."

2. **Can the builder state their spatial hypothesis in one sentence?** And can they explain why that sentence is different from what they would have said at pass 2? The hypothesis should have deepened through the act of building, not just been confirmed.

3. **Has the builder's understanding of the content deepened through the act of building?** The reciprocal relationship must be demonstrable. The builder should be able to point to a specific content feature they only noticed BECAUSE they built something that forced them to decide how to handle it.

4. **Has the builder written at least one ALTERNATIVE spatial hypothesis they considered and rejected (with reasons)?** This proves the builder interrogated their primary hypothesis rather than just confirming it. The rejection reasons should reference the content, not convenience.

5. **Does the 3-condition exhaustion model hold?**
   - **Delta stabilized:** The last 2-3 passes produced diminishing structural changes -- refinements, not reorganizations.
   - **Content re-read produces nothing new:** The builder has re-read the content and it does not suggest spatial forms they have not already addressed or noted for later waves.
   - **Infinite time answer is invisible:** If the builder had unlimited additional time at Wave 0 (without new research input), they cannot see what they would change.

   At Wave 0, "research re-read" is "content re-read" -- there is no research yet. All three conditions must hold simultaneously.

### What the Gate Is NOT

The minimum pass count (8) serves as anti-compression insurance ONLY. It is not the gate. A builder who reaches pass 8 and has not experienced cognitive transformation should continue. A builder who reaches pass 12 and meets all five conditions should transition. The gate is cognitive transformation, not a counter.

CSS line counts are not the gate. A skeleton could be 80 lines of deeply considered structure or 200 lines of generic scaffolding. The gate does not measure output volume. It measures whether the builder's relationship with the content has changed.

---

## Definition Journal Entry

At the START of Wave 0, write in the notebook: **"My current definition of 'good' for this page is: ___."**

At the END of Wave 0, write it again. Compare. These two sentences should be qualitatively different -- not "more detailed" but "operating at a different level."

Example evolution:
- Start of Wave 0: "Good = the page has clear sections and readable typography"
- End of Wave 0: "Good = the page has a spatial form that matches the content's argument -- the corridor width IS the argument's scope, the grid IS the taxonomy, the asymmetry IS the power dynamic"

If the end-of-wave definition could have been written at the start, the wave did not produce cognitive transformation. Investigate before transitioning.
