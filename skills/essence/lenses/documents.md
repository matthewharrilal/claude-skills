# Document Analysis Lenses

Apply these lenses AFTER the five universal lenses when the content is documents, research papers, articles, frameworks, manifestos, or any prose-based content.

---

## Citation Archaeology

### Purpose
Citations reveal intellectual lineage, allegiances, and boundaries. Who you cite tells the world who you think you're in conversation with. Who you don't cite tells us who you're ignoring or opposing.

### Extraction Prompts

#### Approved Ancestors
- Who is cited APPROVINGLY? (intellectual ancestors)
- What authorities are deferred to?
- What tradition is being claimed?
- These are the giants whose shoulders this stands on.

#### Criticized Sources
- Who is cited CRITICALLY? (intellectual enemies)
- Who is argued against explicitly?
- What positions are attacked?
- Critics often reveal identity through opposition.

#### Conspicuous Absences
- Who is conspicuously NOT cited that you'd expect?
- Is this ignorance or deliberate exclusion?
- Absences can be louder than presences.
- What major voices in this space are missing?

#### Citation Patterns
- What's the citation density? (Heavy academic signaling vs. minimal references)
- What's the ratio of foundational vs. contemporary sources?
- Are there self-citations? (Empire-building or genuine continuity)
- Cross-disciplinary citations? (Synthesizing approach)

### Citation Signals

| Pattern | Interpretation |
|---------|---------------|
| Heavy foundational | Grounding in tradition, establishing legitimacy |
| Heavy contemporary | Engaging current discourse, positioning in debate |
| Cross-disciplinary | Synthesizing approach, boundary-crossing |
| Single-discipline | Depth over breadth, insider orientation |
| Minimal citations | Confidence, independence, or ignorance |
| Self-citation heavy | Empire-building, unified body of work |

### Output Format

```
CITATION ARCHAEOLOGY:

Intellectual ancestors (cited approvingly):
- [source 1]: role in this work
- [source 2]: role in this work

Intellectual enemies (cited critically):
- [source 1]: what's attacked
- [source 2]: what's attacked

Conspicuous absences (expected but missing):
- [source 1]: why notable absence
- [source 2]: why notable absence

Citation pattern:
- Density: [heavy/moderate/light]
- Temporal focus: [foundational/contemporary/mixed]
- Disciplinary scope: [single/cross-disciplinary]

Lineage signal:
[What tradition does this claim membership in? What conversation is it joining?]
```

---

## Terminology Archaeology

### Purpose
Coined terms and word choices reveal conceptual boundaries. New words create new thought spaces. Rejected words reveal what's being distanced from. Jargon density signals who's meant to understand.

### Extraction Prompts

#### Coined Terms
- What terms are COINED or REDEFINED?
- Every new term is a claim that existing words were inadequate.
- What gap did this term fill? Why was it needed?
- Neologisms reveal where the author is claiming new conceptual territory.

#### Rejected Terms
- What standard terms are EXPLICITLY REJECTED?
- "I don't call it X, I call it Y because..."
- Rejection of terminology is rejection of framing.
- What worldview is being distanced from?

#### Jargon Analysis
- What's the jargon density?
  - High: Writing for insiders, assuming shared vocabulary
  - Low: Writing for accessibility, building from common ground
- What does jargon use reveal about intended audience?

#### Embedded Metaphors
- What metaphors are embedded IN terminology?
- Terms like "attack surface," "technical debt," "pipeline" carry metaphors.
- What worldview does the terminology assume?

#### Definition Strategy
- What's DEFINED explicitly early on?
- What's ASSUMED known without definition?
- The definition/assumption boundary reveals expected reader sophistication.

### Terminology Signals

| Pattern | Interpretation |
|---------|---------------|
| Heavy coining | Creating new conceptual space |
| Standard terms | Working within established paradigm |
| Jargon-heavy | Writing for insiders |
| Plain language | Writing for accessibility |
| Early definition | Expects outside readers |
| Assumption-heavy | Expects inside readers |

### Output Format

```
TERMINOLOGY ARCHAEOLOGY:

Coined/redefined terms:
- [term 1]: what it means, why it was needed
- [term 2]: what it means, why it was needed

Rejected terms:
- [term 1]: rejected because [reason]
- [term 2]: rejected because [reason]

Jargon analysis:
- Density: [high/moderate/low]
- Insider level required: [expert/intermediate/novice]

Embedded metaphors:
- [term]: carries metaphor of [what]
- [term]: carries metaphor of [what]

Definition strategy:
- Defined explicitly: [what concepts]
- Assumed known: [what concepts]

Terminology signal:
[What worldview does this vocabulary embed? Who is meant to understand?]
```

---

## Implicit Audience Analysis

### Purpose
Who the author imagines reading reveals positioning, intent, and self-conception. The implicit audience shapes everything—tone, assumed knowledge, persuasion strategies, call to action.

### Extraction Prompts

#### Knowledge Assumptions
- What knowledge is ASSUMED without explanation?
- What is EXPLAINED that experts wouldn't need explained?
- The gap between these reveals the imagined reader's sophistication.

#### Emotional Register
- What's the emotional tone?
  - Academic distance: Formal, third-person, hedged claims
  - Conversational: Direct address, personal examples
  - Intimate: First-person plural, shared journey
  - Combative: Us vs. them, calls to action
- Register reveals relationship to reader.

#### Expected Action
- What is the reader expected to DO after reading?
  - Nothing (contemplation)
  - Think differently (persuasion)
  - Act (practical application)
  - Join (community/movement)
- The expected action reveals the document's purpose.

#### Expected Transformation
- How is the reader expected to CHANGE?
- What should they believe after that they didn't before?
- What should they be able to do?
- What community should they feel part of?

#### Actual vs. Imagined
- Who does the author IMAGINE reading this?
- Who will ACTUALLY read this?
- Is there a mismatch? What does it reveal?

### Audience Signals

| Pattern | Interpretation |
|---------|---------------|
| High assumed knowledge | Writing to peers, insiders |
| Low assumed knowledge | Writing to educate, recruit |
| Academic register | Establishing credibility, distance |
| Conversational register | Building relationship, accessibility |
| Action-oriented | For practitioners |
| Contemplation-oriented | For theorists |

### Output Format

```
IMPLICIT AUDIENCE ANALYSIS:

Knowledge assumptions:
- Assumed known: [concepts/skills taken for granted]
- Explicitly explained: [concepts/skills taught]
- Sophistication level: [expert/intermediate/novice]

Emotional register:
- Tone: [academic/conversational/intimate/combative]
- Relationship to reader: [peer/teacher/guide/leader]

Expected action:
- What reader should DO: [nothing/think/act/join]
- Specific call to action: [if any]

Expected transformation:
- Should believe: [what new belief]
- Should be able to: [what new capability]
- Should feel part of: [what community]

Actual vs. imagined:
- Imagined reader: [who author thinks is reading]
- Actual likely readers: [who probably reads this]
- Mismatch analysis: [if any, what it reveals]
```

---

## Trade-off Fingerprinting

### Purpose
How trade-offs are framed reveals value hierarchy and intellectual honesty. What's acknowledged vs. hidden, how conflicts are resolved, what's sacrificed last—these reveal the real priorities.

### Extraction Prompts

#### Explicit Trade-offs
- What trade-offs are EXPLICITLY ACKNOWLEDGED?
- "We chose X over Y because..."
- Explicit acknowledgment shows intellectual honesty and reveals what's being optimized.

#### Hidden Trade-offs
- What trade-offs are MADE but NOT ACKNOWLEDGED?
- What costs are incurred but not discussed?
- Hidden trade-offs reveal blind spots or strategic omission.

#### Resolution Patterns
- How are trade-offs RESOLVED?
  - Principled: Clear rule for choosing (always prioritize X)
  - Pragmatic: Case-by-case, context-dependent
  - Dodge: Acknowledge but don't resolve
  - Deny: Claim no trade-off exists
- Resolution style reveals decision-making philosophy.

#### Final Sacrifice
- What would the author sacrifice LAST?
- What's the non-negotiable?
- The final hold-out reveals the core value.

#### Already Sacrificed
- What has ALREADY been sacrificed?
- What's accepted as cost?
- What's the price already paid?

### Trade-off Signals

| Pattern | Interpretation |
|---------|---------------|
| Explicit acknowledgment | Intellectual honesty, confidence |
| Implicit avoidance | Blind spot or strategic omission |
| Principled resolution | Values-driven, predictable |
| Pragmatic resolution | Context-driven, flexible |
| Trade-off denial | Overconfidence or dishonesty |

### Output Format

```
TRADE-OFF FINGERPRINTING:

Explicit trade-offs acknowledged:
- [trade-off 1]: chose X over Y because [reason]
- [trade-off 2]: chose X over Y because [reason]

Hidden trade-offs (made but unacknowledged):
- [trade-off 1]: [cost incurred but not discussed]
- [trade-off 2]: [cost incurred but not discussed]

Resolution style:
- Pattern: [principled/pragmatic/dodge/deny]
- Evidence: [how trade-offs are handled]

Final sacrifice (would give up last):
[What's non-negotiable? What's the last thing standing?]

Already sacrificed (price paid):
[What's been given up? What costs are accepted?]

Trade-off fingerprint:
[What does trade-off handling reveal about real priorities?]
```

---

## Enemy Identification

### Purpose
Opposition reveals identity. What you're against defines you as much as what you're for. The enemies—named and unnamed—expose the negative space of identity.

### Extraction Prompts

#### Explicit Enemies
- Who or what is EXPLICITLY opposed?
- Named opponents, attacked positions, rejected approaches
- These are the declared adversaries.

#### Implicit Enemies
- Who or what is IMPLICITLY opposed?
- "Some people think..." (straw man formulations)
- Unnamed "others" who are wrong
- What's implicitly bad without being named?

#### Negative Identity
- What is this content explicitly NOT?
- "Unlike X, we..."
- "This is not another Y..."
- Negative identity reveals what's being distanced from.

#### Invalidation Conditions
- What would PROVE THIS WRONG?
- What evidence would be devastating?
- What would the author have to see to change their mind?
- Or: What's unfalsifiable here?

#### Core Fears
- What does this worldview FEAR MOST?
- What's the nightmare scenario?
- What's the enemy at the gates?
- Fear reveals values through negation.

### Enemy Signals

| Pattern | Interpretation |
|---------|---------------|
| Named opponents | Direct engagement, confidence |
| Unnamed opponents | Straw men, avoidance of direct fight |
| Absent opposition | Uncontested territory (or blind spot) |
| Philosophical enemies | Worldview conflict |
| Practical enemies | Implementation dispute |

### Output Format

```
ENEMY IDENTIFICATION:

Explicit enemies (named/attacked):
- [enemy 1]: what about them is opposed
- [enemy 2]: what about them is opposed

Implicit enemies (unnamed "others"):
- [enemy type 1]: the "some people who..." formulation
- [enemy type 2]: what's implicitly wrong

Negative identity:
- Explicitly NOT: [what this distances itself from]
- "Unlike X": [what X is and why different]

Invalidation conditions:
- Would be disproven by: [what evidence would be fatal]
- Unfalsifiable elements: [what can't be disproven]

Core fears:
- Nightmare scenario: [what this worldview fears most]
- Enemy at the gates: [the threat always present]

Enemy fingerprint:
[What do the enemies reveal about this worldview's identity?]
```

---

## Integration with Universal Lenses

### Sequence
1. Complete all five universal lenses first
2. Then apply document analysis lenses
3. Use document findings to validate or revise universal lens outputs

### Cross-Reference Points
- Citation lineage should align with worldview reconstruction
- Terminology should embed the root metaphor
- Implicit audience should match values hierarchy (who matters?)
- Trade-offs should reveal values in action
- Enemies should be the inverse of stated values

### Output Integration
Include document analysis findings in the domain-specific section of the full analysis template.
