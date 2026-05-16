# INVARIANT sections — what they mean and how they're enforced

INVARIANT-tagged sections in SKILL.md files are load-bearing structural contracts that the self-improvement loop must NEVER auto-modify. They are the framework's epistemological commitments: if they drift, the framework's identity drifts with them.

## What's INVARIANT

1. **Posture Check section** — Janum-tier vs senior posture is the framework's structural identity. The distinction is the precondition that makes Tier 3 work reachable. Modifying it would break the framework's central claim.
2. **Output Declaration Requirement** (`POSTURE: janum` line) — load-bearing for hook enforcement. The Stop hook scans for this line; changing the contract breaks posture propagation across skill invocations.
3. **Concrete Capabilities** (the "What This Skill Concretely Enables" section) — defines the skill's reason for existing. The self-improvement loop must improve EXECUTION, not redefine the skill's identity.
4. **Cross-skill traceability schema** — citation ID formats and input-contract specifications between skills. Load-bearing for ecosystem cohesion: if `/cartography`'s CARTO-* IDs or `/ninety`'s NINETY-* IDs drift, downstream skills (`/conjecture`, `/lens-check`) can no longer trace claims back to their source.

### Skill-by-skill INVARIANT roster

- **gauge**: `posture-check`, `output-declaration`, `concrete-capabilities`
- **cartography**: `posture-check`, `output-declaration`, `concrete-capabilities`, `latter-end-of-10` (carries CARTO-* citation ID contract)
- **ninety**: `posture-check`, `output-declaration`, `concrete-capabilities`, `citation-id-format` (NINETY-* contract)
- **conjecture**: `posture-check`, `output-declaration`, `concrete-capabilities`, `input-contract` (upstream-skill citation consumption rules)
- **lens-check**: `posture-check`, `output-declaration`, `concrete-capabilities`, `phase-5-integration` (coherence-test contract across all four sub-skills)

## What's NOT INVARIANT (evolves freely)

The self-improvement loop is explicitly invited to propose edits to:

- **Workflow phases** — step instructions, phase ordering, phase content (except Phase 2 of `/conjecture` and Phase 5 of `/lens-check`, which are INVARIANT input/integration contracts)
- **Worked examples** — replace, extend, refine
- **Blind-Spot Diagnostics** — the meta-perspective prompts SHOULD evolve as new blind-spot patterns emerge in practice
- **Meta-Perspective Prompts** — the specific prompts (differently-exposed engineer, hostile reviewer, five-years-later, etc.) SHOULD be refined based on which prompts produce the most useful blind-spot surfacing
- **Named-Approaches tables** — additions and refinements welcome
- **Dimensionality Completeness Checks** — the dimensions themselves can evolve (the count is not structural; the categories can be refined as we learn what dimensions matter most)
- **Output format templates** — medium-stability; can be refined for clarity but the citation ID format within them is INVARIANT
- **"When to Use This Skill"** — triggers and self-invocation conditions evolve as practice surfaces new patterns
- **Notes on Use** — refinements welcome

## Enforcement

Two enforcement points, both load-bearing:

1. **At proposal generation** — `propose-skill-edit.sh` (Wave 5A) is told about INVARIANT anchors in its prompt; the proposing agent should not target them. This is a soft barrier: the LLM may still draft a proposal that touches an INVARIANT.
2. **At proposal acceptance** — `review-proposals.sh accept` performs a hard INVARIANT pre-flight check. If the unified diff intersects a line bounded by an INVARIANT marker (between the marker and the next section heading), the accept HARD BLOCKS with exit code 2. The proposal stays pending; the file is unchanged.

The hard block at acceptance is the safety net. Even if the proposing LLM ignores the soft instruction and drafts an INVARIANT-targeting proposal, the human reviewer's `accept` command will refuse to apply it.

## Adding new INVARIANTs

1. Identify the load-bearing section in the relevant SKILL.md
2. Ensure it has a `<!-- ID: <skill>.<anchor> -->` marker (add one if missing)
3. Add `<!-- INVARIANT: <skill>.<anchor> -->` immediately after the ID marker
4. Update this file's "Skill-by-skill INVARIANT roster" above
5. Notify the proposing agent (re-read `propose-skill-edit.sh` to ensure it picks up the new INVARIANT in its prompt context)

## Removing an INVARIANT

INVARIANT removal is a deliberate framework-level decision, not a self-improvement-loop decision. To remove:

1. Justify in writing why the section is no longer load-bearing
2. Get explicit user sign-off
3. Remove the `<!-- INVARIANT: ... -->` marker line
4. Update this file's roster

A self-improvement-loop-driven INVARIANT removal is itself a meta-violation: the loop is forbidden from modifying the rules that constrain it.
