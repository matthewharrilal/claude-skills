---
name: ninety
description: Engage the 90% — Apple's internal substrate that is not part of the intentional developer surface — across its five manifestations (internal compositions, data files, private framework signatures, internal behaviors, tacit code-review knowledge) and any of its eight intentions for engagement (compositional lens, importable material, peer rebuild, recursive exploration, awareness-as-signal, philosophical inheritance, taste calibration, reality check). The skill operates standalone for any of the eight intentions; using 90% knowledge to inform 10% composition is only ONE of those intentions.
---

# Ninety — Engaging the 90% Across All Its Dimensions

This skill is the framework's **micro vocabulary** half. Its job is to engage with Apple's internal substrate — the 90% — across whatever manifestations and intentions are currently relevant. The 90% is multi-dimensional, and the skill must respect that. Failing to capture all dimensions collapses the skill back to "find things to feed composition," which is only one of eight intentions.

The full framework is documented at `/Users/spacewizardmoneygang/Desktop/XcodeInstall/THE_10_90_FRAMEWORK.md`. Read Section III (The 90% in Detail), Section IV (The Multiple Intentions for Dipping Into the 90%), and Section V (The Conjecture Move) before invoking this skill.

**Critical framing:** the 90% is not primarily importable material. It is **what we understand** that becomes the lens through which we compose the 10%. But the 90% has standalone purposes beyond composition — recursive exploration to deepen our cartography, awareness-as-signal to know what is solvable, philosophical inheritance through bottled artifacts, taste calibration through observation of Apple-grade output, reality checks to avoid reinventing what already exists. This skill must serve all of them.

---

## Posture Check (Precondition)

<!-- ID: ninety.posture-check -->
<!-- INVARIANT: ninety.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement
<!-- ID: ninety.output-declaration -->
<!-- INVARIANT: ninety.output-declaration -->

After performing the Posture Check (per inherited protocol), this skill's output MUST contain an explicit line:

`POSTURE: janum` — when the Janum-tier posture is confirmed.
`POSTURE: senior` — when the senior posture is detected. In this case, halt and recalibrate before producing further output beyond this declaration.

The Stop hook scans for this line to write a session-level posture artifact that downstream skill invocations consult. Skipping this declaration breaks the framework's posture-propagation guarantee.

### Skill-specific addendum

For `/ninety` specifically, **Intention 3 (peer rebuild) and Intention 6 (philosophical inheritance) require active reverse-engineering** to be served at all. From the senior posture these intentions degrade into different things — peer rebuild becomes "wish Apple would publish a reference implementation," philosophical inheritance becomes "complain that Apple doesn't write design docs." Both produce empty deliverables. Confirm the Janum-tier posture explicitly when either intention is active; without it, the audit's most compositionally-valuable manifestations (A internal compositions, E tacit knowledge) cannot be honestly engaged.

---

## What This Skill Concretely Enables
<!-- ID: ninety.concrete-capabilities -->
<!-- INVARIANT: ninety.concrete-capabilities -->

`/ninety` is not invoked to demonstrate research depth. The substantial effort of class-dumping frameworks, parsing recipe files, frame-stepping interactions, and reading escaped artifacts only pays off if the engineer can name the concrete capabilities that come from doing it. Specifically:

- **The ability to ship Apple-grade compositions without private framework linkage.** With sufficient 90% awareness, the engineer can produce a composition that *behaves identically to Apple's internal version* while shipping only public-API symbols. Without 90% awareness, the engineer either ships at the senior-engineer ceiling (Tier 2B) or takes App Store risk by directly calling private APIs. The middle path — Apple-grade output, App-Store-legal — is only available through 90% awareness applied as compositional lens.
- **The ability to avoid reinventing what Apple has already solved differently than you assume.** Many architectural plans naturally reach for approaches that turn out to be inferior to what Apple ships internally. A 90% reality check (Intention 8) before committing engineering time catches these and redirects to better approaches. The capability is: making fewer expensive mid-implementation pivots.
- **The ability to absorb apprenticeship-grade philosophy from outside Apple.** Through bottled artifacts (Wave, AsyncDisplayKit, etc.), the engineer can internalize the tacit value system of Apple's internal teams. The capability is: making compositional decisions informed by the same philosophy that produces Apple-grade output, without ever having worked at Apple.
- **The ability to calibrate your taste against Apple's actual benchmarks.** Frame-stepping Apple-shipped interactions establishes concrete measurements (durations, curves, color spaces, threshold values) that become your internal benchmark for what "good" looks like in a domain. The capability is: judgment grounded in Apple's actual practice, not in generic notions of polish.
- **The ability to know what is solvable.** Class-dumping a private framework and finding `SBUITintedIconView` confirms that wallpaper-aware icon tinting is solvable. Apple has solved it; the existence is the signal. The capability is: committing engineering time to peer-rebuild attempts with confidence, because the underlying problem has been confirmed solvable.
- **The ability to inherit specific parameter values that Apple has tuned over years.** Recipe-file bytes are not just data — they are the result of Apple's internal designers tuning parameters across thousands of test cases. Inheriting those values gives you the tuning for free. The capability is: shipping with parameter quality that would take years to develop independently.

These are the concrete capabilities `/ninety` provides. If after running `/ninety` you cannot point to one being newly enabled, the audit was performed wrong or was not needed.

Each operation in the workflow below, and each section of the output format, includes an explicit statement of what specific capability it enables. The capability grounding prevents the audit from becoming research-for-its-own-sake.

---

## When to Use This Skill

**User-invoked triggers** — the user types `/ninety <problem domain or artifact>` when:

- They want a 90% audit on a specific iOS engineering domain.
- They want to understand what Apple has built internally for a problem, regardless of whether we plan to ship anything related (Intention 5, awareness-as-signal — pure exploration).
- They want to deepen our personal 90% cartography in an area (Intention 4, recursive exploration).
- They want to absorb the philosophy of an escaped artifact like Wave (Intention 6, philosophical inheritance).
- They want to calibrate their taste against an Apple-grade output (Intention 7).
- They want a reality check before committing engineering time to a particular approach (Intention 8).
- They have a composition in mind and need the 90% intelligence to inform it (Intention 1) — the most common, but not the only intention.

**Self-invoked triggers** — the assistant invokes `/ninety` automatically when:

- `/cartography` has surfaced primitives whose correct composition depends on knowledge that is not in the public documentation.
- The assistant notices a gap between observed Apple behavior and its pure-10% reasoning.
- A new private framework class, recipe file, or behavioral rule has come up in conversation and needs proper 90% investigation rather than passing reference.
- Before committing to a peer rebuild of an Apple-internal component, to ensure the rebuild is informed by the full 90% picture of the original.
- The assistant detects it has been operating on a thin 90% awareness and a recalibration dip is warranted.

In all cases, the skill engages the 90% honestly: identifying the specific manifestations relevant to the question, identifying the specific intentions driving the dip, performing the appropriate research, and producing a deliverable that matches the intention.

---

<!-- ID: ninety.five-manifestations -->
## The Five Manifestations — Always Considered, Selectively Engaged

Every `/ninety` invocation considers all five manifestations of the 90%, even if only some are ultimately relevant to the current dip. This is the discipline that prevents the skill from collapsing to a single dimension.

<!-- ID: ninety.manifestation-a -->
### Manifestation A — Internal Compositions

Apple's specific compositional patterns: how their internal teams wire public-API primitives together to produce Apple-grade outcomes. The primitives are public; the compositional patterns are not.

**What this looks like:** the combination of `CABackdropLayer` + `CAFilter` chain + specific filter order + recipe-driven parameters that produces vibrant materials. The combination of single-flighted `CADisplayLink` + transaction-wrapped value writes + velocity-preserving spring retarget that produces Wave-tier animation. The combination of `UIPanGestureRecognizer` + progress-0-to-1 modeling + spring physics with velocity passthrough that produces fluid-switcher-quality gestures.

**Research methods:**
- Read escaped artifacts (Wave's source, AsyncDisplayKit's source) for the compositional patterns they bottle.
- Frame-step shipping iOS interactions to infer the composition.
- Read framework `strings` and class-dumps for naming conventions that imply compositions.
- Read Saagar Jha-tier reverse-engineering writeups for compositional architecture documentation.

**What it gives us:** the actual compositional rules. The intelligence that informs how we wire our own 10% code.

<!-- ID: ninety.manifestation-b -->
### Manifestation B — Data Files Shipping on Every Device

Configuration data, recipe definitions, color palettes, animation parameters, shader collections shipping as files on disk in every iOS installation.

**What this looks like:** `.materialrecipe` files in `CoreMaterial.framework/Resources/`. `.visualstyleset` files in the same location. `Assets.car` in `UIKit.framework`. `default.metallib` in `RenderBox.framework`. LUT files in `PhotosImagingFoundation.framework`. Plists describing Now Playing chrome rules, Live Activity templates, Spotlight tokenization rules.

**Research methods:**
- File enumeration in `/System/Library/PrivateFrameworks/[framework]/Resources/`.
- `plutil -p` for plist parsing.
- `cartool` or `acextract` for `Assets.car`.
- `strings` and `nm` for `.metallib` introspection.
- Custom format parsers for proprietary file types where needed.

**What it gives us:** concrete byte values, parameter constants, color matrices, transfer functions, LUT coefficients. These can be embedded as Swift constants in our shipping code.

<!-- ID: ninety.manifestation-c -->
### Manifestation C — Private Framework Signatures

Apple's private frameworks in the dyld shared cache: class names, method signatures, property names, instance variable layouts. Recoverable through class-dumping.

**What this looks like:** `MTMaterialView` in CoreMaterial. `SBUITintedIconView` in SpringBoardUIServices. `SBFWallpaperColorAnalysisResult` in SpringBoardFoundation. `MRNowPlayingController`, `MRNowPlayingClient` in MediaRemote. `CARemoteLayerClient`, `CARemoteLayerServer`, `CAContext`, `CAFenceHandle` in QuartzCore. `_UIBackdropEffectLayer`, `_UIVisualEffectBackdropView` in UIKitCore.

**Research methods:**
- `classdump-dyld` against the iOS dyld shared cache.
- `limneos/classdumpios` for Swift-aware class-dumping.
- Reference `nst/iOS-Runtime-Headers` for the canonical published version.
- Cross-reference framework binaries with `nm -g` for exported symbols.

**What it gives us:** vocabulary. The names of internal classes, the shape of their interfaces, the architecture Apple uses internally. Critical input to Intention 5 (awareness as signal of possibility) and Intention 3 (peer rebuild).

<!-- ID: ninety.manifestation-d -->
### Manifestation D — Internal Behaviors Observable as Code Consequences

Rules encoded inside private framework binaries that we cannot read directly, but whose consequences are observable in shipping iOS.

**What this looks like:** the iPhone X fluid switcher's gesture state machine. The Now Playing chrome's crossfade duration in OKLab. The keyboard's hit-test-as-if-already-there rule. The Lock Screen wallpaper dim transition curve. The status bar's automatic style adaptation algorithm.

**Research methods:**
- 240fps screen captures with frame-step analysis.
- A/B behavioral testing on device (e.g., tap a keyboard key during presentation to confirm hit-test rule).
- Hypothesis formation followed by controlled experiments.
- Cross-reference with Apple's own commentary in WWDC sessions where rules are mentioned in passing.

**What it gives us:** the unwritten rules of feel — the specific durations, curves, color spaces, state machine transitions, hit-test biases, threshold values that Apple uses internally. These rules become the value system informing our compositions.

<!-- ID: ninety.manifestation-e -->
### Manifestation E — Tacit Code-Review Knowledge

The deepest manifestation. Knowledge that lives in Apple's internal code review threads, in PR comments, in the tacit norms of internal engineering teams. Unrecoverable directly.

**What this looks like:** Shabam's PR comments. The internal taste norms. The shared sense of "wrong" that's embedded in code reviews but never written down outside of them. The instincts that say "this is a 4ms hitch and we don't ship that" before the data even comes in.

**Research methods:**
- Read bottled artifacts (Wave, AsyncDisplayKit, Texture, Lottie) with the philosophical-position question: "what does this code believe?"
- Watch Apple engineer interviews and conference talks for tacit references to internal practices.
- Read between the lines of WWDC sessions for the philosophical positions Apple's teams hold.
- Apprentice second-hand through repeated exposure to escaped engineers' work.

**What it gives us:** taste. The instinct that informs all future compositional decisions. The most durable form of 90% knowledge, because once absorbed it shapes every line of code we write subsequently.

---

<!-- ID: ninety.eight-intentions -->
## The Eight Intentions — Each a Distinct Use of the 90%

Every `/ninety` invocation operates under one or more of eight distinct intentions. The skill is built to serve any of them. Failing to identify the intention upfront leads to research that produces deliverables in the wrong form.

<!-- ID: ninety.intention-1 -->
### Intention 1 — Compositional Lens

**Purpose:** extract compositional rules from the 90% that will inform how we wire public-API code in the 10%.

**Deliverable:** a rule, a parameter choice, a composition order — articulated in a form the engineer can encode as architectural decisions in their public-API code.

**Example:** dipping into the 90% to extract "velocity preservation through retarget" — a rule that lives in SpringBoard's animation engine and is bottled in Wave. The deliverable is the rule itself; the implementation will be public-API Swift composed under the rule.

**Most common intention. Default operational mode of the framework.**

<!-- ID: ninety.intention-2 -->
### Intention 2 — Importable Material

**Purpose:** extract specific byte values, parameter constants, color matrices, or other data that can be embedded as Swift constants in our shipping code.

**Deliverable:** concrete numeric values, ready to encode as Swift literals.

**Example:** parsing `platformContentGlass.materialrecipe` to extract `m11=0.921`, `m15=0.235`, `blurRadius=45.0`. The deliverable is the numbers; they become Swift constants in our `LiquidGlassConfiguration` struct.

**Lower frequency than Intention 1 but high signal when applicable. The bytes are concrete and unambiguous.**

<!-- ID: ninety.intention-3 -->
### Intention 3 — Peer Rebuild

**Purpose:** understand an Apple-internal component (typically a private framework class) well enough to build a public-API peer with equivalent behavior.

**Deliverable:** a complete architectural understanding of the original, sufficient to implement a peer using public APIs.

**Example:** understanding `MTMaterialView` well enough to build `LiquidGlassView` — same compositional structure, same parameter conventions, same outcome, different class name, no private framework linkage.

**Used when Apple has solved a problem with a private component that we want to ship a public-API version of. Often the most engineering-expensive intention.**

### Intention 4 — Recursive Exploration

**Purpose:** deepen our personal cartography of the 90% itself, without immediate implementation goal. Investment in our long-term vocabulary.

**Deliverable:** an expanded mental map of Apple's internal architecture in a particular area.

**Example:** reading Saagar Jha's CARenderServer reverse-engineering to understand how `CABackdropLayer` actually works at the render-server level — not because we are about to ship anything related, but because the understanding informs every future material-rendering decision.

**The patient intention. Pays off over years, not weeks.**

### Intention 5 — Awareness as Signal of Possibility

**Purpose:** confirm that Apple has solved a particular problem, which signals that the problem is solvable — motivating our own peer attempt.

**Deliverable:** a binary "yes Apple does this" plus the entry-point identifier (a class name, a recipe file, a public-API surface that hints at the internal solution).

**Example:** class-dumping SpringBoardUIServices to find `SBUITintedIconView` — confirming Apple has solved wallpaper-aware icon tinting. We do not need to read its implementation; the existence is enough to motivate building our own.

**Thin but high-value intention. Often costs five minutes and saves weeks.**

<!-- ID: ninety.intention-6 -->
### Intention 6 — Philosophical Inheritance via Bottled Artifacts

**Purpose:** absorb the philosophy that produced a particular escaped artifact (Wave, AsyncDisplayKit, Lottie). Internalize the value system as our taste.

**Deliverable:** an articulated philosophy — the rules and priorities the bottled artifact encodes — that becomes part of our future compositional reasoning.

**Example:** reading Wave's source not to use Wave, but to absorb Janum's bottled SpringBoard philosophy. After absorption, every animation we write subsequently composes differently — even when we are not using Wave.

**The apprenticeship intention. Slow but compounds across every future composition.**

### Intention 7 — Taste Calibration

**Purpose:** deepen our taste against Apple-grade output. Strengthen our internal critic so we can recognize when our work falls short of the bar Apple sets.

**Deliverable:** a calibrated sense of "this is what Apple-grade [domain X] looks like" that informs all subsequent judgment in that domain.

**Example:** frame-stepping Apple Music's Now Playing crossfade to internalize the duration (~750ms), curve (cubic ease-in-ease-out), color space (OKLab), and stability filter. After calibration, our own crossfade implementations are judged against this internal standard.

**The judgment intention. Determines what we accept as "good enough" and what we reject for further refinement.**

### Intention 8 — Reality Check / Avoidance of Reinvention

**Purpose:** verify before committing engineering time that we are not about to reinvent something Apple has already solved differently than we assume.

**Deliverable:** confirmation or refutation of our planned approach, with redirect if Apple's approach is materially better.

**Example:** planning to extract palettes via RGB k-means, then dipping into the 90% to check `MPCMediaItemArtworkColorAnalysis` — discovering Apple uses saturation-weighted clustering in Lab/OKLab. The reality check redirects us to a better algorithm before we commit engineering time.

**The cost-saving intention. Prevents expensive mid-implementation pivots.**

---

## Intention × Manifestation Matrix

Some intentions naturally serve specific manifestations; others span multiple. Use this matrix to plan research scope — research only the manifestations that serve the active intentions. Flag desire-to-research-more as a sign that scope is creeping into a separate audit.

| Intention | Primary Manifestations | Secondary |
|---|---|---|
| 1 — Compositional lens | A (compositions), D (behaviors) | E (tacit via Wave) |
| 2 — Importable material | B (data files) | — |
| 3 — Peer rebuild | C (signatures), A (compositions), D (behaviors) | B (parameter values) |
| 4 — Recursive exploration | All five — pick deepest unexplored | — |
| 5 — Awareness as signal | C (signatures) | — |
| 6 — Philosophical inheritance | E (tacit via bottled artifacts) | — |
| 7 — Taste calibration | D (behaviors) | A (compositions) |
| 8 — Reality check | C (signatures), D (behaviors) | A (compositions) |

Example: if the active intention is Intention 2 (importable material), do not research Manifestation E (tacit knowledge) — the intention doesn't need it. Save the research budget for the manifestation the intention actually requires.

---

## Philosophical Inheritance Procedure (for Intention 6 / Manifestation E)

Manifestation E (tacit knowledge) is unrecoverable directly but recoverable indirectly through bottled artifacts. The procedure:

1. **Select the bottled artifact** matching the domain. Animation: Wave. Hierarchy rendering: AsyncDisplayKit. Timeline interpolation: Lottie. Spring physics: Pop or Wave. Choose one or more whose authors' apprenticeship (e.g., Janum under Shabam at SpringBoard) is closest to the domain you're working in.

2. **Read with the philosophical question** active throughout: "What does this code *believe* about its domain?" Not "what does this code do" — that's a mechanics question. The philosophical question surfaces the value system the code encodes.

3. **For each architectural decision in the artifact, ask:**
   - What is the obvious alternative a senior engineer without this background would have chosen?
   - Why was that alternative rejected? What does the rejection imply about the domain's failure modes?
   - What rule is being encoded by the choice?
   - In what other domains does this rule apply?

4. **Extract the rules as a list.** Each rule is a sentence: "When [condition], prefer [choice] over [alternative], because [reason]." The rules become part of your accumulated philosophical library.

5. **Cross-validate the rules** against behavioral observation of Apple's shipped iOS. If Wave's `target.didSet` velocity preservation appears as the iPhone X fluid switcher's observable behavior, the rule is confirmed. If a rule from the bottled artifact doesn't appear in Apple's shipped behavior, the rule may be the bottler's own innovation rather than internalized Apple philosophy — still useful but worth noting.

6. **Add the validated rules to the personal philosophy library** with source attribution (which artifact, which file/line, which architectural decision). The library is consulted during `/conjecture` to inform compositional choices.

The procedure is repeatable. Each bottled artifact has more philosophy than a single reading extracts; repeated reading deepens the inheritance.

---

## The Skill Workflow

### Phase 1 — Identify the Domain and the Intentions

State precisely:
- The problem domain or artifact being engaged with.
- Which of the eight intentions are operative. Multiple intentions can be active simultaneously; name them all and rank by priority.
- The expected deliverable form for each active intention (rule vs. byte vs. architectural understanding vs. binary signal vs. philosophical absorption vs. calibration data vs. confirmation).

### Phase 2 — Survey the Five Manifestations for the Domain

For the specified domain, ask: which of the five manifestations are relevant?

- Manifestation A (internal compositions) — what compositional patterns does Apple use here? Likely always relevant.
- Manifestation B (data files) — are there recipe files, LUTs, asset catalogs, plists relevant to this domain?
- Manifestation C (private framework signatures) — what private classes underpin this domain?
- Manifestation D (internal behaviors) — what observable iOS behaviors encode rules in this domain?
- Manifestation E (tacit knowledge) — what escaped artifacts (Wave, etc.) carry philosophy relevant here?

Not every manifestation will be relevant for every domain. Flag which are relevant and which are not, with reasoning.

<!-- ID: ninety.phase-2-5-lens-application -->
### Phase 2.5 — Apply the Six Lenses

The framework names six lenses for viewing the 90%. Apply each to the audit's domain before executing research; each lens surfaces operational implications the others miss.

1. **By form of manifestation** (Lens 1): which manifestations (A/B/C/D/E) are relevant? Covered by Phase 2 above.

2. **By acquisition mode** (Lens 2): for each relevant manifestation, what research method applies? Class-dump for C, plist parsing for B, frame-step for D, philosophical reading for E. Mismatched method-manifestation produces thin findings.

3. **By recoverability** (Lens 3): which manifestations are fully recoverable (B, C, D), partially recoverable through inference (A), and unrecoverable directly but indirectly recoverable through proxy (E)? Calibrate confidence levels per finding accordingly.

4. **By what they feed** (Lens 4): does the audit's research produce *rules* (compositional intelligence, fed via Intention 1 to inform composition structure) or *bytes* (importable material, fed via Intention 2 to embed as constants)? Different deliverable forms; do not mix them.

5. **By App Store risk** (Lens 5): which findings, if shipped as-is, would cause App Store rejection? Findings as compositional structure (A patterns informing 10% wiring) carry zero risk. Findings as numeric byte constants carry zero risk. Findings as direct private-class linkage carry high risk. The audit must distinguish these for downstream `/conjecture` use.

6. **By depth** (Lens 6): how deep is the engagement? Surface (file enumeration, single class-dump pass) versus medium (cross-referenced behavioral observation, multi-source validation) versus deep (sustained philosophical reading, multi-iteration inference). Depth correlates with cost; budget accordingly.

The lens application is brief — each lens is one or two sentences for the current audit. The discipline is that all six are explicitly considered, not that each produces a long answer.

### Phase 3 — Execute the Research

For each relevant manifestation, apply the appropriate research method. Where the research is performable in-conversation (reading already-loaded class-dump data, parsing a referenced file, citing observable behavior from prior conversation context), do it directly. Where research requires resources not currently available (a class-dump that hasn't been performed, a behavior that hasn't been frame-stepped), explicitly mark what needs to be done and how.

Research outputs should be specific:
- "Class `SBUITintedIconView` exists in SpringBoardUIServices.framework; has properties `tintColor`, `iconImage`, `wallpaperColors`. Reached via class-dump confirmed."
- "Recipe file `platformContentGlass.materialrecipe` parses to `{blurRadius: 45.0, colorMatrix: [...]}`. Bytes extracted."
- "Frame-step of Now Playing crossfade at 240fps measured duration of 750ms ± 20ms. Curve appears cubic ease-in-ease-out (not spring; no overshoot)."
- "Wave's `SpringAnimator.swift:60` shows velocity-preserving retarget via `target.didSet`. Rule absorbed."

### Phase 4 — Deliver Per Active Intention

For each active intention, produce a deliverable in the form that intention demands:

- Intention 1 deliverable: a rule or set of rules, articulated for encoding as architectural decisions.
- Intention 2 deliverable: concrete numeric values ready for Swift constant declarations.
- Intention 3 deliverable: a complete architectural understanding sufficient to implement a peer.
- Intention 4 deliverable: an expanded mental map; documentation of the deeper understanding acquired.
- Intention 5 deliverable: a binary confirmation plus the entry-point identifier.
- Intention 6 deliverable: an articulated philosophy with specific compositional implications.
- Intention 7 deliverable: calibration data — specific measurements that define what "Apple-grade" looks like in this domain.
- Intention 8 deliverable: confirmation or refutation of the planned approach, with redirect if needed.

### Phase 5 — Flag Outstanding Research

Be explicit about what was NOT researched:
- Manifestations declared relevant but not yet investigated.
- Intentions that could not be fully served with current information.
- Specific research actions that would deepen the deliverable.

---

## Output Format

```
NINETY — [DOMAIN OR ARTIFACT]

=== Active Intentions ===

Primary intention(s): [list, with priority order if multiple]
Secondary intention(s): [list]
Rationale: [why these intentions and not others]
Expected deliverable form per intention: [list]

=== Relevant Manifestations ===

Manifestation A (internal compositions): [relevant / not relevant — reasoning]
Manifestation B (data files): [relevant / not relevant — reasoning]
Manifestation C (private framework signatures): [relevant / not relevant — reasoning]
Manifestation D (internal behaviors): [relevant / not relevant — reasoning]
Manifestation E (tacit knowledge): [relevant / not relevant — reasoning]

=== Research Findings by Manifestation ===

[For each relevant manifestation:]

**[Manifestation Name]**
- Research method applied: [class-dump / file parsing / frame-step / artifact reading / ...]
<!-- ID: ninety.citation-id-format -->
<!-- INVARIANT: ninety.citation-id-format -->
<!-- DEPENDS_ON: _shared/citation-id-schema -->
- Findings: [specific concrete output, each tagged with a citation ID]
  - **Citation ID format:** `NINETY-[domain]-[manifestation-letter][NN]` (e.g., `NINETY-material-A01` for first compositional-pattern finding in the material domain). See `_shared/citation-id-schema.md` for the canonical schema. `/conjecture` cites findings by ID to maintain cross-skill traceability.
- Confidence: [high / medium / low]

=== Deliverables by Intention ===

[For each active intention:]

**Intention [N] — [Name]**

Deliverable: [the rule / byte values / architectural understanding / binary signal / philosophy / calibration data / confirmation]

How this manifests in shipping code: [specific application]

[If Intention 1 (compositional lens): the specific rule(s) extracted, with examples of how they would inform composition choices in the latter end of the 10%.]

[If Intention 2 (importable material): the specific numeric values, ready to drop into Swift code.]

[If Intention 3 (peer rebuild): the architectural plan for the peer, including which 10% primitives substitute for which 90% private components.]

[etc., per intention]

=== Outstanding Research ===

[Explicit list of what was not researched:]
- [Manifestation X] flagged relevant but not investigated. Would require [research action].
- [Intention Y] could not be fully served. Need [specific information].
- [Adjacent area not yet investigated]: e.g., "iOS 18 may have introduced additional primitives in this domain; current investigation is based on iOS 17 class-dumps."

=== Recommended Next Skill ===

- If Intention 1 was active and produced compositional rules → invoke `/conjecture` to apply them.
- If Intention 3 was active and produced a peer-rebuild plan → invoke `/conjecture` to wire the peer's composition.
- If the audit revealed cartographic gaps (we found 90% knowledge implying 10% primitives we hadn't enumerated) → invoke `/cartography` to update the macro map.
- If the audit revealed we are at a shallower tier than the work requires → invoke `/gauge` to recalibrate.
- If a full audit is warranted across all four skills → invoke `/lens-check`.
```

---

## Worked Example

**Invocation:** `/ninety on "ambient backdrop rendering for music players" — primary intentions: compositional lens (1), importable material (2), philosophical inheritance (6), taste calibration (7)`

**Phase 1 (intentions identified):** Four active intentions. Primary: Intention 1 (extract compositional rules for our peer ambient backdrop). Secondary: Intention 2 (extract recipe byte values), Intention 6 (absorb Apple Music's atmospheric philosophy), Intention 7 (calibrate against Apple Music's crossfade quality).

**Phase 2 (relevant manifestations):**
- A (internal compositions) — relevant. We need the 4-copy twist composition, the OKLab crossfade pattern, the saliency-weighted palette extraction algorithm.
- B (data files) — relevant. The `platformContentGlass.materialrecipe` colorMatrix, possibly LUTs in PhotosImagingFoundation.
- C (private framework signatures) — relevant. `MPCMediaItemArtworkColorAnalysis`, possibly NowPlayingUI internals.
- D (internal behaviors) — relevant. Crossfade duration, color interpolation space, stability filter threshold.
- E (tacit knowledge) — relevant. "Atmosphere is content at low spatial frequency" philosophical position from Apple Music's deliberate choice not to use palette extraction for the backdrop.

**Phase 3 (research findings — abbreviated):**
- Manifestation A: 4-copy twist composition at scales {0.25, 0.50, 0.80, 1.25}, non-commensurate rotation periods, wall-clock independent of playback. Frame-step confirmed.
- Manifestation B: `platformContentGlass.materialrecipe` colorMatrix bytes extracted: `m11=0.921, m22=0.735, m33=0.973`, uniform `+0.235` luminance bias. blurRadius: 45.0. Confirmed via plutil.
- Manifestation C: `MPCMediaItemArtworkColorAnalysis` reachable via `[mediaItemArtwork valueForKey:@"_colorAnalysis"]` on `MPMediaItemArtwork`. Properties: `backgroundColor`, `primaryTextColor`, `secondaryTextColor`, `tertiaryTextColor`. Class-dump confirmed.
- Manifestation D: crossfade ~750ms, cubic ease-in-ease-out, OKLab interpolation (red→blue passes through clean purple), stability filter ΔE<10 skips crossfade. Frame-step + behavioral test confirmed.
- Manifestation E: Apple Music's deliberate split — chrome from artist-delivered metadata + backdrop from blurred artwork — encodes the philosophy that atmosphere ≠ chrome. The two color sources serve different purposes. Apple Music's design tooling distinguishes them.

**Phase 4 (deliverables):**

Intention 1 (compositional lens) deliverable — the rules:
1. Use 4 layers at scales {0.25, 0.50, 0.80, 1.25}, not 2 or 8.
2. Drive rotation by wall-clock timer, not playback time.
3. Rotation periods must be non-commensurate (e.g., 20s + 14s).
4. Apply Kawase blur over the composite, not per-layer.
5. Saturation boost AFTER blur, not before (~1.4× factor).
6. Crossfade in OKLab, ~750ms cubic ease-in-ease-out.
7. Implement a stability filter (ΔE<10) to skip crossfade on near-identical track changes.

Intention 2 (importable material) deliverable — the bytes:
```swift
public static let platformContentGlass = LiquidGlassConfiguration(
    blurRadius: 45.0,
    colorMatrix: simd_float4x4(rows: [
        SIMD4(0.921, -0.265, -0.027, 0),
        SIMD4(-0.079, 0.735, -0.027, 0),
        SIMD4(-0.079, -0.265, 0.973, 0),
        SIMD4(0, 0, 0, 1)
    ]),
    colorBias: simd_float4(0.235, 0.235, 0.235, 0)
)
```

Intention 6 (philosophical inheritance) deliverable — the philosophy:
- Atmosphere is content at low spatial frequency, not abstract palette.
- The backdrop must remain alive (rotation continues on pause) so the app reads as "alive" not "frozen."
- Chrome color and backdrop color are distinct artifacts serving distinct purposes; do not conflate.
- The user should feel "inside the album" — the artwork dissolved across the screen — rather than "looking at a gradient referencing the album."

Intention 7 (taste calibration) deliverable — the benchmark:
- Our crossfade must measure within 5% of Apple Music's 750ms.
- Our color interpolation must be in OKLab (verifiable via red→blue intermediate frame inspection).
- Our gradient must continue rotating during paused playback.
- Our composite must blend 4 layers with the documented scale/rotation patterns.

**Phase 5 (outstanding research):**
- Have not yet investigated iOS 18+ MediaPlayer / NowPlayingUI for any new APIs that might supersede or augment `MPCMediaItemArtworkColorAnalysis`.
- Have not yet read Saagar Jha's render-server writeups for any specific composition details of how Apple Music renders this backdrop on the actual render server (in-process Metal vs render-server-side composition).
- iOS 26 Liquid Glass system may interact with this domain in ways the current investigation has not accounted for.

**Recommended next:** invoke `/conjecture` to apply these findings to a peer implementation. The 90% findings translate directly into compositional decisions for `AnimatedArtworkBackdrop` and `NowPlayingAmbientSubscriber` modules in our library.

---

<!-- ID: ninety.blind-spot-diagnostics -->
## Blind-Spot Diagnostics — Stepping Outside the Audit

The 90% has its own depth, and the dangerous failure mode of `/ninety` is **shallow engagement** — the audit touches only the most-accessible manifestations (typically B data files and C signatures) and never reaches the deeper manifestations (A internal compositions, D internal behaviors, E tacit knowledge) that carry the most compositional intelligence. The shallowness is invisible from inside the audit; surfacing it requires stepping outside the immediate research and asking what is being structurally avoided.

### The Meta-Perspective Prompts

Before declaring the 90% audit complete, walk through these prompts. Each forces a vantage shift designed to surface the manifestations and intentions being avoided.

**Prompt 1 — The deepest-manifestation prompt.** "Of the five manifestations, which have I default-skipped because they require more research effort? Specifically, have I touched Manifestation D (internal behaviors observable as code consequences) and Manifestation E (tacit code-review knowledge bottled in escaped artifacts)? Or have I stayed in the easier B and C territory?"

→ This enables: surfacing the avoidance of the manifestations that require behavioral observation and philosophical reading — the manifestations that produce the most useful compositional intelligence but are slower to engage.

**Prompt 2 — The unconsidered-intention prompt.** "Of the eight intentions, which have I not even evaluated? Most audits cover Intention 1 (compositional lens) by default and skip Intention 4 (recursive exploration), Intention 5 (awareness as signal), Intention 6 (philosophical inheritance), and Intention 7 (taste calibration). Each of these has standalone value; have I considered which apply here beyond the default Intention 1?"

→ This enables: detection of the failure where the audit collapsed to one intention when multiple were operative. Each unconsidered intention is a missed deliverable.

**Prompt 3 — The differently-experienced researcher prompt.** "If a researcher who specializes in Manifestation E (philosophical inheritance through bottled artifacts) approached this same domain, what would they find that I have missed? If a researcher who specializes in Manifestation B (recipe file extraction) approached, what files would they investigate that I have not?"

→ This enables: surfacing manifestations that my own research-habits structurally underweight. Different researchers have different methodological biases; explicit perspective-shifting corrects for the bias.

**Prompt 4 — The interpretation-confidence prompt.** "For each finding I have produced, is my interpretation conservatively justified by the evidence, or am I confidently asserting things that the evidence is thin on? Where would a skeptical reader push back?"

→ This enables: calibration of finding-confidence. The skill's output is more useful when high-confidence findings are distinguished from speculative ones.

**Prompt 5 — The trigger-recognition prompt.** "Has a 90% trigger fired during the audit that I have not yet recognized? For example: has the audit surfaced a private framework class I am about to use as importable material when I should be using it as awareness-as-signal? Has the audit surfaced a recipe file I am about to embed verbatim when I should be extracting its compositional pattern rather than its byte values?"

→ This enables: detection of the failure where the audit collected information but used it for the wrong intention. The 90% material is more flexible than the default intention assumes.

**Prompt 6 — The version-currency prompt.** "Is my 90% audit based on the current iOS version, or is it inheriting findings from an older audit? The 90% changes per iOS release — new private classes, renamed methods, updated recipe parameters. Has my audit verified currency?"

→ This enables: detection of audit staleness. iOS evolves; an audit's findings are time-stamped, and stale findings produce architectural decisions based on no-longer-true premises.

### Named Approaches for Addressing Identified Blind Spots

| Blind spot surfaced | Named approach to address |
|---|---|
| "Manifestation D (behaviors) is unaddressed" | Set up a 240fps screen capture rig. Frame-step the relevant Apple-shipped interaction. Document specific measurements: durations, curves, color-space behavior, threshold values. |
| "Manifestation E (tacit knowledge) is unaddressed" | Read the relevant bottled artifact (Wave, AsyncDisplayKit, etc.) with the philosophical-position question: "what does this code believe?" Document the absorbed philosophy as a list of compositional rules. |
| "Intention 4 (recursive exploration) is unaddressed" | Walk into the 90% deeper than the current domain requires. Class-dump adjacent frameworks. Read framework binaries. Build a deeper map even though the current task does not strictly require it. |
| "Intention 5 (awareness as signal) is unaddressed" | Verify that the Apple-internal solution for the related domain exists. Class-dump for the relevant private class. Confirm the existence; record the entry-point identifier; do not invest further until the existence is needed. |
| "Intention 6 (philosophical inheritance) is unaddressed" | Sustained reading of a bottled artifact in the domain. Multiple passes. Each pass surfaces additional philosophical positions. |
| "Intention 7 (taste calibration) is unaddressed" | Establish concrete benchmarks. Measure Apple's shipped artifact across the specific dimensions relevant to the domain (duration, color space, threshold values, parameter ranges). Record as a calibration document. |
| "Findings are speculative" | Add validation operations: behavioral testing on device, cross-referencing escaped artifacts, class-dump verification of inferred class signatures. Mark findings as `validated` vs. `speculative`. |
| "Audit is stale relative to current iOS" | Re-run the relevant research methods against the current iOS. New class-dump, fresh recipe-file extraction, current behavioral observation. |

→ This enables: the 90% audit is not stuck at the level of initial findings. The skill carries its own toolkit for extending the audit when blind spots are surfaced.

### When the Audit Cannot Complete Honestly

When the audit cannot serve a stated intention with confidence — when a manifestation cannot be investigated within the available research budget, when an intention requires more time than is available — the honest output is acknowledgment plus approach:

"Audit incomplete for Intention X. The manifestation that would serve it (Manifestation Y) requires [specific research action] that has not been performed. Marking Intention X as `pending: needs [action]`. Composition decisions made before completion should be flagged as `tentative pending 90% update on [Y]`."

→ This enables: downstream work is informed by an honestly partial audit. Confident-sounding but actually thin audits produce compositional decisions made on bad information; acknowledged partiality produces decisions appropriately scoped to current knowledge.

---

<!-- ID: ninety.dimensionality-completeness -->
## Dimensionality Completeness Check

Before declaring the audit complete, walk through the multi-dimensional territory of the skill. Failing any dimension means the audit is structurally incomplete on that axis.

**Dimension 1 — Manifestation coverage.** Has the audit explicitly considered all five manifestations (A internal compositions, B data files, C private framework signatures, D internal behaviors, E tacit knowledge), even if only some were ultimately investigated? Default-skipping a manifestation without acknowledgment is a coverage failure.

→ This enables: the audit's output honestly reflects which manifestations were engaged and which were not.

**Dimension 2 — Intention coverage.** Has the audit explicitly evaluated all eight intentions for applicability to the current domain, even if only some were active? Most audits operate by default under Intention 1 and silently skip the rest; explicit evaluation surfaces the intentions that actually apply.

→ This enables: the audit serves the full set of operative intentions, not just the default one.

**Dimension 3 — Research-method coverage.** For each engaged manifestation, has the appropriate research method been applied? Manifestation D requires behavioral observation, not class-dumping; Manifestation E requires philosophical reading, not file parsing. Method-manifestation mismatch produces thin findings.

→ This enables: each manifestation gets the research method that actually surfaces its content.

**Dimension 4 — Finding-confidence coverage.** Has each finding been calibrated for confidence (high / medium / low) with reasoning? Confident-sounding findings without confidence calibration are the silent failure mode.

→ This enables: downstream skills (especially `/conjecture`) can weight findings by confidence and avoid relying on speculative inputs.

**Dimension 5 — Outstanding-research coverage.** Has the audit flagged what was NOT researched, with specific approaches for addressing? Audits without outstanding-research sections claim completeness they do not have.

→ This enables: future audit iterations have specific entry points for deepening.

**Dimension 6 — Cross-domain coverage.** Does the audit consider whether 90% knowledge from adjacent domains is relevant? The 90% in motion may inform the 90% in material; the 90% in gesture may inform the 90% in haptic. Audits bounded to a single domain miss cross-domain compositional intelligence.

→ This enables: the audit produces findings that compose across domains, not just within one.

**Dimension 7 — Version coverage.** Has the audit stated which iOS version its findings reflect? The 90% changes per release; un-dated findings become stale invisibly.

→ This enables: the audit is iterable. Future audits can update specific findings rather than re-doing the entire audit.

If any dimension is unexamined, state explicitly: "Dimension X unexamined; [action] would address." Then perform the action within budget, or flag as outstanding.

→ This enables: the audit is structurally complete across the multi-dimensional territory of the 90%, not merely along the dimensions that came to mind first.

---

## Notes on Use

- **Standalone value across all intentions.** This skill is invocable for any of the eight intentions, not only when feeding `/conjecture`. The user dropping `/ninety` to deepen their own cartography (Intention 4) is a valid full use of the skill, with no obligation to subsequently invoke `/conjecture`.
- **Honesty about manifestation coverage.** When a manifestation is relevant but not investigated, say so. Flagging gaps is more useful than claiming coverage.
- **Multiple intentions can coexist.** A single `/ninety` invocation might serve Intentions 1, 2, 6, and 7 simultaneously. The deliverable section makes this explicit by producing a deliverable per active intention.
- **Confidence calibration.** For each finding, note confidence. Frame-step measurements have high confidence; inferred compositional structure from observable behavior has medium confidence; philosophical absorption from a partially-read artifact has low confidence pending deeper reading.
- **Research scope discipline.** Do not let the skill sprawl. Investigate the manifestations and intentions named upfront; flag others as outstanding rather than expanding mid-skill.
- **The 90% is not adversarial.** Apple's internal substrate is not hostile to outside engineers; it is simply not curated for them. Engagement with the 90% is a research operation, not a circumvention.
