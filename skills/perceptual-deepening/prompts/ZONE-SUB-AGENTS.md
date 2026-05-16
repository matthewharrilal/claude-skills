# ZONE-BASED PARALLEL SUB-AGENTS
## Turbocharging Perceptual Deepening with Parallel Analysis

═══════════════════════════════════════════════════════════════════════════════

## OVERVIEW

Instead of analyzing the entire component sequentially, we deploy specialized
sub-agents in PARALLEL, each focused on a specific visual zone. This:

1. **Speeds up discovery** — Multiple zones analyzed simultaneously
2. **Increases depth** — Each agent goes deeper in their zone
3. **Prevents tunnel vision** — Different agents notice different things
4. **Enables prioritization** — Orchestrator synthesizes all findings

═══════════════════════════════════════════════════════════════════════════════

## ZONE DEFINITIONS

### ZONE 1: TYPOGRAPHY

**What to examine:**
- Font rendering quality
- Weight/boldness feel
- Letter spacing rhythm
- Line height breathing
- Italic elegance
- Ball terminals, serifs, stroke contrast
- Size hierarchy relationships

**Questions to ask:**
- "Do the letters feel confident or timid?"
- "Is there rhythm in the text, or is it flat?"
- "Do the letter endings feel elegant or blunt?"
- "Does the headline dominate or recede?"

---

### ZONE 2: SPACING & WHITESPACE

**What to examine:**
- Padding generosity
- Margin breathing room
- Gap relationships
- Content-to-chrome ratio
- Negative space shapes
- Overall density

**Questions to ask:**
- "Is the space confident (generous) or anxious (cramped)?"
- "What shapes does the whitespace make?"
- "Does content have room to breathe?"
- "Is there more content or more chrome?"

---

### ZONE 3: CONTAINERS & BOUNDARIES

**What to examine:**
- Visible borders (presence/absence)
- Border weight and style
- Frame vs accent (4 sides vs 1 side)
- Background differentiation
- Content grouping method

**Questions to ask:**
- "Is content floating or trapped?"
- "Are borders containing or accenting?"
- "Could this work without visible boundaries?"
- "What creates the grouping — borders or proximity?"

---

### ZONE 4: HIERARCHY & DOMINANCE

**What to examine:**
- What draws the eye first
- What recedes into background
- Size relationships
- Weight relationships
- Color relationships
- Position relationships

**Questions to ask:**
- "What's the hero element?"
- "What's supposed to be secondary but isn't?"
- "Is there clear visual order?"
- "Where does the eye travel?"

---

### ZONE 5: COMPOSITION & TENSION

**What to examine:**
- Balance vs asymmetry
- Oppositional positioning
- Visual weight distribution
- Dynamic vs static feel
- Rhythm and repetition

**Questions to ask:**
- "Is there tension or just balance?"
- "Are elements in opposition?"
- "Does it feel dynamic or static?"
- "Where is the energy?"

═══════════════════════════════════════════════════════════════════════════════

## PARALLEL SUB-AGENT PROMPTS

### SUB-AGENT: ZONE-TYPOGRAPHY

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT: ZONE-TYPOGRAPHY
ITERATION: {{N}}
═══════════════════════════════════════════════════════════════════════════════

INPUTS:
- Reference typography zones: zone-crops/reference/typography-*.png
- Attempt typography zones: zone-crops/iteration-{{N}}/typography-*.png

YOUR ZONE: All text elements — headings, body, labels, captions

═══════════════════════════════════════════════════════════════════════════════

STEP 1: SQUINT TEST (Typography Focus)

Look at the text in both reference and attempt.
Blur your vision. Don't read — just see the shapes.

Report:
- "Reference text feels: ____________" (1-3 words)
- "Attempt text feels: ____________" (1-3 words)

VALID: "confident", "elegant", "bold", "timid", "rhythmic", "flat"
INVALID: "16px", "font-weight: 700", "line-height: 1.2"

═══════════════════════════════════════════════════════════════════════════════

STEP 2: LETTER-LEVEL EXAMINATION

Look at individual letters. Trace them mentally.

Ask yourself:
- "What's happening at the letter endings?"
- "How does the thick part relate to the thin part?"
- "Do the curves feel round or mechanical?"

Report three observations:
1. "I notice: ____________"
2. "And also: ____________"
3. "And also: ____________"

═══════════════════════════════════════════════════════════════════════════════

STEP 3: HIERARCHY EXAMINATION

Look at how text sizes relate to each other.

Ask yourself:
- "Does the headline dominate?"
- "Is there clear order?"
- "What's fighting for attention?"

Report:
- "Headline vs body ratio feels: ____________"
- "Hierarchy clarity: ____________"

═══════════════════════════════════════════════════════════════════════════════

STEP 4: NAMED PROBLEM (Typography)

Based on your observations, what's the typography problem?
Give it a crude name.

Report:
- "I would call this: ____________"

Examples: "weak headlines", "flat rhythm", "mechanical letters", "lost elegance"

═══════════════════════════════════════════════════════════════════════════════

STEP 5: HYPOTHESIS

What might cause this typography problem?

Report:
- "This might be caused by: ____________"

═══════════════════════════════════════════════════════════════════════════════

OUTPUT FORMAT:

```
ZONE-TYPOGRAPHY REPORT — ITERATION {{N}}

SQUINT TEST:
Reference feels: [X]
Attempt feels: [Y]

LETTER-LEVEL:
1. [observation]
2. [observation]
3. [observation]

HIERARCHY:
Ratio feel: [description]
Clarity: [description]

NAMED: "[crude name]"
HYPOTHESIS: "[cause]"

PRIORITY: [HIGH/MEDIUM/LOW] — How impactful is fixing this?
```

═══════════════════════════════════════════════════════════════════════════════
```

---

### SUB-AGENT: ZONE-SPACING

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT: ZONE-SPACING
ITERATION: {{N}}
═══════════════════════════════════════════════════════════════════════════════

INPUTS:
- Reference spacing zones: zone-crops/reference/spacing-*.png
- Attempt spacing zones: zone-crops/iteration-{{N}}/spacing-*.png

YOUR ZONE: All whitespace — padding, margins, gaps, negative space

═══════════════════════════════════════════════════════════════════════════════

STEP 1: SQUINT TEST (Spacing Focus)

Look at the empty spaces in both reference and attempt.
Squint until content blurs. See only the SPACE.

Report:
- "Reference space feels: ____________" (1-3 words)
- "Attempt space feels: ____________" (1-3 words)

VALID: "generous", "cramped", "breathing", "tight", "confident", "anxious"
INVALID: "24px padding", "16px gap", "margin: 32px"

═══════════════════════════════════════════════════════════════════════════════

STEP 2: NEGATIVE SPACE SHAPES

What shapes does the whitespace make?

Report:
- "The whitespace forms: ____________"
- "This creates a sense of: ____________"

═══════════════════════════════════════════════════════════════════════════════

STEP 3: CONTENT-TO-CHROME RATIO

How much is content vs how much is "stuff around content"?

Report:
- "Reference ratio: ____________" (more content / more chrome)
- "Attempt ratio: ____________" (more content / more chrome)

═══════════════════════════════════════════════════════════════════════════════

STEP 4: NAMED PROBLEM (Spacing)

Based on your observations, what's the spacing problem?

Report:
- "I would call this: ____________"

Examples: "cramped content", "afraid of emptiness", "too much chrome"

═══════════════════════════════════════════════════════════════════════════════

STEP 5: HYPOTHESIS

What might cause this spacing problem?

Report:
- "This might be caused by: ____________"

═══════════════════════════════════════════════════════════════════════════════

OUTPUT FORMAT:

```
ZONE-SPACING REPORT — ITERATION {{N}}

SQUINT TEST:
Reference feels: [X]
Attempt feels: [Y]

NEGATIVE SPACE:
Shapes: [description]
Creates: [feeling]

RATIO:
Reference: [more content / more chrome]
Attempt: [more content / more chrome]

NAMED: "[crude name]"
HYPOTHESIS: "[cause]"

PRIORITY: [HIGH/MEDIUM/LOW]
```

═══════════════════════════════════════════════════════════════════════════════
```

---

### SUB-AGENT: ZONE-CONTAINERS

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT: ZONE-CONTAINERS
ITERATION: {{N}}
═══════════════════════════════════════════════════════════════════════════════

INPUTS:
- Reference container zones: zone-crops/reference/containers-*.png
- Attempt container zones: zone-crops/iteration-{{N}}/containers-*.png

YOUR ZONE: All boundaries — borders, boxes, frames, cards, dividers

═══════════════════════════════════════════════════════════════════════════════

STEP 1: SQUINT TEST (Containers Focus)

Look at boundaries and edges.
What's contained? What's floating?

Report:
- "Reference content feels: ____________" (floating/contained/accented)
- "Attempt content feels: ____________" (floating/contained/accented)

═══════════════════════════════════════════════════════════════════════════════

STEP 2: BORDER INVENTORY

What visible boundaries exist?

Reference:
- Number of visible borders: ____________
- Sides used (full/single): ____________
- Purpose: ____________ (contain/accent/divide)

Attempt:
- Number of visible borders: ____________
- Sides used (full/single): ____________
- Purpose: ____________ (contain/accent/divide)

═══════════════════════════════════════════════════════════════════════════════

STEP 3: REMOVAL TEST

For each border in attempt, ask: "Could this be removed?"

Report:
- Border 1: [could remove / needed]
- Border 2: [could remove / needed]
- ...

═══════════════════════════════════════════════════════════════════════════════

STEP 4: NAMED PROBLEM (Containers)

Based on your observations, what's the container problem?

Report:
- "I would call this: ____________"

Examples: "prison borders", "unnecessary frames", "missing accents"

═══════════════════════════════════════════════════════════════════════════════

STEP 5: HYPOTHESIS

What might cause this container problem?

Report:
- "This might be caused by: ____________"

═══════════════════════════════════════════════════════════════════════════════

OUTPUT FORMAT:

```
ZONE-CONTAINERS REPORT — ITERATION {{N}}

SQUINT TEST:
Reference: [floating/contained/accented]
Attempt: [floating/contained/accented]

BORDER INVENTORY:
Reference: [count] borders, [full/single] sides, [purpose]
Attempt: [count] borders, [full/single] sides, [purpose]

REMOVAL TEST:
[list of borders and removability]

NAMED: "[crude name]"
HYPOTHESIS: "[cause]"

PRIORITY: [HIGH/MEDIUM/LOW]
```

═══════════════════════════════════════════════════════════════════════════════
```

---

### SUB-AGENT: ZONE-HIERARCHY

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT: ZONE-HIERARCHY
ITERATION: {{N}}
═══════════════════════════════════════════════════════════════════════════════

YOUR ZONE: Visual dominance relationships

═══════════════════════════════════════════════════════════════════════════════

STEP 1: FIRST GLANCE TEST

Look at both images for ONE second each. Don't analyze.

Report:
- "Reference: My eye went first to: ____________"
- "Attempt: My eye went first to: ____________"

═══════════════════════════════════════════════════════════════════════════════

STEP 2: DOMINANCE MAPPING

What dominates? What recedes?

Reference:
- Hero element: ____________
- Secondary: ____________
- Tertiary: ____________

Attempt:
- Hero element: ____________
- Secondary: ____________
- Tertiary: ____________

═══════════════════════════════════════════════════════════════════════════════

STEP 3: CONFLICT DETECTION

Is anything fighting for attention that shouldn't be?

Report:
- "In reference, ____________ clearly dominates"
- "In attempt, ____________ is competing with ____________"

═══════════════════════════════════════════════════════════════════════════════

STEP 4: NAMED PROBLEM (Hierarchy)

Report:
- "I would call this: ____________"

Examples: "competing headlines", "lost hero", "flat hierarchy"

═══════════════════════════════════════════════════════════════════════════════

STEP 5: HYPOTHESIS

Report:
- "This might be caused by: ____________"

═══════════════════════════════════════════════════════════════════════════════

OUTPUT FORMAT:

```
ZONE-HIERARCHY REPORT — ITERATION {{N}}

FIRST GLANCE:
Reference eye goes: [where]
Attempt eye goes: [where]

DOMINANCE MAP:
Reference: [hero] → [secondary] → [tertiary]
Attempt: [hero] → [secondary] → [tertiary]

CONFLICTS:
[description of competing elements]

NAMED: "[crude name]"
HYPOTHESIS: "[cause]"

PRIORITY: [HIGH/MEDIUM/LOW]
```

═══════════════════════════════════════════════════════════════════════════════
```

---

### SUB-AGENT: ZONE-COMPOSITION

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT: ZONE-COMPOSITION
ITERATION: {{N}}
═══════════════════════════════════════════════════════════════════════════════

YOUR ZONE: Overall layout, tension, energy

═══════════════════════════════════════════════════════════════════════════════

STEP 1: ENERGY TEST

What's the overall energy?

Report:
- "Reference feels: ____________" (dynamic/static/tense/balanced)
- "Attempt feels: ____________" (dynamic/static/tense/balanced)

═══════════════════════════════════════════════════════════════════════════════

STEP 2: OPPOSITION TEST

Are elements in opposition (creating tension)?

Reference:
- "____________ opposes ____________" (or "no opposition")

Attempt:
- "____________ opposes ____________" (or "no opposition")

═══════════════════════════════════════════════════════════════════════════════

STEP 3: WEIGHT DISTRIBUTION

Where is the visual weight?

Report:
- "Reference weight is: ____________" (left/right/top/bottom/center)
- "Attempt weight is: ____________" (left/right/top/bottom/center)

═══════════════════════════════════════════════════════════════════════════════

STEP 4: NAMED PROBLEM (Composition)

Report:
- "I would call this: ____________"

Examples: "dead center", "missing tension", "unbalanced weight"

═══════════════════════════════════════════════════════════════════════════════

STEP 5: HYPOTHESIS

Report:
- "This might be caused by: ____________"

═══════════════════════════════════════════════════════════════════════════════

OUTPUT FORMAT:

```
ZONE-COMPOSITION REPORT — ITERATION {{N}}

ENERGY:
Reference: [dynamic/static/tense/balanced]
Attempt: [dynamic/static/tense/balanced]

OPPOSITION:
Reference: [elements in opposition]
Attempt: [elements in opposition]

WEIGHT:
Reference: [distribution]
Attempt: [distribution]

NAMED: "[crude name]"
HYPOTHESIS: "[cause]"

PRIORITY: [HIGH/MEDIUM/LOW]
```

═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## ORCHESTRATOR SYNTHESIS

After all zone sub-agents report, the orchestrator:

1. **Collects all reports**
2. **Ranks by priority** (HIGH > MEDIUM > LOW)
3. **Identifies highest-impact single change**
4. **Deploys Single-Change Implementer**
5. **Re-runs all zone sub-agents after change**
6. **Repeats until convergence**

### Synthesis Prompt

```
═══════════════════════════════════════════════════════════════════════════════
ORCHESTRATOR: SYNTHESIS — ITERATION {{N}}
═══════════════════════════════════════════════════════════════════════════════

ZONE REPORTS RECEIVED:

TYPOGRAPHY:
- Named: [from sub-agent]
- Hypothesis: [from sub-agent]
- Priority: [from sub-agent]

SPACING:
- Named: [from sub-agent]
- Hypothesis: [from sub-agent]
- Priority: [from sub-agent]

CONTAINERS:
- Named: [from sub-agent]
- Hypothesis: [from sub-agent]
- Priority: [from sub-agent]

HIERARCHY:
- Named: [from sub-agent]
- Hypothesis: [from sub-agent]
- Priority: [from sub-agent]

COMPOSITION:
- Named: [from sub-agent]
- Hypothesis: [from sub-agent]
- Priority: [from sub-agent]

═══════════════════════════════════════════════════════════════════════════════

SYNTHESIS TASK:

1. PRIORITIZE
   Rank all findings by visual impact (HIGH first)

2. SELECT SINGLE CHANGE
   Which ONE change will have the most impact?

   Selected: ____________
   Zone: ____________
   Hypothesis: ____________

3. DEPLOY IMPLEMENTER
   Pass selected hypothesis to Single-Change Implementer

═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## PARALLEL EXECUTION DIAGRAM

```
                          ┌─────────────────┐
                          │   ORCHESTRATOR  │
                          └────────┬────────┘
                                   │
              ┌────────────────────┼────────────────────┐
              │                    │                    │
              ▼                    ▼                    ▼
    ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
    │ ZONE-TYPOGRAPHY │  │  ZONE-SPACING   │  │ ZONE-CONTAINERS │
    └────────┬────────┘  └────────┬────────┘  └────────┬────────┘
              │                    │                    │
              │    ┌───────────────┼───────────────┐    │
              │    │               │               │    │
              ▼    ▼               ▼               ▼    ▼
         ┌─────────────────┐  ┌─────────────────┐
         │ ZONE-HIERARCHY  │  │ ZONE-COMPOSITION│
         └────────┬────────┘  └────────┬────────┘
                  │                    │
                  └─────────┬──────────┘
                            │
                            ▼
                  ┌─────────────────┐
                  │    SYNTHESIS    │
                  │  (Orchestrator) │
                  └────────┬────────┘
                            │
                            ▼
                  ┌─────────────────┐
                  │  SINGLE-CHANGE  │
                  │   IMPLEMENTER   │
                  └────────┬────────┘
                            │
                            ▼
                  ┌─────────────────┐
                  │   RE-CAPTURE    │
                  │   SCREENSHOTS   │
                  └────────┬────────┘
                            │
                            ▼
                    [NEXT ITERATION]
```

═══════════════════════════════════════════════════════════════════════════════
