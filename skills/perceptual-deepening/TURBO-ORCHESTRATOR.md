# PERCEPTUAL DEEPENING: TURBO ORCHESTRATOR
## Maximum Effectiveness Sub-Agent Deployment Protocol

═══════════════════════════════════════════════════════════════════════════════

## INVOCATION

This prompt is the master orchestrator for the Perceptual Deepening skill.
Copy and use this entire prompt to execute the full protocol.

**Trigger phrases:**
- `/soul [component-name]`
- `/perceive [component-name]`
- "Run perceptual deepening on [component]"
- "Extract soul from [component]"
- "Why does this look wrong?"

═══════════════════════════════════════════════════════════════════════════════

## TURBO ORCHESTRATOR PROMPT

```
═══════════════════════════════════════════════════════════════════════════════
PERCEPTUAL DEEPENING: TURBO ORCHESTRATOR
═══════════════════════════════════════════════════════════════════════════════

MISSION: Extract the SOUL of {{COMPONENT}} through iterative visual discovery.

You are the ORCHESTRATOR. You will deploy specialized sub-agents in sequence,
enforce the protocol strictly, and prevent premature exit.

═══════════════════════════════════════════════════════════════════════════════
PHASE 0: INITIALIZATION
═══════════════════════════════════════════════════════════════════════════════

EXECUTE THESE SETUP STEPS:

1. VERIFY REFERENCE EXISTS
   □ Check: reference-images/{{COMPONENT}}.png
   □ If missing → STOP: "Reference image required. Please provide."

2. CREATE DIRECTORY STRUCTURE
   ```bash
   mkdir -p audit-screenshots/cycle-1
   mkdir -p audit-screenshots/cycle-2
   mkdir -p audit-screenshots/cycle-3
   mkdir -p audit-screenshots/cycle-4
   mkdir -p audit-screenshots/cycle-5
   ```

3. CAPTURE INITIAL SCREENSHOT
   ```bash
   # Using Playwright
   CYCLE=1 COMPONENT={{COMPONENT}} npx playwright test perceptual-audit.spec.ts
   ```
   □ Verify: audit-screenshots/cycle-1/attempt.png exists

4. INITIALIZE LOG FILE
   □ Copy templates/PERCEPTUAL-AUDIT-LOG-TEMPLATE.md
   □ Replace {{COMPONENT_NAME}} with "{{COMPONENT}}"
   □ Replace {{TIMESTAMP}} with current ISO timestamp
   □ Save as: PERCEPTUAL-AUDIT-LOG.md

5. LOAD EXISTING SOUL KNOWLEDGE
   □ Read: SOUL-DISCOVERIES.md
   □ Note existing soul pieces (context, not constraint)

6. SET ITERATION COUNTER
   □ iteration = 1
   □ converged = false

SETUP COMPLETE. BEGIN ITERATION LOOP.

═══════════════════════════════════════════════════════════════════════════════
ITERATION LOOP (iteration = {{N}})
═══════════════════════════════════════════════════════════════════════════════

REPEAT UNTIL (iteration >= 5 AND converged = true):

┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 1: DEPLOY SUB-AGENT A — VISUAL COMPARATOR                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ ACTIVATE SUB-AGENT A WITH THIS PROMPT:                                      │
│                                                                             │
│ """                                                                         │
│ SUB-AGENT A: VISUAL COMPARATOR — CYCLE {{N}}                                │
│                                                                             │
│ INPUTS:                                                                     │
│ - Reference: reference-images/{{COMPONENT}}.png                             │
│ - Attempt: audit-screenshots/cycle-{{N}}/attempt.png                        │
│                                                                             │
│ YOUR TASK:                                                                  │
│                                                                             │
│ 1. SQUINT TEST                                                              │
│    - Look at both images                                                    │
│    - Blur your perception (squint, defocus)                                 │
│    - What's the FEELING of each?                                            │
│    - Report in 1-3 words, NO MEASUREMENTS                                   │
│                                                                             │
│    Format:                                                                  │
│    "Reference feels: [X]"                                                   │
│    "Attempt feels: [Y]"                                                     │
│                                                                             │
│    VALID: "light", "heavy", "floating", "trapped", "confident", "timid"     │
│    INVALID: "2px border", "#E83025", "16px padding"                         │
│                                                                             │
│ 2. POINTING TEST                                                            │
│    - If you had to point to ONE area that's most wrong                      │
│    - WHERE is it? (location only, no explanation yet)                       │
│    - What ONE WORD describes how it feels?                                  │
│                                                                             │
│    Format:                                                                  │
│    "Most wrong: [location]"                                                 │
│    "Feels: [one word]"                                                      │
│                                                                             │
│ 3. GENERATE DIFF IMAGE                                                      │
│    - Create pixel-level comparison                                          │
│    - Save to: audit-screenshots/cycle-{{N}}/diff.png                        │
│    - Pink/red areas show differences                                        │
│                                                                             │
│ OUTPUT your report in this format:                                          │
│                                                                             │
│ ```                                                                         │
│ VISUAL COMPARATOR — CYCLE {{N}}                                             │
│                                                                             │
│ SQUINT TEST:                                                                │
│ Reference feels: [X]                                                        │
│ Attempt feels: [Y]                                                          │
│                                                                             │
│ MOST WRONG:                                                                 │
│ Location: [where]                                                           │
│ Feels: [one word]                                                           │
│                                                                             │
│ DIFF: audit-screenshots/cycle-{{N}}/diff.png                                │
│ ```                                                                         │
│ """                                                                         │
│                                                                             │
│ WAIT for Sub-Agent A to complete.                                           │
│ LOG output to PERCEPTUAL-AUDIT-LOG.md under Iteration {{N}}.                │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 2: DEPLOY SUB-AGENT B — DEEPENER                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ ACTIVATE SUB-AGENT B WITH THIS PROMPT:                                      │
│                                                                             │
│ """                                                                         │
│ SUB-AGENT B: DEEPENER — CYCLE {{N}}                                         │
│                                                                             │
│ INPUT FROM VISUAL COMPARATOR:                                               │
│ - Most wrong area: [from Sub-Agent A]                                       │
│ - Feeling: [from Sub-Agent A]                                               │
│                                                                             │
│ YOUR TASK:                                                                  │
│                                                                             │
│ 1. ZOOM INTO THE AREA                                                       │
│    - Focus ONLY on the identified area                                      │
│    - Examine it in both reference and attempt                               │
│    - Spend time looking (detailed examination)                              │
│                                                                             │
│ 2. THREE OBSERVATIONS (must be different)                                   │
│    Ask yourself: "What do I notice?"                                        │
│    Then: "What ELSE?"                                                       │
│    Then: "What ELSE?"                                                       │
│                                                                             │
│    Each observation MUST be different.                                      │
│    If iteration > 1, observations MUST be different from previous cycles.   │
│                                                                             │
│    Format:                                                                  │
│    1. "Looking closer, I notice: [observation 1]"                           │
│    2. "And also: [observation 2 - different]"                               │
│    3. "And also: [observation 3 - different]"                               │
│                                                                             │
│ 3. NAME THE PROBLEM                                                         │
│    Give it a crude, perceptual name.                                        │
│    Not technically correct — just what you SEE.                             │
│                                                                             │
│    Format:                                                                  │
│    "I would call this: [name]"                                              │
│                                                                             │
│    Examples: "trapped text", "weak edges", "dead space", "missing tension"  │
│                                                                             │
│ 4. HYPOTHESIZE                                                              │
│    What might CAUSE what you named?                                         │
│    This is a GUESS. It might be wrong. That's okay.                         │
│                                                                             │
│    Format:                                                                  │
│    "This might be caused by: [hypothesis]"                                  │
│                                                                             │
│ OUTPUT your report in this format:                                          │
│                                                                             │
│ ```                                                                         │
│ DEEPENER — CYCLE {{N}}                                                      │
│                                                                             │
│ FOCUS AREA: [area from comparator]                                          │
│                                                                             │
│ OBSERVATIONS:                                                               │
│ 1. [first observation]                                                      │
│ 2. [second - different]                                                     │
│ 3. [third - different]                                                      │
│                                                                             │
│ NAMED: "[crude name]"                                                       │
│                                                                             │
│ HYPOTHESIS: "[what might cause it]"                                         │
│ ```                                                                         │
│                                                                             │
│ RULE: "I don't see anything new" is NOT acceptable.                         │
│ If stuck: zoom to different scale, or examine relationships.                │
│ """                                                                         │
│                                                                             │
│ WAIT for Sub-Agent B to complete.                                           │
│ LOG output to PERCEPTUAL-AUDIT-LOG.md under Iteration {{N}}.                │
│                                                                             │
│ IF Sub-Agent B reports "nothing new":                                       │
│   → REJECT. Force re-examination at different scale.                        │
│   → "Look at relationships between elements instead of elements themselves" │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 3: DEPLOY SUB-AGENT C — SINGLE-CHANGE IMPLEMENTER                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ ACTIVATE SUB-AGENT C WITH THIS PROMPT:                                      │
│                                                                             │
│ """                                                                         │
│ SUB-AGENT C: SINGLE-CHANGE IMPLEMENTER — CYCLE {{N}}                        │
│                                                                             │
│ INPUT FROM DEEPENER:                                                        │
│ - Hypothesis: [from Sub-Agent B]                                            │
│                                                                             │
│ YOUR TASK:                                                                  │
│                                                                             │
│ 1. DETERMINE SINGLE CHANGE                                                  │
│    Based on the hypothesis, what is the ONE most impactful change?          │
│                                                                             │
│    CRITICAL: ONE CHANGE ONLY.                                               │
│    - Not two changes                                                        │
│    - Not three changes                                                      │
│    - ONE.                                                                   │
│                                                                             │
│    If hypothesis implies multiple changes, pick the MOST IMPACTFUL.         │
│                                                                             │
│ 2. IMPLEMENT THE CHANGE                                                     │
│    - Make exactly one change to the component code                          │
│    - Document what you changed                                              │
│                                                                             │
│ 3. CAPTURE NEW SCREENSHOT                                                   │
│    ```bash                                                                  │
│    CYCLE={{N+1}} COMPONENT={{COMPONENT}} npx playwright test                │
│    ```                                                                      │
│    Verify: audit-screenshots/cycle-{{N+1}}/attempt.png exists               │
│                                                                             │
│ OUTPUT your report in this format:                                          │
│                                                                             │
│ ```                                                                         │
│ IMPLEMENTER — CYCLE {{N}}                                                   │
│                                                                             │
│ HYPOTHESIS: [from Deepener]                                                 │
│                                                                             │
│ SINGLE CHANGE:                                                              │
│ What: [specific change]                                                     │
│ Why: [based on hypothesis]                                                  │
│                                                                             │
│ CODE DIFF:                                                                  │
│ ```                                                                         │
│ [minimal diff showing the one change]                                       │
│ ```                                                                         │
│                                                                             │
│ NEW SCREENSHOT: audit-screenshots/cycle-{{N+1}}/attempt.png                 │
│ ```                                                                         │
│                                                                             │
│ VIOLATION CHECK:                                                            │
│ If you made more than one change, you have violated the protocol.           │
│ REVERT all but the most impactful change.                                   │
│ """                                                                         │
│                                                                             │
│ WAIT for Sub-Agent C to complete.                                           │
│ LOG output to PERCEPTUAL-AUDIT-LOG.md under Iteration {{N}}.                │
│                                                                             │
│ ENFORCE: If more than one change was made, REJECT and demand single change. │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 4: DEPLOY SUB-AGENT D — EVALUATOR                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ ACTIVATE SUB-AGENT D WITH THIS PROMPT:                                      │
│                                                                             │
│ """                                                                         │
│ SUB-AGENT D: EVALUATOR — CYCLE {{N}}                                        │
│                                                                             │
│ INPUTS:                                                                     │
│ - Reference: reference-images/{{COMPONENT}}.png                             │
│ - Previous: audit-screenshots/cycle-{{N}}/attempt.png                       │
│ - Current: audit-screenshots/cycle-{{N+1}}/attempt.png                      │
│                                                                             │
│ YOUR TASK:                                                                  │
│                                                                             │
│ 1. COMPARE CURRENT TO REFERENCE                                             │
│    Is it closer than before?                                                │
│                                                                             │
│ 2. COMPARE CURRENT TO PREVIOUS                                              │
│    What changed? Did it help?                                               │
│                                                                             │
│ 3. GIVE VERDICT (choose ONE):                                               │
│    - BETTER: Current is closer to reference                                 │
│    - WORSE: Current is further from reference                               │
│    - SAME: No perceptible difference                                        │
│                                                                             │
│ 4. DETERMINE NEXT FOCUS                                                     │
│    If BETTER: What's STILL wrong? (next iteration focus)                    │
│    If WORSE: Recommend revert + alternative hypothesis                      │
│    If SAME: Wrong hypothesis, suggest new focus area                        │
│                                                                             │
│ 5. CONVERGENCE CHECK (if iteration >= 5)                                    │
│    □ Minimum iterations met?                                                │
│    □ Same visual weight as reference?                                       │
│    □ Ready to document soul pieces?                                         │
│                                                                             │
│ OUTPUT your report in this format:                                          │
│                                                                             │
│ ```                                                                         │
│ EVALUATOR — CYCLE {{N}}                                                     │
│                                                                             │
│ VERDICT: [BETTER / WORSE / SAME]                                            │
│                                                                             │
│ REASONING:                                                                  │
│ [Why this verdict - in perceptual terms]                                    │
│                                                                             │
│ NEXT ACTION:                                                                │
│ [If WORSE]: Revert. Alternative hypothesis: [suggestion]                    │
│ [If SAME]: Wrong hypothesis. New focus: [suggestion]                        │
│ [If BETTER]: Still wrong: [what to focus on next]                           │
│                                                                             │
│ CONVERGENCE (iteration >= 5 only):                                          │
│ □ Minimum iterations: [YES/NO]                                              │
│ □ Same visual weight: [YES/NO]                                              │
│ □ Ready for soul documentation: [YES/NO]                                    │
│ ```                                                                         │
│ """                                                                         │
│                                                                             │
│ WAIT for Sub-Agent D to complete.                                           │
│ LOG output to PERCEPTUAL-AUDIT-LOG.md under Iteration {{N}}.                │
│                                                                             │
│ BRANCH BASED ON VERDICT:                                                    │
│                                                                             │
│ IF WORSE:                                                                   │
│   → Revert the change                                                       │
│   → Return to STEP 2 with alternative hypothesis                            │
│   → Do NOT increment iteration counter                                      │
│                                                                             │
│ IF SAME:                                                                    │
│   → Keep the change (no harm)                                               │
│   → Return to STEP 1 with different focus area                              │
│   → INCREMENT iteration counter                                             │
│                                                                             │
│ IF BETTER:                                                                  │
│   → Proceed to STEP 5 (Soul Documenter)                                     │
│   → INCREMENT iteration counter                                             │
│   → Check convergence if iteration >= 5                                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 5: DEPLOY SUB-AGENT E — SOUL DOCUMENTER (only if BETTER)               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ ACTIVATE SUB-AGENT E WITH THIS PROMPT:                                      │
│                                                                             │
│ """                                                                         │
│ SUB-AGENT E: SOUL DOCUMENTER — CYCLE {{N}}                                  │
│                                                                             │
│ TRIGGER: The change was evaluated as BETTER.                                │
│                                                                             │
│ INPUT:                                                                      │
│ - What changed: [from Implementer]                                          │
│ - Why it worked: [from Evaluator]                                           │
│                                                                             │
│ YOUR TASK:                                                                  │
│                                                                             │
│ Translate the TECHNICAL change into a PERCEPTUAL INSIGHT.                   │
│                                                                             │
│ THE TRANSLATION:                                                            │
│                                                                             │
│ WRONG (Technical):                                                          │
│ - "Removed border: 1px solid #ccc"                                          │
│ - "Changed padding from 16px to 24px"                                       │
│                                                                             │
│ RIGHT (Perceptual):                                                         │
│ - "The border was creating a prison. Content FLOATS in Sanrok—never caged." │
│ - "The space was cramped. Generous whitespace = confidence."                │
│                                                                             │
│ WRITE SOUL PIECE:                                                           │
│                                                                             │
│ ```markdown                                                                 │
│ ## SOUL PIECE #[N]: [Short Perceptual Name]                                 │
│                                                                             │
│ **Discovered During:** {{COMPONENT}} iteration {{N}}                        │
│ **Iteration Count:** [how many to find this]                                │
│                                                                             │
│ **The Observation:**                                                        │
│ "[First-person description of the discovery. What did you see?              │
│ What was reference doing that attempt wasn't?]"                             │
│                                                                             │
│ **The Perceptual Truth:**                                                   │
│ [State as a way of SEEING, not a CSS rule.                                  │
│ Use sensory language: feels, looks, creates, communicates.]                 │
│                                                                             │
│ **The Technical Manifestation:**                                            │
│ - [How it shows up in code]                                                 │
│ - [But remember: perceptual truth is primary]                               │
│                                                                             │
│ **How To Test:**                                                            │
│ [A simple test anyone can apply to check this principle]                    │
│ ```                                                                         │
│                                                                             │
│ ADD to SOUL-DISCOVERIES.md                                                  │
│                                                                             │
│ OUTPUT: Confirmation that soul piece was documented.                        │
│ """                                                                         │
│                                                                             │
│ WAIT for Sub-Agent E to complete.                                           │
│ VERIFY soul piece added to SOUL-DISCOVERIES.md.                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│ STEP 6: ITERATION CONTROL                                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ INCREMENT: iteration = iteration + 1                                        │
│                                                                             │
│ CHECK CONVERGENCE (if iteration >= 5 and last verdict was BETTER):          │
│                                                                             │
│ CONVERGENCE CRITERIA:                                                       │
│ □ Minimum 5 iterations complete                                             │
│ □ Final squint test: same visual weight as reference                        │
│ □ Can articulate WHY it works (soul pieces documented)                      │
│ □ No major perceptual differences remain                                    │
│                                                                             │
│ IF ALL CRITERIA MET:                                                        │
│   → converged = true                                                        │
│   → Proceed to FINALIZATION                                                 │
│                                                                             │
│ IF ANY CRITERIA NOT MET:                                                    │
│   → converged = false                                                       │
│   → CONTINUE to next iteration                                              │
│   → "What's still wrong" becomes focus for next cycle                       │
│                                                                             │
│ HARD STOP: If iteration > 15 without convergence:                           │
│   → Report: "Extended iteration without convergence"                        │
│   → Document what remains different                                         │
│   → Request human review                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════════════════════
FINALIZATION (when converged = true)
═══════════════════════════════════════════════════════════════════════════════

1. GENERATE FINAL COMPARISON
   - Side-by-side: reference vs final attempt
   - Pixel diff showing minimal/no difference

2. COMPILE SUMMARY REPORT

   ```
   ═══════════════════════════════════════════════════════════════════════════
   PERCEPTUAL DEEPENING COMPLETE: {{COMPONENT}}
   ═══════════════════════════════════════════════════════════════════════════

   ITERATIONS: [total count]
   STATUS: CONVERGED

   SOUL PIECES DISCOVERED:
   1. [Soul piece name]: [one-line summary]
   2. [Soul piece name]: [one-line summary]
   3. [Soul piece name]: [one-line summary]

   KEY BREAKTHROUGH:
   [The single most important insight from this session]

   FINAL COMPARISON:
   - Reference: reference-images/{{COMPONENT}}.png
   - Final: audit-screenshots/cycle-[FINAL]/attempt.png
   - Diff: audit-screenshots/cycle-[FINAL]/diff.png

   SOUL-DISCOVERIES.md: Updated with [N] new pieces

   ═══════════════════════════════════════════════════════════════════════════
   ```

3. UPDATE FILES
   □ PERCEPTUAL-AUDIT-LOG.md: Mark as complete
   □ SOUL-DISCOVERIES.md: Verify all pieces added
   □ Component code: Commit final state

4. PRESENT TO USER
   - Show final comparison
   - List discoveries
   - Highlight key insight

═══════════════════════════════════════════════════════════════════════════════
ENFORCEMENT RULES (ORCHESTRATOR MUST ENFORCE)
═══════════════════════════════════════════════════════════════════════════════

1. MINIMUM ITERATIONS
   - CANNOT exit before 5 iterations
   - Even if "looks right" at iteration 3 → CONTINUE
   - Deep insights often come in iterations 4, 5, 6

2. ONE CHANGE PER ITERATION
   - Sub-Agent C must make exactly ONE change
   - If multiple changes detected → REJECT, demand single change
   - This is non-negotiable

3. NEW OBSERVATIONS REQUIRED
   - Sub-Agent B cannot repeat observations from previous cycles
   - If "nothing new" reported → REJECT, force different perspective
   - Look at different scale, or relationships instead of elements

4. PERCEPTUAL DOCUMENTATION
   - Sub-Agent E must document as PERCEPTION, not CSS
   - If technical documentation detected → REJECT, demand rewrite
   - "Removed border" ❌ → "Content was caged, now floats" ✓

5. NO PREMATURE EXIT
   - Only ORCHESTRATOR can declare convergence
   - Sub-agents cannot independently exit the loop
   - Convergence requires ALL criteria met

═══════════════════════════════════════════════════════════════════════════════
BEGIN EXECUTION
═══════════════════════════════════════════════════════════════════════════════

COMPONENT: {{COMPONENT}}
REFERENCE: reference-images/{{COMPONENT}}.png

Initializing Phase 0: Setup...

```

═══════════════════════════════════════════════════════════════════════════════

## USAGE INSTRUCTIONS

### To Run This Protocol:

1. **Copy the entire "TURBO ORCHESTRATOR PROMPT" section above**

2. **Replace all instances of `{{COMPONENT}}` with your component name**
   - Example: "essence-box", "code-block", "project-card"

3. **Ensure reference image exists**
   - Path: `reference-images/[component-name].png`

4. **Paste the prompt into Claude Code**

5. **Let it run through minimum 5 iterations**

### What Happens:

1. Orchestrator initializes the audit
2. Sub-agents are deployed in sequence for each iteration
3. Each iteration produces: squint test → observations → single change → evaluation
4. Soul pieces are documented when improvements are found
5. Loop continues until convergence (minimum 5 iterations)
6. Final report is generated with all discoveries

### Expected Duration:

- Simple components: 5-7 iterations
- Complex components: 8-12 iterations
- Extended cases: up to 15 iterations

### Output Files:

- `PERCEPTUAL-AUDIT-LOG.md` — Complete iteration history
- `SOUL-DISCOVERIES.md` — Accumulated perceptual insights
- `audit-screenshots/` — Visual record of all iterations
- Final component code — Refined to match reference

═══════════════════════════════════════════════════════════════════════════════
