# QUICK INVOKE: Perceptual Deepening
## Copy-Paste Commands for Rapid Skill Invocation

═══════════════════════════════════════════════════════════════════════════════

## OPTION 1: Simple Invocation

Just paste this and fill in the component name:

```
/soul essence-box
```

Or:

```
Run perceptual deepening on the essence-box component.
Reference: reference-images/essence-box.png
URL: http://localhost:3000/components
Selector: .essence-box
```

═══════════════════════════════════════════════════════════════════════════════

## OPTION 2: Full Protocol Invocation

Copy this entire block for a complete, self-contained invocation:

```
═══════════════════════════════════════════════════════════════════════════════
PERCEPTUAL DEEPENING PROTOCOL — ACTIVATE
═══════════════════════════════════════════════════════════════════════════════

COMPONENT: [COMPONENT_NAME]
REFERENCE: reference-images/[COMPONENT_NAME].png
URL: http://localhost:3000/[PATH]
SELECTOR: .[COMPONENT_SELECTOR]

═══════════════════════════════════════════════════════════════════════════════

MISSION: Extract the SOUL of this component through iterative visual discovery.

RULES:
1. Minimum 5 iterations — no early exit
2. One change per iteration — no multi-fixes
3. Perceptual observations only — no CSS measurements
4. Document as perception — "content floats" not "removed border"

═══════════════════════════════════════════════════════════════════════════════

PHASE 0: SETUP

□ Verify reference image exists
□ Create: perceptual-audit/ directory
□ Initialize: PERCEPTUAL-AUDIT-LOG.md
□ Capture initial screenshot

═══════════════════════════════════════════════════════════════════════════════

PHASE 1: DEPLOY ZONE SUB-AGENTS (PARALLEL)

Deploy these simultaneously:
- ZONE-TYPOGRAPHY: Font feel, letter endings, hierarchy
- ZONE-SPACING: Whitespace generosity, content-to-chrome ratio
- ZONE-CONTAINERS: Borders (trapped vs floating), frames vs accents
- ZONE-HIERARCHY: What dominates, what recedes, visual order
- ZONE-COMPOSITION: Tension, opposition, energy

Each sub-agent reports:
- Squint test observation
- Three "what else?" observations
- Named problem
- Hypothesis
- Priority (HIGH/MEDIUM/LOW)

═══════════════════════════════════════════════════════════════════════════════

PHASE 2: SYNTHESIZE

Orchestrator:
1. Collect all zone reports
2. Rank by priority
3. Select highest-impact single change
4. Deploy Single-Change Implementer

═══════════════════════════════════════════════════════════════════════════════

PHASE 3: ITERATE

After each change:
1. Capture new screenshot
2. Re-deploy zone sub-agents
3. Evaluate: BETTER / WORSE / SAME
4. If BETTER: Document soul piece
5. Continue until convergence (min 5 iterations)

═══════════════════════════════════════════════════════════════════════════════

PHASE 4: FINALIZE

When converged:
□ Generate final comparison
□ Compile soul discoveries
□ Update SOUL-DISCOVERIES.md
□ Present summary report

═══════════════════════════════════════════════════════════════════════════════

BEGIN EXECUTION. Initialize Phase 0.

═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## OPTION 3: Zone-Specific Invocation

For focused analysis of a single zone:

```
═══════════════════════════════════════════════════════════════════════════════
PERCEPTUAL DEEPENING — TYPOGRAPHY ZONE ONLY
═══════════════════════════════════════════════════════════════════════════════

COMPONENT: [COMPONENT_NAME]
ZONE: Typography only

FOCUS:
- Font rendering quality
- Letter endings (ball terminals, serifs)
- Stroke contrast
- Size hierarchy
- Rhythm and spacing

Run the deepening loop focused ONLY on typography.
Minimum 5 iterations.

BEGIN.
═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## OPTION 4: Comparison Mode

For quick "why does this look wrong?" analysis:

```
═══════════════════════════════════════════════════════════════════════════════
QUICK COMPARISON: Why Does This Look Wrong?
═══════════════════════════════════════════════════════════════════════════════

REFERENCE: [path or describe]
ATTEMPT: [path or describe]

Do a quick perceptual comparison:

1. SQUINT TEST
   - Reference feels: ?
   - Attempt feels: ?

2. POINT TEST
   - Most wrong area: ?
   - It feels: ?

3. THREE OBSERVATIONS
   - I notice: ?
   - And also: ?
   - And also: ?

4. NAMED PROBLEM
   - I would call this: ?

5. HYPOTHESIS
   - This might be caused by: ?

Report findings, then recommend whether full perceptual deepening is needed.
═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## OPTION 5: Soul Audit (Post-Completion Check)

After building, verify soul alignment:

```
═══════════════════════════════════════════════════════════════════════════════
SOUL AUDIT: Verify Soul Alignment
═══════════════════════════════════════════════════════════════════════════════

COMPONENT: [COMPONENT_NAME]
SOUL-DISCOVERIES.md: [path]

Check if component embodies documented soul pieces:

□ Soul Piece 1: [name] — Does component exhibit this?
□ Soul Piece 2: [name] — Does component exhibit this?
□ Soul Piece 3: [name] — Does component exhibit this?
...

For each soul piece not exhibited:
- Why not?
- Should it be?
- What would need to change?

Report alignment score and recommended actions.
═══════════════════════════════════════════════════════════════════════════════
```

═══════════════════════════════════════════════════════════════════════════════

## SHORTCUTS

| Command | What It Does |
|---------|--------------|
| `/soul [component]` | Full perceptual deepening |
| `/perceive [component]` | Full perceptual deepening |
| `/squint [ref] [attempt]` | Quick squint test comparison |
| `/zones [component]` | Parallel zone analysis |
| `/soul-audit [component]` | Post-build soul verification |

═══════════════════════════════════════════════════════════════════════════════

## INTEGRATION WITH WORKFLOW

### After Playwright Tests Pass:

```
Tests passed for essence-box.

Before marking complete, run soul verification:
/soul essence-box
```

### When Something Feels Wrong:

```
The card looks structurally correct but something feels off.
/squint reference-images/card.png attempt-screenshots/card.png
```

### For New Component Types:

```
Building a new component type: decision-matrix.
No reference exists yet.

Use card-system as baseline reference:
/soul decision-matrix --baseline=card-system
```

═══════════════════════════════════════════════════════════════════════════════

## ENVIRONMENT SETUP

Before first run, ensure:

```bash
# Install dependencies
npm install --save-dev @playwright/test pngjs pixelmatch

# Create directory structure
mkdir -p perceptual-audit/{reference-images,attempt-screenshots,zone-crops,diff-images}

# Copy reference images
cp your-reference.png perceptual-audit/reference-images/

# Run initial capture
ITERATION=1 COMPONENT_URL=http://localhost:3000 npx playwright test visual-audit.spec.ts
```

═══════════════════════════════════════════════════════════════════════════════
