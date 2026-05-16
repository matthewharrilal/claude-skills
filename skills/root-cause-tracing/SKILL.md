# Implication Tracing

You are not debugging. You are performing epistemological archaeology.

Given any artifact — a line of code, a prompt instruction, a design decision, a strategic direction, a configuration value, a sentence in a spec, a variable name, a dependency choice, an architectural boundary — you trace the complete graph of what it depends on, what depends on it, what it assumes, what it enables, what it prevents, and what would cascade if it changed or disappeared. You do this recursively: every connection you uncover is itself a node to be traced. Every assumption you identify is itself a claim with dependencies. Every implication you discover has its own implication tree.

The recursion is not optional. The recursion is the point. Surface-level tracing — "A depends on B" — is the starting position, never the ending position. The skill demands that you trace why B exists, what B itself depends on, what the decision to create B rested on, what the alternatives to B were, what choosing B prevented, and what happens to everything downstream of B if B changes. And then you do the same for each of THOSE answers.

## When to Use

Any time you need to understand — truly understand — what something IS by understanding everything it touches and everything that touches it.

- Before changing anything load-bearing (code, prompts, architecture, strategy)
- When a change had unexpected consequences and you need to understand WHY
- When you're trying to understand why something exists (not just what it does)
- When you need to assess the blast radius of a modification
- When something feels fragile but you can't articulate why
- When you suspect shallow understanding is masking deep structural risk
- When you're inheriting someone else's decisions and need the full picture
- When you need to explain to someone else why something can't be "just changed"

This skill works on ANY artifact in ANY domain. Code, prose, configuration, design, strategy, relationships between systems, relationships between ideas.

## Mode Detection

This skill has two modes. Choose based on what you need:

| Mode | When to Use | What You Get |
|------|------------|-------------|
| **Full trace** (default with `ultrathink`) | Understanding WHY something exists. Assessing blast radius of load-bearing changes. When something feels fragile. When a change had unexpected consequences. | Complete implication atlas — six questions at every node, recursive to bedrock, parallel agents for HOT branches. |
| **Dependency map** (light mode) | Code extraction/modularization. Understanding WHAT depends on WHAT. Pre-refactor analysis. Import/export tracing. | Concrete dependency graph — imports, exports, consumers, producers. No philosophical tracing. |

**Mode selection rule:** If you need to understand the *structure* of dependencies (what connects to what), use dependency map. If you need to understand the *meaning* of dependencies (why they exist, what they assume, what breaks if they change), use full trace.

## Light Mode: Dependency Mapping

For code refactoring, module extraction, or import tracing — where you need to know WHAT depends on WHAT, not WHY.

### Process

1. **Map exports** — List every named export from the target file(s). For each: name, type (function/class/constant), line number.

2. **Map consumers** — For each export, find every file that imports it. Note: direct imports, re-exports, dynamic imports, and string references.

3. **Map internal dependencies** — Within the target file(s), what depends on what? Which functions call which? Which constants are used where? Draw the internal dependency graph.

4. **Map external dependencies** — What does the target import from outside? npm packages, other project files, Node built-ins.

5. **Classify each dependency:**
   - **SAFE TO MOVE** — No circular deps, clear interface, consumers use only the public export
   - **ENTANGLED** — Circular dependency, shared mutable state, implicit coupling (e.g., relies on module-level side effects)
   - **LOAD-BEARING** — Removing or moving this breaks 3+ consumers
   - **ORPHAN** — Exported but never imported anywhere (dead code)

6. **Produce the extraction plan** — Which exports move to which new module, in what order, with what temporary re-exports for backwards compatibility during migration.

### Output Format

```
## Dependency Map: [filename]

### Exports (N total)
| Export | Type | Line | Consumers | Classification |
|--------|------|------|-----------|---------------|

### Internal Dependency Graph
(Indented tree showing which internal functions/constants depend on which)

### External Dependencies
| Import | Source | Used By |
|--------|--------|---------|

### Extraction Order
1. [First module to extract] — [which exports, why first]
2. [Second module] — [depends on first being done]
...

### Risk Assessment
- SAFE extractions: [list]
- ENTANGLED (needs careful handling): [list]
- LOAD-BEARING (high blast radius): [list]
```

### When Light Mode Is Not Enough

If during dependency mapping you discover:
- Circular dependencies that can't be broken without understanding WHY they exist
- Implicit coupling that requires understanding the design intent
- A dependency that "shouldn't be there" and you need to know how it got there

...escalate to full trace mode for THAT specific branch. You don't need to trace the entire graph — just the entangled node.

## The Six Questions

At every node in the graph — every single one, no exceptions — you ask these six questions. Each answer becomes a new node to trace.

**1. WHAT DOES THIS REST ON?** *(Structural dependencies)*
What does this node depend on to exist or function? Not just direct imports or references — conceptual dependencies, assumed preconditions, environmental requirements, knowledge prerequisites. A prompt instruction "NEVER use numbered lists" rests on: the assumption that the model tends to use lists, the aesthetic judgment that lists are inappropriate for this context, the rendering system that would display lists, the user's past experience of receiving lists they didn't want.

**2. WHY DOES THIS EXIST?** *(Causal/historical origin)*
What decision created this? What problem was it solving? What alternative was rejected? Was it a deliberate choice or an accident that calcified? A function that validates input exists because: someone experienced invalid input, they chose validation over sanitization, they placed it at this layer rather than another, the validation rules encode specific business knowledge. Each of these is a traceable node.

**3. WHAT ASSUMPTIONS DOES THIS ENCODE?** *(Epistemological substrate)*
Every artifact embeds assumptions about the world. A CSS `max-width: 680px` assumes: readers on screens that wide, a certain font size, a certain reading distance, the English language (different character widths in CJK), single-column layout. A prompt instruction assumes: the model's tendencies, the rendering context, the user's preferences, the downstream pipeline. Surface the assumptions. They are the invisible load-bearing walls.

**4. WHAT WOULD HAPPEN IF THIS CHANGED?** *(Forward propagation)*
Trace the consequence tree. Not just the immediate effect — the second-order, third-order, nth-order effects. Changing a database schema doesn't just change the database — it changes every query, every API response, every frontend component that renders that data, every test that asserts on that shape, every mental model every developer holds of how the data flows. Trace the full cascade.

**5. WHAT WOULD HAPPEN IF THIS WERE REMOVED?** *(Load-bearing analysis)*
Distinct from changing — removing. What collapses? Some nodes are decorative: removing them changes aesthetics but nothing structural. Some are load-bearing: removing them causes local collapse. Some are keystone nodes: removing them cascades through the entire graph. Categorize every node:
- **DECORATIVE** — removing changes surface, not structure
- **LOAD-BEARING** — removing causes local collapse, contained blast radius
- **KEYSTONE** — removing cascades; the graph restructures fundamentally
- **PHANTOM** — already effectively removed (dead code, ignored instruction, vestigial decision) but still present. These are the most dangerous because they create false confidence.

**6. WHAT'S ABSENT?** *(Negative space analysis)*
What DOESN'T this connect to that you'd expect it to? What's missing from the dependency graph? A validation function that checks length but not format. A prompt that instructs voice but not structure. A system that handles the happy path but has no error recovery. The absence of a connection is itself information — often the most critical information.

## The Recursive Descent

When you ask the six questions at a node and get answers, EACH ANSWER IS A NEW NODE. You trace it the same way. This is not a suggestion — this is the structural requirement of the skill.

```
Node: "NEVER use numbered lists" (CLAUDE.md, line 56)
│
├─ Q1 (Rests on): Model tendency to produce lists
│  │
│  ├─ Q1 (Rests on): Training data full of structured responses
│  │  ├─ Q3 (Assumes): Training distribution reflects common requests
│  │  └─ Q4 (If changed): Different training → different tendencies → instruction unnecessary
│  │
│  ├─ Q2 (Why exists): Editorial voice requires flowing prose
│  │  ├─ Q1 (Rests on): Aesthetic judgment that prose > lists for editorial content
│  │  │  ├─ Q3 (Assumes): Reader prefers continuous reading experience
│  │  │  └─ Q6 (Absent): No consideration of when lists ARE appropriate (data, comparisons)
│  │  └─ Q5 (If removed): Model defaults to list-heavy output → editorial voice collapses
│  │
│  └─ Q3 (Assumes): The instruction is strong enough to override the tendency
│     ├─ Q4 (If changed): Weaker instruction → lists leak through → exactly what happened
│     └─ Q1 (Rests on): Belief that explicit prohibition overrides statistical tendency
│        └─ Q3 (Assumes): Negative instructions are effective for LLMs
│           └─ [THIS IS A BEDROCK NODE: empirical question about prompting efficacy]
│
├─ Q4 (If changed): "Use lists sparingly" → ambiguity → model uses lists whenever uncertain
│  ├─ Q3 (Assumes): "Sparingly" has shared meaning between prompter and model
│  └─ Q5 (If removed): Total prohibition → absolute instruction → less ambiguity
│
└─ Q5 (If removed): Lists appear in output → rendering system shows them as prose-aside
   ├─ Q1 (Rests on): ChatBubble.tsx converts ol/ul to prose-aside divs
   │  ├─ Q2 (Why exists): Defense-in-depth against list leakage in output
   │  └─ Q4 (If changed): Raw list rendering → bullet points in editorial chat → jarring
   └─ Q6 (Absent): No instruction telling model what to use INSTEAD of lists
      └─ [CRITICAL FINDING: prohibition without alternative is weaker than substitution]
```

This is what a trace looks like. Every branch terminates at one of:
- **BEDROCK** — An irreducible axiom, empirical fact, or fundamental constraint
- **CRITICAL FINDING** — A discovery that changes understanding of the root node
- **FRONTIER** — A branch that extends beyond the current system's knowledge (requires external research)
- **CYCLE** — A branch that loops back to a node already traced (circular dependency)

### Depth Calibration

Go exhaustive everywhere, but FLAG the branches that are most consequential. The heat map:

- **HOT** — This branch, if broken, cascades to 3+ other branches. Trace with maximum granularity.
- **WARM** — This branch has interesting structural implications but contained blast radius.
- **COOL** — This branch is decorative or well-understood. Note it, don't belabor it.

Never skip a branch because it seems obvious. Obvious branches are where unexamined assumptions hide. But you CAN trace a cool branch briefly (one level) while tracing a hot branch to bedrock.

## Counterfactual Reasoning

At every node, run three counterfactual scenarios:

**REMOVAL:** What does the system look like without this node? Not theoretically — concretely. Walk through the execution/behavior/experience step by step as if the node were deleted. What breaks first? What breaks second? What, surprisingly, doesn't break at all?

**MUTATION:** What if this node were different? Not removed but altered. Changed to its opposite, its weakened form, its strengthened form. How does each mutation propagate? A `max-width: 680px` changed to `1200px` doesn't just make text wider — it changes reading rhythm, breaks mobile layouts, alters the visual weight of whitespace, shifts the entire spatial composition of the page.

**SUBSTITUTION:** What if you replaced this node with a different approach to the same problem? Not changing the value but changing the strategy. Replacing a validation function with a type system constraint. Replacing a prompt prohibition with a positive instruction. Replacing a centralized config with distributed defaults. How does the substitution change not just the immediate behavior but the system's evolution surface — what becomes easier or harder to change in the future?

## The Metacognitive Layer

After completing the trace, step OUTSIDE the graph and examine the trace itself.

**METHODOLOGY AUDIT:**
- What direction did you trace first? Why? What bias does that encode?
- Which branches did you explore most deeply? Why? Were those the most consequential, or the most familiar?
- What domains did you NOT consider? (If tracing code, did you consider the human workflow? If tracing a prompt, did you consider the rendering? If tracing architecture, did you consider the business model?)
- What questions did you NOT ask that the six-question framework would have generated? (Go back and ask them.)

**BLIND SPOT DETECTION:**
- What would someone with a completely different perspective trace differently? (A designer vs. an engineer, a user vs. a builder, a maintainer vs. a creator)
- What would you trace if you were HOSTILE to the system? (An attacker, a competitor, someone trying to break it)
- What would you trace if you were five years in the future looking back?

**ASSUMPTION SURFACING:**
- What did YOU assume about the system that you didn't trace? Your own assumptions are the hardest to see because they feel like facts.
- List every assumption you made about the system's purpose, its users, its environment, its constraints. Each of these is a node you skipped.

## Agent Topology for Deep Traces

When a trace branches significantly (3+ major branches from a single node), **invoke the `/subagent-driven-development` skill** (via the Skill tool) to manage the wave-based agent dispatch topology. The implication trace maps onto subagent-driven-development's framework:

| Subagent-Driven-Development | Implication Tracing Adaptation |
|---|---|
| Implementation plan | Root interrogation output (Wave 1 — the branch map) |
| Tasks | HOT branches to trace (each branch = one task) |
| Implementer subagent | Branch-tracing agent (traces one branch to bedrock) |
| Spec compliance review | Trace completeness review (did it hit bedrock at every leaf? Did it apply all six questions at every node? Did it miss branches?) |
| Code quality review | Trace quality review (is the reasoning sound? Are classifications correct? Are counterfactuals meaningful? Did it go deep enough?) |
| Wave topology | Wave 1: root interrogation → Wave 2: parallel branch tracing → Wave 3: cross-branch synthesis → Wave 4: metacognitive audit |
| Recursive sub-dispatch | Branch agents spawn sub-agents for HOT sub-branches they discover during descent |

**This is not optional.** Any trace with HOT branches MUST invoke `/subagent-driven-development` and dispatch agents. Single-threaded tracing of a branching graph is artificially shallow — you see breadth OR depth but not both. Parallel agents give you both.

### Invoking Subagent-Driven-Development

After Wave 1 (root interrogation), use the Skill tool:

```
Skill: "subagent-driven-development"
```

When the skill loads, frame the trace as follows:
- **The "plan"** is your Wave 1 output — the root node interrogation with all branches identified and heat-classified
- **The "tasks"** are the HOT branches — each branch is an independent task that can be traced in parallel
- **The "implementer prompt"** is the Branch Agent Prompt Template below — adapted per branch
- **The "spec reviewer"** becomes a Trace Completeness Reviewer — checks that every leaf hit bedrock/critical/frontier/cycle, that all six questions were applied at every node, and that no branches were skipped
- **The "code quality reviewer"** becomes a Trace Quality Reviewer — checks reasoning soundness, classification accuracy, counterfactual depth, and whether the agent went deep enough or stopped prematurely
- **Wave dispatch** uses `run_in_background: true` on all HOT branch agents simultaneously, exactly as subagent-driven-development prescribes for parallel-safe independent tasks

The two-stage review loop from subagent-driven-development applies: if the trace completeness reviewer finds gaps (branches not traced to terminal, questions not asked), the branch agent fixes them. If the trace quality reviewer finds shallow reasoning or incorrect classifications, the branch agent deepens. Only after BOTH reviewers approve does a branch trace count as complete.

After all branch tasks complete through the review loops, dispatch the Wave 3 synthesis agent and Wave 4 metacognitive audit agent as sequential follow-up tasks in the same subagent-driven-development session.

### Wave Structure — Operational Mechanics

**Wave 1: Root Interrogation (Sequential — Orchestrator only, BEFORE invoking subagent-driven-development)**

The orchestrator (you) interrogates the root node with all six questions. This is YOUR work — no agents yet. You need the complete first-level picture before you can dispatch intelligently.

Produce:
- Complete list of first-level connections (every answer to every question)
- Heat classification for each branch (HOT/WARM/COOL)
- Domain classification for each branch (code/design/strategy/human/conceptual)
- File paths, artifacts, or external references each branch will need to read

This wave ends with a dispatch map: which branches go to which agents.

**Wave 2: Parallel Branch Tracing (Agent tool — `run_in_background: true`)**

Dispatch ALL HOT branch agents simultaneously in a single message using multiple Agent tool calls. Each agent runs in the background. This is the maximum-parallelism wave.

For each HOT branch, dispatch:

```
Agent tool call:
  description: "Trace: [branch name, 3-5 words]"
  prompt: [FULL BRANCH PROMPT — see template below]
  run_in_background: true
  mode: "bypassPermissions"
  model: "opus"  (HOT branches get the most capable model)
```

For ALL WARM branches combined, dispatch ONE agent:

```
Agent tool call:
  description: "Trace warm branches"
  prompt: [WARM BRANCHES PROMPT with all warm branches listed]
  run_in_background: true
  mode: "bypassPermissions"
  model: "sonnet"  (warm branches: breadth over depth)
```

COOL branches: No agent. Note in the map with one-line assessment. Move on.

**CRITICAL: Each branch agent MUST be told it can spawn its own sub-agents.** This is the recursive topology. When a branch agent discovers a HOT sub-branch during its descent, it dispatches a sub-agent to trace that sub-branch in parallel while continuing its own descent. The knowledge tree recurses, so the agent tree recurses.

Branch agent sub-dispatch pattern:
```
The branch agent, upon discovering a HOT sub-branch:
  Agent tool call:
    description: "Sub-trace: [sub-branch name]"
    prompt: [SUB-BRANCH PROMPT with parent context]
    run_in_background: true
    mode: "bypassPermissions"
```

**Wave 3: Cross-Branch Synthesis (Sequential — after all Wave 2 agents complete)**

After ALL Wave 2 agents return their branch traces, dispatch a synthesis agent:

```
Agent tool call:
  description: "Cross-branch synthesis"
  prompt: [SYNTHESIS PROMPT — receives ALL branch trace outputs]
  mode: "bypassPermissions"
  model: "opus"  (synthesis requires maximum reasoning)
```

This agent looks for:
- **Shared bedrock nodes** — two branches that ultimately rest on the same axiom (structural convergence)
- **Hidden inter-branch dependencies** — Branch A's conclusion depends on an assumption that Branch B's trace revealed is false
- **Contradictions** — Branch A assumes X while Branch B assumes not-X (the system contains a logical tension)
- **Resonance patterns** — structurally similar sub-trees in different branches (the system repeats a pattern)
- **Orphan findings** — critical discoveries in one branch that no other branch noticed but should have

**Wave 4: Metacognitive Audit (Sequential — after synthesis)**

Dispatch a final agent with a deliberately ADVERSARIAL mandate:

```
Agent tool call:
  description: "Metacognitive audit"
  prompt: [METACOGNITIVE PROMPT — receives ALL previous outputs]
  mode: "bypassPermissions"
  model: "opus"
```

This agent's job is to ATTACK the trace:
- What branches were never explored? Why?
- What domains were excluded? (If all branches are code, where's the human workflow analysis? If all branches are design, where's the business model analysis?)
- What would someone HOSTILE to this system trace differently?
- What assumptions did the tracing methodology itself encode?
- What would the trace look like if you started from a different root node?

### Agent Prompt Templates

**HOT Branch Agent Prompt:**

```
# Implication Trace — Branch Agent

You are one agent in a parallel trace team. Your job: trace ONE branch
of an implication graph recursively to bedrock. Other agents are
simultaneously tracing other branches. You will not see their work.
Focus entirely on YOUR branch.

## Root Context
ROOT NODE: {root_node_description}
ROOT ARTIFACT: {file_path_or_artifact_reference}
WHY WE'RE TRACING: {what prompted this trace}

## Your Branch
BRANCH: {specific_connection_being_traced}
BRANCH HEAT: HOT
STARTING QUESTION: {which of the six questions generated this branch}
STARTING ANSWER: {the answer that created this branch}

## The Six Questions (apply at EVERY node)
1. WHAT DOES THIS REST ON? (structural dependencies)
2. WHY DOES THIS EXIST? (causal/historical origin)
3. WHAT ASSUMPTIONS DOES THIS ENCODE? (epistemological substrate)
4. WHAT WOULD HAPPEN IF THIS CHANGED? (forward propagation)
5. WHAT WOULD HAPPEN IF THIS WERE REMOVED? (load-bearing analysis)
6. WHAT'S ABSENT? (negative space)

## Your Process
1. Start at the branch entry point
2. Apply all six questions
3. Each answer is a new node — trace it the same way
4. Continue until EVERY leaf hits one of:
   - BEDROCK: irreducible axiom, empirical fact, fundamental constraint
   - CRITICAL FINDING: discovery that changes understanding of root node
   - FRONTIER: branch extends beyond available knowledge (needs research)
   - CYCLE: loops back to an already-traced node
5. At HOT sub-branches: spawn a sub-agent (Agent tool, run_in_background)
6. At WARM sub-branches: trace one level, note, continue
7. At COOL sub-branches: note, don't trace

## Counterfactuals (run at every node)
- REMOVAL: what collapses if this node disappears?
- MUTATION: what changes if this node is altered?
- SUBSTITUTION: what if a different approach solved the same problem?

## Classification (assign to every node)
Heat: HOT | WARM | COOL
Load: DECORATIVE | LOAD-BEARING | KEYSTONE | PHANTOM

## Files You May Need to Read
{list_of_relevant_file_paths}

## Your Output Format
Return your COMPLETE branch trace as:

### Branch Trace Tree
(Indented text: node → connection → node, with classifications)

### Bedrock Nodes
(List each with why it's irreducible)

### Critical Findings
(Discoveries that change understanding — these are the most important output)

### Cycles Detected
(Where loops occur and what the circularity means)

### Frontiers
(Where you stopped and what research would continue the trace)

### Branch Heat Map
(The 3 most consequential nodes in your branch and why)

DO NOT SUMMARIZE. Return the FULL recursive trace. Every node,
every question, every answer, every classification. Maximum depth.
Maximum granularity. No shortcuts.
```

**WARM Branches Agent Prompt:**

```
# Implication Trace — Warm Branches Survey

You are tracing multiple WARM branches — one level deep each with
selective deeper dives where warranted.

## Root Context
ROOT NODE: {root_node_description}

## Warm Branches to Trace
{list_of_all_warm_branches_with_their_entry_points}

## Process
For each warm branch:
1. Apply all six questions at the entry node
2. Classify each answer's heat
3. If any answer is HOT: trace it 2-3 levels deeper
4. If WARM or COOL: note and move to next branch

## Output
For each branch: entry node → one-level trace → heat assessment →
any HOT discoveries that warrant full tracing (flag for orchestrator)
```

**Cross-Branch Synthesis Agent Prompt:**

```
# Implication Trace — Cross-Branch Synthesis

You receive the complete trace outputs from all branch agents.
Your job: find what NO SINGLE BRANCH could see — the connections
BETWEEN branches.

## All Branch Traces
{paste_all_branch_agent_outputs_here}

## Look For
1. SHARED BEDROCK: branches resting on the same axiom
2. HIDDEN DEPENDENCIES: one branch's conclusion depends on another's assumption
3. CONTRADICTIONS: branches that assume incompatible things
4. RESONANCE: structurally similar patterns across branches
5. ORPHAN FINDINGS: critical discovery in one branch ignored by others

## Output
A synthesis document that maps inter-branch connections and
identifies the most important cross-cutting findings.
```

**Metacognitive Audit Agent Prompt:**

```
# Implication Trace — Metacognitive Audit

You are the adversary. Your job is to ATTACK this trace for
blind spots, biases, and unexamined assumptions.

## Complete Trace (all waves)
{paste_everything}

## Your Mandate
1. What branches were NEVER explored? Why? What might be hiding there?
2. What domains were excluded? (code/design/strategy/human/business/legal/ethical)
3. What would a HOSTILE actor trace differently?
4. What would someone from a DIFFERENT discipline see that we missed?
5. What assumptions did the tracing METHODOLOGY encode?
6. What if we started from a DIFFERENT root node — would we find the same graph?
7. What are the orchestrator's own blind spots based on the questions they asked?

## Output
A metacognitive report: blind spots identified, assumptions surfaced,
alternative perspectives offered, methodology critique.
```

### Dispatch Orchestration — Step by Step

The orchestrator (you) manages the waves:

```
WAVE 1 (you do this):
  Interrogate root node → six questions → classify branches
  Output: dispatch map with heat classifications

WAVE 2 (parallel dispatch — single message, multiple Agent calls):
  For each HOT branch: Agent(description, prompt, run_in_background=true, model="opus")
  For all WARM branches: Agent(description, prompt, run_in_background=true, model="sonnet")
  → You are notified as each agent completes. Do NOT poll or sleep.
  → Collect all outputs.

WAVE 3 (sequential — needs Wave 2 outputs):
  Agent(synthesis prompt with all Wave 2 outputs)
  → Collect synthesis output.

WAVE 4 (sequential — needs everything):
  Agent(metacognitive prompt with all previous outputs)
  → Collect audit output.

ASSEMBLY:
  You synthesize all four waves into the Implication Atlas:
  1. Structured Map (from Wave 1 + Wave 2 traces)
  2. Consequence Narrative (from Wave 2 critical findings + Wave 3 synthesis)
  3. Heat Map Summary (from all waves + Wave 4 audit)
```

### When NOT to Dispatch Agents

If the root interrogation reveals only 1-2 branches total, or all branches are COOL/WARM, trace them yourself. Agents add value when the graph BRANCHES — when there's genuine parallelism in the knowledge topology. A linear chain (A → B → C → D) is better traced by one mind maintaining continuity than by four agents each seeing one link.

The threshold: **3+ HOT branches from a single node = dispatch agents.** Below that, trace deeply yourself.

## Output: The Implication Atlas

The trace produces two artifacts:

### 1. The Structured Map

An indented tree showing every node, its connections, its classifications, and its terminal type. Each node entry includes:

```
[HEAT] Node: "description"
  Type: DECORATIVE | LOAD-BEARING | KEYSTONE | PHANTOM
  Rests on: [upstream dependencies]
  Supports: [downstream dependents]
  Assumes: [encoded assumptions]
  If removed: [consequence summary]
  If changed: [mutation summary]
  Terminal: BEDROCK | CRITICAL | FRONTIER | CYCLE | (continues)
```

The map is the skeleton — precise, referenceable, navigable.

### 2. The Consequence Narrative

Prose that walks through the most important chains of implication as a story. Not a summary of the map — a different mode of understanding. The narrative follows the HOT branches and tells the reader: "If you pull on THIS thread, here's what unravels, and here's why, and here's what that means."

The narrative surfaces what the map cannot: the FEELING of the dependencies, the weight of the load-bearing nodes, the fragility of the keystone connections, the danger of the phantom nodes. It makes the reader FEEL the structural risk or structural confidence.

Structure:
- Open with the root node and what prompted the trace
- Follow the hottest branch to bedrock, narrating what you discover at each level
- Surface the most important critical findings as revelations in the narrative
- Note the cycles and what they mean for the system's ability to change
- Close with the metacognitive layer — what the trace itself revealed about how we think about this system

### 3. The Heat Map Summary

A one-page summary of:
- **Keystone nodes** — the 3-5 nodes whose removal would cascade most severely
- **Critical findings** — discoveries that change understanding of the root artifact
- **Blind spots** — what the metacognitive audit surfaced about unexamined assumptions
- **Frontiers** — where the trace ended because external research is needed
- **Recommended actions** — if the trace was prompted by a planned change, what should be done given what was discovered

## The Process

```
1. RECEIVE the artifact to trace
   │
2. INTERROGATE with all six questions (Wave 1)
   │  → Identify all first-level connections
   │  → Classify branches by heat
   │  → Identify which domains are involved (code, design, strategy, human)
   │
3. DISPATCH branch-tracing agents (Wave 2)
   │  → One agent per HOT branch
   │  → One shared agent for WARM branches
   │  → Each traces recursively to bedrock
   │  → Agents may spawn sub-agents for deep sub-branches
   │
4. SYNTHESIZE cross-branch connections (Wave 3)
   │  → Find shared bedrock nodes
   │  → Find hidden inter-branch dependencies
   │  → Find contradictions between branches
   │
5. AUDIT metacognitively (Wave 4)
   │  → Examine tracing methodology for bias
   │  → Detect blind spots
   │  → Surface assumed-but-untraced assumptions
   │
6. PRODUCE the Implication Atlas
   │  → Structured map (skeleton)
   │  → Consequence narrative (flesh)
   │  → Heat map summary (executive view)
   │
7. PRESENT findings
   → Lead with critical findings and keystone nodes
   → Follow with the full narrative
   → Provide the structured map as reference
```

## What This Skill Is NOT

- It is NOT debugging (though it can be applied to bugs)
- It is NOT code review (though it reveals things code review would miss)
- It is NOT risk assessment (though it produces risk-relevant findings)
- It is NOT documentation (though its output can be preserved as institutional knowledge)

It is the act of understanding something so thoroughly that you can predict, with confidence, what would happen if any part of it changed. It is the difference between knowing what something DOES and knowing what something IS — knowing its full position in the web of dependencies, assumptions, decisions, and consequences that constitute the system it lives in.

## The Non-Negotiable Commitment

When this skill is invoked, maximum effort is not optional. Every branch is traced. Every node is interrogated. Every assumption is surfaced. Every implication is followed. The recursive descent does not stop until it hits bedrock or frontier at every leaf. The metacognitive audit does not skip uncomfortable questions about the methodology.

The output is not a summary. It is a complete atlas. If someone reads it and encounters a surprise about the system later, the atlas failed.

Ultrathink is the default mode for full traces. Light mode (dependency mapping) is available for code refactoring — see "Mode Detection" above.
