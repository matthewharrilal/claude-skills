# Code Archaeology Lenses

Apply these lenses AFTER the five universal lenses when the content is a codebase, software project, or technical system.

---

## Naming Archaeology

### Purpose
Names are compressed worldview. Every identifier is a decision about what conceptual domain to draw from. Excavate the thinking behind naming.

### Extraction Prompts

#### Convention Analysis
- What naming convention is used? (snake_case, camelCase, PascalCase, kebab-case)
- What does this signal about influence? (Python world? Java world? Go world?)
- Is naming CONSISTENT or does it show evolution/multiple authors?

#### Conceptual Domain
- What domain do names draw from?
  - Military? (deploy, target, execute, command)
  - Organic? (grow, spawn, lifecycle, health)
  - Mechanical? (engine, pipeline, driver, gear)
  - Domestic? (home, host, guest, family)
  - Scientific? (experiment, hypothesis, sample, control)
  - Financial? (transaction, balance, ledger, account)
  - Spatial? (container, boundary, path, zone)

#### Abstraction Level
- Are names CONCRETE or ABSTRACT?
  - Concrete: `getUserById`, `sendEmailNotification`, `calculateTaxRate`
  - Abstract: `fetchResource`, `processItem`, `handleEvent`
- What does this reveal about how the creator thinks about the problem?

#### Negative Space
- What names are AVOIDED? What's never in identifiers?
- What does conspicuous absence reveal?

#### Inconsistencies
- Where does naming break pattern?
- What do inconsistencies reveal about evolution, pain points, or multiple authors?

### Signal Patterns

| Pattern | Reveals |
|---------|---------|
| Verbose names | Values explicitness over brevity |
| Short names | Values brevity, assumes shared context |
| Business terms | Domain-driven thinking |
| Technical terms | Implementation-focused thinking |
| Negative naming (`is_not_valid`) | Defensive mindset |
| Positive naming (`is_valid`) | Assertive mindset |
| Hungarian notation | Legacy or specific domain constraints |
| Single-letter variables | Speed over readability (or math heritage) |

### Output Format

```
NAMING ARCHAEOLOGY:

Convention: [pattern used]
Conceptual domain: [what world names draw from]
Abstraction level: [concrete/abstract/mixed]
Consistency: [high/medium/low with explanation]

Philosophy signal: [what naming reveals about creator's worldview]

Notable patterns:
- [pattern 1]: reveals [what it means]
- [pattern 2]: reveals [what it means]

Inconsistencies found:
- [inconsistency]: likely reveals [evolution/pain point/multiple authors]
```

---

## Structure Archaeology

### Purpose
Folder and file organization reveals mental models. How things are grouped exposes how the creator thinks about the problem space.

### Extraction Prompts

#### Organizing Principle
- What is the primary organizing principle?
  - **Feature-based**: `auth/`, `payments/`, `users/` (vertical slices)
  - **Layer-based**: `controllers/`, `services/`, `models/` (horizontal layers)
  - **Type-based**: `components/`, `utils/`, `hooks/` (by what it is)
  - **Mixed/Pragmatic**: Different principles in different areas

#### Hierarchy Analysis
- What's at the root level vs. nested deep?
- Root level = primary concepts, most important
- Deep nesting = derived, secondary, implementation detail
- What does this hierarchy reveal about priority?

#### Boundary Analysis
- Where do boundaries live? What's separated from what?
- What's in the same directory that could be separate?
- What's separate that could be together?
- Boundaries reveal ownership, independence, and coupling expectations.

#### Evolution Prediction
- What would you have to change to add a new feature?
- How many files would you touch to add a new entity type?
- Structure predicts pain points in evolution.

### Structure Philosophies

| Philosophy | Characteristics | Values |
|------------|-----------------|--------|
| Flat | Few directories, files at root | Simplicity, low cognitive load |
| Deep nesting | Many levels, fine categorization | Taxonomy, organization |
| Feature-based | Vertically integrated slices | Encapsulation, independence |
| Layer-based | Horizontal separation | Separation of concerns |
| Mixed | Different approaches for different areas | Pragmatism over consistency |

### Output Format

```
STRUCTURE ARCHAEOLOGY:

Organizing principle: [feature/layer/type/hybrid]
Depth pattern: [flat/deep/mixed]
Hierarchy signal: [what's primary vs. secondary]

Boundary philosophy:
- Things grouped together: [what and why]
- Things separated: [what and why]
- Surprising groupings: [unexpected combinations]

Evolution prediction:
- To add a new feature: [what changes]
- To add a new entity: [what changes]
- Pain points likely: [where structure fights change]

Cognitive model implied:
[What mental model does this structure assume the developer holds?]
```

---

## Commit Archaeology

### Purpose
Git history reveals priorities, evolution, and moments of truth. What was built first shows founding priorities. What was changed most shows pain points. What was never touched shows sacred cows or abandoned corners.

### Prerequisite
Only apply this lens if git history is available. Use `git log` to access history.

### Extraction Prompts

#### Origin Analysis
- What were the first commits? What was built FIRST?
- First commits reveal founding decisions—what was considered essential from day one.
- Was it big-bang (large initial commits) or incremental (small steps from the start)?

#### Change Patterns
- What areas have the MOST commits?
- Heavy change = pain points, iteration zones, or core functionality
- What areas have been REFACTORED?
- Refactoring reveals what became wrong enough to fix.

#### Sacred and Dead Zones
- What has NEVER been touched since creation?
- Never-touched code is either:
  - Sacred: works perfectly, don't touch
  - Dead: abandoned, everyone's scared of it
- Which is which?

#### Message Analysis
- What's the commit message style?
  - Detailed explanations: values documentation, future readers
  - Brief/cryptic: values speed, assumes context
  - Conventional commits: values process, automation
- Do messages reveal personality, frustration, or evolution?

#### Collaboration Signals
- Who commits what? Are there ownership patterns?
- Do certain people own certain areas?
- Are there handoff points visible in history?

### History Signals

| Signal | Interpretation |
|--------|---------------|
| Large initial commits | Built in isolation, then shared |
| Small incremental commits | Built publicly, iteratively |
| Refactor clusters | Pain points reached threshold |
| Message style evolution | Team conventions solidifying |
| High revert frequency | High risk tolerance or poor testing |
| Long-lived branches | Feature isolation or merge fear |

### Output Format

```
COMMIT ARCHAEOLOGY:

Origin story:
- First commits: [what was built first]
- Origin pattern: [big-bang/incremental]
- Founding priorities: [what the first commits reveal]

Change patterns:
- Hotspots (most changed): [areas and what this reveals]
- Refactor zones: [what's been reworked and why likely]
- Cold zones: [what's never touched - sacred or dead?]

Message philosophy:
- Style: [detailed/brief/conventional]
- Personality: [any notable tone or evolution]

Evolution story:
[2-3 sentences about how this codebase has grown and changed over time]
```

---

## Dependency Archaeology

### Purpose
Dependencies reveal trust, philosophy, and pragmatism levels. What's brought in from outside vs. built in-house shows what the creator is willing to trust vs. control.

### Extraction Prompts

#### Quantity Philosophy
- How many dependencies? Count them.
- Minimal (< 10 direct deps): Values control, distrusts external code
- Moderate (10-50): Pragmatic selection
- Maximal (50+): Values productivity, trusts ecosystem

#### Category Analysis
- What types of dependencies are present?
  - Core frameworks (React, Django, Rails)
  - Utility libraries (lodash, moment, ramda)
  - Infrastructure (AWS SDK, database drivers)
  - Dev tools (testing, linting, building)
- What's the ratio? Framework-heavy vs. utility-heavy?

#### Build vs. Buy
- What's built in-house that COULD be a dependency?
- Custom date handling when moment exists? Values control or NIH syndrome?
- What's a dependency that COULD be built in-house?
- Using a library for 2 functions? Values convenience over understanding?

#### Version Philosophy
- How are versions pinned?
  - Exact (`1.2.3`): Values stability, fears surprises
  - Range (`^1.2.3`): Values updates, trusts semver
  - Latest: Values current, accepts risk
  - Locked (lockfile): Values reproducibility

#### Notable Absences
- What dependencies are CONSPICUOUSLY missing?
- No testing framework? No linter? What's the absence saying?

### Dependency Philosophies

| Philosophy | Characteristics | Values |
|------------|-----------------|--------|
| Minimal | Few dependencies, custom code | Control, understanding, self-reliance |
| Maximal | Many dependencies, leverage ecosystem | Productivity, community, pragmatism |
| NIH | Build everything in-house | Understanding every line, no surprises |
| Framework-committed | All-in on one framework | Consistency, ecosystem benefits |
| Best-of-breed | Pick best tool for each job | Optimization, complexity tolerance |

### Output Format

```
DEPENDENCY ARCHAEOLOGY:

Quantity: [count] dependencies
Philosophy: [minimal/moderate/maximal]

Category breakdown:
- Frameworks: [list and what they reveal]
- Utilities: [list and what they reveal]
- Infrastructure: [list and what they reveal]

Build vs. buy decisions:
- Built in-house (could be dep): [what and why probably]
- Dependency (could be built): [what and why probably]

Version philosophy: [exact/range/latest/locked]

Notable absences: [what's missing that's usually present]

Trust model:
[What does this dependency profile reveal about what the creator trusts?]
```

---

## README Gap Analysis

### Purpose
The gap between README and code reveals self-awareness, aspiration, and documentation culture. What's promised vs. delivered exposes the difference between intent and reality.

### Extraction Prompts

#### Promise vs. Delivery
- What does the README PROMISE that the code doesn't deliver?
- Aspirational features? Claimed simplicity that isn't simple?
- What does the code DELIVER that the README doesn't mention?
- Hidden capabilities? Undocumented features?

#### Audience Analysis
- Who is the README written FOR?
- Who ACTUALLY uses this?
- Is there a mismatch? What does it reveal?

#### Future Work Section
- What's in "Future Work" or "TODO" or "Roadmap"?
- How old are these items?
- What will clearly NEVER happen? Why is it still listed?

#### Knowledge Assumptions
- What does the README assume you already know?
- What's explained that probably doesn't need explaining?
- The gap between these reveals the expected reader.

#### Documentation Culture
- Is the README maintained alongside code?
- When was it last updated vs. code last changed?
- Is documentation a first-class citizen or afterthought?

### Gap Signals

| Signal | Interpretation |
|--------|---------------|
| Over-promising | Aspiration > execution, or stale documentation |
| Under-promising | Humility, poor docs, or documentation debt |
| Mismatched audience | Target user unclear or changed over time |
| Dead roadmap items | Abandoned aspirations, direction changes |
| Never-updated | Documentation is afterthought |
| Obsessively current | Documentation is valued |

### Output Format

```
README GAP ANALYSIS:

Promise vs. delivery:
- Promised but not delivered: [what and why likely]
- Delivered but not promised: [what and why likely]

Audience analysis:
- Written for: [who the README assumes]
- Actually used by: [who likely actually reads this]
- Mismatch: [if any, what it reveals]

Dead zones:
- Stale future work: [items that will never happen]
- Outdated claims: [things that are no longer true]

Knowledge assumptions:
- Assumes you know: [prerequisite knowledge]
- Over-explains: [what didn't need explanation]

Documentation culture:
[Is documentation valued or an afterthought? Evidence?]
```

---

## Integration with Universal Lenses

### Sequence
1. Complete all five universal lenses first
2. Then apply code archaeology lenses
3. Use code findings to validate or revise universal lens outputs

### Cross-Reference Points
- Naming domain should align with root metaphor
- Structure should reflect values hierarchy
- Dependency philosophy should match trust model in worldview
- Commit history should reveal values evolution

### Output Integration
Include code archaeology findings in the domain-specific section of the full analysis template.
