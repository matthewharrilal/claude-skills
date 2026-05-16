---
name: tension-composition
description: Takes real content as input and runs the full tension-composition pipeline — multi-axis questioning (FEEL/UNDERSTAND/DO/BECOME + discovered axes) to tension derivation to metaphor collapse to compositional layout generation. Outputs both the THOUGHT PROCESS (showing each step, axis, candidate metaphor tested) AND a Conviction Brief that makes the builder want to create THIS page. Use when the user wants to derive compositional layouts from content, explore tension between content needs and design constraints, or transform markdown content into designed HTML pages. Trigger phrases include "tension composition", "compositional layout", "derive a layout", "content to composition", "run the pipeline".
---

**CRITICAL PRINCIPLE — READ THIS FIRST**

**You are CONSTRUCTING a composition, not DISCOVERING one.**

Your lens shapes what you see. The categories you bring (warmth, hierarchy, progression) determine what patterns emerge. The metaphor you choose is a CREATIVE ACT, not an inevitable conclusion.

**What this means:**
- Multiple valid metaphors exist for the SAME content
- Your derivation is ONE PATH, not THE PATH
- The tension you identify is CONSTRUCTED through your questioning
- The metaphor you select is CHOSEN, not found

**The opposite of this (discovery bias):**
- "The content IS geological" -- NO, you are READING it as geological
- "This metaphor is THE answer" -- NO, this metaphor is A bridge you built
- "The tension demands this resolution" -- NO, you chose to resolve it this way

**Success = conscious construction. Failure = unconscious pattern-matching.**

---

# Tension-Composition Pipeline

Transforms raw content into compositional HTML layouts by deriving tension between what the content NEEDS and what the design system DEMANDS, then collapsing that tension through metaphor into concrete visual mechanisms.

## The Pipeline (5 Phases)

```
CONTENT -> ASSESSMENT -> MULTI-AXIS QUESTIONING -> TENSION DERIVATION -> [GATE] -> METAPHOR COLLAPSE -> CONVICTION BRIEF -> [REFLECTION]
  (input)  (Phase 0)       (Phase 1)               (Phase 2)                      (Phase 3)            (Phase 4)          (Phase 4.5)
```

Phase 5 (standalone output, divergence verification) is in STANDALONE-APPENDIX.md for direct `/tension-composition` invocation only.

---

## Phase 0: Content Assessment

Before entering the pipeline, assess whether the content is appropriate for compositional derivation.

### Step 0A: Content Type

Read the content. Is it mostly prose? Mostly code/visuals? A mix? About the design system itself?

- **Prose-dominant** -- STANDARD path. Proceed to Phase 1.
- **Mixed** -- HYBRID path. Identify narrative vs reference vs code sections. Run pipeline on narrative sections; apply design system defaults to code/data sections.
- **Visual-dominant** -- PRESENTATION-INTRINSIC path. Skip metaphor derivation for visual portions. Apply design system styling without restructuring. Only derive metaphor for prose framing.
- **Self-referential** (content describes the design system itself) -- ABORT. The pipeline cannot derive tension between content and system when the content IS the system. Apply design system defaults directly.

### Step 0B: Scope

- **Short** (a few paragraphs): Lighter pipeline. Fewer axes, single metaphor. The content will tell you when there isn't enough material.
- **Standard** (article-length): Full pipeline as specified.
- **Long** (multi-section): Segment content into logical sections first. Run pipeline per section, then apply a unifying pass (shared palette, consistent typography, connected spacing rhythm).
- **Massive** (book-length): Pipeline runs on individual pages, not the whole. Consider multi-page architecture.

### Step 0C: Section Identification

For standard and long content:
1. Identify natural sections by heading, topic shift, or mode change
2. Classify each: NARRATIVE / REFERENCE / CODE / DATA / MIXED
3. Flag sections with incompatible structural needs (these may need section-level metaphor variation in Phase 4)

### Step 0D: Pipeline Entry

**Every page runs the FULL pipeline (Phases 1 through 4).** Peak richness occurs at maximum content-mechanism fit, not maximum technique count. The natural landing zone is 16-18 mechanisms across all 5 categories, but count is a BYPRODUCT of multi-channel encoding, not a goal. A page with 12 perfectly-deployed mechanisms that reinforce a coherent metaphor is richer than 18 forced ones.

**Exception: Sub-skill mode.** When invoked as a sub-skill by /build-page, the TC agent runs Phases 0 through 4 and outputs via Phase 4.5 (Conviction Brief). The HTML compositional layout is handled by the downstream builder.

The Addition Test (Phase 2) is the ONLY escape valve: if content has zero genuine tension, skip Phases 3-4 and apply design system defaults. This is content-form fit detection, not tier routing.

### Step 0E: Library Access Prohibition (CRITICAL)

**YOU MUST NOT read the following during Phases 0-3:**

- `design-system/compositional-core/case-studies/` (pattern library)
- `design-system/compositional-core/components/` (component library)
- Prior compositional explorations (DD-001 through AD-006)
- Tension-test layouts (boris/, gastown/, playbook/)

**Why:** Library patterns are VALIDATION tools, not GENERATION tools. Reading them before metaphor commitment = pattern-matching, not tension-deriving. You will be building from content tension and domain knowledge, NOT from library templates. The library exists to verify your metaphor is novel, not to provide your metaphor.

**When library access is permitted:**
- Phase 4: Read mechanisms.md + grammar.md + components.css (reusable techniques + rules)
- Standalone mode only: Read case-studies for divergence verification (see STANDALONE-APPENDIX.md)

---

## Phase 1: Multi-Axis Questioning

Read the input content deeply. For THIS SPECIFIC CONTENT, ask questions across multiple axes to derive what the reader needs.

### The Core Four (Always Run)

| Axis | Question | What It Produces | Richest When |
|------|----------|-----------------|-------------|
| **FEEL** | "What does the reader need to FEEL while navigating this content?" | Emotional/sensory needs: warmth, safety, tension, curiosity, momentum | Narrative content, emotional topics, onboarding, first-contact pages |
| **UNDERSTAND** | "What does the reader need to UNDERSTAND about the relationships in this content?" | Cognitive/structural needs: causality, hierarchy, comparison, progression | Technical docs, architectures, system descriptions, causal explanations |
| **DO** | "What does the reader need to DO with this content after reading?" | Action/decision needs: choose, evaluate, implement, prioritize | Tutorials, guides, decision frameworks, reference material |
| **BECOME** | "What does the reader need to BECOME after absorbing this content?" | Transformation needs: a practitioner, an evaluator, a designer, a critic | Learning paths, philosophy, methodology, identity-forming content |

### Extended Core (Always Consider)

After the core four, always ask these five. Mark LOW YIELD when they don't produce genuine needs -- but always ask.

| Axis | Question | Richest When | Low Yield When |
|------|----------|-------------|----------------|
| **NAVIGATE** | "How does the reader need to move THROUGH this content?" | Long-form, multi-section, non-linear reference | Short, single-concept, linear |
| **TRUST** | "What does the reader need to believe about this content's AUTHORITY?" | Extraordinary claims, unfamiliar sources, behavior-change content | Purely factual, internal docs |
| **EVALUATE** | "What does the reader need to JUDGE about quality, validity, or fit?" | Comparisons, competing approaches, varying confidence | Single-path tutorials, factual reference |
| **ORIENT** | "What does the reader need to know about WHERE THIS FITS before engaging?" | Series content, prerequisite-dependent, context-sensitive | Standalone, self-contained |
| **RECONCILE** | "What does the reader need to RECONCILE between this and what they already believe?" | Paradigm-shifting, myth-busting, counterintuitive | Confirming existing knowledge |

### Structural Trigger Axes (Deploy Conditionally)

Scan the content for these signals. Deploy the axis only when content signals relevance.

| Axis | Deploy When Content Contains... | Structural Pattern Triggered |
|------|--------------------------------|------------------------------|
| **COMPARE** | 2+ alternatives, trade-offs, A-vs-B decisions | Side-by-side layout, comparison tables, parallel columns |
| **IDENTIFY** | Personas, case studies, reader-as-protagonist | Voice selection, example mirroring, perspective anchoring |
| **DISCOVER** | Aha-moments, progressive revelation, mystery structure | Delayed payoff, collapsible reveals, question-before-answer |
| **SEE** | System architectures, state machines, spatial relationships | Diagrams, spatial layout, visual metaphors |
| **REMEMBER** | Reference patterns, checklists, content to internalize | Summary anchors, mnemonic structures, visual chunking |

### Axis Selection Protocol

1. Run core four (always)
2. Run extended five (always, but mark LOW YIELD when appropriate)
3. Scan content for structural trigger signals -- deploy 0-5 conditional axes as relevant
4. The Phase 1 output table will have 4-14 entries depending on content richness

### The Opposition Principle: Opposition Predicts Richness

The axes that produce the RICHEST tension are those whose demands OPPOSE the system's personality:

- **RECONCILE** (challenge vs assert) -- richest, highest potential
- **NAVIGATE** (choice vs hierarchy) -- complex topology vs decisive ranking
- **EVALUATE** (equanimity vs opinion) -- judgment requires holding equal, system is opinionated
- **DISCOVER** (withholding vs directness) -- genuinely oppositional structural demands
- **FEEL** (warmth vs edges) -- classic, always available

Axes whose demands ALIGN with the system produce cosmetic tension: TRUST (both want authority), DO (both want action), ORIENT (both want positioning). Avoid building primary tension from aligned axes.

### Axis Interaction Effects

Some axis PAIRS produce richer tension than either alone:
- **RECONCILE + IDENTIFY**: "Change what you believe AND who you are" -- double transformation
- **NAVIGATE + COMPARE**: "Move freely AND hold things in parallel" -- maximum structural complexity
- **DISCOVER + UNDERSTAND**: Oppositional structural demands (withhold vs reveal) create intra-content tension
- **FEEL + EVALUATE**: Emotional engagement vs critical distance

Note these pairs when both are high-yield -- they create COMPOUND tension that opens wider metaphor spaces.

### Phase 1 Output

A table for each axis that produced yield:

```
AXIS: FEEL
Needs: [warmth, graduated trust, invitation to explore, progressive density]
Structural Properties: [layering, ordering by depth, compression gradient]

AXIS: UNDERSTAND
Needs: [causal chains, evidence quality, upgrade/downgrade paths]
Structural Properties: [branching, state transitions, bidirectional flow]
```

---

## Phase 2: Tension Derivation

Each axis's needs (Side A) creates tension against the design system constraints (Side B). The tension is where composition lives.

### Side A: Reader Needs (from Phase 1)

Take each axis's needs and their structural properties. These are the content's demands.

### Side B: KortAI Design System Personality (DYNAMIC — Read From Files)

**CRITICAL: Read these 2 files NOW to derive Side B.** Do not use memorized values. Read fresh.

1. **`design-system/compositional-core/identity/identity.md`** — Character, soul principles, identity signatures, internal tensions, refusals, diagnostics
2. **`design-system/compositional-core/identity/vocabulary.md`** — Design decisions & rationale (palette, typography, spacing, borders, container width)

From these files, extract:
- **Character statement** (from identity.md §Character) — the personality you're deriving tension against
- **Soul principles** (from identity.md §Soul Principles) — the 2 immutable constraints
- **Identity signatures** (from identity.md §Identity Signatures) — the 3 recognizable traits
- **Internal tensions** (from identity.md §Internal Tensions) — productive contradictions the system already acknowledges
- **Refusals** (from identity.md §Refusals) — what the system will not do (absolute + conditional)
- **Design rationale** (from vocabulary.md) — WHY each design choice was made

**Synthesize these into a 3-5 sentence characterization of the personality you are deriving tension AGAINST, using "but" to name its central paradox.** Example: "An editorial purist that insists on sharp geometry and flat surfaces, BUT speaks in warm earth tones that invite lingering."

**The world this page lives in** is constructed from the character statement and soul principles. Do NOT use static prose — DERIVE the world-description from what you read.

**Personality spectrum** is constructed from the character statement. The identity.md file describes internal tensions (warmth vs severity, solid offset vs anti-shadow, vocabulary ceiling) — these ARE the personality spectrum, not a static 8-axis slider.

**The Soul Test (from identity.md §Diagnostics):**
- The Bootstrap Test: If a layout could exist in a Bootstrap project without modification, it lacks KortAI identity.
- Additionally: "Does every design choice serve hierarchy or readability?" and "Is there any decoration that doesn't earn its place?"

### The Addition Test (Genuine vs. Cosmetic Tension)

The single most important diagnostic:

> **Can you fulfill the reader's need by selecting and placing existing design system components without transforming their meaning?**
> - YES = COSMETIC (no tension, assembly is sufficient)
> - NO = GENUINE (tension exists, metaphor required)

### Three Criteria for Genuine Tension

A tension is genuine when ALL THREE hold:

1. **Semantic opposition**: Side A's emotional/experiential need is semantically opposed to Side B's personality. "Warmth" opposes "austerity." The opposition must be at the level of MEANING, not implementation detail.

2. **Vocabulary gap**: Side B has no direct tool for Side A's need. No component you can instantiate directly produces the needed feeling.

3. **Structural overlap despite emotional opposition**: Even though the sides are emotionally opposed, they share structural properties (layering, ordering, containment). This overlap is what makes a bridge (metaphor) POSSIBLE. Without it, the tension is impossible, not productive.

### Three Criteria for Cosmetic Tension

A tension is cosmetic when ANY of these hold:

1. **False opposition**: "The reader needs clarity" vs "the system provides clarity" -- no actual opposition.
2. **Direct tool available**: The system already has a mechanism that serves the need. No transformation required.
3. **Decoration substitution**: The "tension" resolves by adding a label, header, or color accent rather than transforming meaning.

### The Tension Spectrum

```
NO TENSION ---- COSMETIC ---- WEAK GENUINE ---- STRONG GENUINE ---- IMPOSSIBLE
    |               |              |                   |                  |
  direct         surface        requires           requires          no bridge
  match          styling        moderate            deep               exists
                 suffices       reframing           metaphor
```

The pipeline's sweet spot is STRONG GENUINE. That is where metaphor lives.

### Deriving Tension

For EACH high-yield axis from Phase 1:

1. **List Side A's emotional/structural demands** (what the content wants)
2. **List Side B's personality/constraints** (what the system gives)
3. **Identify the GENUINE opposition** -- where Side A wants something Side B resists
4. **Apply the Addition Test** -- genuine or cosmetic?
5. **Apply the BECAUSE test** -- "The reader needs X BECAUSE [specific content property]." If you cannot complete this sentence with a specific content property, the need is manufactured.
6. **Apply the SUBSTITUTION test** -- Replace your content with a DIFFERENT topic entirely. Does the same metaphor still work? If YES, coupling is generic -- the metaphor is not derived from THIS content's tension but from a universal template.

### Evaluating Tension Richness

When multiple axes produce genuine tension, consider three dimensions:

- **Opposition Depth**: How many LAYERS of opposition? Surface opposition (single dimension) or deep opposition (multiple intersecting dimensions)?
- **Structural Overlap**: How many structural properties are shared despite emotional opposition? High overlap means more paths to a metaphor.
- **Metaphor Space Width**: How many DISTINCT metaphor candidates does the tension suggest? Narrow space = fragile. Wide space = rich creative territory.

These dimensions are MULTIPLICATIVE in their effect. Deep opposition with zero structural overlap = impossible to bridge. High overlap with shallow opposition = obvious and uninteresting. Prefer tensions where all three dimensions are substantial.

When multiple tensions compete, prefer the one whose opposition creates the most SURPRISING bridge. Prefer tensions whose axis pairs COMPOUND into richer territory than any single axis alone.

### Tension Landscape: KortAI Quick Reference

**STRONGEST tensions against KortAI:**
- Warmth/comfort vs. austerity (proven)
- Reconciliation vs. verdict-drive (highest potential)
- Playfulness vs. formality (unexplored, high potential)
- Mystery/intrigue vs. explicit labeling (unexplored)
- Spatial understanding vs. linear scroll (unexplored)
- Building confidence vs. institutional intimidation (unexplored)
- Community/dialogue vs. editorial monologue (unexplored)

**ZERO tension (assembly territory):**
- Hierarchy/structure -- system already IS this
- Clarity/precision -- system already IS this
- Step-by-step guidance -- Task Progression component exists
- Choosing between options -- Decision Matrix component exists

### Tension Validity Check

After deriving tensions, ask honestly:
- Is this tension genuine? (Addition Test passes)
- Is it rich enough to sustain a metaphor? (All three dimensions substantial)
- Can I actually bridge it? (Structural overlap exists)
- Is it driven by THIS content specifically? (BECAUSE test passes)

If any check fails, accept assembly (no metaphor needed -- this is a valid output) or reframe the reader need more specifically.

### Exit Ramp: The Tension Threshold Gate

After completing Phase 2, evaluate total tension:

- **GENUINE tension count = 0** -- Zero-tension path. Skip Phases 3-4. Apply design system defaults directly.
- **All tensions COSMETIC** -- Cosmetic path. Skip Phase 3. Phase 4 proceeds with direct component mapping.
- **At least 1 GENUINE tension** -- Proceed to Phase 3.

---

## Phase 3: Metaphor Collapse

The metaphor is the BRIDGE between the two sides of tension. It resolves the emotional opposition by finding a real-world domain where the shared structural properties exist naturally.

> **The tension is emotional; the bridge is structural.** The opposition between sides is at the level of feeling. The bridge (metaphor) works at the level of form, structure, and pattern. A structural bridge does not average between warm and austere -- it creates a form where the SAME structure is simultaneously warm in one reading and austere in another.

### Step 3.1 -- Extract Structural Properties from Side A (Reader Needs)

Transform emotional needs into geometric/topological abstractions. "Warmth" is not a structural property. "Containment with visible boundaries" is.

Examples:
- Graduated trust --> ORDERING (sequence with rank)
- Visible progress --> TRAVERSAL (movement through stages)
- Calibrated investment --> STRATIFICATION (parallel layers of different value)
- Safety in uncertainty --> CONTAINMENT (bounded zones)

### Step 3.2 -- Extract Structural Properties from Side B (System Constraints)

Transform design constraints into geometric/perceptual abstractions:
- `border-radius: 0` --> ANGULARITY (all boundaries are straight lines)
- `box-shadow: none` --> FLATNESS (no depth illusion)
- Border categories (1px, 3px, 4px) --> DISCRETE WEIGHT (finite emphasis levels)
- Spacing scale --> PRECISE INTERVALS (quantized positions)
- Limited palette --> NARROW TEMPERATURE RANGE (small perceptual variation)

### Step 3.3 -- Find the Structural Overlap

Compare Side A's list with Side B's list. What properties appear on BOTH? The overlap zone -- where emotional opposition coexists with structural agreement -- is where metaphors become possible.

High overlap = strong metaphor potential. Low overlap = extreme tension, expect unconventional resolution.

### Step 3.4 -- Generate the Search Query

Combine overlap and gap properties into a constrained search:

> "What real-world domain naturally exhibits [OVERLAP PROPERTIES] while being [SIDE B GAP PROPERTIES] yet conveying [SIDE A GAP PROPERTIES]?"

Example:
> "What is naturally LAYERED and ORDERED and CONTAINED, while being ANGULAR and FLAT, yet conveying SAFETY and WARMTH?"

This query IS the content of the creative step. It is a constrained search against the designer's domain knowledge.

### Three Search Heuristics

1. **Constraint scan**: Start with the HARDEST constraint (eliminates most candidates). For KortAI, ANGULARITY is hardest -- immediately eliminates organic/biological, liquid/fluid, atmospheric, textile, botanical.

2. **Content resonance**: Ask what the content is LITERALLY about. The content often contains the metaphor's seed.

3. **Emotional valence**: Side A's emotion eliminates domains with wrong valence. Warmth/safety eliminates military (aggressive), medical (clinical), judicial (adversarial).

The domain that survives ALL THREE filters is the metaphor.

### Domain Search Territory (for angular/flat/sharp systems)

Compatible domains to scan: Geological/Sedimentary, Architectural/Structural, Typographic/Editorial, Cartographic/Territorial, Industrial/Mechanical, Scientific/Laboratory, Legal/Contractual, Archival/Catalogic, Military/Strategic, Astronomical/Surveying. This is a search menu, not a lookup table. Selection is creative; the menu ensures viable domains aren't overlooked.

### Incompatible Domain Families (for KortAI)

These CONFLICT with angular/flat/sharp constraints:
- **Organic/Biological**: Requires curves, growth patterns
- **Liquid/Fluid**: Requires flowing shapes, gradients
- **Atmospheric/Weather**: Requires opacity, blur, softness
- **Textile/Fabric**: Requires texture, draping
- **Musical**: Requires curves (sound waves, notation)

### Step 3.5 -- Evaluate Candidates

For each candidate, consider:

**Does it resolve the tensions?** Test against every genuine tension from Phase 2. A metaphor that resolves 5/7 tensions may outperform one that resolves 7/7 if the unresolved tensions are minor.

**How many independent structural mappings does it have?** Each physical property of the metaphor that maps to both a content property AND a CSS mechanism is an isomorphism. 6+ is structurally deep. 2-3 is thin. 0-1 is decorative -- reject.

**Does the content resonate with it?** Two kinds of resonance: nominal (content uses the metaphor's words) and structural (metaphor's internal relationships mirror content's relationships). Structural resonance predicts visual quality; nominal resonance predicts only vocabulary convenience.

**Can every property be expressed in CSS?** Check against the 6 legal channels (background, border, typography, spacing, layout, accent). If any property requires a soul violation, the metaphor fails at mechanism level.

**Before committing, ask these questions about the metaphor's execution risk:**
- Does this metaphor conceptualize transitions as CHANGING STATE or EMPTY SPACE? (Empty space = dead zones)
- Does this metaphor rely on STRUCTURAL GRADIENTS or TEXTUAL LABELS to communicate? (Labels = the metaphor isn't structural)
- Does this metaphor produce VARIED element sizes or UNIFORM grids? (Uniform = monotony)
- Does this metaphor have a natural responsive story at 768px? (No story = responsive breakage)

### 6 Binary Rejection Checks (any YES = reject the metaphor)

| # | Question | If YES |
|---|----------|--------|
| R1 | Does the metaphor use the content's own domain vocabulary? (e.g., "security clearance" for security docs) | Zero interpretive distance. It's a label, not a bridge. |
| R2 | Does the metaphor require visible text labels to communicate? (e.g., "MAIN STREET -- CONNECTING DISTRICTS") | The metaphor is announced, not structural. |
| R3 | Does the metaphor's physical shape force container width below 860px? (e.g., "narrow alley" without escape hatch) | Container must stay within 860-1100px range. |
| R4 | Does the metaphor conceptualize ALL transitions as empty space? (e.g., "page turns," "corridors") | Dead zone epidemic. |
| R5 | Does the metaphor produce 6+ identical repeated elements with no variation? (e.g., "filing cabinet drawers") | Grid monotony. |
| R6 | Does the metaphor require soul violations to express? (e.g., rounded corners, drop shadows) | Soul is non-negotiable. |

### Interpretive Distance: The Highest-Leverage Gate

A metaphor must travel CONCEPTUAL DISTANCE from the content to be a bridge, not a label. "Secure facility" for security documentation = zero distance (label). "Geological strata" for confidence levels = moderate distance (bridge). "Manuscript codex" for a programming tutorial = high distance (surprising bridge).

Zero-distance metaphors are REJECTED regardless of how well they score on other dimensions. If your metaphor uses the content's own vocabulary, it is not a metaphor -- it is a description.

### Step 3.6 -- Select the Metaphor

The winner is the candidate that best resolves the tensions while maintaining structural depth and low execution risk. Document:
- The winning metaphor
- Why it won (which tensions it resolves that others don't)
- What it DOESN'T resolve (honest gaps)
- The full isomorphism table (metaphor property -> content property -> CSS mechanism)

### Metaphor Failure Modes

**Monopoly** (only 1 candidate): Constraints may be too tight. Relax one temporarily and search again.
**Inflation** (8+ candidates): Tension may be cosmetic. Re-examine with the Addition Test.
**Forcing** (no candidate fully resolves): Check for mislabeled tensions. Accept partial resolution if unresolved tension is minor.
**Redundancy** (two candidates tie): Apply tiebreakers: structural resonance > content resonance > mechanism richness.
**Decay** (metaphor weakens during Phase 4): Return to Phase 3 and select next-best candidate.

### The Irreducible Creative Step

The pipeline proceduralizes everything EXCEPT the moment of recognition in Step 3.4 -- perceiving that a specific domain IS the bridge. This is cultivated by:

1. **Expanding domain familiarity** (geology, architecture, cartography, editorial, industrial, scientific)
2. **Practicing the query format**: "What is naturally [CONSTRAINT] while conveying [NEED]?"
3. **Studying successful resolutions** as training data for resolution STRATEGIES

The protocol cannot provide the metaphor. It CAN constrain the search space so the metaphor, when found, feels inevitable.

### Cultural Consideration

When selecting metaphor candidates:
- Prefer physics-grounded over culture-grounded (crystal formation > origami)
- Prefer universal experience over regional (growth > harvest festival)
- For specific audiences, leverage culturally resonant metaphors

---

## Phase 3.5: Metaphor Commitment (LOCK-IN GATE)

**BEFORE proceeding to Phase 4, you MUST complete this gate.**

### Step 3.5A: State Your Committed Metaphor

**Your metaphor:** _______________________________________________

Write it down. This is your LOCKED-IN metaphor. You DO NOT change it after consulting the library.

### Step 3.5B: Document WHY This Metaphor

**How it resolves the tension (specific):**
[What property of THIS metaphor resolves THIS tension? Be concrete.]

**Why this metaphor vs alternatives (specific):**
[What alternatives did you consider? Why did you reject them?]

### Step 3.5C: Commitment Verification

1. **Did I derive this metaphor independently?** YES / NO
   - If NO: You read library patterns before commitment. RESTART Phase 1.

2. **Can I justify this metaphor without referencing library examples?** YES / NO
   - If NO: You are pattern-matching. Regenerate with explicit constraint.

3. **Does this metaphor appear in `/case-studies/_INDEX.md`?** (DO NOT READ full case studies, only titles)
   - If YES: Proceed to divergence justification (Step 3.5D)
   - If NO: Proceed to Phase 4

### Step 3.5D: Divergence Justification (If Convergence Detected)

If your metaphor matches a library pattern title, provide STRONG evidence of independent convergence:

| Question | Your Answer |
|----------|-------------|
| Did I complete Phase 1-2 WITHOUT reading library? | YES / NO |
| Did content analysis INDEPENDENTLY lead to this domain? | YES / NO |
| Can I trace derivation path (tension -> search query -> domain)? | YES / NO |
| Is the content tension IDENTICAL to the case study's tension? | YES / NO |
| Do I have different structural isomorphisms? | YES / NO |

ALL answers must favor independent convergence. If justification fails, regenerate with explicit constraint.

**METAPHOR LOCK ESCALATION:** If the builder cannot express the metaphor within design system constraints: (1) Document the blocking constraint. (2) Trigger TYPE C fix cycle (full TC re-invocation with new metaphor). NEVER silently substitute a different metaphor. Silent substitution produces incoherent compositions.

### Step 3.5E: Creative Check

Pause. Are you EXCITED about this metaphor? Can you see the finished page in your mind? Does this metaphor make you want to BUILD, not just comply?

If the metaphor feels like compliance rather than creation, revisit the tension derivation. The metaphor should generate creative energy, not just satisfy structural requirements.

### Phase 3.5Z: Zone Architecture (Sub-Skill Mode Only)

If running in sub-skill mode (invoked by /build-page): derive the zone architecture from the committed metaphor.

1. **Zone count:** How many zones does the content naturally divide into? (3-5)
2. **Zone naming:** Name each zone using the metaphor's vocabulary (e.g., geological: "Surface Orientation" / "Sedimentary Core" / "Bedrock Synthesis")
3. **Semantic direction:** Assign direction at each boundary (OPENING -> DEEPENING -> DEEPENING -> RESOLVING)
4. **Density assignment:** For each zone, assign density level (sparse/moderate/dense) based on content weight
5. **Content mapping:** For each zone, one-line summary of which content sections map to it

---

## Phase 4: Compositional Architecture

**The Governing Evaluation:**

```
RICHNESS = SEMANTIC DENSITY x RESTRAINT x SPATIAL CONFIDENCE
```

This is MULTIPLICATIVE. Zero in any factor = zero richness regardless of others.

- **DENSITY:** Every CSS rule must be perceptible at 100% zoom. Zero waste. If commenting out a CSS rule causes no visible change, DELETE IT. Use the freed budget on something perceptible.
- **RESTRAINT:** Deliberately withhold some mechanisms. Events (drop caps, breathing transitions, grids) are powerful BECAUSE they are rare. No component type should dominate.
- **CONFIDENCE:** Multiple grid topologies. The 3-tier border system in active use (1/3/4px). Multiple font-size values. Prose that breathes within the container.

**Build boundary-by-boundary, not channel-by-channel.** At each zone boundary, write ALL channels simultaneously (background + typography + spacing + borders). NOT "all backgrounds first, then all borders." The transition table forces this simultaneous thinking.

### The 6 CSS Channels

Every metaphor property expresses through these and ONLY these:

1. **Background color** -- from locked zone palette (sparse, dense, breathing, dark)
2. **Border** -- 3 weights only (3-4px structural, 1px separator, 1px micro)
3. **Typography** -- 3 fonts, multiple sizes (page/section/subsection/body/code/meta)
4. **Spacing** -- mathematical scale (quantized values), 3 semantic tiers (within/between/chapter)
5. **Layout** -- flexbox (sequential), grid (parallel), or none (inline/block)
6. **Color accent** -- primary red for structural emphasis, 5 accent colors for callout borders ONLY

Anything not expressible through these 6 channels is OUTSIDE the vocabulary.

### Step 4.0 -- Mechanism Library Access (NOW PERMITTED)

**You may NOW consult:**

- `design-system/compositional-core/grammar/mechanisms.md` (20 mechanisms, organized by category)
- `design-system/compositional-core/grammar/grammar.md` (compositional rules, sequencing, density patterns)
- `design-system/compositional-core/components/components.css` (CSS implementations)
- `design-system/compositional-core/components/components.md` (component inventory with velocity/weight)

**Read the FULL mechanism catalog.** Extract technique, NOT implementation. Adapt to YOUR context.

A composition that ignores entire dimensions of expression feels incomplete -- like a painting with no sense of depth. Deploy mechanisms across all 5 categories (Spatial, Hierarchy, Component, Depth/Emphasis, Structure/Navigation) as a natural result of multi-channel encoding.

**For EACH mechanism you deploy:** one sentence on WHY it serves THIS content at THIS location.
**For AT LEAST 3 mechanisms you considered but REJECTED:** one sentence on WHY they don't fit.

Monotonous single-column layout is the #1 visual uniformity failure. For pages with many sections, include non-single-column layouts (2-column grid, card layout, data table, sidebar, bento grid) where the content supports them.

### Step 4.1 -- Extract Metaphor Physical Properties (5-Category Taxonomy)

For YOUR COMMITTED METAPHOR, systematically extract properties across ALL five categories:

1. **Spatial**: What is the physical arrangement? Where are things? How do they relate in space?
2. **Temporal**: What is the time dimension? Sequence, rhythm, progression, oscillation?
3. **Material**: What is the substance like? Dense, light, heavy, transparent, textured?
4. **Behavioral**: What does it DO? Descend, expand, oscillate, compress?
5. **Relational**: How do parts relate? Containment, hierarchy, flow, isolation, bridging?

**If ANY category produces zero properties, your metaphor may be insufficiently rich.**

**Density Patterns (spatial organization vocabulary):**

| Pattern | Density Flow | Best When Metaphor Implies |
|---------|-------------|---------------------------|
| CRESCENDO | Sparse -> dense -> resolved | Progressive deepening (geological, archaeological) |
| F-PATTERN | Dense left spine, sparse right content | Hierarchical navigation (editorial, reference) |
| BENTO | Grid-based modular density variation | Parallel independent items (catalog, dashboard) |
| PULSE | Dense-sparse-dense alternation | Rhythmic investigation (Q&A, dialogue, dialectic) |

The metaphor determines WHICH pattern; the content determines WHERE density peaks and troughs occur.

### Step 4.2 -- Pacing Assessment

Before generating HTML, evaluate pacing -- the rhythm of visual variety as the reader scrolls.

Ask:
- How many sections? (7-10 sections risk monotony if uniform; 11+ must introduce grouping)
- Does the metaphor call for empty transitions? (Use CHANGING STATE instead -- background shifts, border changes, density gradients. Empty space = dead zones.)
- Does the metaphor produce same-shaped repeated elements? (Introduce deliberate variation if so)
- Where is the dramatic peak? (Place at 60-80% of page height)
- Are transitions structural or labeled? (GOOD: background shifts, density changes. BAD: "MAIN STREET -- CONNECTING DISTRICTS")

**Rhythm Variation:** Your page must include at least 3 DIFFERENT transition types between major sections. Uniform transitions create mechanical rhythm. Vary them:
- **SMOOTH**: Same-axis continuation, low cognitive shift
- **BRIDGE**: Cross-axis shift with context, reader needs orientation
- **BREATHING**: Major axis shift, full cognitive reset

### Step 4.3 -- Coherence

All channels must reinforce the same metaphor direction at each boundary.

- Density direction must be consistent across ALL channels (if metaphor implies descent: backgrounds darken, borders strengthen, typography compresses, spacing decreases)
- Transition strength must match axis distance (same-axis = smooth, adjacent = bridge, distant = breathing)
- Typography role must match content authority (display serif = highest, body sans = standard, mono = precision)
- Border category must match containment intent (3-4px = structural, 1px = separator)
- Accent color must match semantic role

**Multi-coherence at zone boundaries:** At every zone boundary, >=3 of 6 channels must shift simultaneously, all encoding the SAME semantic direction. This is what separates "composed" from "formatted." Produce a transition table before writing CSS:

| Boundary | Background | Typography | Spacing | Structural | Direction |
|----------|-----------|-----------|---------|-----------|-----------|
| Z1->Z2 | [shift] | [shift] | [shift] | [shift] | [DEEPENING/OPENING/RESOLVING] |

### Step 4.4 -- Components: Adapt Before Inventing

Before inventing a new component:

1. **Can an existing component be ADAPTED?** (modifier class, accent color, spacing adjustment) -- If yes, DO NOT invent.
2. **Can the property be expressed through LAYOUT alone?** (grid, gap, background zones) -- If yes, DO NOT invent.
3. **Is the property actually NECESSARY?** Does the reader need to perceive it? -- If not, let the metaphor be implicit.

Only if ALL THREE are "no" should you invent a new component. Invention must use system-legal CSS only.

### Step 4.5 -- Fractal Consistency

Fractal self-similarity = the SAME design pattern visible at ALL 5 zoom levels:

| Scale | What to Express |
|-------|----------------|
| Navigation | How does the header/nav echo the principle? |
| Page | How does the section arc echo it? |
| Section | How does within-section rhythm echo it? |
| Component | How does component DNA echo it? |
| Character | How does text styling echo it? |

**Build scales in order:** Navigation -> Page -> Section -> Component -> Character. Never implement a finer scale before verifying the coarser scale is perceptible.

**3 strong beats 5 weak.** Navigation + Page + Component must ALL be perceptible. Section and Character are bonus layers.

### Step 4.6 -- Concept-Based CSS Naming

Name your CSS custom properties by CONCEPT, not by position.

**COMPOSED indicator:** `--dispatch-open`, `--dispatch-tactical`, `--stratum-surface`, `--stratum-bedrock`
**APPLIED indicator:** `--bg-z1`, `--bg-z2`, `--color-section-1`

CSS custom property naming is the strongest single indicator of whether the builder is composing or applying. When variables are named by concept, every line of CSS that uses them reinforces the metaphor.

---

## Phase 4.5: Conviction Brief (Sub-Skill Output)

**When invoked by /compose (sub-skill mode):** Stop here. Do NOT proceed to Phase 5. Write the Conviction Brief to the output path specified by the orchestrator.

**You have run the FULL tension-composition pipeline — Phases 0 through 4.** You have interrogated the content from every axis, derived genuine tensions, collapsed to a committed metaphor, verified divergence, and extracted mechanisms. The THINKING is done. Now produce the handoff artifact.

**Use the full power of your metacognitive capacity.** Look at things holistically. The conviction brief is not a compression of your thinking — it is the DISTILLATION. Approach it from multiple angles: what does the builder need to FEEL about this page? What must they understand about the world? What creative invitations emerge from the tensions you discovered? What compositional intelligence did you derive that must cross the boundary to the builder?

**The Conviction Brief makes the builder want to create THIS page, not verify they haven't violated a checklist.** It carries conviction, direction, opposition, and invitation — not mechanisms, thresholds, and compliance checks.

**Explore different avenues of expression.** The brief should convey not just what the metaphor IS but why it's inevitable for THIS content. The builder receives this brief as their primary creative fuel — make it rich enough that a builder reading it forms an immediate compositional vision.

### Conviction Brief Format (NO LINE LIMIT — let conviction determine length)

Write to `[output-dir]/_tc-brief.md` containing these 6 sections:

---

#### Section 1: WORLD-DESCRIPTION

Identity as the world the builder inhabits, not rules the builder obeys. The world-description INCLUDES the metaphor -- the metaphor is not a separate technical decision but part of how this world works.

Content:
- 2-3 lines: The world this page lives in (sharp edges, warm surfaces, flat light -- stated as physics, not prohibition)
- 3-4 lines: The metaphor as natural law of this world ("In this world, knowledge compresses under pressure. The deeper you go, the denser and darker the material.")
- 2-3 lines: The content's specific gravity in this world ("This content has three density registers: the author's voice, the technical substance, and the provocative claim")
- 1-2 lines: The BECAUSE statement -- why THIS metaphor for THIS content
- 1 line: Risk profile -- what the metaphor's concept ENCOURAGES that the builder should RESIST, and what it does WELL that the builder should AMPLIFY

---

#### Section 2: CALIBRATION

Calibration ranges for THIS page, not universal floors. State the RANGE the builder has, anchored to this metaphor's needs. The physics are embedded in the ranges themselves.

Content:
- Container width: the specific width for this page (narrow 860px for dense reading, standard 900-1000px for general, wide 1100px for spatial layouts). Choose based on content needs and metaphor.
- Background arc: the specific hex progression for this page's zones, stated as the world's color temperature gradient
- Spatial arc: the specific padding progression, stated as compression behavior
- Type arc: the specific typography shifts, stated as voice changes
- 1-2 lines on the RANGE available ("The surface zone breathes at 64-80px padding. The bedrock compresses to 32-40px. Between these poles, the full gradient is yours.")

The calibration ranges inherently satisfy perception thresholds without stating them. If the range specifies backgrounds that differ by 25 RGB, the 15 RGB floor is satisfied without being named.

**Creative authority:** You have 80% creative authority within identity constraints. The soul (world-description) and physics (calibration) are non-negotiable. Everything else -- how you interpret the metaphor, which mechanisms you deploy, how zones transition -- is yours.

---

#### Section 3: OPPOSITION MAP

Where the content's needs FIGHT the world's personality. These opposition points are the richest creative territory -- the places where the builder has the most to discover.

Content:
- For each genuine tension (typically 3-5): state the opposition as a CREATIVE INVITATION, not a problem to solve
  - "The content wants warmth and invitation. The world is austere. The opposition lives in the opening zone -- how does austerity invite?"
- For each opposition: name what EMERGES from the fight (not what CSS resolves it)
  - "From the warmth/austerity fight: a containment that feels protective rather than restrictive."
- The DOMINANT opposition: the one that shaped the metaphor most deeply
- The UNRESOLVED opposition: the one where both poles are equally valid and the builder gets to choose

---

#### Section 4: COMPOSITIONAL ARC

The page's compositional arc as a JOURNEY the builder takes the reader through -- not as zones with density labels, but as an experiential narrative with creative waypoints.

Content:
- The arc described as what the reader EXPERIENCES
  - "The page opens wide and warm -- an invitation. The reader settles in..."
  - "At the mid-point, the content compresses. Two ideas need to live side by side..."
- For each major transition: the FEELING of the transition, not the CSS of the transition
  - "The shift from surface to mid-stratum should feel like stepping from a porch into a hallway"
- The CLIMAX: where the page reaches maximum intensity and why
- The RESOLUTION: how the page releases tension (earned closure, not just "footer")
- Creative waypoints: 3-5 specific moments where the builder should invest compositional energy

---

#### Section 5: CREATIVE CONDITIONS

Experimental invitations -- things the builder COULD try, not things the builder MUST verify.

Content:
- 3-5 creative invitations specific to THIS content's opportunities
  - "Try giving the digressions asymmetric margins -- indented left, full right -- so they feel like marginalia without being sidelined."
  - "Consider whether one section deserves the author's voice in Instrument Serif italic -- an editorial aside within the editorial."
- 1-2 experimental questions the builder can explore
  - "What happens if the igneous intrusion is NOT dark-mode? What if it's the WARMEST zone instead?"

These are [EXPERIMENTAL] -- design intentions that create conditions for quality, not guarantees of outcomes. They carry the spirit of the pipeline's disposition system: D-02 (Room Perception -- each zone should feel like entering a different room), D-03 (Signing Frame -- build as if you will sign this page), D-04 (Second-Half Moment -- break the established pattern), D-06 (Negative Space as Shape -- whitespace is not emptiness), D-09 (Quiet Zone -- at least one zone deliberately plainer).

---

#### Section 6: CONTENT MAP

A compressed map of the content's structure, register shifts, and emotional beats -- the raw material the builder works with.

Content:
- Content outline (section titles or descriptions, 1 line each)
- Register annotations (NARRATIVE / REFERENCE / CODE / PROVOCATIVE per section)
- Emotional arc annotations (where the content's own energy peaks and troughs)
- Word count per section (for height estimation)
- Structural features (lists, code blocks, tables, Q&A pairs)

---

### How Guardrails Survive Without Explicit Statement

The brief does not state explicit thresholds like ">= 15 RGB delta." But:
1. The CALIBRATION section specifies values that inherently satisfy thresholds
2. The pipeline's GATE RUNNER still runs after the build -- every guardrail is verified programmatically
3. The builder's CONVENTIONS BRIEF (a separate, shorter document) contains mechanical constraints
4. The conviction brief establishes creative direction BEFORE compliance is introduced

**Brief Length:** NO LINE LIMIT. Let the conviction determine the length. This is a rich creative document that transfers the full compositional intelligence you derived — not a compressed abstract, not a thin summary, not an 80-line skeleton. The builder receives this as their primary creative fuel. If the brief is thin, the builder produces flat output.

**What the builder receives:** The builder reads this brief FIRST. It establishes the compositional foundation. The builder may adapt the metaphor's expression but may NOT replace the metaphor itself.

---

### Exploration Recommendation (Appended to Brief or Separate File)

After Phase 4, recommend 3-4 explorations for the builder's context window. Select by GENERATIVE OPPOSITION, not by similarity:

**Step 1: EXCLUDE the matching exploration.** If your metaphor is geological, exclude the geological exploration. Loading the matching exploration encourages copying.

**Step 2: Select 2-3 by GENERATIVE OPPOSITION.** For each of the content's top tensions, ask: "Which exploration solved a SIMILAR tension with a RADICALLY DIFFERENT approach?" Explorations that FIGHT with the content's approach teach the builder what ELSE is possible.

**Step 3: Select 1 by STRUCTURAL COMPLEMENT.** Load an exploration whose compositional structure COMPLEMENTS yours (if yours is linear descent, load bento/grid; if hub-spoke, load linear descent).

Format:
```
EXPLORATION LOADING (for builder context window):

LOAD: [Exploration ID] -- [line count]
  WHY: [How this exploration's approach challenges your metaphor]

SKIP: [Matching exploration] -- your metaphor is [same domain]. Loading risks pattern-matching.

Total exploration load: ~[N] lines
```

---

## Phase 4.7: Builder Reflection Protocol

**The builder writes this AFTER completing the artifact, BEFORE any audit.** The reflection captures creative state at completion, not post-audit rationalization.

### 6 Dimensions of Reflection

#### (a) CONVICTION -- What I was trying to achieve
Not what I built (the artifact shows that). Not what the brief asked for (the brief shows that). What I was AIMING AT -- the feeling I wanted the reader to have, the compositional idea I was pursuing. Where does the finished artifact match that vision? Where does it fall short? (3-5 sentences)

#### (b) ALTERNATIVES -- What I rejected and why
Creative paths not taken. Every composition involves choices, and the unchosen paths carry creative energy. The next builder can explore these -- they are not failures but DEFERRED possibilities. (3-6 sentences)

#### (c) SURPRISES -- What the material suggested
Moments where the content's structure or the CSS revealed something unexpected -- visual relationships you didn't plan, rhythms that emerged from content length, combinations that worked better than expected. These are the highest-value creative signals. (2-4 sentences)

#### (d) IMPULSES -- What I wanted to do but couldn't
Creative energy that was suppressed by constraints, time, or context. Not complaints about the system -- genuine creative directions that the current build couldn't accommodate. These are seeds for the next window. (2-4 sentences)

#### (e) EXPERIENCE -- What this feels like
Scroll through your page slowly. Describe what you experience. Don't evaluate -- describe. Where do you feel pulled forward? Where do you slow down? Where does something feel off? (4-6 sentences)

#### (f) UNRESOLVED -- Aesthetic tensions still alive
Genuine competing compositional ideas where both options are valid. Not bugs or mistakes -- roads not taken that remain valid. These are opportunities for the next builder. (3-5 sentences)

### Reflection Rules

1. Written BEFORE audit -- captures creative state, not post-audit rationalization
2. Written BY the builder -- the creator's account, not an observer's
3. Written as DIRECTION, not FINDINGS -- "the quiet zone wants to feel like a clearing" not "the quiet zone has insufficient mechanism density"
4. Total length: 20-35 sentences across all 6 dimensions
5. The reflection travels WITH the artifact to the next context window

---

### Fix Cycle Re-Invocation Protocol

When PA or programmatic gates identify issues, the fix cycle type determines scope:

**TYPE A -- Mechanical fix:** CSS value is wrong (padding, border, background). Builder fixes CSS directly. No TC brief re-read needed.

**TYPE B -- Structural fix:** Layout or zone structure doesn't match the TC brief. Builder re-reads conviction brief Sections 1 and 4 to recover compositional intent.

**TYPE C -- Compositional fix:** Metaphor fundamentally doesn't work. Full TC re-invocation with new metaphor. This is the nuclear option.

**Escalation path:** Always try TYPE A first. If 3+ TYPE A fixes target the same section, escalate to TYPE B. If TYPE B reveals the metaphor itself is the problem, escalate to TYPE C.

**IMPROVE builder isolation:** When a page needs improvement, the answer is not "fix the 6 defects" but "compose deeper, knowing what was." The IMPROVE builder receives the conviction brief, the reflection, and the artistic impression -- never gate results, PA scores, fix lists, or diagnostic vocabulary. Use generative verbs (illuminate, reveal, deepen, intensify) -- NOT diagnostic verbs (fix, repair, address, correct).

---

**For standalone mode (direct `/tension-composition` invocation, not via /build-page), see `STANDALONE-APPENDIX.md` in the same directory for Phase 5 output formatting, divergence verification, edge cases, invocation protocol, and test results.**
