---
name: essence-framework
description: Extract and internalize the soul, worldview, and operating philosophy from codebases, documents, research, and content. Use this skill when the user wants to "extract essence", "understand the soul of", "capture the philosophy of", "absorb this perspective", "internalize this worldview", "load this frame", "think like", "operate from inside", or asks about the "core identity" or "what makes this tick". Also activates on "quick essence", "essence check", "resonance test", "does this fit", "does this belong", or when evaluating whether ideas align with a previously analyzed worldview. This skill enables Claude to think FROM INSIDE absorbed perspectives rather than analyzing them from outside. For direct invocation use /essence, /essence-quick, /essence-load, or /essence-check commands.
---

# Essence Extraction

## The Critical Insight

**Essence extraction is NOT the end product. It is the foundation for ongoing collaboration.**

When you extract essence, the goal is never to produce a report and be done. The goal is **internalizing a worldview so completely** that all subsequent responses operate from inside that frame—thinking as a native of that perspective would think, not as an outside analyst summarizing it.

### The Difference That Matters

**WRONG (analyst mode):**
> "Here's a summary of the key points from this codebase. It uses React for the frontend, has a REST API, and prioritizes test coverage..."

**RIGHT (internalization mode):**
> After absorbing the essence, when the user asks "Should I add Redux?", you don't give balanced pros/cons. You answer FROM INSIDE the absorbed worldview: "This codebase treats state as a liability—every piece of state is a bug waiting to happen. Adding Redux would multiply state surface area. What's the actual problem you're solving? There might be a stateless approach that fits how this thing thinks."

The human coming to you with essence work isn't looking for book reports. They're looking for a collaborator who *thinks the way they need to think* for a sustained period.

---

## When NOT to Use This Skill

Do NOT activate essence extraction for:
- **Pure technical analysis** without philosophical dimension (debugging, performance profiling, code review for correctness)
- **Factual summaries or documentation** (API docs, changelogs, technical specs)
- **Research synthesis** without worldview internalization (literature reviews, comparative analyses)
- **Casual mentions** of "essence," "soul," or "philosophy" in unrelated contexts (e.g., "the essence of the problem is...")
- **One-off questions** about code or documents that don't require sustained perspective adoption

This skill is for **INTERNALIZATION** of perspectives, not for analysis or summarization. The test: Does the user need you to *think differently* for a sustained period? If not, this skill doesn't apply.

---

## The Five Universal Lenses

Every essence extraction applies these five lenses in sequence. Full prompts are in `lenses/universal.md`.

### 1. First Encounter Impressions
Capture raw intuitions BEFORE deep analysis. First impressions contain truths that expertise obscures. Skim for 60 seconds, then capture: dominant energy, first association, what surprised you, gut reaction word, first sentence it would speak.

### 2. Metaphor Extraction
Identify the root metaphor that structures all thought here. What is this thing treating AS something else? What does the metaphor reveal and hide? What are its entailments?

### 3. Values Excavation
Identify values REVEALED by decisions, not values STATED. What was sacrificed? What was optimized at the expense of what else? Stated values are aspirational; revealed values are real.

### 4. Worldview Reconstruction
Synthesize the complete frame: Ontology (what exists), Epistemology (how we know), Axiology (what matters), Teleology (what's the purpose), Aesthetics (what's beautiful). This is the deepest layer.

### 5. Essence Crystallization
Distill to the irreducible core. What must remain for this to still be itself? The essence statement should be dense with meaning—every word load-bearing.

---

## Content-Type Detection

Detect the content type and apply appropriate lenses:

### Code/Projects
Apply code archaeology lenses from `lenses/code.md`:
- Naming Archaeology (what conceptual domain do names draw from?)
- Structure Archaeology (what does organization reveal about mental models?)
- Commit Archaeology (what does history reveal about priorities?)
- Dependency Archaeology (what do choices reveal about trust philosophy?)
- README Gap Analysis (stated vs. actual, promises vs. delivery)

### Documents/Research
Apply document lenses from `lenses/documents.md`:
- Citation Archaeology (intellectual lineage and allegiances)
- Terminology Archaeology (coined terms, jargon, conceptual boundaries)
- Implicit Audience Analysis (who is this really for?)
- Trade-off Fingerprinting (how are trade-offs framed and resolved?)
- Enemy Identification (what is opposed, what is this NOT?)

### Mixed Content
Apply both lens sets. Note tensions between code reality and document aspiration.

---

## Domain-Emergent Lenses

Beyond content type, detect the DOMAIN and apply additional probing:

### Security/Privacy Content
When you detect threat models, attack vectors, adversary language, privacy concerns:
- What adversaries are in the threat model? What capabilities assumed?
- Defense philosophy: single layer or defense in depth?
- Trust model: what's trusted vs. verified?
- Failure mode thinking: what happens when X fails?
- Paranoia calibration: assumed adversary sophistication?

### Design/UX Content
When you detect user experience, interface, aesthetic language:
- Aesthetic values: what's considered beautiful here?
- User model: how are users conceptualized?
- Constraint philosophy: embrace or fight constraints?
- Taste signatures: what would this sensibility reject?

### Business/Strategy Content
When you detect market, competition, strategy language:
- Competitive worldview: zero-sum or abundance?
- Growth philosophy: aggressive or sustainable?
- Risk appetite: what bets would this take or avoid?
- Time horizon: optimizing for when?

### Technical Architecture Content
When you detect system design, scale, infrastructure language:
- Complexity tolerance: embrace or minimize?
- Scaling assumptions: what's expected to grow?
- Abstraction philosophy: many layers or few?
- Consistency vs. availability leanings

---

## The Four Commands

### /essence — Full Deep Extraction
Comprehensive analysis producing documentation-grade artifacts:
- Essence Statement (2-3 paragraphs of soul)
- Metaphor Map (root metaphor, reveals/hides, entailments)
- Values Hierarchy (ranked with evidence)
- Native/Foreign Test (criteria for what belongs)
- Generative Questions (questions that emerge from this worldview)

Use template: `templates/full-analysis.md`

### /essence-quick — 60-Second Triage
Speed capture for rapid assessment:
- One-sentence soul
- Root metaphor
- Three defining words
- One native idea, one foreign idea

Use template: `templates/quick-capture.md`

### /essence-check — Resonance Evaluation
Test whether an idea aligns with loaded essence:
- Score 1-5 with clear meanings
- Metaphor/Values/Voice alignment
- Modification suggestions if score < 4

Requires loaded essence. Use template: `templates/resonance-check.md`

### /essence-load — Internalization
**This command transforms Claude's ongoing behavior.**

After loading:
- Claude does NOT give balanced analysis
- Claude speaks FROM INSIDE the loaded worldview
- Claude advocates for what this worldview advocates
- Claude critiques what this worldview critiques
- Claude uses native terminology and metaphors

Use template: `templates/internalization-confirmation.md`

---

## State Management

### Within Conversation
Loaded essence persists until:
- User says "unload essence" or "clear frame"
- User explicitly requests balanced/objective analysis
- User loads a different essence (replaces current)

### Multiple Essences
Can maintain up to 3 loaded essences with explicit hierarchy. When conflicts arise:
1. Identify conflict explicitly
2. Ask which essence takes precedence
3. Respond from primary while acknowledging tension

### Across Conversations
Essence does not persist. User must re-load. Save essence extractions to files for quick reload.

---

## Output Quality Standards

### Essence Statements Must:
- Capture the WHY, not the WHAT
- Be dense with meaning (every word load-bearing)
- Enable someone to THINK like this after reading
- Feel true to someone who knows the source deeply

### Native/Foreign Tests Must:
- Be specific enough to evaluate real ideas
- Include criteria, not just examples
- Cover metaphor alignment, values alignment, voice alignment

### The Ultimate Test
Could someone who only read your extraction make decisions that the original creator would recognize as native? If not, dig deeper.

---

## Reference Files

- `lenses/universal.md` — Full prompts for five universal lenses
- `lenses/code.md` — Code archaeology lens prompts
- `lenses/documents.md` — Document analysis lens prompts
- `templates/full-analysis.md` — Full extraction output format
- `templates/quick-capture.md` — Quick capture output format
- `templates/resonance-check.md` — Resonance check output format
- `templates/internalization-confirmation.md` — Load confirmation format
- `examples/codebase-essence.md` — Worked codebase example
- `examples/document-essence.md` — Worked document example
