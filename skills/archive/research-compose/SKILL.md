---
name: research-compose
description: Build a designed HTML page from content markdown using the full accumulated knowledge base (26,528 lines across 57 files) via the Tripod Pipeline. Orchestrates five phases — DERIVE (tension-composition), RESEARCH (5 specialists + synthesizer), BUILD (3-pass rotation), EVALUATE (perceptual audit), REFINE (fix cycles). Input is a content markdown path. Output is a self-contained .html file + research packages + PA audit + comparison report. Trigger phrases include "research-compose", "research compose", "tripod compose", "deep compose", "compose with research".
---

# /research-compose — Tripod Pipeline Orchestrator

Takes content markdown and produces a designed, self-contained HTML page using the full accumulated knowledge base — not the 4 compressed vocabulary files, but curated selections from all 57 source files (26,528 lines).

**You are the ORCHESTRATOR.** You handle plumbing (file loading, agent spawning, screenshots, routing, validation). Creative freedom lives inside each phase's agents. You do NOT make compositional decisions.

**This skill SUPERSEDES /compose when invoked.** The user chose /research-compose for this build, which means the full Tripod Pipeline runs.

---

## CONTEXT RECOVERY (read this first if disoriented)

**If you cannot recall your current phase:** STOP. Read `{OUTPUT_DIR}/_pipeline-log.md`. The last completed phase checkpoint tells you where to resume. Then jump to the next uncompleted phase below.

**Context management rules:**
- Do NOT read agent prompt files into your own context. Pass the file path to the agent and let the agent read it via the Read tool.
- For validation, prefer Bash-based checks (`wc -l`, `grep -c '<style>'`, file existence) over reading full file contents.
- Only read files YOU need to make routing decisions. Let agents read their own inputs.

## Quick Reference — Phases & Outputs

Use this table to find your current position after context compression. If context has compressed, re-read `_pipeline-log.md` for the latest checkpoint, then jump to the next uncompleted phase below.

| Phase | Name | Agents | Key Outputs | Validation Gate |
|-------|------|--------|-------------|-----------------|
| 0 | SETUP | 0 (orchestrator) | Dirs created, files loaded | Input file exists, dirs created |
| 1 | DERIVE | 1 TC (Opus) | `_tc-brief.md` | 6 sections, definitive metaphor, 3+ waypoints, structural observation (non-blocking) |
| 2 | RESEARCH | 5 specialists + 1 synth (Opus) | `_specialist-[1-5]-*.md`, `_package-pass-[1-3].md` | Each specialist >= quality floor lines, each package >= 100 lines |
| 3 | BUILD | 1 builder x 3 passes (Opus) | `_build-pass-[1-2].html`, `_build-final.html`, `_pass-[1-2]-decisions.md`, `_builder-reflection.md` | HTML > 1KB, has `<style>`, has Google Fonts, self-contained |
| 4 | EVALUATE | 5 PA + 1 weaver (Opus) | `_pa/auditor-[1-5].md`, `_pa/synthesis.md`, `_comparison-report.md` | Synthesis has verdict, comparison report has gap analysis |
| 5 | REFINE | 0-1 builder (Opus) | Updated `_build-final.html`, `_fixes/fix-N-*.md` | Max 2 cycles, re-screenshot + re-PA after each |

**Total agents per run:** 16-17 base (1 TC + 5 specialists + 1 synthesizer + 3 builder passes + 5 PA auditors + 1 weaver) + 0-7 per refine cycle (1 refine builder + 5 PA re-auditors + 1 re-weaver). Maximum with 2 refine cycles: 30 agents.

---

## Prerequisites

**Content file:** The user provides a path to a markdown file containing the content to design. Resolve to an absolute path immediately and verify the file exists before proceeding. If the file doesn't exist, STOP and ask the user for the correct path.

**Output directory:** Create the output directory before any agent writes:
```bash
mkdir -p ephemeral/builds/<content-name>-<date>/
mkdir -p ephemeral/builds/<content-name>-<date>/_screenshots
mkdir -p ephemeral/builds/<content-name>-<date>/_pa
mkdir -p ephemeral/builds/<content-name>-<date>/_pa/_images
mkdir -p ephemeral/builds/<content-name>-<date>/_fixes
```
Content name = the markdown filename without extension (e.g., `my-article.md` -> `my-article-2026-03-02`).

Store the absolute output directory path as `OUTPUT_DIR` — every file reference below uses it.

**Agent spawning:** Use the Agent tool with `subagent_type: "general-purpose"` and `model: "opus"` for all agent spawns. Each agent runs in its own context. Agents have Read tool access to read files from disk. Pass file PATHS in prompts (not full contents) — agents read their own inputs.

**Agent spawn retry:** If an agent spawn fails (error, timeout, empty output), wait 30 seconds and retry once. If the retry also fails, log the failure in `_pipeline-log.md` and proceed without that agent's output.

**Pipeline log:** Create `{OUTPUT_DIR}/_pipeline-log.md` immediately with a header:
```markdown
# Pipeline Log: {content-name}
Started: {timestamp}
Content: {absolute-path-to-content.md}
Output: {OUTPUT_DIR}
```

---

## Instrumentation: Layer B Checkpoint Format

Every phase checkpoint written to `_pipeline-log.md` must follow this structure:

```markdown
## Phase [N]: [PHASE NAME] — Checkpoint

- **Timestamp:** [ISO 8601 or descriptive]
- **Agents spawned:** [count] ([role names])
- **Artifacts produced:**
  - [filename] — [line count] lines
  - [filename] — [line count] lines
- **Quality floor check:**
  - [artifact]: [PASS/FAIL] — [reason if FAIL]
- **Concerns:** [any red flags observed, or "None"]
- **Cumulative cost estimate:** $[low]-[high] (Phase [N] est: $[low]-[high])
- **Decision:** [PROCEED / RE-RUN / ABORT] — [1-sentence justification]

---
```

Cost estimate ranges per phase: Phase 1 ($3-5), Phase 2 ($10-18, increased for Section 10 assembly), Phase 3 ($12-18), Phase 4 ($5-10), Phase 5 ($0-8). Estimated total per run: $30-59 base + $0-16 per refine cycle. If cumulative upper bound exceeds $50, this is a **HARD GATE**: PAUSE and report to user with current cost breakdown per phase before proceeding. The user must explicitly approve continued spending. Do NOT proceed past $50 without approval. Maximum 1 re-run per agent per phase. If re-run also fails, proceed with best available output.

---

## Phase 0: SETUP — Load Common Files (YOU do this)

Read these files. They are used across multiple phases.

1. `design-system/compositional-core/identity/identity.md` (87 lines)
2. `design-system/compositional-core/identity/vocabulary.md` (55 lines)
3. `design-system/compositional-core/vocabulary/tokens.css` (124 lines)
4. `design-system/compositional-core/components/components.css` (779 lines)

Verify soul principles are clear:
- `border-radius: 0` — always, on everything
- `box-shadow: none` — always, on everything
- No gradients, no semi-transparent backgrounds, no cool grays

**Browser pre-flight:** Verify Playwright browser is available by navigating to `about:blank`. If this fails with a "browser not installed" error, call `browser_install` and retry.

**Write Phase 0 checkpoint to `_pipeline-log.md`** using the Layer B template format above.

**DO NOT proceed to Phase 1 until Phase 0 validation passes.**

---

## Phase 1: DERIVE (Tension-Composition)

**Context recovery:** If context has compressed, re-read `{OUTPUT_DIR}/_pipeline-log.md`. If Phase 0 is marked COMPLETE and Phase 1 is not, you are HERE.

**Spawn:** One Opus agent for TC derivation.

**Agent receives (provide file paths for agent to Read):**
- The content markdown (full path: `{CONTENT_PATH}`)
- The TC skill: `~/.claude/skills/tension-composition/SKILL.md`
- Identity files: `design-system/compositional-core/identity/identity.md` + `design-system/compositional-core/identity/vocabulary.md`
- The resolved output path: `{OUTPUT_DIR}/_tc-brief.md`

**Agent does NOT receive:**
- Case studies, prior explorations, mechanism files (library prohibition until TC Phase 4)
- Gate results, PA scores, or any pipeline vocabulary
- Components.css or components.md
- Research packages or specialist outputs

**Agent prompt:** Pass the supplementary TC instructions from `~/.claude/skills/research-compose/prompts/tc-derivation.md` to the agent along with this instruction:

Run the full TC pipeline (Phases 0 through 4.5) using the tension-composition skill at `~/.claude/skills/tension-composition/SKILL.md`. Output the conviction brief to `{OUTPUT_DIR}/_tc-brief.md`. The brief must be rich and comprehensive — not a thin summary. Let the TC agent determine how much conviction needs to transfer. Read the supplementary instructions at `~/.claude/skills/research-compose/prompts/tc-derivation.md` for additional requirements specific to the research-compose pipeline.

**Agent outputs to:** `{OUTPUT_DIR}/_tc-brief.md`

### Phase 1 Validation (YOU verify before proceeding)

1. File exists: `{OUTPUT_DIR}/_tc-brief.md`
2. File is > 50 lines (thin briefs produce flat output)
3. Brief has all 6 sections: World-Description, Calibration, Opposition Map, Compositional Arc, Creative Conditions, Content Map
4. Section 1 contains a definitive metaphor statement (no 'could', 'might', 'perhaps')
5. Section 4 contains at least 3 creative waypoints
6. Brief is conviction-driven (creative invitations, not compliance checklists)
7. **Compositional Questions section present** with 2-3 explicit "What if..." questions, each implying 3+ CSS channels. Check for the "Compositional Questions (CARRY VERBATIM TO BUILDERS)" header.

**Structural observation check (non-blocking):** If TC brief contains Section 7 (Structural Observation) with content archetype identification, note it in the pipeline log. If absent, note "TC did not produce structural observation — standard vertical pipeline." This is informational, not a gate failure.

**If validation fails:** Re-spawn the TC agent with feedback: "The brief is missing [specific issue]. The conviction brief must transfer FULL compositional intelligence to the builder. Go deeper." For missing compositional questions: "The brief needs 2-3 explicit 'What if...' compositional questions that imply multi-channel CSS coordination. Each question should naturally generate CSS changes across 3+ visual channels (spacing, typography, color, borders, line-height, letter-spacing). See the tc-derivation.md prompt for examples."

**Write Phase 1 checkpoint to `_pipeline-log.md`** using the Layer B template format. Key fields: Agents spawned: 1 (TC). Artifacts: _tc-brief.md ({line-count} lines). Cumulative cost estimate: $3-5.

**DO NOT proceed to Phase 2 until Phase 1 validation passes.**

---

## Phase 2: RESEARCH (Specialist Team)

**Context recovery:** If context has compressed, re-read `{OUTPUT_DIR}/_pipeline-log.md`. If Phase 1 is marked COMPLETE and Phase 2 is not, you are HERE. Re-read `{OUTPUT_DIR}/_tc-brief.md` to recall the metaphor and content.

This is the core of the tripod. 5 specialists read different slices of the 26,528-line knowledge base and produce curated, content-specific research. Then 1 synthesizer merges their output into 3 rotation-ready package files.

### Step 2A: Spawn 5 Specialists (PARALLEL)

All 5 specialists run in parallel. Each receives the common input plus their domain-specific files.

**Common input for ALL specialists (provide file paths):**
- `{CONTENT_PATH}` — the article being designed
- `{OUTPUT_DIR}/_tc-brief.md` — the conviction brief (metaphor + spatial direction)

---

#### Specialist 1: Findings Mapper

**Domain files to Read (Layer 1 + Layer 6a, ~4,810 lines):**
- `design-system/research/R1-DOCUMENTATION-PATTERNS.md` (584 lines)
- `design-system/research/R2-CREATIVE-LAYOUTS.md` (810 lines)
- `design-system/research/R3-DENSITY-DIMENSIONS.md` (553 lines)
- `design-system/research/R4-AXIS-INNOVATIONS.md` (990 lines)
- `design-system/research/R5-COMBINATION-THEORY.md` (784 lines)
- `design-system/research/RESEARCH-SYNTHESIS.md` (383 lines)
- `design-system/validated-explorations/combination/R5-EVALUATION-MATRIX.md` (706 lines)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/specialist-1-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Output:** `{OUTPUT_DIR}/_specialist-1-findings.md`
**Quality floor:** 200 lines minimum. 20+ HIGH findings with originating question attribution. TC Experimental Questions (Preserved) section present. Each HIGH finding: finding ID + relevance rationale + specific CSS action for THIS build + originating question link. Recipe format.

---

#### Specialist 2: Validation Mapper

**Domain files to Read (Layer 2 + Layer 5 + Layer 6b, ~4,827 lines):**
- `design-system/specification/provenance/stage-1-components/component-findings.md` (196 lines)
- `design-system/specification/provenance/stage-2-density-dd/DD-outbound-findings.md` (232 lines)
- `design-system/specification/provenance/stage-3-organization-od/OD-outbound-findings.md` (959 lines)
- `design-system/specification/provenance/stage-4-axis-ad/AD-outbound-findings.md` (680 lines)
- `design-system/specification/provenance/stage-2-density-dd/HANDOFF-DD-TO-OD.md` (338 lines)
- `design-system/specification/provenance/stage-3-organization-od/HANDOFF-OD-TO-AD.md` (351 lines)
- `design-system/specification/provenance/stage-4-axis-ad/HANDOFF-AD-TO-CD.md` (447 lines)
- `design-system/specification/provenance/stage-3-organization-od/OD-SYNTHESIS.md` (672 lines)
- `design-system/specification/provenance/stage-4-axis-ad/AD-SYNTHESIS.md` (306 lines)
- `archive/knowledge-architecture/09-CD-SYNTHESIS-BRIEFING.md` (646 lines)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/specialist-2-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Output:** `{OUTPUT_DIR}/_specialist-2-validated.md`
**Quality floor:** 80 lines minimum. 15+ validated findings with provenance chains. Each: finding ID + stage progression + validation evidence + build-specific application.

---

#### Specialist 3: Case Study Analyst

**Domain files to Read (Layer 3, ~5,120 lines):**
- `design-system/compositional-core/case-studies/DD-003-islands.md` (405 lines)
- `design-system/compositional-core/case-studies/DD-004-layers.md` (428 lines)
- `design-system/compositional-core/case-studies/DD-006-fractal.md` (377 lines)
- `design-system/compositional-core/case-studies/dd-003-islands-visual.md` (462 lines)
- `design-system/compositional-core/case-studies/dd-004-layers-visual.md` (144 lines)
- `design-system/compositional-core/case-studies/dd-006-fractal-visual.md` (165 lines)
- `design-system/compositional-core/case-studies/OD-001-conversational.md` (297 lines)
- `design-system/compositional-core/case-studies/OD-004-confidence.md` (309 lines)
- `design-system/compositional-core/case-studies/OD-006-creative.md` (333 lines)
- `design-system/compositional-core/case-studies/CD-001-reasoning-inside-code.md` (415 lines)
- `design-system/compositional-core/case-studies/CD-005-multi-axis-transition.md` (386 lines)
- `design-system/compositional-core/case-studies/CD-006-pilot-migration.md` (387 lines)
- `design-system/compositional-core/case-studies/ANTI-PRESCRIPTION-TEMPLATE.md` (471 lines)
- `design-system/compositional-core/case-studies/README.md` (541 lines)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/specialist-3-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Output:** `{OUTPUT_DIR}/_specialist-3-casestudies.md`
**Quality floor:** 100 lines minimum. 3-5 case studies with structural affinity. Each: affinity rationale + process extraction + at least 10 lines of actual CSS adapted for THIS build.

---

#### Specialist 4: Constraints Compiler

**Domain files to Read (Layer 4 + Layer 9 + Layer 11, ~5,162 lines):**
- `design-system/specification/provenance/stage-4-axis-ad/AD-CONVENTION-SPEC.md` (1,093 lines)
- `design-system/specification/provenance/stage-4-axis-ad/AD-PA-CONVENTIONS.md` (970 lines)
- `design-system/specification/provenance/stage-3-organization-od/OD-CONVENTION-SPEC.md` (468 lines)
- `design-system/compositional-core/identity/identity.md` (87 lines)
- `design-system/compositional-core/identity/vocabulary.md` (55 lines)
- `design-system/compositional-core/vocabulary/tokens.css` (124 lines)
- `design-system/specification/anti-patterns/registry.md` (354 lines)
- `archive/knowledge-architecture/core/ACCUMULATED-IDENTITY-v2.md` (519 lines)
- `design-system/specification/BACKBONE.md` (542 lines)
- `design-system/specification/provenance/stage-3-organization-od/OD-RESEARCH-GATE.md` (440 lines)
- `design-system/specification/provenance/stage-4-axis-ad/AD-RESEARCH-GATE.md` (510 lines)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/specialist-4-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Output:** `{OUTPUT_DIR}/_specialist-4-constraints.md`
**Quality floor:** 60 lines minimum. Soul checklist (all non-negotiables). 6+ anti-patterns risk-profiled with: risk level, WHY it's risky for THIS content, CSS mitigation. Token values as reference.

---

#### Specialist 5: Protocol & Exemplar Analyst

**Domain files to Read (Layer 7 + Layer 8, ~3,892 lines):**
- `archive/knowledge-architecture/MASTER-AD-EXECUTION-SPEC.md` (1,407 lines)
- `design-system/pipeline/MASTER-CD-EXECUTION-PROMPT.md` (930 lines)
- `archive/combination-research/research-package-cd-001.md` (249 lines)
- `archive/combination-research/research-package-cd-002.md` (240 lines)
- `archive/combination-research/research-package-cd-003.md` (249 lines)
- `archive/combination-research/research-package-cd-004.md` (250 lines)
- `archive/combination-research/research-package-cd-005.md` (226 lines)
- `archive/combination-research/research-package-cd-006.md` (341 lines)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/specialist-5-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Output:** `{OUTPUT_DIR}/_specialist-5-protocol.md`
**Quality floor:** 80 lines minimum. Consumption protocol defined. 5+ effective patterns from Agent-0C. Template structure proposed. Anti-orphaning principle stated.

---

### Step 2B: Validate Specialist Outputs (YOU do this)

After all 5 specialists complete, validate EACH output:

```
For each specialist N in [1, 2, 3, 4, 5]:
  1. Verify file exists: {OUTPUT_DIR}/_specialist-{N}-*.md
  2. Count lines. Compare against quality floor:
     - S1: >= 200 lines (includes TC Experimental Questions section)
     - S2: >= 80 lines (includes TC Experimental Questions section)
     - S3: >= 100 lines
     - S4: >= 60 lines
     - S5: >= 80 lines
  3. If below floor: re-spawn that specialist with:
     "Your output was {N} lines. The quality floor is {floor} lines.
      Go deeper — read more carefully, extract more findings,
      provide more CSS examples. Every finding needs a specific
      build action for THIS content."
  4. Maximum 1 re-run per specialist. If still below floor after re-run, proceed with what you have.
  5. STOP CONDITION: If 3+ specialists produce below-floor output AFTER re-runs,
     STOP and report to user: "The knowledge base has insufficient relevance for
     this content. 3+ specialists could not produce quality output. Options:
     (a) proceed with thin packages, or (b) provide supplementary reference material."
```

---

### Step 2C: Spawn Synthesizer (SEQUENTIAL — after all specialists)

**Context recovery reminder:** If context has compressed between Step 2A and 2C, re-read `{OUTPUT_DIR}/_pipeline-log.md` to confirm you're in Phase 2, then re-read the specialist outputs.

**Spawn:** One Opus agent as the synthesizer.

**Agent receives (provide file paths for agent to Read):**
- All 5 specialist outputs:
  - `{OUTPUT_DIR}/_specialist-1-findings.md`
  - `{OUTPUT_DIR}/_specialist-2-validated.md`
  - `{OUTPUT_DIR}/_specialist-3-casestudies.md`
  - `{OUTPUT_DIR}/_specialist-4-constraints.md`
  - `{OUTPUT_DIR}/_specialist-5-protocol.md`
- `{OUTPUT_DIR}/_tc-brief.md` (conviction brief)
- `{CONTENT_PATH}` (content markdown)
- Exemplar package (format reference, provide path):
  - `archive/combination-research/research-package-cd-006.md`

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/synthesizer-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Agent produces THREE files (not one):**

- `{OUTPUT_DIR}/_package-pass-1.md` — **Foundations** (~280-360 lines)
  - Section 0: Soul Checklist (~15 lines)
  - Section 1: Build Context — metaphor + content map + **zone architecture summary** (~40-50 lines)
    - NOTE: Section 1 MUST include a condensed zone overview (zone names, density progression direction, ASCII density diagram) because the Pass 1 builder creates zones but does NOT see Section 4. Without this, the zone creator is blind to the zone recipe.
  - Section 2: Mechanism Selections + full rationale + CSS examples (~100-120 lines)
  - Section 9: Consumption Protocol — how to read and sequence work (~20 lines)
  - Section 10: Compositional Questions — 5-7 generative "What if..." questions from 3 sources (~30-40 lines)
    - Source 1: TC Brief experimental questions (2-3, carried verbatim from S1/S2's "TC Experimental Questions (Preserved)" sections)
    - Source 2: Knowledge Base question families (2-3, adapted from proven exploration questions to THIS content)
    - Source 3: Cross-specialist synthesis question (1, derived from the intersection of all 5 specialist findings)
  - Section 11: Structural Propositions from Synthesizer (~20-50 lines)
    - Content archetype + 2-4 structural propositions (non-standard layout ideas tied to content features)
    - Section 11 may be a single line ("No structural propositions") for linear content — this is valid

- `{OUTPUT_DIR}/_package-pass-2.md` — **Enrichment** (~180-230 lines)
  - Section 3: Findings -> Build-Specific Actions (~100-130 lines, increased for question attributions)
  - Section 4: Zone Architecture — zone-by-zone recipe with ASCII density diagram (~50-70 lines)
  - Section 5: Case Study Processes + CSS that worked (~50-60 lines)

- `{OUTPUT_DIR}/_package-pass-3.md` — **Hardening** (~140-180 lines)
  - Section 6: Anti-Patterns risk-profiled + CSS mitigations (~30-40 lines)
  - Section 7: CSS Examples from validated explorations (~60-80 lines, increased for richer patterns)
  - Section 8: Structural Propositions — testable hypotheses (~20-30 lines)

### Step 2D: Validate Synthesizer Outputs (YOU do this)

```
For each package file in [_package-pass-1.md, _package-pass-2.md, _package-pass-3.md]:
  1. Verify file exists (bash: test -f)
  2. Verify >= 130 lines (bash: wc -l)
  3. Verify recipe format: grep for sequenced verbs (Read, Deploy, Apply, Internalize).
     If the file has more checklist verbs (Verify, Fail if, Must be) than recipe verbs, flag it.
  4. Verify content-specificity: grep for the article title or key topic words.
     The package should reference specific structural properties of THIS content
     (e.g., "Q&A alternation", "code nesting", "narrative arc"), not just the article name.
  5. Structural uniqueness spot-check: In _package-pass-1.md Section 2 (Mechanisms),
     verify at least 2 mechanism rationales reference specific content features
     (not just "for this article"). Look for concrete references to content structure,
     not generic design principles.
  6. Section 10 presence check (Pass 1 only): Verify _package-pass-1.md contains
     "## 10. COMPOSITIONAL QUESTIONS" header. Verify at least 5 numbered questions
     exist below it. If missing, the builder receives no compositional questions
     and multi-channel coordination will be limited.
  7. Section 11 presence check (Pass 1 only): Verify _package-pass-1.md contains
     "## 11. STRUCTURAL PROPOSITIONS" header (or similar). Content may be a single
     line ("No structural propositions") for linear content — this is valid and
     passes the check. If the header is entirely absent, log it as a non-blocking
     note: "Section 11 absent — builder will use standard vertical layout."
```

**If any package file is < 100 lines or too generic:** Re-spawn the synthesizer with: "Package file {name} is {issue}. Every section must reference specific aspects of THIS article and THIS metaphor. Generic advice is useless to the builder."

**Write Phase 2 checkpoint to `_pipeline-log.md`** using the Layer B template format. Key fields: Agents spawned: 6 (5 specialists + 1 synthesizer). Specialist outputs: S1 ({lines}L), S2 ({lines}L), S3 ({lines}L), S4 ({lines}L), S5 ({lines}L). Package outputs: pass-1 ({lines}L), pass-2 ({lines}L), pass-3 ({lines}L). Cumulative cost estimate: $11-20.

**DO NOT proceed to Phase 3 until Phase 2 validation passes.**

---

## Phase 3: BUILD (3-Pass Rotation)

**Context recovery:** If context has compressed, re-read `{OUTPUT_DIR}/_pipeline-log.md`. If Phase 2 is marked COMPLETE and Phase 3 is not, you are HERE. Check which pass was last completed by looking for `_build-pass-1.html`, `_build-pass-2.html`, `_build-final.html`.

### Why Rotation

Transformer attention follows a U-shaped curve: primacy (beginning) and recency (end) get disproportionate weight; the middle gets compressed. Rotation ensures EVERY section gets primacy position exactly once by splitting the build into 3 passes, each with a different package file at the top of the context.

### Build Pass 1: STRUCTURE

**Spawn:** One Opus builder.

**Agent receives (include file contents for small files; provide paths for large files):**

In this order (order matters for attention primacy):
1. `{OUTPUT_DIR}/_package-pass-1.md` **(PRIMACY POSITION)** — include full contents in prompt
2. `{CONTENT_PATH}` — provide path for agent to Read
3. `{OUTPUT_DIR}/_tc-brief.md` — provide path for agent to Read
4. `design-system/compositional-core/vocabulary/tokens.css` — include full contents (124 lines)
5. `design-system/compositional-core/components/components.css` — provide path for agent to Read (779 lines)

**Agent does NOT receive:**
- `_package-pass-2.md` or `_package-pass-3.md`
- PA questions, audit criteria, gate thresholds
- Prior build artifacts or fix lists

**Agent prompt (Pass 1 builder instructions):** Read the full prompt from `~/.claude/skills/research-compose/prompts/builder-pass-1-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Agent outputs to:**
- `{OUTPUT_DIR}/_build-pass-1.html`
- `{OUTPUT_DIR}/_pass-1-decisions.md` (~20-30 lines: what was built, which mechanisms deployed, what zones were created)

**Pass 1 Validation (YOU verify):**
1. `_build-pass-1.html` exists and is > 1KB
2. Contains a `<style>` block
3. Contains Google Fonts `<link>` tags
4. No external stylesheet links (must be self-contained)
5. `_pass-1-decisions.md` exists and is > 10 lines

**If validation fails:** Re-spawn the builder with: "The output is missing {specific issue}. The HTML must be self-contained with all CSS inline in a <style> block."

**Section 11 handling:** The builder reads Section 11 as part of the Pass 1 package. If Section 11 contains propositions, the builder decides ADOPT/MODIFY/REJECT per the Standard/Structural Build Path in the builder prompt. The orchestrator does NOT enforce structural adoption — it is the builder's creative decision.

---

### Build Pass 2: ENRICHMENT

**Context recovery reminder:** If context has compressed since Pass 1, re-read `{OUTPUT_DIR}/_pipeline-log.md` and `{OUTPUT_DIR}/_pass-1-decisions.md`.

**Spawn:** One Opus builder (new agent — fresh context).

**Agent receives (in this order):**
1. `{OUTPUT_DIR}/_package-pass-2.md` **(PRIMACY POSITION)** — include full contents in prompt
2. `{OUTPUT_DIR}/_pass-1-decisions.md` — include full contents in prompt
3. `{OUTPUT_DIR}/_build-pass-1.html` — provide path for agent to Read

**Agent does NOT receive:**
- `_package-pass-1.md` or `_package-pass-3.md`
- The TC brief (decisions.md carries what's needed)
- content.md (the HTML already contains the content)

**Agent prompt (Pass 2 builder instructions):** Read the full prompt from `~/.claude/skills/research-compose/prompts/builder-pass-2-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Agent outputs to:**
- `{OUTPUT_DIR}/_build-pass-2.html`
- `{OUTPUT_DIR}/_pass-2-decisions.md` (~20-30 lines: what was enriched, which findings applied, what changed)

**Pass 2 Validation (YOU verify):**
1. `_build-pass-2.html` exists and is > 1KB
2. File is >= size of `_build-pass-1.html` (enrichment should add, not remove)
3. Contains a `<style>` block
4. `_pass-2-decisions.md` exists and is > 10 lines

---

### Build Pass 3: HARDENING

**Context recovery reminder:** If context has compressed since Pass 2, re-read `{OUTPUT_DIR}/_pipeline-log.md`, `{OUTPUT_DIR}/_pass-1-decisions.md`, and `{OUTPUT_DIR}/_pass-2-decisions.md`.

**Spawn:** One Opus builder (new agent — fresh context).

**Agent receives (in this order):**
1. `{OUTPUT_DIR}/_package-pass-3.md` **(PRIMACY POSITION)** — include full contents in prompt
2. `{OUTPUT_DIR}/_pass-1-decisions.md` + `{OUTPUT_DIR}/_pass-2-decisions.md` — include full contents in prompt
3. `{OUTPUT_DIR}/_build-pass-2.html` — provide path for agent to Read

**Agent does NOT receive:**
- `_package-pass-1.md` or `_package-pass-2.md`
- The TC brief
- content.md

**Agent prompt (Pass 3 builder instructions):** Read the full prompt from `~/.claude/skills/research-compose/prompts/builder-pass-3-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Agent outputs to:**
- `{OUTPUT_DIR}/_build-pass-3.html` (hardened HTML, saved as distinct artifact)
- `{OUTPUT_DIR}/_build-final.html` (copy of `_build-pass-3.html` — the deliverable)
- `{OUTPUT_DIR}/_builder-reflection.md` (~40-60 lines — 7 dimensions: conviction fidelity, **questions explored** (v1.1), alternatives considered, surprises, impulses resisted, experience quality, unresolved tensions)

**Pass 3 Validation (YOU verify):**
1. `_build-final.html` exists and is > 1KB
2. Contains a `<style>` block
3. Contains Google Fonts `<link>` tags
4. No external stylesheet links (self-contained)
5. `_builder-reflection.md` exists

**Write Phase 3 checkpoint to `_pipeline-log.md`** using the Layer B template format. Key fields: Agents spawned: 3 (1 per pass). Pass 1/2/Final HTML sizes and CSS line counts. Cumulative cost estimate: $23-38.

**DO NOT proceed to Phase 4 until Phase 3 validation passes.**

---

## Phase 4: EVALUATE (Perceptual Audit)

**Context recovery:** If context has compressed, re-read `{OUTPUT_DIR}/_pipeline-log.md`. If Phase 3 is marked COMPLETE and Phase 4 is not, you are HERE. The page to evaluate is `{OUTPUT_DIR}/_build-final.html`.

### Step 4A: Screenshots (YOU do this)

**Screenshot capture protocol — same as /compose:**

1. Start a local HTTP server:
   ```bash
   # Kill any existing server on port 8080 first
   lsof -ti:8080 | xargs kill -9 2>/dev/null || true
   python3 -m http.server 8080 --directory "{OUTPUT_DIR}" &
   sleep 1
   # Verify server started successfully
   curl -s -o /dev/null -w '%{http_code}' http://localhost:8080/ | grep -q 200 && echo 'Server OK' || echo 'Server FAILED — check port 8080'
   ```
   **IMPORTANT:** Shell variables like `$!` do NOT persist between Bash tool calls. To stop the server later, always use: `lsof -ti:8080 | xargs kill -9 2>/dev/null || true`

2. Use Playwright MCP tools to capture screenshots at 3 viewports:
   - **1440px** (desktop)
   - **1024px** (intermediate)
   - **768px** (tablet)

3. For each viewport:
   a. `browser_resize` to set viewport width and height 900
   b. `browser_navigate` to `http://localhost:8080/_build-final.html`
   c. Wait for fonts: `browser_evaluate` with `() => document.fonts.ready`
   d. Disable animations: `browser_evaluate` with:
      ```javascript
      () => {
        const s = document.createElement('style');
        s.textContent = '*, *::before, *::after { animation: none !important; transition: none !important; opacity: 1 !important; }';
        document.head.appendChild(s);
      }
      ```
   e. Take full-page screenshot: `browser_take_screenshot` with `{type: "png", fullPage: true}`
   f. Take above-the-fold screenshot: `browser_take_screenshot` with `{type: "png"}`

4. Validate screenshots — blank screenshots are a known persistent issue:
   - Check each screenshot file size. Blank/white PNGs are typically < 5KB. Full-page screenshots of styled HTML are > 50KB. If any file is < 10KB, consider it potentially blank.
   - If blank: (a) Kill and restart the HTTP server. (b) Wait 3 seconds. (c) Re-navigate and re-capture. (d) If still blank after 2 retries, STOP and report to user: "Screenshots are blank. Check the HTML for rendering issues."

5. Save to `{OUTPUT_DIR}/_screenshots/` with naming:
   - `1440-full.png`, `1440-fold.png`
   - `1024-full.png`, `1024-fold.png`
   - `768-full.png`, `768-fold.png`

6. Copy to sanitized paths (remove content-identifying information):
   ```
   {OUTPUT_DIR}/_pa/_images/view-a-01.png (1440 full)
   {OUTPUT_DIR}/_pa/_images/view-a-02.png (1440 fold)
   {OUTPUT_DIR}/_pa/_images/view-b-01.png (1024 full)
   {OUTPUT_DIR}/_pa/_images/view-b-02.png (1024 fold)
   {OUTPUT_DIR}/_pa/_images/view-c-01.png (768 full)
   {OUTPUT_DIR}/_pa/_images/view-c-02.png (768 fold)
   ```

7. Stop the HTTP server:
   ```bash
   lsof -ti:8080 | xargs kill -9 2>/dev/null || true
   ```

### Step 4B: Perceptual Audit — Spawn 5 Auditors (PARALLEL)

**Each auditor receives ONLY:**
- The sanitized screenshots (file paths to `{OUTPUT_DIR}/_pa/_images/`)
- A STRIPPED version of the PA skill containing ONLY:
  - The One Rule, Three Laws, Your Role as Auditor
  - Section 0: The Experiential Pass (cold look + scroll-through + anchor)
  - Their assigned questions (NOT all 20)
  - Language Constraint + Metaphor Awareness sections

**Auditor question assignments:**
- Auditor 1: E-01 (first notice), E-05 (breathing), E-11 (fighting content), E-17 (voice), E-21 (layout variety)
- Auditor 2: E-02 (scroll speed), E-08 (attention thirds), E-14 (rhythm), E-18 (best moment)
- Auditor 3: E-03 (character), E-07 (shifting), E-12 (shapes), E-19 (almost working), E-22 (showing vs telling)
- Auditor 4: E-04 (empty space), E-06 (confidence), E-13 (complexity), E-20 (one change)
- Auditor 5: E-09 (form coupling), E-10 (design adds), E-15 (dramatic peak), E-16 (consistency), E-23 (page topology)

**Structural perception questions (added to pool):**
- E-21: "Does every section have the same layout, or do some have different geometry?"
- E-22: "Is there a section that SHOWS what it's about, not just tells?"
- E-23: "If the page were a map, would it be a single road or have intersections and plazas?"

**Each auditor does NOT receive:**
- The conviction brief, mechanism names, metaphor identity
- CSS source, tokens, grammar files, research packages
- Builder reflection or any pipeline context
- The full PA skill (only stripped relevant sections)
- Other auditors' question assignments

**CRITICAL: Fresh-eyes principle.** Zero context = genuine first impressions. If the auditor knows the metaphor, their perception is contaminated.

**Each agent prompt:**

Pass the file path `~/.claude/skills/research-compose/prompts/pa-auditor-prompt.md` to the agent in its task description. The agent reads it via the Read tool. Additionally include: the screenshot paths at `{OUTPUT_DIR}/_pa/_images/`, the output path `{OUTPUT_DIR}/_pa/auditor-{N}.md`, and the 4 assigned questions for this auditor number (from the PA skill's question distribution).

(Also include the stripped PA skill sections from `~/.claude/skills/perceptual-auditing/SKILL.md` for the One Rule, Three Laws, and Experiential Pass protocol.)

**Each agent outputs to:** `{OUTPUT_DIR}/_pa/auditor-{N}.md`

### Step 4C: Weave PA Results

**Spawn:** One Opus agent as the WEAVER.

**Weaver receives (provide file paths):**
- Sanitized screenshots: `{OUTPUT_DIR}/_pa/_images/`
- All 5 auditor reports: `{OUTPUT_DIR}/_pa/auditor-{1-5}.md`
- The Weaver protocol from PA skill: `~/.claude/skills/perceptual-auditing/SKILL.md` (Section: "THE WEAVER: CREATIVE SYNTHESIS")
- The 3 package files for compliance checking:
  - `{OUTPUT_DIR}/_package-pass-1.md`
  - `{OUTPUT_DIR}/_package-pass-2.md`
  - `{OUTPUT_DIR}/_package-pass-3.md`
- The HTML source for CSS-level compliance checks:
  - `{OUTPUT_DIR}/_build-final.html`
- Builder reflection (for Section 10 Assessment only — read AFTER completing experiential Outputs 1-3):
  - `{OUTPUT_DIR}/_builder-reflection.md`
- Builder decisions (for Section 11 Assessment only — read AFTER completing experiential Outputs 1-3):
  - `{OUTPUT_DIR}/_pass-1-decisions.md`

**Weaver does NOT receive:**
- The conviction brief (`_tc-brief.md`) — you must NOT know the metaphor name
- `_pass-2-decisions.md` (Pass 2 decisions are not needed for structural assessment)
- Vocabulary files, tokens, mechanisms, grammar

**NOTE:** The weaver DOES receive `_builder-reflection.md` (for Section 10 Assessment) and `_pass-1-decisions.md` (for Section 11 Assessment) — read BOTH only AFTER completing experiential Outputs 1-3. Do NOT read these files before your anchor impression is formed.

**Weaver prompt:** Pass the file path `~/.claude/skills/research-compose/prompts/weaver-prompt.md` to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context. Also reference the Weaver protocol from `~/.claude/skills/perceptual-auditing/SKILL.md` (Section: THE WEAVER: CREATIVE SYNTHESIS). Write all outputs to `{OUTPUT_DIR}/_pa/synthesis.md`. Include an Agent Log footer.

**Weaver produces 4 outputs (in one file):**
1. **Experience Portrait** — What the page IS (prose, for creators)
2. **Creative Direction** — AMPLIFY / RELEASE / DEEPEN (generative language)
3. **Verdict** — SHIP / REFINE / REBUILD with issue classification (TYPE A mechanical / TYPE B structural / TYPE C compositional)
4. **Package Compliance** — section-by-section: what the package instructed vs what the build did vs gaps identified, with NOVEL/STANDARD compliance tracked separately

**Structural variety assessment:** The weaver includes structural variety metrics in Output 4 (DIVERSE/UNIFORM with sub-metrics: distinct layout count, non-standard section count). If Section 11 was present but all propositions were rejected, the weaver diagnoses whether this was BUILDER DIVERGED (builder had a better idea), PACKAGE UNCLEAR (propositions were too vague to act on), or CONTENT INAPPROPRIATE (content didn't warrant structural variation).

**Weaver outputs to:** `{OUTPUT_DIR}/_pa/synthesis.md`

### Step 4D: Extract Comparison Report (YOU do this — plumbing, not creativity)

The Weaver's Output 4 (Package Compliance) IS the comparison report. Extract it into a standalone file for archival. This is a COPY operation, not a composition — do NOT write your own analysis.

**Extraction method (use Bash — grep for the section header):**

```bash
# Find the line number where Output 4 starts
LINE=$(grep -n "## Output 4: Package Compliance" {OUTPUT_DIR}/_pa/synthesis.md | head -1 | cut -d: -f1)
# Extract from that line to end of file
tail -n +${LINE} {OUTPUT_DIR}/_pa/synthesis.md > {OUTPUT_DIR}/_comparison-report.md
```

**If grep finds nothing** (the Weaver used a slightly different header), try:
```bash
grep -n "Package Compliance" {OUTPUT_DIR}/_pa/synthesis.md
```
Then extract from the matching line.

**Prepend a header** to the comparison report:

```bash
# Read the verdict from Output 3 (it follows "## Output 3: Verdict")
VERDICT_LINE=$(grep -A1 "## Output 3: Verdict" {OUTPUT_DIR}/_pa/synthesis.md | tail -1)
```

The final `_comparison-report.md` should have this structure:
```markdown
# Package → Build Comparison Report
Extracted from: _pa/synthesis.md Output 4
Verdict: {SHIP/REFINE/REBUILD from Output 3}
Date: {ISO date}

{Full Output 4 content}
```

**v1.1 addition:** Also extract the "Channels Coordinated Per Question" summary and the Section 10 Assessment from Output 4 into the comparison report header for quick reference.

**Structural variety section in comparison report:**
- Section 11 propositions: [count] proposed, [count] adopted, [count] visible in final build
- Structural metrics from weaver: DIVERSE/UNIFORM, distinct layout count, non-standard section count
- Comparison to baseline: previous builds had 0 structural variety; target is 1-2 non-standard sections when content warrants

**Write Phase 4 checkpoint to `_pipeline-log.md`** using the Layer B template format. Key fields: Agents spawned: 6 (5 PA auditors + 1 weaver). Verdict: {SHIP/REFINE/REBUILD}. Package compliance: {estimate}%. NOVEL instruction compliance: {N/N}. STANDARD instruction compliance: {N/N}. **Channels coordinated per question: avg {N} across {M} explored questions.** **Questions explored: {M} of {total in Section 10}.** Cumulative cost estimate: $30-51.

**If verdict is SHIP:** Pipeline complete. Skip Phase 5. Report to user.
**If verdict is REBUILD:** Stop and report to user. Explain the compositional issues. Ask whether to restart from Phase 1 with different TC analysis.
**If verdict is REFINE:** Proceed to Phase 5.

---

## Phase 5: REFINE (Fix Cycles)

**Context recovery:** If context has compressed, re-read `{OUTPUT_DIR}/_pipeline-log.md`. If Phase 4 verdict is REFINE and Phase 5 is not marked COMPLETE, you are HERE. Re-read `{OUTPUT_DIR}/_pa/synthesis.md` for the Weaver's creative direction.

### Fix Cycle Protocol

**Maximum 2 fix cycles.** Track by counting `{OUTPUT_DIR}/_fixes/fix-N-feedback.md` files.

**COST WARNING:** Each fix cycle costs ~$8-16 (1 refine builder + 5 PA auditors + 1 weaver for re-evaluation). With 2 cycles, total REFINE cost is $16-32 on top of the base pipeline cost. **Before starting the first fix cycle, report to the user:** "Weaver verdict: REFINE. Each fix cycle costs ~$8-16. Current cumulative cost: $X. Proceed with fix cycle?"

For each fix cycle:

#### Step 5A: Classify Fixes

Read the Weaver's Creative Direction (from `_pa/synthesis.md`). Classify each issue:
- **TYPE A (Mechanical):** CSS value wrong. Builder fixes directly.
- **TYPE B (Structural):** Layout doesn't match conviction brief. Needs zone restructuring.
- **TYPE C (Compositional):** Metaphor doesn't work. Would need TC re-invocation. (If mostly TYPE C, recommend REBUILD to user instead.)

Always try TYPE A first. If 3+ TYPE A fixes target same section, escalate to TYPE B.

#### Step 5B: Route Package Files to Fix Builder

Based on the Weaver's Package Compliance (Output 4), route relevant package files:

| Gap Location | Package File Sent | Rationale |
|-------------|-------------------|-----------|
| Section 0 (Soul) or Section 1 (Context) or Section 2 (Mechanisms) | `_package-pass-1.md` | Foundation gaps |
| Section 3 (Findings) or Section 4 (Zones) or Section 5 (Case Studies) | `_package-pass-2.md` | Enrichment gaps |
| Section 6 (Anti-Patterns) or Section 7 (CSS) or Section 8 (Propositions) | `_package-pass-3.md` | Hardening gaps |

If gaps span multiple packages, send all relevant packages.

#### Step 5C: Spawn Refine Builder

**Spawn:** One Opus builder.

**Agent receives (provide file paths — ORDER MATTERS for attention primacy):**
1. `{OUTPUT_DIR}/_pa/synthesis.md` **(FIRST — creative direction)** — Weaver's AMPLIFY/RELEASE/DEEPEN is the primary guide
2. Relevant package file(s) based on gap routing table above **(SECOND — instructions that were missed)**
3. Specific gap statements extracted from Output 4: "The package instructed X. The build shows Y. Close this gap." **(THIRD — targeted fixes)**
4. `{OUTPUT_DIR}/_builder-reflection.md` **(FOURTH — builder context)**
5. `{OUTPUT_DIR}/_build-final.html` **(LAST — the page to fix. Creative direction first, HTML last.)**

**Agent does NOT receive:**
- The conviction brief directly (it's encoded in the package already)
- Raw specialist outputs
- PA auditor individual reports (Weaver synthesis is sufficient)

**Agent prompt:** Read the full prompt from `~/.claude/skills/research-compose/prompts/refine-builder-prompt.md` and pass the file path to the agent in its task description. The agent reads it via the Read tool — do NOT read the full prompt into your own context.

**Fix feedback phrasing:** Use GENERATIVE language from the Weaver's creative direction: "The opening zone wants more warmth" not "Fix PA-03 score." Feed the Weaver's AMPLIFY/RELEASE/DEEPEN items as creative direction.

**Agent outputs to:**
- `{OUTPUT_DIR}/_fixes/fix-{N}-page.html`
- `{OUTPUT_DIR}/_fixes/fix-{N}-feedback.md` (what was changed and why)

#### Step 5D: Preserve Pre-Fix State and Copy Fixed Page

```bash
# ALWAYS preserve pre-fix state before overwriting
cp {OUTPUT_DIR}/_build-final.html {OUTPUT_DIR}/_fixes/pre-fix-{N}.html
# Then copy the fixed page into place
cp {OUTPUT_DIR}/_fixes/fix-{N}-page.html {OUTPUT_DIR}/_build-final.html
```

This creates a before/after pair for each fix cycle: `pre-fix-{N}.html` (before) and `fix-{N}-page.html` (after). The comparison report can diff these to see exactly what the refine builder changed.

#### Step 5E: Re-Evaluate

Re-capture screenshots and re-run PA. This is a FULL re-evaluation:

1. **Restart HTTP server** (it was killed after Phase 4):
   ```bash
   lsof -ti:8080 | xargs kill -9 2>/dev/null || true
   python3 -m http.server 8080 --directory "{OUTPUT_DIR}" &
   sleep 1
   ```
2. **Re-capture screenshots** at all 3 viewports (same protocol as Step 4A steps 2-6)
3. **Stop HTTP server:** `lsof -ti:8080 | xargs kill -9 2>/dev/null || true`
4. **Spawn 5 fresh PA auditors + 1 weaver** (Steps 4B-4C)
5. **Note: Each re-evaluation costs ~$8-16** (5 PA + 1 weaver + re-screenshots). Report cost to user before proceeding.

If the new verdict is SHIP, pipeline complete.
If the new verdict is REFINE and fix cycle < 2, run another cycle.
If fix cycle >= 2, STOP. Report to user with what's been achieved.

**Write Phase 5 checkpoint to `_pipeline-log.md`** using the Layer B template format. Key fields: Fix cycles completed: {N}. Fix type: {A/B/C}. Re-evaluation verdict: {SHIP/REFINE}. Cumulative cost estimate: ${total}.

---

## Pipeline Complete

When the pipeline completes (SHIP verdict or max cycles), report to user:

```
Pipeline complete.

Page: {OUTPUT_DIR}/_build-final.html
Verdict: {final verdict}
Total phases: {completed phases}
Fix cycles: {N}
Estimated cost: ${total}

Key artifacts:
- Research packages: _package-pass-[1-3].md
- Builder reflection: _builder-reflection.md
- PA synthesis: _pa/synthesis.md
- Comparison report: _comparison-report.md
- Pipeline log: _pipeline-log.md
```

---

## Output Manifest

When complete, `{OUTPUT_DIR}/` contains:

```
{OUTPUT_DIR}/
+-- _build-final.html ............... The designed page (DELIVERABLE)
+-- _tc-brief.md .................... TC conviction brief
+-- _specialist-1-findings.md ....... Raw findings mapping
+-- _specialist-2-validated.md ...... Validated findings mapping
+-- _specialist-3-casestudies.md .... Case study analysis
+-- _specialist-4-constraints.md .... Constraint compilation
+-- _specialist-5-protocol.md ....... Protocol analysis
+-- _package-pass-1.md .............. Research package: Foundations
+-- _package-pass-2.md .............. Research package: Enrichment
+-- _package-pass-3.md .............. Research package: Hardening
+-- _build-pass-1.html .............. Structure pass output
+-- _build-pass-2.html .............. Enrichment pass output
+-- _build-pass-3.html .............. Hardening pass output (pre-copy to _build-final)
+-- _pass-1-decisions.md ............ Pass 1 build decisions
+-- _pass-2-decisions.md ............ Pass 2 build decisions
+-- _builder-reflection.md .......... Builder's 7-dimension reflection
+-- _pipeline-log.md ................ Phase checkpoint reflections
+-- _comparison-report.md ........... Package vs build gap analysis
+-- _screenshots/ ................... Viewport captures
|   +-- 1440-full.png, 1440-fold.png
|   +-- 1024-full.png, 1024-fold.png
|   +-- 768-full.png, 768-fold.png
+-- _pa/ ............................ Perceptual audit
|   +-- _images/ .................... Sanitized screenshots
|   +-- auditor-1.md through auditor-5.md
|   +-- synthesis.md ................ Weaver's verdict + package compliance
+-- _fixes/ ......................... Fix cycle artifacts (if any)
    +-- pre-fix-1.html .............. Pre-fix baseline (copy of _build-final before fix 1)
    +-- fix-1-feedback.md, fix-1-page.html
    +-- pre-fix-2.html .............. Pre-fix baseline (copy of _build-final before fix 2)
    +-- fix-2-feedback.md, fix-2-page.html (if needed)
```

---

## Key Principles

1. **The orchestrator handles plumbing, not creativity.** File loading, agent spawning, screenshots, routing, validation. Never compositional decisions.

2. **Three files, not one.** Research package split into 3 pass-group files. No section parsing by the orchestrator. File-based handoffs only.

3. **Recipe format, not checklist format.** Sequenced verbs (Read -> Deploy -> Verify), not constraints (Must be -> Fail if). Agent-0C's most effective pattern.

4. **Per-build curation, not generic vocabulary.** Every research package is unique to THIS content + THIS metaphor. If a package could apply to any article, it's too generic.

5. **Rotation ensures full consumption.** Each package section gets primacy position exactly once. No section sits in the attention trough.

6. **Diagnostic by design.** The comparison report maps package instructions -> build evidence -> PA confirmation. This shows exactly where knowledge transfer succeeded or failed.

7. **Context management through files.** `_pipeline-log.md` is the orchestrator's external memory. `_pass-N-decisions.md` is the builder's cross-pass continuity. Files survive context compression. If context has compressed at ANY point, re-read `_pipeline-log.md` before proceeding.

8. **Fresh-eyes PA is non-negotiable.** Auditors get zero pipeline context. Weaver gets the package for compliance checking but NOT the conviction brief.

9. **Quality floors, not quality ceilings.** Specialists must produce minimum output. But don't cap creativity — if a specialist finds 40 HIGH findings, let it produce 200 lines.

10. **All Opus, all the time.** Every agent in this pipeline requires deep comprehension and creative judgment. No cost optimization through model downgrading.

11. **Validation gates between EVERY phase.** Never proceed to Phase N+1 until Phase N validation passes. The gates are explicit in each phase section above.

12. **Re-read at every phase boundary.** After any phase completes, if you suspect context may have compressed, re-read `_pipeline-log.md` and the relevant artifacts before proceeding. The output directory is the source of truth, not conversation context.

13. **Instrumentation is diagnostic, not overhead.** Layer A (agent logs) adds ~200 tokens per agent. Layer B (checkpoints) is the orchestrator's memory. Layer C (comparison report) is the pipeline's success metric. All three layers exist to answer: "Where did knowledge transfer succeed or fail?"

---

## Version History

| Version | Date | Key Changes |
|---------|------|-------------|
| v1.0 | 2026-03-01 | Initial release. 5-phase pipeline, 16-17 agents, 14 prompt files. Tested on Molly/Panopticon and Yegge/Gas Town. |
| v1.1 | 2026-03-02 | 31-finding remediation. Added Compositional Questions layer (Section 10), standardized citation format, TC question carry-through, KB question families, count variability, builder question exploration across 3 passes, PA rebalancing, weaver override visibility, pre-fix preservation, $50 hard gate. Core improvement: multi-channel coordination through generative questions. Target: 5-7 channel coordination per compositional idea (up from 3-4 in v1.0). |
| v1.2 | 2026-03-02 | Structural awareness across all 5 phases. TC structural observation check (non-blocking). Section 11 (Structural Propositions) in Pass 1 package. Builder ADOPT/MODIFY/REJECT for structural propositions. PA questions E-21/E-22/E-23 for structural perception. Weaver structural variety metrics (DIVERSE/UNIFORM). Comparison report structural variety section. All structural checks non-blocking — orchestrator enables but does not enforce structural invention. |

## Key Design Decisions

1. **Questions in Pass 1 only (not all 3 passes).** Section 10 lives in `_package-pass-1.md` because question EXPLORATION happens during structure creation. Passes 2-3 DEEPEN and VERIFY question-driven CSS through the decisions.md handoff mechanism. Self-containment preserved: each pass reads the previous pass's decisions file.

2. **3 question sources, not 1.** TC questions (firsthand, content-specific) + KB families (proven, adapted) + cross-specialist synthesis (novel, emergent). This diversity prevents the questions from being a single perspective. TC questions have the highest generative power; KB questions provide vocabulary; cross-specialist questions force novel connections.

3. **Standardized citation format across all builders.** All 6 citation prefixes (`PACKAGE`, `FINDING`, `CASE-STUDY`, `SOUL`, `TC-BRIEF`, `QUESTION`) enable automated comparison report extraction. The weaver can grep for prefixes and count compliance per source category.

4. **$50 hard gate.** Moved from advisory ("PAUSE and report") to mandatory ("MUST get user approval"). Pipeline runs averaging $28-56 need explicit cost governance at the upper range.

5. **Pre-fix preservation.** Every fix cycle creates `pre-fix-{N}.html` before overwriting `_build-final.html`. This enables before/after diffing in the comparison report and prevents losing the fix baseline.

## Prompt File Reference

All agent prompts are stored as separate files for maintainability. When spawning agents, pass the prompt file path to the agent and let it read via the Read tool. Do NOT read prompt files into orchestrator context — this saves context for validation and routing.

**Prompt files are installed at** `~/.claude/skills/research-compose/prompts/` alongside this SKILL.md.

| Agent | Prompt File |
|-------|------------|
| TC Agent | `~/.claude/skills/research-compose/prompts/tc-derivation.md` |
| Specialist 1 | `~/.claude/skills/research-compose/prompts/specialist-1-prompt.md` |
| Specialist 2 | `~/.claude/skills/research-compose/prompts/specialist-2-prompt.md` |
| Specialist 3 | `~/.claude/skills/research-compose/prompts/specialist-3-prompt.md` |
| Specialist 4 | `~/.claude/skills/research-compose/prompts/specialist-4-prompt.md` |
| Specialist 5 | `~/.claude/skills/research-compose/prompts/specialist-5-prompt.md` |
| Synthesizer | `~/.claude/skills/research-compose/prompts/synthesizer-prompt.md` |
| Builder Pass 1 | `~/.claude/skills/research-compose/prompts/builder-pass-1-prompt.md` |
| Builder Pass 2 | `~/.claude/skills/research-compose/prompts/builder-pass-2-prompt.md` |
| Builder Pass 3 | `~/.claude/skills/research-compose/prompts/builder-pass-3-prompt.md` |
| PA Auditor | `~/.claude/skills/research-compose/prompts/pa-auditor-prompt.md` |
| Weaver | `~/.claude/skills/research-compose/prompts/weaver-prompt.md` |
| Refine Builder | `~/.claude/skills/research-compose/prompts/refine-builder-prompt.md` |
