---
name: gauge
description: Gauge the current state of thinking against the 10/90 framework — either introspectively (what tier am I operating from right now?) or against an external artifact (what tier does this UX interaction / app / video operate at?). The diagnostic baseline that every other framework skill (cartography, ninety, conjecture) builds on.
---

# Gauge — Calibrate the Lens

This skill is the **diagnostic baseline** of the 10/90 framework. Before doing any non-trivial iOS engineering — before mapping cartography, before dipping into the 90%, before proposing a composition — first gauge the current state of thinking. Establish what tier the work is operating at, what compositional patterns are being assumed, what's visible and what's a blind spot.

The full framework is documented at `/Users/spacewizardmoneygang/Desktop/XcodeInstall/THE_10_90_FRAMEWORK.md`. Read it first if context for the 10/90 distinction, the tier ladder, the eight intentions, and the conjecture move is not already present.

---

## Posture Check (Precondition)

<!-- ID: gauge.posture-check -->
<!-- INVARIANT: gauge.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement
<!-- ID: gauge.output-declaration -->
<!-- INVARIANT: gauge.output-declaration -->

After performing the Posture Check (per inherited protocol), this skill's output MUST contain an explicit line:

`POSTURE: janum` — when the Janum-tier posture is confirmed.
`POSTURE: senior` — when the senior posture is detected. In this case, halt and recalibrate before producing further output beyond this declaration.

The Stop hook scans for this line to write a session-level posture artifact that downstream skill invocations consult. Skipping this declaration breaks the framework's posture-propagation guarantee.

### Skill-specific addendum

For `/gauge` specifically, the posture is also a **Tier 2B vs. Tier 3 detector**. The senior posture produces Tier 2B work indefinitely; the Janum-tier posture produces Tier 3 work. If the gauge detects the senior posture in current thinking, explicitly flag this in the gauge output as the primary tier-ceiling factor and recommend posture-recalibration before proceeding with downstream framework skills — no amount of `/cartography` or `/ninety` depth will lift Tier 2B output to Tier 3 if the posture has not shifted.

---

## What This Skill Concretely Enables
<!-- ID: gauge.concrete-capabilities -->
<!-- INVARIANT: gauge.concrete-capabilities -->

`/gauge` is not invoked for complexity's sake. Operating with a calibrated lens enables concrete iOS engineering capabilities that higher-level "just write the app" framings forfeit. Specifically:

- **The ability to choose primitives deliberately rather than by default reach.** When you know what tier you are operating at, you can ask "is this primitive my best choice, or is it just the one I reached for first?" Without gauging, every primitive reach is opportunistic; with gauging, every reach is positional.
- **The ability to calibrate expectations against the goal's actual tier requirement.** If you are aiming for Apple-grade feel (Tier 3B) but operating at Tier 2A thinking, the gap will manifest as a shipped product that falls short. Gauging the gap upfront prevents shipping at tier mismatch.
- **The ability to identify external artifacts whose reproduction requires 90% engagement.** When a user drops a video of an interaction and asks "can we build this," gauging the artifact tells you whether pure-10% reasoning can reproduce it or whether the conjecture move is required. Without gauging, the engineer commits to a build approach that may be structurally insufficient.
- **The ability to surface your own framing before it embeds in shipped code.** Framings calcify. The architectural decisions you make in week one of a project become irreversible by week six. Gauging in week one — when the framing is still negotiable — is the cheapest opportunity to recalibrate.
- **The ability to control how much engineering budget the work warrants.** Not every task needs Janum-tier composition. Some tasks are correctly served by Tier 1 thinking; over-engineering them is its own failure mode. Gauging is what allows the engineer to match effort to required depth.

These are the concrete capabilities the skill exists to provide. If after running `/gauge` you cannot point to one of these capabilities being enabled by the gauge output, the gauge was performed wrong or was not needed.

Each operation in this skill, below, ends with an explicit statement of what specific capability it enables. The capability grounding is the antidote to gauging-for-its-own-sake.

---

<!-- ID: gauge.when-to-use -->
## When to Use This Skill

**User-invoked triggers** — the user types `/gauge` when:

- They want to assess the assistant's current lens in the middle of a conversation. ("I think you're operating at Tier 2B right now — run `/gauge`.")
- They drop an artifact (video, screenshot, app link, repo) and want it gauged against the framework. ("Watch this video of Dot's pinch — run `/gauge` and tell me what tier it operates at.")
- They want a baseline before doing more framework work. ("Before we plan the next feature, run `/gauge` on the current implementation.")

**Self-invoked triggers** — the assistant invokes `/gauge` automatically when:

- A new iOS domain enters the conversation that hasn't been gauged yet (e.g., "let's design a transition system" — transitions are a new domain, gauge first).
- The user references or shares an external artifact (a video, a competitor app, a shipped interaction) that should be gauged before discussing.
- The assistant notices it is about to commit to an architectural decision (a primitive, a stack, a composition) without having gauged its current lens first.
- The assistant detects a gap between observed Apple-grade behavior and its own reasoning — a sign that current thinking may be at a shallower tier than the work requires.

In all cases, `gauge` is the **first** skill invoked. It produces the baseline that `/cartography`, `/ninety`, and `/conjecture` build on.

---

## Two Modes

<!-- ID: gauge.two-modes -->

The skill operates in two distinct modes depending on what is being gauged.

### Mode A — Introspective Gauge (self-assessment)

<!-- ID: gauge.mode-a -->
<!-- DEPENDS_ON: _shared/tier-ladder -->


Used when gauging the assistant's own current lens.

**Inputs:**
- The current task or question in the conversation.
- Any code or architecture the assistant has just proposed or is about to propose.
- Recent reasoning the assistant has produced.

**Operations:**

<!-- STEP: gauge.mode-a.step-1-name-task -->
1. **Name the task or domain.** State precisely what iOS engineering territory the current work is in (animation, material rendering, color extraction, gesture handling, cross-process composition, etc.).
<!-- STEP: gauge.mode-a.step-2-identify-primitives -->
2. **Identify the primitives currently being reached for.** Which APIs am I about to use or recommend? Which compositional patterns am I assuming?
<!-- STEP: gauge.mode-a.step-3-classify-tier -->
3. **Classify the current lens against the tier ladder — BOTH current and required.**
   - **Current tier estimate:** what tier is my actual thinking operating at right now?
     - **Tier 0:** Am I treating iOS as a generic platform via cross-platform abstractions?
     - **Tier 1:** Am I only considering well-documented front-of-10% APIs (UIView.animate, UITableView, basic gestures)?
     - **Tier 2A:** Am I working with middle-of-10% APIs (UIViewPropertyAnimator, UIVisualEffectView, Vision saliency)?
     - **Tier 2B:** Am I reaching into the latter end of the 10% (_UI-prefixed types, CAFilter, direct CADisplayLink) but without 90% awareness informing composition?
     - **Tier 3A:** Am I bringing intermittent 90% awareness — some compositional patterns from Wave, some recipe-file knowledge — but inconsistently?
     - **Tier 3B:** Am I composing the latter end of the 10% under continuous 90% lens, with cartography enumerated and the conjecture move reflexive?
   - **Required tier for this work:** what tier does the work actually need to ship at?
     - Does the goal demand Apple-grade feel (Tier 3) or is a competent shipped product (Tier 2A/B) sufficient?
     - Will users perceive the difference between Tier 2B and Tier 3 output for this specific work, or is the difference invisible at the user level?
     - Is this a load-bearing surface (chrome, hero interaction) where tier matters, or a routine surface (settings, list view) where Tier 1 is appropriate?
   - **The gap is the operational output.** If current-tier matches required-tier, no further depth is needed and the work proceeds at current level. If current-tier is below required-tier, downstream skills (`/cartography`, `/ninety`, `/conjecture`) must close the gap; gauge depth is calibrated to that gap. If current-tier exceeds required-tier, flag over-engineering as the failure mode and recommend reducing depth.
4. **Surface assumed compositional patterns.** What rules am I taking for granted? What do I assume about:
   - Animation flight and interruption semantics?
   - Material rendering pipeline order?
   - Color space for interpolation and crossfading?
   - Gesture state machine modeling?
   - Cross-process composition substrate?
5. **Flag blind spots.** What primitives or compositional patterns might I be missing because I haven't gauged the cartography or dipped into the 90%? Be specific:
   - "I haven't enumerated the latter-end-of-10% primitives for this domain — `/cartography` would surface them."
   - "I'm assuming a naive RGB color interpolation here — likely a 90% pattern I'm missing in OKLab."
   - "I'm modeling animation as CASpringAnimation without considering the velocity-preserving retarget pattern Wave bottles."
6. **Recommend next steps in framework terms.** Which subsequent skills should run, and why? Common patterns:
   - "Tier 2B baseline detected. Recommend `/cartography` to enumerate the latter end of the 10% for this domain, then `/ninety` to identify which intentions are triggered, then `/conjecture` to propose the calibrated composition."
   - "Tier 3A baseline detected with specific blind spots in [domain]. Recommend `/ninety` focused on [specific 90% manifestation] before composing."

**Output format:**

```
GAUGE — INTROSPECTIVE — [TASK NAME]

Current tier estimate: [Tier X, with confidence: high / medium / low]
Required tier for work: [Tier Y, with reasoning]
Gap: [delta — Y minus X, or "matched" if equal, or "over-engineered" if X > Y]

Posture: [Janum-tier / senior — flag if senior]

Primitives currently being reached for:
- [list]

Assumed compositional patterns:
- [list of patterns I'm taking for granted]

Visible blind spots:
- [specific cartographic gaps]
- [specific 90% manifestations not yet investigated]

Recommended next skills (calibrated to the gap):
- If gap is zero: proceed at current depth; no further framework skills needed.
- If gap is positive (work needs more depth): [/cartography focused on X | /ninety focused on Y | /conjecture once X and Y complete] — at depth proportional to gap size.
- If gap is negative (over-engineered): flag the over-engineering; reduce target depth before proceeding.
```

### Mode B — Artifact Gauge (external assessment)

<!-- ID: gauge.mode-b -->
<!-- DEPENDS_ON: _shared/tier-ladder -->

Used when gauging an external artifact: a video the user drops, a screenshot, a shipped app's behavior, a competitor's interaction, an open-source library, a code reference.

**Sub-mode bifurcation — establish first:**

- **Mode B-Understand:** the user wants to know what tier the artifact operates at and what's interesting about it. Purpose is comprehension, not reproduction. Output emphasizes tier classification, encoded compositional patterns, philosophical position.
- **Mode B-Reproduce:** the user wants to build their own version. Purpose is producing a reproduction approach. Output emphasizes reproducibility verdict, primitive substitutions, peer-rebuild feasibility, and what `/cartography` + `/ninety` + `/conjecture` would need to surface to ship the reproduction.

If the user has not explicitly indicated which sub-mode is active, ask before proceeding. The deliverables differ substantially.

**Inputs:**
- The artifact itself (visual, code, behavioral description, link).
- Any context the user provides about it ("this is Dot's pinch gesture," "this is a video I captured of Apple Music's track change," etc.).
- Sub-mode confirmation (Understand or Reproduce).

**Operations:**

1. **Describe what the artifact does.** State observable behavior in concrete UX/UI terms before any framework analysis. What does the user see? What does the user feel? What is the interaction sequence?
2. **Identify visible primitives.** What 10% APIs are likely being used? Be specific:
   - Gesture types (`UIPinchGestureRecognizer`, `UIPanGestureRecognizer`, custom).
   - Animation primitives (`UIViewPropertyAnimator`, `CASpringAnimation`, `CADisplayLink`-driven, SwiftUI `withAnimation`).
   - Material primitives (`UIVisualEffectView`, `_UIVisualEffectBackdropView`, custom Metal compute).
   - Color primitives (system colors, custom palette, extracted palette).
3. **Identify visible compositional patterns.** What rules appear to be encoded? Examples:
   - "Velocity preservation through retarget — visible because reversal mid-flight doesn't snap."
   - "Single-progress modeling — visible because multiple visual properties move in lock-step from a single source."
   - "OKLab color interpolation — visible because the red→blue crossfade passes through clean purple, not muddy brown."
   - "Hit-test at destination — visible because tap targets remain accurate during animation."
4. **Classify the artifact's tier.**
   - **Tier 0–1:** generic UX, no specific iOS depth visible.
   - **Tier 2A:** well-polished but recognizably built from documented public APIs.
   - **Tier 2B:** technically sophisticated, deeper APIs visible, but compositional patterns feel ad-hoc or generic.
   - **Tier 3:** compositional patterns visible that imply 90% awareness (specific rules encoded that pure-10% reasoning would not naturally produce).
5. **Identify the 90% knowledge likely encoded.** For Tier 3 artifacts, name the specific 90% patterns. Examples:
   - "Apple Music's track-change crossfade encodes the OKLab interpolation rule (90%-D internal behavior) and the saturation-weighted color clustering pattern from `MPCMediaItemArtworkColorAnalysis` (90%-C private framework signature)."
   - "Dot's pinch encodes the progress-0→1 modeling rule (90%-A internal composition from SpringBoard) and the velocity-preserving retarget rule (90%-E tacit knowledge bottled in Wave)."
6. **Identify what to investigate further.** For each 90% manifestation surfaced, name the specific research dip needed to fully understand the artifact:
   - "Class-dump SpringBoardFoundation to verify whether `SBFWallpaperColorAnalysisResult` is involved."
   - "Frame-step the crossfade at 240fps to measure the exact duration and curve."
   - "Re-read Wave's source for the specific spring parameter space being used here."
7. **Pose the build question.** If we wanted to reproduce this artifact from outside Apple, what would the composition look like? This is a teaser for `/cartography` + `/ninety` + `/conjecture`.

**Output format:**

```
GAUGE — ARTIFACT — [ARTIFACT NAME] — Sub-mode: [Understand / Reproduce]

Observable behavior:
[description of what the artifact does, in UX/UI terms]

Visible primitives:
- [list of likely 10% APIs]

Visible compositional patterns:
- [list of rules visibly encoded]

Artifact tier estimate: [Tier X, with reasoning, confidence: high / medium / low]

90% knowledge likely encoded:
- [90%-A internal compositions]: [specific patterns]
- [90%-B data files]: [specific files if applicable]
- [90%-C private framework signatures]: [specific classes if applicable]
- [90%-D internal behaviors]: [specific behavioral rules]
- [90%-E tacit knowledge]: [specific philosophical positions if applicable]

Further research recommended:
- [specific research dips needed]

[For Mode B-Reproduce only — Reproducibility Verdict:]

Reproducible from outside Apple: [YES at Tier X / YES with caveats / NO because Z]
- If YES: estimated reproduction effort: [hours / days / weeks].
- If YES: required intentions for `/ninety`: [list of the eight intentions that apply].
- If YES: critical 90% findings the reproduction depends on: [list].
- If YES with caveats: [the caveats — feature parity vs. peer rebuild, specific UX properties that may differ].
- If NO: the blocker is [specific access dependency: entitlement-gated cross-process composition / kernel-level API / hardware feature]. The peer-rebuild approach would require [specific resource acquisition or scope reduction].

Reproduction approach (Mode B-Reproduce only):
[concrete approach — which primitives compose how, which 90% findings inform the composition, what `/cartography` + `/ninety` + `/conjecture` need to produce]
```

---

<!-- ID: gauge.composition-with-other-skills -->
## How Gauge Composes With the Other Framework Skills

`/gauge` is always the entry point. Its output is the input to one or more subsequent skills:

- **If the gauge surfaces a cartographic gap:** `/cartography` runs next to enumerate the full menu for the domain.
- **If the gauge surfaces a 90% knowledge gap:** `/ninety` runs next to audit the relevant manifestations and intentions.
- **If the gauge confirms current thinking is calibrated:** `/conjecture` runs to propose the composition (or the user simply proceeds with the work).
- **If a full audit is needed:** `/lens-check` runs the compound wrapper, which invokes all four in sequence.

A common sequence: `/gauge` → notices Tier 2B baseline → recommends `/cartography` → cartography reveals primitives I had been ignoring → suggests `/ninety` → ninety identifies which intentions are triggered → produces 90% findings → `/conjecture` proposes the calibrated composition. The full sequence is `/lens-check`.

---

<!-- ID: gauge.worked-example-mode-a -->
## Worked Example — Mode A (Introspective)

**Context:** in conversation, the user has asked me to design a card-stack carousel for their app. I've just sketched: "use `UIPageViewController` with `.scroll` transition style, fade-in on each card."

**Invocation:** the user types `/gauge` (or I self-invoke).

**Output:**

```
GAUGE — INTROSPECTIVE — Card-stack carousel design

Current tier estimate: Tier 1 (with some Tier 2A elements).

Primitives currently being reached for:
- UIPageViewController with scroll style — front of 10%
- Fade-in animations via UIView.animate — front of 10%

Assumed compositional patterns:
- Card transitions are discrete (one card at a time, scroll style)
- Fade is the entire visual transition
- No velocity-aware gesture handling
- No spring physics
- No interruptibility consideration

Visible blind spots:
- I haven't enumerated the cartography of "card-stack interaction" — likely candidates I'm missing: UICollectionViewCompositionalLayout with custom orthogonal scrolling, custom UIViewControllerInteractiveTransitioning for fluid drag, matchedGeometryEffect in SwiftUI, CADisplayLink-driven progress modeling for true Wave-tier feel.
- I haven't dipped into the 90% for what makes card stacks feel alive (velocity preservation, progress-0→1 modeling, hit-test-at-destination). The current sketch is ceiling-bound at "well-built UIKit app."
- I haven't asked whether the user wants Apple-grade feel or just functional behavior. The taste trigger hasn't fired.

Recommended next skills:
- /cartography on "card-stack interactions" to enumerate the full menu (UIPageViewController vs collectionView vs custom interactive transition vs SwiftUI matchedGeometryEffect vs CADisplayLink-driven custom)
- /ninety on the gesture-driven interaction patterns Apple uses (intentions 1, 6, 7 are likely triggered)
- /conjecture once both complete to produce the calibrated composition
```

---

<!-- ID: gauge.worked-example-mode-b -->
## Worked Example — Mode B (Artifact)

**Context:** the user drops a 240fps screen recording of Apple Music's Now Playing track change.

**Invocation:** `/gauge` against the video.

**Output:**

```
GAUGE — ARTIFACT — Apple Music Now Playing track change

Observable behavior:
On track change, the album artwork backdrop crossfades from the previous song's palette to the new song's palette over ~750ms. The animated artwork (4-copy twist composition) continues rotating during the crossfade — both old and new composites are visibly alive simultaneously. The chrome tint (play button, scrubber) follows the same crossfade timing. The crossfade curve is cubic ease-in-ease-out, not a spring (no overshoot visible). Red → blue crossfades pass through clean purple, not muddy brown.

Visible primitives:
- Likely .layerEffect-based Metal shader for the twist (iOS 17+ API surface)
- CADisplayLink or TimelineView(.animation) for continuous rotation
- CAGradientLayer or custom Metal for the chrome tint
- Likely MPCMediaItemArtworkColorAnalysis (private, accessed via KVC on MPMediaItemArtwork) for palette extraction

Visible compositional patterns:
- Crossfade timing: ~750ms easeInEaseOut
- Color interpolation in OKLab (clean purple in red→blue confirms perceptually-uniform space)
- Wall-clock rotation independent of playback state (gradient stays alive on pause)
- Both old and new composites alive during crossfade (not a snapshot crossfade)

Artifact tier estimate: Tier 3B — Apple-internal grade, with multiple 90% patterns visibly encoded.

90% knowledge likely encoded:
- 90%-A internal compositions: 4-copy twist at scales {0.25, 0.50, 0.80, 1.25} with non-commensurate rotation timers; saturation-weighted palette clustering in Lab/OKLab; crossfade between two complete composites (not single-composite tween)
- 90%-B data files: possibly LUTs for the saturation-boost stage; not strictly required to identify
- 90%-C private framework signatures: MPCMediaItemArtworkColorAnalysis; possibly NowPlayingUI internals for the chrome coordination
- 90%-D internal behaviors: wall-clock rotation rule (independent of playback); OKLab crossfade space; cubic easing (not spring); stability filter (ΔE<10 skips crossfade — would need additional testing to confirm)
- 90%-E tacit knowledge: "atmosphere is content at low spatial frequency" philosophy (Apple Music explicitly does not use palette extraction for the backdrop, only for the chrome — a deliberate philosophical position)

Further research recommended:
- Frame-step the crossfade at 240fps to measure exact duration (current estimate 750ms is rough)
- Test the stability filter by changing to a near-identical track and observing whether the crossfade triggers
- Class-dump MediaPlayer.framework to confirm MPCMediaItemArtworkColorAnalysis is the active analysis class
- Read Saagar Jha's writeups for any references to MediaRemote / NowPlayingUI composition

Reproduction approach:
A faithful peer reproduction requires: a Metal shader for the 4-copy twist (`.layerEffect`-based), a CADisplayLink for continuous rotation tied to wall-clock, an OKLab color interpolation library, and a saliency-weighted palette extractor that takes the salient region of the artwork as input. Full composition plan would emerge from /cartography on "ambient artwork rendering" + /ninety with intentions 1 (compositional lens), 2 (importable material for the saturation values), 4 (recursive exploration of NowPlayingUI), and 7 (taste calibration against the observed crossfade) + /conjecture to assemble.
```

---

<!-- ID: gauge.blind-spot-diagnostics -->
## Blind-Spot Diagnostics — Stepping Outside the Activity

The single most important metacognitive operation in `/gauge` is the structured step outside the immediate gauging activity to ask: **what is my current frame preventing me from seeing?**

This is not "have I done the steps." It is "what step does not yet exist in my framing that should." The blind spots that matter most are the ones invisible from the inside — they are not "I didn't enumerate enough primitives," they are "I didn't recognize that an entire dimension of the problem exists."

### The Meta-Perspective Prompts

After producing the initial gauge output, but before declaring the gauge complete, walk through these prompts. Each is designed to force a vantage shift.

**Prompt 1 — The differently-exposed engineer prompt.** "If a different engineer with completely different exposure came to this same task — say a former Apple SpringBoard engineer who left two years ago, or an iOS engineer who has spent the last year deep in CoreMaterial reverse-engineering — what would they see that I am not currently seeing?"

→ This enables: surfacing dimensions of the problem that your current exposure is structurally blind to. The differently-exposed engineer is a stand-in for the breadth of perspectives that exist; the prompt forces you to acknowledge that your gauge is bounded by your exposure.

**Prompt 2 — The hostile review prompt.** "If a hostile reviewer wanted to argue that my current tier classification is wrong, what evidence would they use? What would they say I am missing?"

→ This enables: detection of self-confirmation bias. Most engineers, when gauging their own work, rate it slightly higher than it actually operates at. The hostile review prompt corrects for this by forcing engagement with disconfirming evidence.

**Prompt 3 — The five-years-later prompt.** "If I look back at this gauge in five years with the cartography and 90% knowledge I will have accumulated by then, what will I see as obvious that I cannot see now?"

→ This enables: recognition that current ignorance is bounded by current exposure, not by the territory itself. Five-years-later-me has a larger vocabulary. The prompt forces present-me to acknowledge the gap rather than assume current exposure is complete.

**Prompt 4 — The wrong-domain prompt.** "Am I treating this as a problem in domain X (e.g., 'animation') when it is actually also a problem in domain Y (e.g., 'gesture handling' or 'cross-process composition' or 'haptic coordination')? What dimensions of this problem are outside the domain frame I have adopted?"

→ This enables: detection of domain truncation. Many iOS problems span multiple domains; gauging only within one domain misses the cross-domain compositional possibilities.

**Prompt 5 — The artifact-tier challenge prompt.** "For external artifacts: if I rated this artifact at Tier X, what evidence would push the rating one tier higher? What would push it one tier lower? Have I sought both forms of evidence?"

→ This enables: balanced assessment of external artifacts. Without the challenge, the gauge defaults to the first plausible rating.

### Named Approaches for Addressing Identified Blind Spots

The meta-perspective prompts surface blind spots. The named approaches address them. For each kind of blind spot the prompts might surface, this skill provides a specific approach.

| Blind spot surfaced | Named approach to address |
|---|---|
| "My primitive enumeration is bounded by my exposure" | Invoke `/cartography` explicitly. It will surface primitives the gauge missed. |
| "I don't know what 90% compositional patterns Apple uses here" | Invoke `/ninety` with the specific question. Frame-step relevant Apple-shipped behaviors. Read escaped artifacts in adjacent domains. |
| "I'm treating this as one-domain when it may be multi-domain" | Explicitly list adjacent domains and re-gauge under each. If a domain spans gesture + animation + material, gauge under all three frames. |
| "I'm rating my work too generously" | Find an Apple-grade shipped artifact in the same domain. Compare side-by-side. The artifact is the ground truth; your work is the test. |
| "I'm rating an external artifact wrong because I don't know what compositional patterns it encodes" | Invoke `/ninety` on the artifact specifically. The audit will surface the patterns. The gauge can then be revised. |
| "I'm operating with a stale framework — the framework's terms have become rote, not active" | Re-read Section XII of the framework markdown — the journey. The pivots are what keep the framework deep. Re-walking them re-activates the framework. |

→ This enables: the engineer is not stuck when the gauge surfaces a blind spot. The skill carries its own toolkit for breaking out of the limited vantage that produced the blind spot.

### When the Gauge Cannot Complete Honestly

Sometimes the gauge surfaces that the engineer does not have enough information to gauge accurately. The honest response is not to produce a confident-sounding placeholder; it is to flag the gap and the approach.

Format: "Cannot gauge with confidence. The information I am missing is [X]. The approach that would close this gap is [Y]. I will mark the gauge as `pending: needs [Y]` and proceed only when [Y] has been performed."

→ This enables: the engineer does not get false confidence from a gauge that papered over its own ignorance. False confidence from a gauge is worse than acknowledged ignorance, because the false confidence leads to architectural decisions made on bad information.

---

<!-- ID: gauge.dimensionality-completeness -->
## Dimensionality Completeness Check

Before declaring the gauge complete, walk through the full dimensionality of the skill's territory. The gauge's territory has multiple dimensions; if any are unexamined, the gauge is incomplete.

The dimensions are:

**Dimension 1 — Mode coverage.** Has the gauge addressed the right mode? Introspective gauges (Mode A) and artifact gauges (Mode B) require different operations. Some situations call for both (gauge my framing AND the artifact I am being asked to reproduce). Check: have I addressed all applicable modes?

→ This enables: catching the failure where the gauge addressed only my framing but the user was asking me to gauge an artifact, or vice versa.

**Dimension 2 — Tier coverage.** Has the gauge classified across the full six-tier ladder (0, 1, 2A, 2B, 3A, 3B), or have I collapsed to fewer tiers? The 2A-versus-2B distinction in particular is often missed; it matters because Tier 2B is the senior-engineer ceiling that 90% awareness breaks through.

→ This enables: catching the failure where the gauge said "senior tier" without distinguishing whether 90% awareness is present.

**Dimension 3 — Intention coverage.** For artifact gauges: have I identified which of the eight intentions for engaging the 90% are operative for this artifact? Most artifacts encode multiple intentions' worth of 90% knowledge; partial intention coverage produces a thin gauge.

→ This enables: catching the failure where the gauge surfaced only the compositional-lens dimension and missed that the artifact also requires importable material, peer rebuild, or philosophical inheritance work.

**Dimension 4 — Manifestation coverage.** For artifact gauges: have I identified which of the five 90% manifestations are encoded in the artifact? An artifact encoding internal compositions + data files + behaviors is structurally different from one encoding only tacit knowledge; missing the distinction produces a thin gauge.

→ This enables: catching the failure where the gauge identified the artifact as Tier 3 without naming the specific 90% manifestations involved.

**Dimension 5 — Domain coverage.** Has the gauge considered all applicable iOS domains? A single artifact might be evaluable as motion + color + material + gesture + cross-process simultaneously; gauging only one domain misses the cross-domain composition.

→ This enables: catching the failure where the gauge classified the artifact within a single domain when it actually spans multiple.

**Dimension 6 — Confidence calibration.** Has the gauge stated its confidence honestly? Vague confidence is a failure mode; "high / medium / low with reasoning" is the discipline.

→ This enables: catching the failure where the gauge produced confident-sounding output that papered over uncertainty.

If any dimension is unexamined, explicitly state: "Dimension X unexamined; running [specific operation] to address before completing." Then run the operation. Then complete the gauge.

→ This enables: the gauge's output is structurally complete across the multi-dimensional territory of the skill, not merely along the dimensions that came to mind first.

---

## Notes on Use

- **Honesty about uncertainty.** When the gauge is uncertain (e.g., can't tell if a tier is 2B or 3A), say so explicitly. The gauge's value comes from the assistant's honest self-assessment, not from confident-sounding placeholders.
- **Tier estimates can be ranges.** "Currently between 2A and 2B" is a valid output if the work spans both.
- **The gauge can fail to gauge.** If the artifact is outside iOS engineering (a backend system, a marketing video), say so and exit. The gauge applies only to the 10/90 framework's domain.
- **The gauge runs fast.** It is not an exhaustive analysis — it is a baseline. The exhaustive work is in `/cartography`, `/ninety`, and `/conjecture`. Don't try to do their work inside `/gauge`.
- **When self-invoked, announce it.** "Self-invoking `/gauge` because a new domain (transitions) entered the conversation." This makes the assistant's reasoning legible to the user.
