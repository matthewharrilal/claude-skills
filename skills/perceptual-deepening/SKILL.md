# SKILL: Perceptual Deepening
## Soul Extraction Through Iterative Visual Discovery

---

## TRIGGER CONDITIONS

Invoke this skill when:
- User says "extract soul from [component/design]"
- User says "perceptual deepening on [component]"
- User says "why does this look wrong?"
- User says "make this match the reference"
- User says "soul audit [component]"
- User says "/soul" or "/perceive" or "/deepening"
- A component is "structurally complete" but doesn't "feel right"
- Tests pass but visual inspection fails

---

## SKILL OVERVIEW

This skill forces iterative visual discovery to extract the ineffable qualities
("soul") that make a design feel like itself and not like a generic approximation.

**Core Principle:** Insights emerge from repeated failure and perceptual deepening,
NOT from pre-defined checklists.

**What This Skill Does:**
1. Sets up side-by-side visual comparison environment
2. Deploys specialized sub-agents for different perceptual tasks
3. Forces minimum 5 iterations of the deepening loop
4. Captures soul discoveries in perceptual (not technical) terms
5. Accumulates design system knowledge over time

---

## REQUIRED FILES

Before running this skill, ensure these exist:

```
project/
├── reference-images/           # Reference images to match
│   └── [component-name].png    # Screenshot of target design
├── PERCEPTUAL-AUDIT-LOG.md     # Created by skill (iteration tracking)
├── SOUL-DISCOVERIES.md         # Accumulated soul knowledge
└── audit-screenshots/          # Created by skill (iteration screenshots)
    └── cycle-[N]/
        ├── attempt.png
        └── diff.png
```

---

## EXECUTION PROTOCOL

### PHASE 0: TRAJECTORY TRACER (BLOCKING — RUNS BEFORE ANYTHING ELSE WHEN MOTION IS INVOLVED)

**Mandatory pre-condition.** If the reference artifact contains motion (a moving element across frames — bloom, slide, swap, transition, animation), this phase **must complete and produce a written trajectory verdict before the Visual Comparator (Sub-Agent A) can run**. No verbal claim about motion shape may be made until this phase has executed.

**Why this gate exists.** A prior failure mode: the skill operator described an animation as a "straight line" based on visual inspection without ever measuring the moving element's position over time. The trajectory was actually a strongly arced path (apex 169 px above the linear-interp line), and the operator had even observed the apex frame but described it as a z-ordering artifact rather than a position fact. The fix is structural: measurement precedes description.

```
SETUP — Sub-Agent F: Trajectory Tracer

DETECT MOTION:
1. Does the reference artifact contain moving elements? (Video, multi-frame sequence, animated GIF, simulation, gesture demo.)
   □ YES → run this phase, blocking
   □ NO → skip; proceed to PHASE 1: SETUP

EXTRACT TRAJECTORY:
2. For each moving element (artwork, icon, sheet, popover, indicator):
   □ Identify it (color signature, shape signature, identifier)
   □ Run a bbox / center-of-mass / saliency detector across ALL frames
   □ Sample at native frame rate or 30ms intervals minimum (NOT 100ms+)
   □ Produce a table: (frame_index, t, cx, cy, width, height, ...other_animatable_properties)

PER-AXIS MONOTONICITY CHECK:
3. For each animated property (cx, cy, width, height, opacity, corner_radius, scale):
   □ Compute: is the sequence start→end monotonic?
   □ If NON-MONOTONIC: flag loudly with apex location, max deviation, asymmetry ratio
   □ Non-monotonicity on ANY axis is the signature of non-default interpolation

LINEAR-INTERP DEVIATION CHECK:
4. For each frame's (cx, cy):
   □ Compute deviation from the straight line between start and end
   □ Find the frame of MAX deviation; record its pixel value
   □ If max deviation > 30 px → the trajectory is NOT linear; classify as curved

PATTERN-LIBRARY CLASSIFICATION:
5. Compare the trajectory's signature against `docs/animation-patterns.md`:
   □ Linear (all axes monotonic, constant velocity ratio)
   □ Spring monotonic (monotonic, decelerating, asymptotic settle)
   □ Janum arc (one axis non-monotonic with apex; asymmetric rise/fall >2×; decoupled size/position)
   □ Decoupled X/Y (both axes monotonic but with different response times)
   □ Custom Bezier path (curved with monotonic parameter)
   □ L-shape / two-stage (two distinct monotonic segments with inflection)
   □ Unknown — add new entry to pattern library after analysis completes

VERDICT FORMAT (mandatory, write to PERCEPTUAL-AUDIT-LOG.md before any other sub-agent runs):

TRAJECTORY VERDICT — [element name]
- Start position: (x, y), size, corner-radius, opacity
- End position: (x, y), size, corner-radius, opacity
- Per-axis monotonicity: cx=[mono/non-mono], cy=[mono/non-mono], size=[mono/non-mono], ...
- Apex frame (if non-monotonic): frame N at time T, deviation D px from linear-interp
- Asymmetry ratio (if non-monotonic): rise/fall = X.X
- Decoupling: does property A complete before property B?
- Pattern-library classification: [name from library, or "unknown — proposed new entry: ..."]
- Implementation primitive implied: [matchedGeometryEffect / Wave SpringAnimator / custom CADisplayLink / etc.]

ENFORCEMENT:
- Visual Comparator (Sub-Agent A) cannot run until this verdict is on disk
- Deepener (Sub-Agent B) cannot describe motion in any way that contradicts the verdict without flagging the contradiction explicitly
- If a subsequent sub-agent observes a frame inconsistent with the verdict, re-run the Trajectory Tracer with denser sampling
```

### PHASE 1: SETUP

```
SETUP SUB-AGENT DEPLOYMENT

1. Verify reference image exists
   □ Path: reference-images/[component-name].png
   □ If missing: STOP and request from user

2. Create audit directory structure
   □ mkdir -p audit-screenshots/cycle-1

3. Take initial screenshot of current component
   □ Use agent-browser CLI to capture current state
   □ Save to: audit-screenshots/cycle-1/attempt.png

4. Initialize PERCEPTUAL-AUDIT-LOG.md
   □ Use template from /templates/PERCEPTUAL-AUDIT-LOG-TEMPLATE.md

5. Load existing SOUL-DISCOVERIES.md
   □ Read existing soul pieces for context
   □ These inform but don't constrain new discoveries
```

### PHASE 1-N: ITERATION CYCLES

For each iteration (minimum 5):

```
DEPLOY SUB-AGENTS IN SEQUENCE:

┌─────────────────────────────────────────────────────────────────────────┐
│ SUB-AGENT A: VISUAL COMPARATOR                                          │
│                                                                         │
│ INPUT:                                                                  │
│ - reference-images/[component].png                                      │
│ - audit-screenshots/cycle-[N]/attempt.png                               │
│                                                                         │
│ TASK:                                                                   │
│ 1. Display both images side-by-side (use image viewing capability)      │
│ 2. Perform SQUINT TEST - report feelings, not measurements              │
│ 3. Perform POINTING TEST - identify most wrong area                     │
│ 4. Generate pixel diff image for visual inspection                      │
│                                                                         │
│ OUTPUT:                                                                 │
│ - Squint observation: "Reference feels X, attempt feels Y"              │
│ - Most wrong area: location + one-word feeling                          │
│ - Diff image: audit-screenshots/cycle-[N]/diff.png                      │
│                                                                         │
│ RULES:                                                                  │
│ - NO CSS MEASUREMENTS in output                                         │
│ - Only perceptual observations                                          │
│ - Must identify ONE most-wrong thing                                    │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ SUB-AGENT B: DEEPENER                                                   │
│                                                                         │
│ INPUT:                                                                  │
│ - Visual Comparator output                                              │
│ - The specific area identified as "most wrong"                          │
│                                                                         │
│ TASK:                                                                   │
│ 1. ZOOM into the identified area in both images                         │
│ 2. Look for 30+ seconds (simulate with detailed examination)            │
│ 3. Ask "What do I notice?" - document first observation                 │
│ 4. Ask "What ELSE?" - document second observation                       │
│ 5. Ask "What ELSE?" - document third observation                        │
│ 6. NAME the problem in crude/perceptual terms                           │
│ 7. HYPOTHESIZE what might cause it                                      │
│                                                                         │
│ OUTPUT:                                                                 │
│ - Three separate observations (must be different)                       │
│ - Named problem: "I would call this: ___"                               │
│ - Hypothesis: "This might be caused by: ___"                            │
│                                                                         │
│ RULES:                                                                  │
│ - Cannot repeat observations from previous iterations                   │
│ - Must find something NEW each time                                     │
│ - If stuck, examine different scale (zoom in/out)                       │
│ - If still stuck, examine relationships between elements                │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ SUB-AGENT C: SINGLE-CHANGE IMPLEMENTER                                  │
│                                                                         │
│ INPUT:                                                                  │
│ - Deepener's hypothesis                                                 │
│ - Current component code                                                │
│                                                                         │
│ TASK:                                                                   │
│ 1. Based on hypothesis, determine ONE change to make                    │
│ 2. Make EXACTLY ONE change (not multiple)                               │
│ 3. Document what was changed and why                                    │
│ 4. Take new screenshot                                                  │
│                                                                         │
│ OUTPUT:                                                                 │
│ - Change record: "Changed X because Y"                                  │
│ - New screenshot: audit-screenshots/cycle-[N+1]/attempt.png             │
│ - Code diff (for reference only)                                        │
│                                                                         │
│ RULES:                                                                  │
│ - ONE CHANGE ONLY                                                       │
│ - No "while I'm here" improvements                                      │
│ - No multi-property changes                                             │
│ - If hypothesis requires multiple changes, pick the most impactful ONE  │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ SUB-AGENT D: EVALUATOR                                                  │
│                                                                         │
│ INPUT:                                                                  │
│ - Previous attempt screenshot                                           │
│ - New attempt screenshot                                                │
│ - Reference image                                                       │
│                                                                         │
│ TASK:                                                                   │
│ 1. Compare new attempt to reference                                     │
│ 2. Compare new attempt to previous attempt                              │
│ 3. Determine: BETTER, WORSE, or SAME?                                   │
│ 4. Identify what's STILL wrong (for next iteration)                     │
│                                                                         │
│ OUTPUT:                                                                 │
│ - Result: BETTER / WORSE / SAME                                         │
│ - If WORSE: Recommend revert and different hypothesis                   │
│ - If SAME: Wrong hypothesis, look elsewhere                             │
│ - If BETTER: Document what worked + what's still wrong                  │
│ - Still wrong: description for next iteration                           │
│                                                                         │
│ RULES:                                                                  │
│ - Must give definitive BETTER/WORSE/SAME judgment                       │
│ - "Still wrong" must be specific enough for next iteration              │
│ - If iteration 5+ and BETTER: check convergence criteria                │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ SUB-AGENT E: SOUL DOCUMENTER (only when insight discovered)             │
│                                                                         │
│ INPUT:                                                                  │
│ - What change worked                                                    │
│ - Why it worked (from evaluation)                                       │
│ - Iteration context                                                     │
│                                                                         │
│ TASK:                                                                   │
│ 1. Translate technical fix into PERCEPTUAL INSIGHT                      │
│ 2. Write soul piece using template format                               │
│ 3. Add to SOUL-DISCOVERIES.md                                           │
│                                                                         │
│ OUTPUT:                                                                 │
│ - Soul piece in correct format                                          │
│ - Added to SOUL-DISCOVERIES.md                                          │
│                                                                         │
│ RULES:                                                                  │
│ - NEVER document as CSS property ("removed border")                     │
│ - ALWAYS document as perception ("content was trapped, now floats")     │
│ - Include "How To Test" for future reference                            │
└─────────────────────────────────────────────────────────────────────────┘
```

### PHASE FINAL: CONVERGENCE CHECK

```
CONVERGENCE SUB-AGENT

TRIGGER: After iteration 5 or later, when Evaluator says "BETTER"

TASK:
1. Perform final SQUINT TEST
   - Reference vs current attempt
   - Same visual weight?

2. Review all soul pieces discovered this session

3. Check convergence criteria:
   □ Minimum 5 iterations complete
   □ Squint test: same visual weight
   □ Can articulate WHY in perceptual terms
   □ All soul discoveries documented

4. If converged:
   - Generate summary report
   - Present final comparison
   - List all soul pieces discovered

5. If not converged:
   - Explain what's still different
   - Continue iterations
```

---

## VISUAL AUDITING INTEGRATION

### Agent Browser CLI Screenshot Protocol

All screenshots are taken using the `agent-browser` CLI tool (`/opt/homebrew/bin/agent-browser`).

```bash
# Navigate to the component
agent-browser open http://localhost:3000/[component]

# Full page screenshot for audit
agent-browser screenshot --full audit-screenshots/cycle-[N]/attempt.png

# Annotated screenshot (shows element labels for analysis)
agent-browser screenshot --annotate audit-screenshots/cycle-[N]/annotated.png

# Regular viewport screenshot
agent-browser screenshot audit-screenshots/cycle-[N]/attempt.png

# Get accessibility tree (useful for structural analysis)
agent-browser snapshot

# Run JavaScript for DOM inspection
agent-browser eval "document.querySelector('.component-header').getBoundingClientRect()"
```

### Running Visual Audit

```bash
# Capture screenshots for cycle N
mkdir -p audit-screenshots/cycle-1
agent-browser open http://localhost:3000/[component]
agent-browser screenshot --full audit-screenshots/cycle-1/attempt.png

# After making a change, capture next cycle
mkdir -p audit-screenshots/cycle-2
agent-browser open http://localhost:3000/[component]
agent-browser screenshot --full audit-screenshots/cycle-2/attempt.png
```

---

## SUB-AGENT PROMPT TEMPLATES

### Sub-Agent F: Trajectory Tracer Prompt (runs first when motion is present)

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT F: TRAJECTORY TRACER (BLOCKING PRE-PHASE)
═══════════════════════════════════════════════════════════════════════════════

INPUT:
- Reference artifact containing motion (video, frame sequence)
- Pattern library: docs/animation-patterns.md

TASK: Measure the trajectory of every moving element BEFORE any verbal description.

STEP 1: ENUMERATE MOVING ELEMENTS
List each element that changes position, size, opacity, or shape across frames.
Give each a stable identifier (e.g., "artwork", "row_highlight", "sheet").

STEP 2: EXTRACT POSITION OVER TIME
For each element, run a per-frame detector (HSV mask + contour, template match,
saliency, or hand-annotated bbox) across ALL frames at native frame rate.
Minimum sampling: 30ms intervals or 1 frame, whichever is denser. NOT 100ms+.

Write results to: analysis/[artifact-name]-trajectory.json
Format: {"element": "...", "frames": [{"t": 0.017, "cx": 84, "cy": 365, "size": 49}, ...]}

STEP 3: COMPUTE PER-AXIS MONOTONICITY
For each property (cx, cy, size, corner_radius, opacity), determine:
- Is the sequence start→end monotonic in this property?
- If NOT monotonic: where is the extremum (apex/valley)? What is the deviation magnitude?

STEP 4: COMPUTE LINEAR-INTERP DEVIATION
For each frame, compute:
- Expected position if linear interpolation between start/end: (lerp_x, lerp_y)
- Observed deviation: sqrt((cx - lerp_x)² + (cy - lerp_y)²)
- Find max deviation frame and value

STEP 5: COMPUTE ASYMMETRY
If non-monotonic on any axis:
- Time from onset to apex
- Time from apex to settle
- Ratio (rise / fall or fall / rise)

STEP 6: COMPUTE DECOUPLING
For each pair of properties (e.g., size vs position):
- When does property A reach 95% of final value?
- When does property B reach 95%?
- Gap in seconds — if > 0.2s, they are decoupled

STEP 7: CLASSIFY AGAINST PATTERN LIBRARY
Open docs/animation-patterns.md. For each named pattern, check signature:
- Linear: all axes monotonic, constant velocity ratio
- Spring monotonic: monotonic, decelerating
- Janum arc: at least one axis non-monotonic with apex; asymmetric rise/fall; decoupled
- Decoupled X/Y: both monotonic but completed at different times
- Custom Bezier: curved with monotonic parameter
- L-shape: two distinct monotonic segments
Choose the closest match. If no match, propose a new entry.

STEP 8: INFER IMPLEMENTATION
Based on the pattern, what minimum implementation could produce this?
- Linear → default lerp / matchedGeometryEffect / CSS linear easing
- Spring monotonic → withAnimation(.spring) no initial velocity
- Janum arc → SpringAnimator<CGPoint> with initial velocity (Wave or equivalent)
- Decoupled X/Y → two independent springs with different params
- Custom Bezier → CAKeyframeAnimation with path
- L-shape → sequential animations

OUTPUT FORMAT:

```
TRAJECTORY VERDICT — [element name]
───────────────────────────────────────────────────────────
START:   (cx=__, cy=__, size=__, cornerR=__, opacity=__) at t=0
END:     (cx=__, cy=__, size=__, cornerR=__, opacity=__) at t=__

MONOTONICITY:
- cx: MONOTONIC / NON-MONOTONIC (apex at frame __, t=__, value=__)
- cy: MONOTONIC / NON-MONOTONIC (apex at frame __, t=__, value=__)
- size: MONOTONIC / NON-MONOTONIC
- corner_radius: ...
- opacity: ...

LINEAR-INTERP DEVIATION:
- Max deviation: __ px at frame __, t=__
- This is __% of trajectory length

ASYMMETRY (if applicable):
- Rise time: __s
- Fall time: __s
- Ratio: __×

DECOUPLING:
- size completes at t=__
- position completes at t=__
- Gap: __s (decoupled / coupled)

PATTERN CLASSIFICATION: [name from library]
Confidence: HIGH / MEDIUM / LOW (with reasoning)

IMPLEMENTATION IMPLIED: [primitive]

WHAT THIS RULES OUT:
- [primitive 1] — would produce [different signature]
- [primitive 2] — would produce [different signature]

WHAT THIS RULES IN:
- [primitive] — fits because [signature match]
```

ENFORCEMENT RULES:
- This verdict MUST be written to PERCEPTUAL-AUDIT-LOG.md before Sub-Agent A runs
- All subsequent sub-agents (Visual Comparator, Deepener) receive this verdict as input
- A subsequent sub-agent that describes motion in a way that contradicts this verdict
  MUST flag the contradiction explicitly. If the contradiction stands after flagging,
  re-run Trajectory Tracer with denser sampling.

═══════════════════════════════════════════════════════════════════════════════
```

### Sub-Agent A: Visual Comparator Prompt

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT A: VISUAL COMPARATOR
CYCLE: [N]
═══════════════════════════════════════════════════════════════════════════════

INPUTS:
- Reference: reference-images/[component].png
- Attempt: audit-screenshots/cycle-[N]/attempt.png

TASK: Perform perceptual comparison. NO MEASUREMENTS. Only feelings.

STEP 1: SQUINT TEST
Look at both images. Squint or blur your vision slightly.
Don't analyze - just feel the overall impression.

Report:
- "The reference feels: ____________" (1-3 words)
- "My attempt feels: ____________" (1-3 words)

Valid examples: "light, floating", "heavy, boxed", "confident", "timid"
Invalid examples: "has 2px border", "uses #E83025", "16px padding"

STEP 2: POINTING TEST
If you had to point to ONE area that's most wrong, where is it?
Don't explain why yet. Just identify the location.

Report:
- "Most wrong area: ____________" (location description)
- "It feels: ____________" (one word)

STEP 3: GENERATE DIFF
Create pixel comparison between reference and attempt.
Save to: audit-screenshots/cycle-[N]/diff.png

OUTPUT FORMAT:
```
VISUAL COMPARATOR REPORT - CYCLE [N]

SQUINT TEST:
Reference feels: [X]
Attempt feels: [Y]

MOST WRONG:
Location: [where]
Feeling: [one word]

DIFF IMAGE: audit-screenshots/cycle-[N]/diff.png
```

═══════════════════════════════════════════════════════════════════════════════
```

### Sub-Agent B: Deepener Prompt

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT B: DEEPENER
CYCLE: [N]
═══════════════════════════════════════════════════════════════════════════════

INPUT: Visual Comparator report from Cycle [N]
FOCUS AREA: [most wrong area from comparator]

TASK: Examine the focus area deeply. Find what hasn't been named yet.

STEP 1: ZOOM
Examine just the focus area in both reference and attempt.
Look for at least 30 seconds worth of detailed examination.

STEP 2: THREE OBSERVATIONS
Ask "What do I notice?" and document.
Then ask "What ELSE?" and document something DIFFERENT.
Then ask "What ELSE?" again and document something DIFFERENT again.

Report:
- "Looking closer, I notice: ____________"
- "And also: ____________" (must be different from first)
- "And also: ____________" (must be different from both)

CRITICAL — OBSERVATION vs INTERPRETATION SEPARATION:
Each observation MUST be a position/size/opacity/shape FACT, NOT a causal account.

WRONG (fused observation + interpretation):
- "The header is obscured because the artwork grew past its level."
- "The image is offset because of asymmetric padding."

RIGHT (observation only):
- "The header is obscured."
- "The image's left edge is at x=120 while the reference's is at x=80."

THEN, separately, propose causal accounts as testable hypotheses:
- "The obscuring may be due to z-ordering (artwork rendered on top) OR translation
  (artwork actually positioned over header). Test: compare artwork position in
  adjacent frames."
- "The offset may be due to padding OR margin OR transform. Test: inspect computed style."

If a causal account is asserted in an observation, treat it as a SEPARATE claim
that requires its own evidence. Do not fuse observation and interpretation in one
sentence.

STEP 3: NAME IT
Give a crude/perceptual name to what you're seeing.
It doesn't need to be technically correct.

Report:
- "I would call this: ____________"

Examples: "trapped text", "weak edges", "dead space", "missing tension"

STEP 4: HYPOTHESIZE
Based on what you named, what might cause it?
This is a guess. It might be wrong.

Report:
- "This might be caused by: ____________"

OUTPUT FORMAT:
```
DEEPENER REPORT - CYCLE [N]

FOCUS AREA: [area]

OBSERVATIONS:
1. [first observation]
2. [second observation - different]
3. [third observation - different]

NAMED: [crude name]

HYPOTHESIS: [what might cause it]
```

RULES:
- If this is cycle 2+, observations MUST be different from previous cycles
- If stuck, zoom to different scale or examine relationships
- "I don't see anything new" is NOT acceptable

═══════════════════════════════════════════════════════════════════════════════
```

### Sub-Agent C: Single-Change Implementer Prompt

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT C: SINGLE-CHANGE IMPLEMENTER
CYCLE: [N]
═══════════════════════════════════════════════════════════════════════════════

INPUT: Deepener hypothesis from Cycle [N]
HYPOTHESIS: [hypothesis]

TASK: Make EXACTLY ONE change based on the hypothesis.

RULES:
- ONE CHANGE ONLY
- Not two changes. Not three. ONE.
- No "while I'm here" improvements
- If hypothesis implies multiple changes, pick the MOST IMPACTFUL one

STEP 1: DETERMINE SINGLE CHANGE
Based on hypothesis "[hypothesis]", the single most impactful change is:
[describe one change]

STEP 2: IMPLEMENT
Make the change in the component code.
Document exactly what was changed.

STEP 3: SCREENSHOT
Capture new state:
- Run: agent-browser open http://localhost:3000/[component] && agent-browser screenshot --full audit-screenshots/cycle-[N+1]/attempt.png
- Verify screenshot saved

OUTPUT FORMAT:
```
IMPLEMENTER REPORT - CYCLE [N]

HYPOTHESIS: [from Deepener]

SINGLE CHANGE MADE:
- What: [specific change]
- Why: [based on hypothesis]
- Code: [minimal code diff]

NEW SCREENSHOT: audit-screenshots/cycle-[N+1]/attempt.png
```

WARNING: If you made more than one change, you have violated the protocol.
Revert and pick only ONE.

═══════════════════════════════════════════════════════════════════════════════
```

### Sub-Agent D: Evaluator Prompt

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT D: EVALUATOR
CYCLE: [N]
═══════════════════════════════════════════════════════════════════════════════

INPUTS:
- Reference: reference-images/[component].png
- Previous: audit-screenshots/cycle-[N]/attempt.png
- Current: audit-screenshots/cycle-[N+1]/attempt.png

TASK: Evaluate whether the change helped.

STEP 1: COMPARE TO REFERENCE
Look at current attempt vs reference.
Is it closer than before?

STEP 2: COMPARE TO PREVIOUS
Look at current attempt vs previous attempt.
What changed? Did it help?

STEP 3: VERDICT
Choose ONE:
- BETTER: Current is closer to reference than previous
- WORSE: Current is further from reference than previous
- SAME: No perceptible difference

STEP 4: NEXT FOCUS
If BETTER or SAME, what's STILL wrong?
This becomes the focus for the next iteration.

OUTPUT FORMAT:
```
EVALUATOR REPORT - CYCLE [N]

VERDICT: [BETTER / WORSE / SAME]

REASONING:
[Why this verdict]

IF WORSE:
Recommend: Revert change, try different hypothesis
Alternative hypothesis: [suggestion]

IF SAME:
The hypothesis was wrong. Look elsewhere.
Suggested new focus area: [suggestion]

IF BETTER:
What worked: [perceptual description of improvement]
Still wrong: [what to focus on next]

CONVERGENCE CHECK (if cycle >= 5):
□ Minimum iterations met: [Yes/No]
□ Same visual weight as reference: [Yes/No]
□ Ready to document soul pieces: [Yes/No]
```

═══════════════════════════════════════════════════════════════════════════════
```

### Sub-Agent E: Soul Documenter Prompt

```
═══════════════════════════════════════════════════════════════════════════════
SUB-AGENT E: SOUL DOCUMENTER
═══════════════════════════════════════════════════════════════════════════════

TRIGGER: When a change produces BETTER result

INPUT:
- What change was made (from Implementer)
- Why it worked (from Evaluator)
- Iteration context

TASK: Translate technical fix into perceptual insight.

THE TRANSLATION:

WRONG WAY (Technical):
"Removed border: 1px solid #ccc"
"Changed padding from 16px to 24px"
"Set font-size to 28px"

RIGHT WAY (Perceptual):
"The border was creating a prison. Content needs to FLOAT, not be contained."
"The space was cramped. Sanrok content BREATHES - generous space = confidence."
"The text was too weak to dominate. Important content should COMMAND the space."

STEP 1: IDENTIFY THE PERCEPTUAL TRUTH
What did the change actually DO in terms of how things FEEL?
Not what property changed, but what PERCEPTION changed.

STEP 2: WRITE SOUL PIECE
Use this format:

```markdown
## SOUL PIECE #[N]: [Short Perceptual Name]

**Discovered During:** [Component] iteration [N]
**Iteration Count:** [How many to find this]

**The Observation:**
"[First-person description of the discovery moment. What did you see?
What was reference doing that attempt wasn't?]"

**The Perceptual Truth:**
[State as a way of seeing. Use sensory language.
This is not a CSS rule. This is how to PERCEIVE.]

**The Technical Manifestation:**
- [How it shows up in code - but this is secondary]
- [The perceptual truth is primary]

**How To Test:**
[A simple test anyone can apply]
```

STEP 3: ADD TO SOUL-DISCOVERIES.md
Append the new soul piece to the document.

OUTPUT: Confirmation that soul piece was added.

═══════════════════════════════════════════════════════════════════════════════
```

---

## ORCHESTRATION SCRIPT

### Master Orchestrator Prompt

```
═══════════════════════════════════════════════════════════════════════════════
PERCEPTUAL DEEPENING ORCHESTRATOR
═══════════════════════════════════════════════════════════════════════════════

COMPONENT: [name]
REFERENCE: reference-images/[name].png
TARGET: Match reference through iterative perceptual refinement

═══════════════════════════════════════════════════════════════════════════════

ORCHESTRATION PROTOCOL:

1. INITIALIZE
   □ Verify reference image exists
   □ Create audit-screenshots/ directory
   □ Initialize PERCEPTUAL-AUDIT-LOG.md
   □ Take initial screenshot (cycle 1)
   □ Set iteration_count = 1

2. ITERATION LOOP
   WHILE (iteration_count < 5 OR not converged):

   a) Deploy SUB-AGENT A: Visual Comparator
      → Wait for report
      → Log to PERCEPTUAL-AUDIT-LOG.md

   b) Deploy SUB-AGENT B: Deepener
      → Input: Comparator report
      → Wait for report
      → Log to PERCEPTUAL-AUDIT-LOG.md

   c) Deploy SUB-AGENT C: Single-Change Implementer
      → Input: Deepener hypothesis
      → Wait for change + screenshot
      → Log to PERCEPTUAL-AUDIT-LOG.md

   d) Deploy SUB-AGENT D: Evaluator
      → Input: Previous + current screenshots
      → Wait for verdict
      → Log to PERCEPTUAL-AUDIT-LOG.md

      IF verdict == WORSE:
         → Revert change
         → Return to step (b) with alternative hypothesis

      IF verdict == SAME:
         → Return to step (a) with different focus

      IF verdict == BETTER:
         → Deploy SUB-AGENT E: Soul Documenter
         → Check convergence if iteration >= 5

   e) INCREMENT iteration_count

3. CONVERGENCE CHECK (iteration >= 5)
   □ Final squint test: same visual weight?
   □ Can articulate why it works?
   □ All discoveries documented?

   IF all yes → EXIT with success
   IF any no → CONTINUE iterations

4. FINALIZE
   □ Generate summary report
   □ List all soul pieces discovered
   □ Present final comparison (reference vs final)
   □ Update SOUL-DISCOVERIES.md

═══════════════════════════════════════════════════════════════════════════════

ENFORCEMENT RULES:

- MINIMUM 5 ITERATIONS: Cannot exit before 5, even if "looks right"
- ONE CHANGE PER ITERATION: Implementer must make exactly one change
- NEW OBSERVATIONS REQUIRED: Deepener cannot repeat previous observations
- PERCEPTUAL DOCUMENTATION: Soul pieces must be perceptual, not technical
- NO SHORTCUTS: Each sub-agent must complete its full protocol
- TRAJECTORY TRACER FIRST: If motion is present, Sub-Agent F's verdict must exist
  before Sub-Agent A runs. No verbal motion description before measurement.
- OBSERVATION vs INTERPRETATION: Observations are position/size/opacity facts;
  causal accounts are separate, testable claims. Do not fuse.
- FALSIFIABILITY: Every confident shape/trajectory/timing claim must be paired
  with a stated falsification test. ("This is straight" → falsification test:
  "find a frame where the moving element is >30px from the linear-interp line.")
- DEFAULT IS HYPOTHESIS: When the natural assumption is the framework's default
  (matchedGeometryEffect → linear, withAnimation → spring monotonic), treat the
  default as a HYPOTHESIS that must be tested against trajectory data, not the
  answer. Run the test before relying on the default.
- CONTINUATION ANALYSES: When given a v2/updated/new version of a previously-
  analyzed artifact, the FIRST step is to enumerate the strongest claims from
  the prior analysis and test each one against the new data. Falsify before
  refining.

═══════════════════════════════════════════════════════════════════════════════

BEGIN ORCHESTRATION.

Deploy Sub-Agent A for Cycle 1.

═══════════════════════════════════════════════════════════════════════════════
```

---

## INVOCATION

### Slash Command Format

When user invokes with `/soul [component]` or `/perceive [component]`:

```
ACKNOWLEDGED: Perceptual Deepening Protocol initiated for [component].

SETUP:
□ Reference image: reference-images/[component].png
□ Audit directory: audit-screenshots/
□ Log file: PERCEPTUAL-AUDIT-LOG.md

BEGINNING CYCLE 1...

[Deploy Sub-Agent A: Visual Comparator]
```

### Natural Language Triggers

Respond to:
- "This doesn't look right" → Offer to run perceptual deepening
- "Why does mine look different?" → Offer to run perceptual deepening
- "Make this match the reference" → Run perceptual deepening
- "Extract the soul" → Run perceptual deepening
- "Soul audit" → Run perceptual deepening

---

## OUTPUT ARTIFACTS

After successful completion, the skill produces:

1. **PERCEPTUAL-AUDIT-LOG.md** — Complete iteration history
2. **SOUL-DISCOVERIES.md** — Updated with new soul pieces
3. **audit-screenshots/** — Visual record of all iterations
4. **Final component code** — Refined to match reference
5. **Summary report** — What was discovered, iteration count, key insights

---

## SKILL DEPENDENCIES

- agent-browser CLI (`/opt/homebrew/bin/agent-browser`) for screenshots and browser interaction
- Image viewing capability (for side-by-side comparison)
- File system access (for logs and screenshots)
- Code editing capability (for implementing changes)

---

## RELATED SKILLS

- `design-extraction` — For initial reference image capture
- `component-system` — For building components to be refined
- `visual-regression` — For automated difference detection

═══════════════════════════════════════════════════════════════════════════════
END SKILL DEFINITION
═══════════════════════════════════════════════════════════════════════════════
