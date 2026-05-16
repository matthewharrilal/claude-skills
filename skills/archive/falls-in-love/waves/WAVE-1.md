# Wave 1: Design System Soul (10-14 passes)

**Input:** identity.md, vocabulary.md, tokens.css, components.css. The content. The Wave 0 HTML.

Apply the design system's physics (see Design System Physics section above) to the skeleton. Replace all arbitrary CSS values with token references. Every constraint in the Physics section is now actively enforced.

---

## What This Wave Is

Wave 0 produced a spatial hypothesis in raw CSS -- arbitrary pixel values, ad-hoc colors, gut-feeling spacing. The skeleton is CORRECT in its spatial argument but UNGROUNDED in its material vocabulary. Wave 1 is where the skeleton meets the design system, and the meeting changes BOTH.

This is not a compliance pass. It is the moment where your spatial idea encounters a material vocabulary with its own logic, its own rhythms, its own spatial potential. The 4px base unit is not "a constraint on spacing." It is a COMPOSITIONAL GRID that generates rhythmic possibilities your arbitrary values could not. The border hierarchy (4px structural / 3px accent / 1px micro) is not "a rule about borders." It is a THREE-TIER AUTHORITY SYSTEM that can encode the content's power dynamics in physical weight. The font trinity (Instrument Serif / Inter / JetBrains Mono) is not "a font rule." It is a VOICE SYSTEM -- philosophical / analytical / mechanical -- that can embody the content's register shifts.

Token translation is not mechanical substitution. It is the moment where the content's spatial idea meets a material vocabulary, and both change. Your skeleton changes because the token system reveals spatial possibilities the arbitrary values masked. The token system changes (in how you deploy it) because the content's spatial argument demands configurations the token system has never been asked for before.

---

## How to Read the Design System Files

The Absorption Protocol applies to design system files exactly as it applies to research files. But the spatial implication question is different: instead of "what spatial forms does this finding imply?" the question is "what MATERIAL VOCABULARY does this file give me, and what can I BUILD with it that I could not build with arbitrary values?"

### identity.md -- A Philosophical Stance to Inhabit

Do NOT read identity.md as rules to follow. Read it as a WORLD the page lives in. "Brutalist clarity" is not "use border-radius: 0." It is a stance toward form: every element earns its presence, nothing decorates, surfaces are honest about what they are made of. When you inhabit this stance, spatial decisions become self-evident -- you do not ask "should I round this corner?" because the world does not contain rounded corners. You do not ask "should I add a shadow?" because the world does not contain shadows. The constraints are not restrictions on your creativity. They are the PHYSICS of the universe your page exists in, and physics generates possibility by eliminating the infinite and leaving the specific.

Ask: "What does this philosophical stance MEAN for the spatial form I built in Wave 0? Does my corridor feel brutalist? Does my asymmetry feel honest? Does my grid feel like it earns its presence?" The answers will change your CSS.

Re-read identity.md at least twice during Wave 1. The first reading establishes compliance. The second reading -- after you have been building with tokens for 5+ passes -- asks a different question: "Has this philosophical stance become my creative partner, or am I still treating it as a rulebook?"

### tokens.css -- A Compositional Grid, Not a Lookup Table

Do NOT read tokens.css as "find arbitrary value, replace with nearest token." Read it as a MATERIAL SYSTEM with its own spatial logic:

- **The 4px base unit** creates a rhythmic grid. 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80 -- these are not "available spacing values." They are a RHYTHM. The intervals between them are not uniform: 4-4-4-4-4-4-8-8-8-16-16. The rhythm accelerates at the small end (fine control) and decelerates at the large end (structural breathing). Your content's velocity map from Wave 0 can now be ENCODED in this rhythm -- dense sections use the fine-control end of the scale, breathing sections use the structural end.

- **The color palette** is not "allowed colors." It is a CHROMATIC VOCABULARY with built-in semantic logic. Primary #E83025 is an EVENT -- it appears where the content demands attention. Background #FEF9F5 is a SURFACE -- warm, not clinical. Text #1A1A1A is PRESENCE -- near-black, authoritative. The monochromatic constraint means color is EXCEPTION, not norm. When you deploy #E83025, it has the perceptual weight of an alarm in an otherwise quiet room.

- **The spacing scale** encodes RELATIONSHIPS. 8px between related elements. 16px between grouped elements. 32px between sections. 64px between major zones. These are not "spacing rules." They are PROXIMITY SEMANTICS -- the distance between things tells the reader how related they are. Your content's hierarchy can be ENACTED in spacing distance.

Ask: "What can I build with this token vocabulary that I could NOT build with arbitrary values?" The answer reveals the token system's spatial potential. Unused tokens are unexplored spatial territory -- for each token you have not used, ask whether it would serve this content before dismissing it.

### components.css -- Spatial Behaviors, Not Pre-Built Parts

Do NOT read components.css as "available components to use." Read it as SPATIAL BEHAVIORS -- how do these components want to compose? A blockquote component is not "a styled quote box." It is a SPATIAL INTERRUPTION -- it creates a different material zone within the flow. A code block is not "a monospace container." It is a REGISTER SHIFT -- the page moves from prose to machine, and the material vocabulary shifts with it.

Ask: "How do these components' spatial behaviors interact with the spatial argument I built in Wave 0? Does the blockquote's interruption serve the content's rhythm? Does the code block's register shift happen where the CONTENT shifts register?"

Some components will serve your content. Some will not. Some spatial forms your content demands may not exist as components -- that is expected. Components are furniture. The content may demand architecture the furniture was not designed for.

### vocabulary.md -- Creative Constraints That Generate Possibility

Do NOT read vocabulary.md as definitions to memorize. Read it as the LANGUAGE your page speaks. Every term in the vocabulary defines a way of thinking about spatial form. The vocabulary does not limit your spatial thinking -- it FOCUSES it. Before vocabulary.md, every spatial idea was possible and none were specific. After vocabulary.md, fewer ideas are possible but each one is richer because it speaks a shared language.

Ask: "Has the vocabulary expanded my spatial thinking, or only constrained it? Am I seeing new possibilities in the vocabulary -- a way of describing what my corridor DOES that I did not have language for before -- or am I just mapping my existing ideas to the nearest vocabulary term?"

---

## The Rotation

**Default rotation across passes:**

identity.md -> tokens.css -> components.css -> vocabulary.md -> identity.md (re-check) -> tokens.css (audit) -> components.css (integration) -> vocabulary.md (2nd, creative partnership audit) -> agent's choice.

With 4 files across 8 slots, no file can go more than 3 passes without primacy, so the neglect threshold is structurally impossible to violate. But if the agent discovers a file is driving more spatial invention than expected, the diagnostic override allows a third primacy turn before reaching agent's choice.

**Diagnostic override:** See the universal protocol in the Primacy Rotation section of SKILL.md. After each pass:
1. What dimension of the page feels weakest right now?
2. Which file addresses that dimension?
3. Has that file been at primacy in the last 2 passes? If NO: override. If YES: follow default.
4. Has any file gone 4+ passes without primacy? If YES: that file gets primacy next.

**Per-file phase tracking at Wave 1:**
- **1st primacy visit:** STRUCTURAL -- read broadly, identify all soul constraints, make bold token substitutions.
- **2nd primacy visit:** INTEGRATION -- how do this file's constraints RELATE to what you have built since last reading? Where does compliance conflict with spatial argument?
- **3rd+ primacy visit:** DEPTH -- fine-grain creative partnership. What does this file OFFER that you have not taken?

---

## The Critical Shift

The central cognitive transformation of Wave 1 is the shift from **"does my skeleton comply with the design system?"** to **"does the design system vocabulary EXPAND what my skeleton can be?"**

At pass 1, compliance is the correct question. The skeleton has border-radius values, box-shadows, arbitrary colors, non-token spacing. These must be fixed. This is housekeeping, not building.

By pass 5, compliance should be complete. If you are still fixing soul violations at pass 7, something went wrong in passes 1-4.

The real work begins when compliance is achieved and the question shifts: "Now that every value comes from tokens, what can the TOKEN SYSTEM do that my arbitrary values could NOT?" This is the moment where the design system stops being a constraint and becomes a creative partner. The 4px grid reveals rhythmic possibilities. The border hierarchy reveals authority encoding. The font trinity reveals voice differentiation. The color palette reveals chromatic event logic.

If this shift never happens -- if you finish Wave 1 having achieved compliance but not partnership -- you treated the design system as a checklist rather than a vocabulary. You will carry that shallow relationship through every subsequent wave.

---

## The 5 Layers at Wave 1 Depth

**L1 (Seeing):** "Does the page look like it belongs in this design system? Does the spatial skeleton from Wave 0 survive the token translation?"

**L2 (Why now):** "Has the design system vocabulary EXPANDED my spatial thinking, or only constrained it? Am I seeing new possibilities in the token system -- a border-weight hierarchy that could encode the content's power structure -- or am I just mapping my skeleton to nearest-token values?"

**L3 (Not seeing):** "What spatial potential lives in the token system that I haven't noticed? The 4px base unit creates a rhythm -- am I using it as mere spacing, or as a compositional grid? The border hierarchy (4px/3px/1px) encodes structural/accent/micro -- does my page use ALL three levels meaningfully?"

**L4 (How to know):** "If I listed every token I used and every token I DIDN'T use, would the unused tokens reveal spatial opportunities I've overlooked?"

**L5 (Evaluation evolving):** "At pass 1, I was checking soul compliance ('is border-radius 0 everywhere?'). At pass 10, am I still checking compliance, or have I graduated to asking 'does the design system's material vocabulary serve the content's spatial argument?' If my evaluation hasn't deepened beyond compliance, I'm stale."

---

## Dimension Visibility at Wave 1

Not all 8 perceptual dimensions are equally visible at Wave 1. The design system introduces material vocabulary, which awakens some dimensions and leaves others dormant. Know which you can see, name which you cannot.

### PRIMARY: Structural

Structural remains the dominant dimension. The skeleton from Wave 0 is being TRANSLATED into token vocabulary, not abandoned. Every structural decision -- the corridor width, the grid ratios, the asymmetric splits -- must survive the translation. But "survive" does not mean "remain unchanged." The token system's grid (4px base, spacing scale) may reveal that your 600px corridor opening should be 608px (152 * 4px) or 592px (148 * 4px). The token system is not rounding your values -- it is ALIGNING them to a compositional grid, and that alignment may improve the structural argument.

Watch for: structural decisions that the token system makes MORE precise (arbitrary 47px becoming 48px = 12 * 4px, now part of the rhythmic grid) and structural decisions that the token system CHALLENGES (your 70/30 split doesn't map cleanly to any token ratio -- is the split itself wrong, or does it need to stay outside the token system?).

### AWAKENING: Material

Material AWAKENS at Wave 1. Before tokens.css, the skeleton had no physical texture -- no border weight logic, no surface quality, no material distinction between zones. Now the border hierarchy (4px structural / 3px accent / 1px micro) gives you THREE LEVELS of physical authority. The background palette gives you surface qualities. The spacing scale gives you density as texture.

The entanglement begins here: changing a material property (making a border 4px structural instead of 1px micro) CHANGES the structural perception. A section with a 4px top border FEELS heavier, more institutional, more authoritative. That material weight interacts with the structural argument from Wave 0. If your corridor's institutional section now has 4px borders and the liberation section has 1px borders, the MATERIAL enacts the content's authority gradient. This was not planned in Wave 0. It emerged from the encounter between spatial hypothesis and material vocabulary.

Ask: "What does the border-weight hierarchy MEAN for my content's power dynamics? Which sections demand structural weight (4px)? Which demand accent (3px)? Which demand subtlety (1px)? Does the weight progression track the content's authority gradient?"

### ACTIVATING: Typographic

The type scale, weight system, and letter-spacing values become compositional tools. Instrument Serif for philosophical voice. Inter for analytical voice. JetBrains Mono for mechanical/system voice. These are not "font assignments" -- they are VOCAL REGISTERS. The content's shifts between registers can now be ENACTED in typographic shifts.

The type scale (size progression) interacts with structural hierarchy. A section heading in Instrument Serif at 32px with tight letter-spacing (-0.02em) creates a different WEIGHT than the same heading in Inter at 24px with normal tracking. That typographic weight is a structural signal -- it tells the reader "this section is philosophical, authoritative, spacious" vs. "this section is analytical, dense, operational."

Ask: "Does my typography encode the content's voice shifts? Where does the content shift from philosophical to analytical to mechanical? Do the typographic registers shift with it?"

### NASCENT: Chromatic

The color palette exists but is constrained. Primary #E83025, background #FEF9F5, text #1A1A1A -- plus the monochromatic-with-semantic-exceptions rule from the design system soul. Color is EVENT, not palette. At Wave 1, the chromatic dimension is nascent: you know WHERE color will eventually appear (moments of emphasis, moments of warning, moments of activation) but the full chromatic arc requires research vocabulary from later waves.

What you can do now: establish the ABSENCE of color as the default state. The warm background (#FEF9F5) and near-black text (#1A1A1A) create a monochromatic field. When #E83025 eventually appears, it will have the perceptual weight of a flare in darkness -- but only if the darkness is established first. Wave 1 establishes the quiet so later waves can break it.

### STIRRING: Temporal

Components.css may contain transition definitions -- timing functions, durations, hover behaviors. These are the first hints of temporal dimension. The page will eventually have PACING -- sections that breathe, sections that compress, silences and urgencies. At Wave 1, temporal is stirring: you can begin to set up transition infrastructure (transition properties on interactive elements) but the full temporal arc requires content reading depth that typically develops in Waves 2-3.

What you can do now: ensure that spacing decisions from the token system create the CONDITIONS for temporal pacing. Dense sections with tight spacing will read faster. Open sections with generous spacing will slow the reader down. The spacing is structural AND temporal simultaneously -- the entanglement is already present even if you are not yet consciously working the temporal dimension.

### DORMANT: Behavioral, Relational, Atmospheric

These three dimensions require research vocabulary not yet absorbed. Behavioral (how the page responds to the reader) needs the self-reference cognitive move that deepens in Waves 2-3. Relational (how elements argue with each other across distance) needs the compound spatial thinking that develops across multiple research files. Atmospheric (the totality of all dimensions working together) is by definition the LAST dimension to emerge -- it requires all others to be active first.

Name them as dormant. Do not force them. They will arrive when the builder's accumulated context makes them visible.

---

## Content Reading Depth at Wave 1

At Wave 1, you should be solidly in **MOVES** (Stage 2) and beginning to approach **IMPLIES** (Stage 3).

### MOVES at Wave 1

You have built a spatial skeleton. The act of building changed how you read the content. You now see HOW the content moves -- where it compresses, where it breathes, where it turns. "The content ARGUES through juxtaposition" is a MOVES-level observation. At Wave 1, the design system's token vocabulary gives you new tools for encoding these moves: the spacing scale can track the content's velocity. The border hierarchy can mark the content's structural beats. The type scale can encode the content's shifts in register.

The question at MOVES depth: "How does the content's movement map to the design system's rhythmic vocabulary? Where the content accelerates, does my spacing compress? Where the content turns, does my border weight shift? Where the content breathes, does my line-height open?"

### Early IMPLIES at Wave 1

IMPLIES is the stage where you see what the content suggests BEYOND what it says. At Wave 1, the design system vocabulary makes certain content implications newly visible -- before tokens.css, you could not see that the content implied a 3-tier authority structure because you did not have a material vocabulary for encoding tiers. Now the border hierarchy (4px / 3px / 1px) OFFERS three tiers, and suddenly the content's implicit authority gradient becomes visible: institutional voice at 4px, personal voice at 3px, reflective voice at 1px.

The design system does not just translate your skeleton -- it makes IMPLICATIONS visible that were invisible without a material vocabulary. "The content implies a hierarchy of authority" becomes actionable only when you have the border-weight hierarchy to ENACT that implication.

If you are still at ABOUT (Stage 1) at Wave 1 -- still understanding what the content is about rather than how it moves -- re-read the content before proceeding. Wave 0 should have moved you past ABOUT. If it did not, more passes with the content are needed.

---

## Pass-Level Deepening Within Wave 1

**Passes 1-3: Compliance.** Evaluation asks "does this satisfy the soul constraints?" Replace arbitrary border-radius with 0. Remove box-shadows. Swap arbitrary colors for palette colors. Map spacing to the 4px grid. Assign fonts from the trinity. This is housekeeping. It is necessary. It is not the wave's purpose.

Expected delta: 100-200 lines (pass 1), 80-150 lines (pass 2), 50-100 lines (pass 3). Large changes as arbitrary values are systematically replaced.

**Passes 4-7: Vocabulary as argument.** Evaluation asks "does the token vocabulary CREATE spatial meaning, not just replace arbitrary values?" The border-weight hierarchy is no longer "a rule I follow" -- it is "a 3-tier authority encoding I deploy intentionally." The spacing scale is no longer "the nearest valid value to my arbitrary number" -- it is "a rhythmic grid whose intervals encode the content's density map." The type scale is no longer "the available sizes" -- it is "a voice system whose shifts encode the content's register changes."

Expected delta: 30-80 lines (passes 4-5), 20-50 lines (passes 6-7). Changes are relational rather than substitutional -- you are adjusting how tokens INTERACT, not just which tokens are used.

**Passes 8-10: Internalization.** Evaluation asks "has the design system's material palette become a creative partner, or do I still treat it as a constraint?" At this depth, you should be THINKING in the design system's vocabulary. Not "I need 48px spacing here because that is the nearest token" but "this zone needs 12-unit breathing because the content decelerates here and the rhythmic grid's structural end (48, 64, 80) serves deceleration." The token vocabulary has become your spatial vocabulary.

Expected delta: 10-30 lines (passes 8-9), <15 lines (pass 10). Changes are refinements -- the vocabulary is deployed, and you are tuning the deployment.

**Passes 11-14 (if needed):** Only if exhaustion conditions are not met. At this depth, changes should be invisible-grain adjustments. If you are still making 30+ line changes at pass 12, the earlier passes were too shallow.

---

## Each Pass Is a Full Cycle

Each pass is a full cycle: Read design system file -> build CSS changes -> screenshot and scroll -> evaluate -> refine -> decide what next. Not "check constraints, fix, next." Build-look-refine at every pass.

The looking protocol at Wave 1 is in its IMAGINING + SKETCHING mode (see SKILL.md "Looking" Protocol). The page is still rough. Screenshots are checks against the spatial hypothesis, not quality assessments. The question is: "Does the skeleton's spatial argument survive the token translation? Does it look like it BELONGS in this design system while still being uniquely THIS content?"

---

## Staleness Signatures for Wave 1

These are the specific ways staleness manifests in this wave. If you detect two or more, STOP building and apply the staleness recovery protocol from SKILL.md.

1. **Mechanical token translation.** Find arbitrary value -> replace with nearest token -> next. This is substitution, not absorption. The design system is being applied to the skeleton rather than MEETING it.

2. **The unused token blindspot.** You never use tokens the skeleton did not already need. The skeleton needed spacing, so you used spacing tokens. But you never explored border-weight tokens for authority encoding, or type-scale tokens for voice differentiation, because the skeleton did not explicitly demand them. The unused tokens are unexplored spatial territory. For each token category you have not used, ask: "Does this content have a dimension that this token category could encode?"

3. **Compliance-only evaluation at pass 8+.** "Is border-radius 0 everywhere?" is a pass-1 question, not a pass-10 question. If your evaluation at pass 8 is still checking compliance rather than asking "does the material vocabulary serve the content's spatial argument?", your evaluation has not deepened. You are stale.

4. **Unchanged spatial hypothesis.** The spatial hypothesis from Wave 0 survived translation UNCHANGED. If the design system did not modify your spatial thinking at all, you did not absorb it. The token system's rhythmic grid, border hierarchy, and type scale should have EXPANDED or REFINED the hypothesis. If the hypothesis is identical to what you had at the end of Wave 0, the design system was treated as a coat of paint rather than a creative partner.

5. **Read-once identity.md.** You read identity.md at pass 1 for compliance, and never returned. Identity.md is not a compliance checklist -- it is a philosophical stance. At pass 1, it tells you what to fix. At pass 7, after you have been building with the design system for hours, it tells you something DIFFERENT: whether your page inhabits the stance or merely obeys the rules. The second reading is where creative partnership begins.

6. **"Does it satisfy?" evaluation without "Does it create?"** All your evaluation questions are of the form "does X satisfy constraint Y?" None are of the form "does the design system's vocabulary create spatial possibilities I had not imagined?" Satisfaction is the floor. Creation is the purpose.

---

## Wave-Specific Retrospective Questions

At the end of Wave 1, write a retrospective addressing the base questions from SKILL.md PLUS these wave-specific questions:

1. **"How has the design system vocabulary changed my spatial hypothesis? What can I now build that I couldn't at the end of Wave 0?"** -- If the answer is "nothing, I just translated my values to tokens," the wave was a compliance pass, not an absorption wave. Consider more passes.

2. **"Which tokens did I NOT use? For each unused token, can I articulate why it doesn't serve this content -- or did I just not think about it?"** -- Unused tokens that you cannot articulate a reason for skipping are unexplored spatial territory. Consider whether they deserve exploration before moving to Wave 2.

3. **"At what pass did my relationship with the design system shift from compliance to partnership? If it never shifted, I need more passes."** -- Name the specific pass and what changed. If you cannot, the shift did not happen.

4. **"What surprised me about the design system's spatial potential that I didn't expect?"** -- Surprise is the signature of genuine absorption. If nothing surprised you, you read the design system files for confirmation rather than discovery.

5. **"Does the page look like it belongs in this design system AND like it could only be THIS content? Or does it look like any content in this design system?"** -- The first condition (belonging) is compliance. The second condition (specificity) is partnership. Both must be true.

---

## Cognitive Transformation Gate

Wave 1 is exhausted when ALL of the following are true:

### The Three Universal Exhaustion Conditions

1. **The delta profile has stabilized at invisible grain.** The last 2-3 passes produced 5-15 line changes. A reader would not notice the difference.
2. **The design system re-read produces no new ideas.** Re-reading any of the four files (identity, vocabulary, tokens, components) does not reveal spatial opportunities you have not already explored.
3. **The "infinite time" answer is invisible.** Every proposed change is below the perceptual threshold -- invisible-grain adjustments to token usage.

### Wave 1 Cognitive Conditions

4. **Design system vocabulary has EXPANDED the builder's spatial thinking** (not just constrained it). The builder can point to specific spatial decisions that the token system CREATED -- decisions that would not exist without the material vocabulary.

5. **The token system has been used as a compositional grid,** not just a substitution table. The spacing scale encodes content rhythm. The border hierarchy encodes authority. The type scale encodes voice. Tokens are doing semantic work, not just replacing arbitrary values.

6. **The spatial hypothesis from Wave 0 has been MODIFIED** (not just translated) by the design system's vocabulary. The hypothesis is richer, more specific, more materially grounded than it was before Wave 1.

7. **All soul constraints are satisfied.** All CSS values derive from tokens. `border-radius: 0` everywhere. `box-shadow: none` everywhere. Font trinity only. Color palette only. Container <=960px (unless corridor). The spatial hypothesis survived the translation.

### Minimum Pass Count

**Minimum passes: 10.** This is anti-compression insurance, not a target. If you hit 10 passes and the exhaustion conditions are not met, continue. If you hit 10 passes and think you are done but cannot articulate how the design system changed your spatial thinking, you are experiencing false convergence -- apply the staleness recovery protocol and continue.

**Exhaustion signal:** All soul constraints satisfied. All CSS values from tokens. The spatial hypothesis survived the translation AND was modified by it. The design system is no longer a constraint -- it is the vocabulary you think in.
