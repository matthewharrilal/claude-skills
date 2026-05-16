---
name: cartography
description: Enumerate the full macro vocabulary — every public-API primitive (front / middle / latter end of the 10%) that could address a given iOS engineering problem. Maps the landscape at varying documentation levels, surfaces blind spots, makes explicit what is NOT yet enumerated. The skill that ensures the menu is complete before any composition is attempted.
---

# Cartography — The Full Macro Vocabulary

This skill is the **macro mapping** half of the 10/90 framework. Its job is exhaustive: enumerate every public-API primitive (the 10%, at every level of documentation quality) that could plausibly address a given iOS engineering problem. The output is a map of what exists, organized by where it sits on the documentation gradient.

The full framework is documented at `/Users/spacewizardmoneygang/Desktop/XcodeInstall/THE_10_90_FRAMEWORK.md`. Read Section II (The 10% in Detail) before invoking this skill — `cartography` operates entirely within the 10%, and the documentation gradient (front / middle / latter end) is the organizing structure of the skill's output.

**Critical framing:** `cartography` has standalone value independent of any composition that follows. The point is to *see the menu*. An engineer who has not enumerated the cartography for their problem domain is choosing primitives from a truncated menu and does not know what they are missing. The cartography is the antidote to the truncated menu.

---

## Posture Check (Precondition)

<!-- ID: cartography.posture-check -->
<!-- INVARIANT: cartography.posture-check -->
<!-- INHERITS: _shared/posture-check.md -->

Inherits the canonical Posture Check from `_shared/posture-check.md`.

### Output declaration requirement
<!-- ID: cartography.output-declaration -->
<!-- INVARIANT: cartography.output-declaration -->

After performing the Posture Check (per inherited protocol), this skill's output MUST contain an explicit line:

`POSTURE: janum` — when the Janum-tier posture is confirmed.
`POSTURE: senior` — when the senior posture is detected. In this case, halt and recalibrate before producing further output beyond this declaration.

The Stop hook scans for this line to write a session-level posture artifact that downstream skill invocations consult. Skipping this declaration breaks the framework's posture-propagation guarantee.

### Skill-specific addendum

For `/cartography` specifically, the posture determines whether the **latter end of the 10%** is reachable at all. The latter end is exposed but undocumented: SDK headers, framework binaries, escaped artifacts, `nst/iOS-Runtime-Headers`. Janum-tier posture treats this as research territory ("Apple did document it — just not in prose; let me find where") and produces an actionable map. Senior posture treats it as Apple's failure ("Apple should have documented this better") and produces a wish-list of complaints. If the posture is wrong, the enumeration will be thin precisely where it most matters — at the latter end where Janum-tier cartography earns its keep.

---

## What This Skill Concretely Enables
<!-- ID: cartography.concrete-capabilities -->
<!-- INVARIANT: cartography.concrete-capabilities -->

`/cartography` is not invoked to look comprehensive. The effort of enumerating the full 10% landscape — including the laborious latter-end research — only pays off if the engineer can name the concrete capabilities it unlocks. Specifically:

- **The ability to choose primitives from the full menu rather than from your default reach.** Without cartography, you reach for the API you happened to learn first. With cartography, you choose from what actually exists. The difference is between "I used `UIPageViewController` because that's what I know" and "I considered `UIPageViewController`, `UICollectionViewCompositionalLayout` with orthogonal scrolling, custom `UIViewControllerInteractiveTransitioning`, `matchedGeometryEffect`, and `CADisplayLink`-driven progress modeling — and selected X for these specific reasons."
- **The ability to discover compositional pairings you didn't know existed.** Many of the most interesting iOS compositions live in the *pairing* of primitives across categories — `CAFilter` + `CABackdropLayer`, `Vision.saliency` + `CIKMeans`, `CAMetalDisplayLink` + `CAEDRMetadata`. Cartography surfaces these pairings; default-reach engineering does not.
- **The ability to reach into the latter end of the 10% with confidence and risk awareness.** The latter end is exposed but undocumented. Cartography names what is reachable, how it is reached, what risk it carries, and what version stability it has. Without cartography, latter-end engagement is opportunistic and reckless; with cartography, it is calibrated.
- **The ability to detect when a problem actually requires 90% engagement.** Cartography enumerates the 10%. If the enumeration is complete and no combination of public-API primitives accounts for the observable Apple-grade behavior in the domain, the gap is the 90%. This is the signal that `/ninety` must run.
- **The ability to articulate to teammates or future-you what was considered and rejected.** Architectural decisions are most defensible when the alternatives are named. Cartography produces the artifact that records the alternatives — a permanent record of the menu the decision was made from.
- **The ability to recognize new iOS-version capabilities at landing rather than at adoption.** Cartography for a domain is iterative; each iOS release adds primitives and shifts compositions. An engineer with an active cartography re-enumerates on each release and catches new capabilities while they are still novel competitive advantages.

These are the concrete capabilities cartography provides. If after running `/cartography` you cannot point to one of these being newly enabled, the cartography was performed wrong or was not needed.

Each phase of the workflow below, and each section of the output format, includes an explicit statement of what specific capability that operation enables. The capability grounding is what keeps cartography from becoming an exhaustive list with no operational value.

---

## When to Use This Skill

**User-invoked triggers** — the user types `/cartography <problem domain>` when:

- They want to see the full menu for a specific iOS engineering problem ("`/cartography` on card-stack transitions").
- They suspect their (or my) current thinking is operating with an incomplete menu.
- They are about to commit to a primitive and want to verify it is the right choice from the full menu, not a default reach from a truncated one.
- They are gauging an external artifact (via `/gauge`) and want to know what primitives plausibly underpin it.

**Self-invoked triggers** — the assistant invokes `/cartography` automatically when:

- `/gauge` has surfaced a blind spot suggesting the menu is incomplete.
- The assistant is about to commit to a primitive without having enumerated alternatives.
- The user has named a problem domain that has not yet been cartographically mapped in this conversation.
- The assistant notices it has only listed primitives from one level of the documentation gradient (e.g., only front-of-10% APIs) and recognizes the menu may extend deeper.

In all cases, `cartography` runs *before* any decision about which primitive to use, and *before* any 90% dip (`/ninety`). You cannot decide whether to dip into the 90% if you do not yet know whether the 10% alone provides enough.

---

<!-- ID: cartography.documentation-gradient -->
## The Documentation Gradient — The Organizing Structure

The cartography output is always organized by the 10%'s internal documentation gradient. This is the structure that distinguishes `cartography` from a generic "list of APIs" — the gradient itself is the cartographic frame.

<!-- ID: cartography.front-of-10 -->
### Front End of the 10%

**Definition:** ideally documented public APIs. Documentation, sample code, tutorials, WWDC sessions. The kind of API where reading the docs is sufficient to write the call.

**Engineering mode:** read documentation, write call, ship. No experimentation required for normal use.

**For each primitive listed at this level, include:**
- Name and SDK location.
- One-line summary of what it does.
- Documentation quality assessment (canonical / well-documented / officially-supported).
- Whether the primitive can stand alone for the problem domain or needs composition with others.

<!-- ID: cartography.middle-of-10 -->
### Middle of the 10%

**Definition:** documented but sparsely. SDK headers exist. Some documentation exists. But the engineer must experiment to discover production behavior. Apple has officially shipped the API but has not invested in fully documenting it.

**Engineering mode:** read headers carefully, experiment to validate behavior, dig through sample code where available, validate empirically.

**For each primitive listed at this level, include:**
- Name and SDK location.
- One-line summary.
- What documentation exists (WWDC session, release note, header comment).
- What is NOT documented that the engineer will need to experiment to discover.
- Estimated experimentation cost (hours / days) to use this primitive in production.

<!-- ID: cartography.latter-end-of-10 -->
<!-- INVARIANT: cartography.latter-end-of-10 -->
<!-- DEPENDS_ON: _shared/citation-id-schema -->
### Latter End of the 10%

**Definition:** function signatures and class names present in the SDK or in publicly-shipped framework binaries, but with effectively zero useful documentation. Apple has shipped the primitive in a form developers can reach, but using it requires research-level engagement.

**Engineering mode:** reverse-engineer to USE (not to build — the primitive is already there). Read framework binaries, examine class-dumps of public framework classes, validate behavior empirically, accept the documentation absence as part of the work.

**For each primitive listed at this level, include:**
- Name and SDK location (which framework, which header file if accessible).
- One-line summary of what it does, even if speculative based on naming and surrounding context.
- How the primitive is reached (direct API call, `NSClassFromString` + `performSelector`, KVC on a public class, undocumented enum value, etc.).
- Risk assessment — App Store review tolerance, version stability, deprecation likelihood.
- Concrete examples of shipped apps known to use it (where this can be reasonably attributed).
- Specific compositional pairings — what other latter-end-of-10% primitives this one commonly combines with.
- **90%-dependency hint** — does this primitive require 90% awareness to compose correctly? Tagged as: `none` (composes safely from the cartography alone), `light` (some compositional rules from 90% would improve use), `heavy` (cannot be composed correctly without `/ninety` engagement; flag for `/ninety` audit). This annotation is consumed by `/conjecture` to decide whether the conjecture move is required for this primitive.
- **Citation ID** — assign a stable ID in the form `CARTO-[domain]-[NN]` (e.g., `CARTO-material-01`). `/conjecture` cites primitives by this ID to maintain cross-skill traceability.

---

<!-- ID: cartography.workflow -->
## The Skill Workflow

<!-- STEP: cartography.workflow.step-1-define-domain -->
### Phase 1 — Define the Problem Domain

Before enumerating, define the boundaries of the problem precisely. What is the cartography for? Examples:

- "Card-stack carousel transitions in iOS."
- "Ambient color extraction from photo content."
- "Pinch-to-collapse gesture with morph between expanded and minimized states."
- "Material rendering with content-adaptive tinting."
- "Cross-process layer composition for Live Activity Lock Screen widget."

The definition should be specific enough that primitives can be evaluated as in-scope or out-of-scope. Too-broad domains ("animation in iOS") produce sprawling maps; too-narrow domains ("the cornerRadius animation curve") produce trivial maps. Aim for the level where the map is exhaustive within ~3 hours of cartographic effort.

<!-- STEP: cartography.workflow.step-2-enumerate-front -->
### Phase 2 — Enumerate the Front of the 10%

Walk through every well-documented public API that could plausibly address the problem domain. Be exhaustive within the gradient level. Common categories to check:

- **UIKit / SwiftUI primitives** — every documented gesture recognizer, transition coordinator, animation API, layout primitive, view controller pattern.
- **Foundation primitives** — every documented timer, scheduler, queue, observable.
- **CoreAnimation primitives** — every documented layer type, animation class, transaction API.
- **Documented Metal primitives** — every documented MTLDevice/MTLBuffer/MTLTexture/MTLCommandQueue surface.
- **Documented Core Image primitives** — every documented CIFilter, CIContext API, well-known pixel format.
- **Documented Vision / CoreML primitives** — every documented request, observation, model surface.
- **Documented MediaPlayer / AVFoundation primitives** — every documented player, capture, asset API.

For each, ask: "is this in-scope for the problem domain?" If yes, include with the format described above.

<!-- STEP: cartography.workflow.step-3-enumerate-middle -->
### Phase 3 — Enumerate the Middle of the 10%

Walk through every public API that is documented but sparsely. This is the experimentation layer. Common sources to consult:

- **SDK headers** with TODO/UNAVAILABLE comments or sparse documentation.
- **WWDC session videos** that introduce APIs without follow-up sample code.
- **Apple sample code** that uses primitives without documenting them prominently.
- **Release notes** that mention APIs in passing.
- **Documented-but-rarely-used APIs** — the long tail of `CALayer`'s properties, `UIVisualEffectView`'s deeper styles, `Core Image`'s rarely-used filters, `Vision`'s less-common requests.

For each, ask: "what experimentation would be needed to use this in production?" Document that explicitly.

<!-- STEP: cartography.workflow.step-4-enumerate-latter-end -->
### Phase 4 — Enumerate the Latter End of the 10%

This is the cartographic effort that distinguishes Janum-tier cartography from senior cartography. Walk through every primitive that is in the SDK or in publicly-shipped framework binaries but is effectively undocumented. Common categories:

- **`_UI`-prefixed types** reachable via `NSClassFromString` (e.g., `_UIVisualEffectBackdropView`, `_UIPortalView`, `_UIRoundedRectShadowView`).
- **`CAFilter` named recipes** discoverable via framework `strings` analysis or WebKit open-source references (e.g., `colorHueRotate`, `colorMatrix`, `gaussianBlur`, `vibrantColorMatrix`).
- **KVC-accessible private properties on public classes** (e.g., `MPCMediaItemArtworkColorAnalysis` via `valueForKey:@"_colorAnalysis"` on `MPMediaItemArtwork`).
- **Undocumented enum values** in otherwise-public enums.
- **Extended-range pixel formats and color spaces** that exist in the public Metal/CoreGraphics headers but are undocumented (`bgra10_xr`, `bgr10_xr_srgb`, `extendedLinearDisplayP3`).
- **Public C functions with undocumented parameter dictionaries** (`CGImageSourceCopyAuxiliaryDataInfoAtIndex` with auxiliary type constants).
- **CARemoteLayer same-process variants** that work without entitlement.

For each, ask: "is this primitive reachable from App Store code, and at what risk?" Document the access method and the risk profile.

<!-- STEP: cartography.workflow.step-5-surface-blind-spots -->
### Phase 5 — Surface the Blind Spots

The cartographic effort is never complete. The final phase is to **explicitly mark what is NOT yet enumerated**. Categories of blind spot to flag:

- **Recently introduced APIs** (current iOS / pending iOS) that may have shifted the landscape.
- **Cross-framework compositions** where a primitive in one domain (e.g., Vision) pairs with a primitive in another (e.g., Core Image) — these are often missed because cartography is usually domain-bound.
- **Platform variants** (macOS / tvOS / watchOS / visionOS / Catalyst) where a primitive may exist with different documentation.
- **Adjacent gradient levels** that are easy to miss — front primitives that have undocumented modes, middle primitives that have latter-end variants, latter-end primitives whose existence implies other latter-end primitives.
- **Naming conventions and aliases** — the same primitive may exist under multiple names across iOS versions; missing one name misses the primitive.

Be explicit: "I have not enumerated [X]. I would need [research action] to do so."

### Phase 6 — Produce the Output

The structured output organizes everything from Phases 2–5 into a single readable artifact.

---

## Output Format

```
CARTOGRAPHY — [PROBLEM DOMAIN]

=== Front End of the 10% ===

[For each primitive at this level:]
**[Primitive Name]** — [SDK location]
- What: [one-line summary]
- Documentation: [canonical / well-documented]
- Standalone or compositional: [can stand alone / requires composition with X, Y]

=== Middle of the 10% ===

[For each primitive at this level:]
**[Primitive Name]** — [SDK location]
- What: [one-line summary]
- Documented in: [WWDC session / release note / header comment]
- Undocumented aspects: [what experimentation will be needed]
- Experimentation cost: [hours / days estimate]

=== Latter End of the 10% ===

[For each primitive at this level:]
**[Primitive Name]** — [SDK location, framework, header if accessible]
- What: [one-line summary, even if speculative]
- Reached via: [direct call / NSClassFromString / KVC / undocumented enum]
- App Store risk: [low / medium / high — with reasoning]
- Version stability: [stable since iOS X / introduced iOS Y / deprecation likely]
- Known shipped apps using it: [list]
- Common compositional pairings: [what other primitives this combines with]

=== Blind Spots ===

[Explicit list of what was NOT enumerated:]
- [Specific blind spot]: would need [research action] to enumerate.
- [Adjacent domain not searched]: e.g. "I did not look at cross-process composition primitives for this problem; possible candidates include [list].".
- [Recent iOS version primitives I may have missed]: would need [class-dump of current iOS] to verify.

=== Cartographic Confidence ===

Overall confidence in completeness of this cartography: [low / medium / high].
What would increase confidence: [specific next research steps].

=== Sufficiency Check ===

Given the cartography output AND the target tier from `/gauge`:

- Are the enumerated primitives sufficient to produce the target-tier output via pure-10% composition? Specifically: are the primitives with `90%-dependency: none` annotations sufficient alone, or does the work require primitives with `light` or `heavy` annotations?
- If sufficient via pure-10% composition: state explicitly. No `/ninety` needed. `/conjecture` can proceed with cartography output alone.
- If insufficient: state which primitives carry `light` or `heavy` 90%-dependency annotations and what intentions (compositional lens, importable material, philosophical inheritance, etc.) would be relevant for `/ninety` to engage.
- The sufficiency check IS the routing decision for whether `/ninety` is required next.

=== Recommended Next Skill ===

Given the cartography output:
- If a clear primitive emerges from the front or middle of the 10% as sufficient → proceed with that primitive (no further framework skills needed unless the work demands Apple-grade feel).
- If the latter end of the 10% offers candidates that look promising but need 90% awareness to compose correctly → invoke `/ninety` on the relevant compositional patterns.
- If the cartography reveals that no 10% primitive alone suffices and a peer rebuild of a 90% artifact is needed → invoke `/ninety` focused on peer-rebuild intention (Intention 3).
- If a full audit is warranted → invoke `/lens-check`.
```

---

## What Cartography Is Not

To prevent the skill from being misapplied:

- **Cartography is not the 90%.** It maps Apple's intentional cartography only. The 90% is mapped by `/ninety`. If during cartographic enumeration the assistant finds itself naming private framework classes, recipe files, or internal compositions, those belong in `/ninety`'s output, not here.
- **Cartography is not composition.** It maps available primitives without yet wiring them together. The composition is `/conjecture`'s job.
- **Cartography is not gauging.** It does not assess what tier the current thinking operates at; that is `/gauge`'s job. Cartography is invoked *after* gauging if gauging surfaced a menu-completeness concern.
- **Cartography is not opinionated.** It enumerates what exists; it does not yet recommend which primitive to use. The recommendation comes from `/conjecture` after `/ninety` informs the compositional lens.

---

## Worked Example

**Invocation:** `/cartography on "ambient backdrop rendering for a music player's now playing screen"`

**Phase 1 output (problem definition):** ambient backdrop rendering for a music player's now playing screen, encompassing: the visual treatment of the area behind the album artwork; the chromatic relationship between the backdrop and the artwork; the temporal evolution of the backdrop during track changes; the responsiveness to playback state (paused / playing); composability with the chrome elements (controls, scrubber, text) overlaying the backdrop.

**Phase 6 output (the full structured map):**

```
CARTOGRAPHY — Ambient backdrop rendering for music player Now Playing screen

=== Front End of the 10% ===

**UIImageView** — UIKit
- What: display a UIImage with sizing/aspect modes
- Documentation: canonical
- Standalone or compositional: standalone for static; needs animation primitive for temporal evolution

**LinearGradient / RadialGradient (SwiftUI)** — SwiftUI
- What: declarative gradients with named stop arrays
- Documentation: canonical
- Standalone or compositional: standalone; can be composed with .blur or .saturation modifiers

**CAGradientLayer** — QuartzCore
- What: gradient-rendering CALayer with start/end points and color array
- Documentation: canonical, with full property reference
- Standalone or compositional: standalone for chrome gradients; composes with backdrop layers

**UIView.animate(withDuration:)** — UIKit
- What: time-based animation of view properties
- Documentation: canonical
- Standalone or compositional: can drive temporal evolution but limited interruptibility

=== Middle of the 10% ===

**UIVisualEffectView (with .systemThinMaterial and vibrancy styles)** — UIKit
- What: blur-based material rendering with documented style presets
- Documented in: iOS 13 release notes, WWDC 2019 Session 224
- Undocumented aspects: exact blur radius per style, exact color matrix per vibrancy variant, performance characteristics under content load
- Experimentation cost: 2-4 hours to characterize each style empirically

**CAEDRMetadata + CAMetalLayer.wantsExtendedDynamicRangeContent** — QuartzCore + Metal
- What: HDR-capable rendering when display headroom allows
- Documented in: WWDC 2021 session 10161, WWDC 2022 session 10113
- Undocumented aspects: how to coordinate with current EDR headroom, runtime detection of HDR-capable displays
- Experimentation cost: 1-2 days for production-ready HDR backdrop

**CIKMeans / CIColorClustering** — Core Image
- What: image color clustering for palette extraction
- Documented in: WWDC 2017 session 510 (briefly)
- Undocumented aspects: optimal input image size for accuracy/performance tradeoff, behavior with low-saturation images, exact clustering algorithm
- Experimentation cost: 4-8 hours to characterize for music artwork

**VNGenerateAttentionBasedSaliencyImageRequest** — Vision
- What: produces a saliency map identifying where the eye would focus
- Documented in: WWDC 2019 session 222
- Undocumented aspects: exact saliency model used (revisions exist), behavior on abstract artwork vs. photographic
- Experimentation cost: 2-4 hours for music-artwork specific evaluation

**TimelineView(.animation)** — SwiftUI
- What: continuous timeline-driven view updates
- Documented in: WWDC 2022 session 10168
- Undocumented aspects: exact tick rate under various conditions, pause behavior, energy cost
- Experimentation cost: 1-2 hours

**.layerEffect(_:maxSampleOffset:isEnabled:)** — SwiftUI (iOS 17+)
- What: applies a Metal stitchable fragment shader to a view's rendered output
- Documented in: WWDC 2023 session 10257
- Undocumented aspects: maxSampleOffset cost, exact pixel format of input/output, stitching mechanism
- Experimentation cost: 4-8 hours for non-trivial backdrop shader

=== Latter End of the 10% ===

**_UIVisualEffectBackdropView** — UIKitCore (private but reachable)
- What: the actual backdrop renderer inside UIVisualEffectView, with knobs UIVisualEffectView does not expose
- Reached via: NSClassFromString("_UIVisualEffectBackdropView") + KVC for properties like inputSettings, colorMatrix, grayscaleTintAlpha, grayscaleTintLevel, lightenGrayscaleWithSourceOver, inputSaturation
- App Store risk: medium (used by some shipped apps; obfuscation reduces detection)
- Version stability: stable across iOS 13–17, behavior changes in iOS 18+ Liquid Glass system
- Known shipped apps: Spotify (historically), various indie players
- Common compositional pairings: with KVC-mutated CAFilter chain on layer.filters

**CAFilter (private but reachable via NSClassFromString)** — QuartzCore
- What: named filter recipes (gaussianBlur, colorMatrix, vibrantColorMatrix, colorSaturate, plusD, lumaIn, etc.)
- Reached via: NSClassFromString("CAFilter") + filterWithType:
- App Store risk: medium-high — selector strings are detectable but routinely tolerated
- Version stability: very stable since iOS 6; recipe names have been additive only
- Known shipped apps: most apps using "vibrant" effects beyond stock UIVisualEffectView
- Common compositional pairings: applied to layer.filters on a CABackdropLayer-equivalent surface

**MPCMediaItemArtworkColorAnalysis via KVC** — MediaPlayer (private property on public class)
- What: returns the analysis result Apple uses internally to tint Lock Screen Now Playing — backgroundColor, primaryTextColor, secondaryTextColor, tertiaryTextColor
- Reached via: [mediaItemArtwork valueForKey:@"_colorAnalysis"]
- App Store risk: low-medium — KVC on a public class is hard to detect statically
- Version stability: stable since iOS 10
- Known shipped apps: shipped apps that mirror Lock Screen tinting

**bgra10_xr / bgr10_xr_srgb pixel formats** — Metal (public enum, undocumented use)
- What: 10-bit extended range pixel formats for HDR rendering
- Reached via: direct enum constant
- App Store risk: zero
- Version stability: stable since A10 Fusion
- Known shipped apps: most HDR-capable iOS games and media apps
- Common compositional pairings: with CAEDRMetadata on CAMetalLayer

**.layerEffect with stitchable fragment shaders** (iOS 17+)
- Although the modifier itself is middle-of-10%, the stitchable shader composition pattern (multiple shader functions composed via [[ stitchable ]] attribute) is latter-end-of-10% in practice — the documentation is sparse on best practices, performance characteristics, and the SwiftUI::Layer namespace.
- Documented examples are limited; production use requires reverse-engineering Apple's own .layerEffect uses in shipped iOS 17/18 surfaces.

=== Blind Spots ===

- I have not enumerated **AVPlayerLayer**-based backdrop techniques (using video as backdrop). If artwork sources include short video loops (Apple Music animated artwork ships these), this is in-scope and missing.
- I have not enumerated **CoreImage HDR-aware filters** (filters that operate in extendedLinearDisplayP3 working space). Likely relevant for HDR album art.
- I have not enumerated **iOS 18+ Liquid Glass-related public API surfaces**. The new material system likely exposes some primitives I have not yet investigated.
- I have not searched for **CARemoteLayer same-process composition** primitives that might allow the backdrop to sample from the artwork view directly. This is plausibly relevant.
- I have not enumerated **MetalFX**-based upscaling/temporal techniques that could enable lower-resolution backdrop rendering with HDR quality.

=== Cartographic Confidence ===

Overall confidence in completeness: medium. The major primitive categories are covered, but the blind spots above (video-loop backdrops, HDR filters, iOS 18 Liquid Glass, CARemoteLayer, MetalFX) represent meaningful gaps that could change the composition choices.

What would increase confidence:
- Class-dump of current iOS framework binaries for any new CoreMaterial / RenderBox / NowPlayingUI exports.
- WWDC 2024/2025 session review for material-rendering and EDR session updates.
- Frame-step analysis of Apple Music's current Now Playing screen to identify any compositional patterns the cartography does not predict.

=== Recommended Next Skill ===

Given the cartography output:
- Multiple latter-end-of-10% candidates emerged (_UIVisualEffectBackdropView with KVC knobs, CAFilter named recipes, MPCMediaItemArtworkColorAnalysis). Each carries 90% knowledge implications.
- The fact that Apple ships specific compositional patterns (4-copy twist, OKLab crossfade, saturation-weighted clustering) for this exact problem domain indicates the 90% is heavily relevant.
- Recommend: invoke `/ninety` on "ambient backdrop rendering for music players" with focus on Intentions 1 (compositional lens — how does Apple Music compose its backdrop?), 2 (importable material — what recipe files / LUTs apply?), 4 (recursive exploration — class-dump MediaPlayer and NowPlayingUI for the architecture), 6 (philosophical inheritance — what compositional patterns does Wave teach that apply here?), and 7 (taste calibration — frame-step Apple Music to extract specific compositional rules).
- After `/ninety` completes, invoke `/conjecture` to propose the composition.
- For complete audit: `/lens-check`.
```

---

<!-- ID: cartography.blind-spot-diagnostics -->
## Blind-Spot Diagnostics — Stepping Outside the Enumeration

The most dangerous failure mode of cartography is the **silent truncation** — the engineer believes the enumeration is complete when in fact entire categories of primitives have not been considered, because the engineer's exposure does not include them. The truncation is invisible from inside the enumeration; it requires a step-outside operation to surface.

### The Meta-Perspective Prompts

Before declaring the cartography complete, walk through these prompts. Each forces a vantage shift to surface what the in-enumeration vantage cannot see.

**Prompt 1 — The differently-exposed cartographer prompt.** "If a cartographer with completely different framework exposure approached this same problem — say one who specializes in audio-haptic coordination, or one who deeply knows the Vision framework, or one who works primarily with CoreImage — what primitives would they enumerate that I did not?"

→ This enables: surfacing entire categories of primitives that your domain-bias has structurally excluded. The differently-exposed cartographer is a stand-in for the breadth of iOS expertise; the prompt forces you to acknowledge the cartography is bounded by exposure, not by territory.

**Prompt 2 — The cross-domain prompt.** "Have I considered primitives in adjacent domains that might be relevant? If this is a 'transitions' problem, have I enumerated gesture primitives, color/material primitives, audio cue primitives, haptic primitives, that compose into transition experiences? Most non-trivial problems span domains."

→ This enables: detection of domain-truncation. Many iOS problems live at the intersection of domains; cartographying only the dominant domain misses the compositional possibilities that emerge from cross-domain primitive pairings.

**Prompt 3 — The new-iOS-version prompt.** "What did the most recent iOS version add to this domain that may not be in my current cartography? If the current iOS is 18, have I checked iOS 17 → 18 additions? If it is 17, have I checked iOS 16 → 17 additions?"

→ This enables: catching the failure where the cartography reflects an older iOS landscape and missed primitives that landed in the current OS. Apple adds primitives every year; an active cartography re-enumerates.

**Prompt 4 — The escaped-artifact prompt.** "What primitives does Wave or AsyncDisplayKit or another bottled artifact in this domain use that I have not enumerated? Each escaped artifact is a curated list of primitives an Apple-trained engineer found worth using; the curation is signal."

→ This enables: detection via reverse-cartographying — looking at what curated bottled artifacts actually call and treating their callsites as a primitive shortlist worth investigating.

**Prompt 5 — The shipped-Apple-grade-app prompt.** "What shipped App Store app in this domain operates at Tier 3 (Dot, Halide, Things, Arc Search, Bear, etc.)? What primitives are they using that I have not enumerated? Their callsites are observable in some cases via class-dumping their own binaries."

→ This enables: surfacing primitives that ship-grade engineers have validated as worth using but my own cartography missed.

**Prompt 6 — The platform-variant prompt.** "Has my cartography considered platform variants? iPad-specific primitives, watchOS-specific, tvOS-specific, visionOS-specific, Catalyst variations? Sometimes a primitive exists in one platform variant first and is informative even if we are shipping iOS-only."

→ This enables: detection of platform-bias truncation, especially for cross-platform features (the iPad pointer adaptation Janum worked on is the canonical example — primitives there inform iOS gesture work).

### Named Approaches for Addressing Identified Blind Spots

Each blind-spot category surfaced by the prompts has a specific approach to address it. The cartography is incomplete; here is how to extend it.

| Blind spot surfaced | Named approach to address |
|---|---|
| "I do not have exposure to primitives in domain Y" | Cross-domain research: scan SDK headers for framework Y, read its WWDC sessions, check `nst/iOS-Runtime-Headers` for Y's runtime types. Add the relevant primitives to the cartography. |
| "I have not enumerated cross-domain pairings" | Explicit pairings phase: take the primitives enumerated in this cartography and ask, for each pair (P1, P2), "do P1 and P2 compose in a way relevant to this problem?" |
| "I have not checked the current iOS version's additions" | Re-read the most recent iOS's WWDC sessions for the relevant domains. Check Apple Developer release notes. Class-dump the dyld shared cache from the current iOS Simulator runtime. |
| "I have not consulted bottled artifacts" | Read Wave's source, AsyncDisplayKit's source, or another bottled library's source for this domain. List every public-API symbol they call. Cross-reference against my enumeration. |
| "I have not observed which primitives shipped Apple-grade apps use" | If accessible: class-dump the shipped app's binary. If not: examine API symbols statically (strings in the binary, framework dependencies). Frame-step the app's behavior and infer which primitives could produce that behavior. |
| "I have not considered platform variants" | Cross-platform cartography pass: check the same domain in iPadOS, watchOS, tvOS, visionOS, Catalyst. Note which primitives exist in one but not the other. |
| "The latter end of my cartography is thin — I haven't done the research effort" | Commit explicit research time: a few hours of class-dumping the relevant private frameworks, framework-binary `strings` extraction, KVC enumeration on public classes via runtime introspection. The latter end requires investment; without the investment, the latter end is always thin. |

→ This enables: cartography is not stuck at the level of the initial enumeration. The skill carries its own toolkit for extending the cartography when blind spots are surfaced.

### When the Cartography Cannot Complete Honestly

When the cartography surfaces that an entire dimension is unexplored, the honest output is acknowledgment plus approach:

"Cartography incomplete in dimension X. I have not enumerated [specific category] because [reason — typically exposure or research budget]. To complete: [specific research action]. Marking cartography as `partial: pending [action]`. Composition decisions made before completion should be flagged as `tentative pending cartographic update`."

→ This enables: downstream work (composition, conjecture) is informed by an honest map. False confidence in a truncated cartography produces architecturally fragile compositions; acknowledged partiality produces decisions appropriately scoped to current knowledge.

---

<!-- ID: cartography.dimensionality-completeness -->
## Dimensionality Completeness Check

Before declaring the cartography complete, walk through the multi-dimensional territory of the skill. Each dimension is a check that the cartography has covered something that could otherwise be silently omitted.

**Dimension 1 — Documentation gradient coverage.** Has the cartography enumerated primitives at all three levels (front, middle, latter end)? The most common truncation is stopping at the middle. The latter end requires explicit research; without it, the cartography is structurally incomplete.

→ This enables: the cartography honestly reflects the full 10% rather than the engineer's reach-comfort zone.

**Dimension 2 — Category coverage.** Has the cartography considered all primitive categories relevant to the domain? UIKit, SwiftUI, AppKit (for Catalyst), QuartzCore, CoreAnimation, CoreImage, Metal, MetalKit, MetalPerformanceShaders, Vision, Speech, NaturalLanguage, MediaPlayer, AVFoundation, AVKit, CoreHaptics, CoreMotion, CoreLocation, CoreBluetooth, MultipeerConnectivity, NetworkExtension, BackgroundTasks, WidgetKit, ActivityKit, AppIntents, IntentsUI, etc. Most domains touch only a subset, but the subset is often larger than the engineer's initial framing.

→ This enables: cross-framework cartography. Many of the most interesting compositions span frameworks; category truncation misses them.

**Dimension 3 — Compositional pairing coverage.** Has the cartography considered which pairs of enumerated primitives commonly compose? The pairings are often more interesting than the individual primitives. Cartography that lists primitives without noting their pairings is structurally thin.

→ This enables: the cartography supports composition reasoning, not just enumeration.

**Dimension 4 — Platform variant coverage.** Has the cartography considered iPadOS-specific, watchOS-specific, tvOS-specific, visionOS-specific, Catalyst-specific primitives where relevant? Even iOS-only projects often benefit from awareness of how a primitive works on adjacent platforms.

→ This enables: cross-platform compositional possibilities, which often inform iOS-specific work.

**Dimension 5 — Version coverage.** Has the cartography stated which iOS version it reflects? Have iOS-version-specific additions been called out separately so the cartography ages gracefully?

→ This enables: the cartography is dated and re-derivable. A cartography that does not state its iOS version becomes stale invisibly.

**Dimension 6 — Risk coverage.** For latter-end primitives, has the cartography stated App Store review risk, version stability, and deprecation likelihood? Latter-end primitives without risk metadata are useless for decision-making.

→ This enables: the engineer can evaluate whether to ship a latter-end primitive based on quantified risk, not on intuition.

**Dimension 7 — Source attribution.** Has the cartography noted, for each primitive, how it was discovered (SDK headers, class-dump, WWDC, framework binary `strings`, escaped artifact, shipped app)? Source attribution lets future cartography updates know where to look.

→ This enables: cartography is an iterable artifact, not a one-shot snapshot.

If any dimension is unexamined, state explicitly: "Dimension X unexamined; [specific action] would address." Then perform the action (within budget) or flag the gap as outstanding.

→ This enables: the cartography is structurally complete across the territory it covers, not merely along the dimensions that came to mind first.

---

## Notes on Use

- **Cartography is iterative.** A first pass produces a map with confidence "medium." Each subsequent research dip (class-dump, framework binary inspection, WWDC archaeology) increases confidence. Track confidence explicitly.
- **Cartography is comparable to a literature review in academic research.** Its job is to survey what exists, not to argue for any particular use. Save the argumentation for `/conjecture`.
- **When a domain has been cartographically mapped before in the conversation, reference the prior map rather than re-enumerating from scratch.** State explicitly: "Cartography for this domain was performed earlier in conversation; updating with [new findings since]."
- **Cartography is not a substitute for `/ninety`.** The latter end of the 10% surfaces primitives whose correct use depends on 90% knowledge. Cartography names them; `/ninety` enables their correct composition.
- **When the cartography reveals that the front of the 10% alone suffices,** be honest about that. Not every problem needs latter-end-of-10% or 90% engagement. The cartography's job is to surface what exists; if the problem genuinely only needs `UIView.animate`, say so and exit.
