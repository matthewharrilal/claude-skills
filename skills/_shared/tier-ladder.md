<!-- ID: _shared.tier-ladder -->

# Tier Ladder — Canonical Source

This file is the **single source of truth** for the six-tier ladder used across every 10/90 framework skill. The ladder is the framework's most diagnostic tool: given an iOS app, identify the tier it operates at and you can predict both its UX quality and its engineering ceiling. Given an engineer's practice, identify their tier and you can predict what they can build.

The full developmental treatment is in Section VI of `THE_10_90_FRAMEWORK.md`. The reconciled summary below is what consuming skills cite. When the two diverge, the framework markdown is the deeper source; this file is the operationally-cited summary.

The ladder has six rungs: **0, 1, 2A, 2B, 3A, 3B**. They are not strictly sequential (a developer can jump 1 → 2B by going straight into deep API exploration), but the most-common progression climbs them in order.

## Tier 0 — Does Not Work With the 10%

**Profile.** Builds iOS apps without engaging the iOS SDK directly. Uses a cross-platform framework (React Native, Flutter, Ionic) for the entire app. UI primitives are whatever the cross-platform framework exposes — usually a lowest-common-denominator approximation of native.

**UX outcome.** Obviously non-native to anyone with developed iOS taste. Scroll inertia is wrong. Tap feedback is delayed by a frame. Materials are chromatically off. Reviews cite "feels like a web view."

**Why operate here.** Usually a business decision (cross-platform reach with one codebase) or a skill background (web/backend engineer who hasn't invested in native iOS). The ceiling is structural — no work within the cross-platform framework reaches Tier 3.

## Tier 1 — Beginning End of the 10% Only

**Profile.** Works exclusively with the ideally-documented surface of UIKit/SwiftUI. Reads documentation, follows tutorials, ships the app. Has not pushed past documentation into SDK-header experimentation.

**UX outcome.** Functional and recognizably native, but undifferentiated. Transitions are abrupt `UIView.animate` calls. Gestures are basic (`UITapGestureRecognizer`, `UISwipeGestureRecognizer`). The app reads as the median App Store app — not bad, not exceptional.

**Why operate here.** Early career, or a context where the business case for above-median UX has not been made. The ceiling is competent shippable apps that do not distinguish on craft.

## Tier 2A — Middle of the 10%

**Profile.** Reads SDK headers when documentation is insufficient. Experiments to validate behavior. Uses `UIViewPropertyAnimator` for interruptibility, `UIVisualEffectView` with custom vibrancy, `Vision` for image analysis, `UIKeyboardLayoutGuide`. Recognizably "senior" within most teams.

**UX outcome.** Noticeable polish above Tier 1. Interruptible animations. Material backgrounds. Saliency-aware image cropping. Spring-driven gesture handoff. Reads as well-designed; reviewers cite the polish positively.

**Why operate here.** Has invested past Tier 1 and shipped at this level for years. The ceiling is very good third-party iOS apps that still feel "third-party" — anyone with developed taste can identify the work as senior-engineer rather than Apple-internal.

## Tier 2B — Pushes Into Latter End of 10% Without 90% Awareness

This is the most important pre-Janum tier. The engineer here has pushed past the middle of the 10% into the latter end — `_UI`-prefixed types, `CAFilter` named recipes, KVC on private properties of public classes, `CADisplayLink`-driven animation. They know more public-API surface than most senior engineers. **But they have not engaged with the 90% as a distinct knowledge stratum.**

**Profile.** Treats the 10% as a single thing — "the public API surface" — and prides themselves on the deep end of it. Has instantiated `_UIVisualEffectBackdropView`. Has called `CAFilter(name: "colorMatrix")`. Has read class-dumps of public framework binaries. Visibly above Tier 2A. Has not absorbed Wave's compositional philosophy. Has not extracted `.materialrecipe` bytes. Does not have the distinction between *awareness* and *access*.

**UX outcome.** Technically sophisticated. Custom Metal shaders. `CADisplayLink`-driven animation. Cross-process composition via `_UIPortalView`. Impressive to other engineers ("how did you do that?"). **But side by side with Wave-tier work, the difference is visible:** springs feel arbitrary because the engineer has the substrate but not the velocity-preservation rule; materials are tinted but the matrices are ad-hoc, not the specific Apple recipes; color extraction is in RGB rather than OKLab.

**Why operate here.** Exceptional senior engineers who have hit the natural ceiling of pure-10% mastery and not yet recognized the 90% exists. Most engineers who reach Tier 2B stay there indefinitely because the gap to Tier 3 is *conceptual* (the awareness shift), not technical (the skills are already in hand). The engineer often wishes Apple would expose more — `MTMaterialView`, a documented `CAFilter`, a public `UIWallpaperColorAnalysisResult`. The wait is permanent.

**Ceiling.** Excellent third-party iOS apps. Visibly above-average, visibly the work of a skilled senior engineer. **Not Apple-grade.**

## Tier 3A — Latter End of 10% With Some 90% Awareness

**Profile.** Has begun to engage the 90% but has not fully integrated it as the operational lens for everything. Knows about `.materialrecipe` files. Has read Wave's source. Has started frame-stepping Apple's interactions. The awareness is **intermittent**, not continuous. Will dip into the 90% when stuck, but most days operates within the 10% and only returns when an obstacle drives them back.

**UX outcome.** Stretches of Tier 3 quality interspersed with stretches of Tier 2B quality. Features that received 90% attention shine; features that didn't are visibly less polished. The app is inconsistent — reviewers praise the peaks, implicitly critique the valleys.

**Why operate here.** Has made the awareness shift but has not yet converted intermittent dipping into daily practice. The work to do is making the research pipeline habitual.

## Tier 3B — Janum-Tier, Full Integration

**Profile.** Has integrated the framework completely. Cartography (10% deep end plus continuously-growing 90% vocabulary), mechanics (deep primitive understanding), taste (calibrated against Apple-grade output), and the conjecture move (composing 10% under the 90% lens) are all present simultaneously and applied reflexively. Daily research pipeline runs without effort. Class-dumps and recipe-extracts within the first week of each new iOS.

**UX outcome.** The app feels like Apple shipped it. Springs preserve velocity through retarget. Materials use the exact `colorMatrix` bytes Apple uses for the equivalent surface. Gestures encode progress as 0-to-1. Color crossfades happen in OKLab. Ambient palettes derive from saliency-weighted analysis. Cross-process composition is implemented where entitlements permit, peer-rebuilt where they don't.

**Why operate here.** Has made the framework an operational practice. The research pipeline is daily, the conjecture move is reflexive, the bottling work is ongoing. Most engineers do not reach Tier 3B because the awareness shift from Tier 2B requires explicit recognition that the 90% is a distinct knowledge stratum.

**Ceiling.** Apple-grade. With sustained practice, every subsequent app the engineer ships is at this tier, because the bottle (the accumulated library) elevates every downstream app to the same depth automatically.
