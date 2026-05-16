---
name: contamination-check
description: Reactive audit that flags non-iOS instincts (web/Android/Material) in code or design and names iOS-native equivalents
---

# /contamination-check

Audits code, a screenshot, or a design description for non-iOS instincts (web / Android / Flutter / Material patterns) that bled in, and surfaces the iOS-native equivalent for each finding.

## When to invoke

- Reviewing your own code that originated in web/Android instinct
- Pre-shipping audit of a feature surface
- Onboarding a teammate from another platform; reviewing their iOS work together
- Sanity-check before merging a PR from a non-iOS developer
- After porting a feature from web/Android to iOS — verify the port didn't carry instincts with it
- Quick gut-check when something "looks slightly off" but you can't name why

## When NOT to invoke

- You're designing fresh, not auditing — use `/property-synthesize` or `/feature-pass`
- You want to find new references — use `/exposure`
- You're polishing perimeter — use `/complementary`
- You want to articulate a half-formed intuition about your own design — use `/property-inquire`

## Input

Code, screenshot, design description, or component file. Examples:
- "Here's my settings screen — does it feel iOS-native?"
- A pasted code snippet (SwiftUI or UIKit)
- A SwiftUI/UIKit file path
- A Figma frame description or screenshot

## Output

Flagged items + suggested iOS-native equivalents. Per-finding format:

- **Finding:** what was reached for
- **Why it reads as non-iOS:** the instinct origin (web / Android / Material / Flutter / iOS-6 era)
- **iOS-native equivalent:** what to reach for instead (with property-library reference where applicable)
- **Severity:** load-bearing (worth fixing before ship) vs cosmetic (note for later)

## Common contamination patterns this skill catches

- **Border-heavy hierarchy** (web/Material instinct) — tonal step + system materials (`.regularMaterial`, `.thinMaterial`) are iOS-native
- **Hover states** (web) — press states are iOS-native; iOS has no concept of hover outside iPad-with-pointer
- **Full-screen modals** (web) — sheets with detents (`.sheet`, `.presentationDetents`) are iOS-native
- **Hardcoded font sizes** (web/Android) — semantic text styles (`.body`, `.title`) + Dynamic Type are iOS-native
- **Custom icon sets** (any) — SF Symbols are iOS-native; gain free symbol effects, weight matching, and locale variants
- **Material Design shadows / elevation tiers** (Android) — blur materials and tonal step are iOS-native
- **Tab-bar overuse** (Android) — iOS reserves the tab bar for true top-level pillars; nested or 6+ tabs read as Android
- **Sidebar on iPhone** (web/Mac instinct) — not iOS-native for primary phone navigation; sidebar is iPad/Mac
- **Custom hamburger menus** (Android) — tab bar or settings-tucked-in-profile is iOS-native
- **Page-curl effects, skeuomorphism** (iOS-6 instinct) — flat surfaces with materials are modern iOS-native
- **Center-weighted bottom CTAs ignoring safe area** (web) — safe-area-aware positioning + bottom inset respect
- **"Loading…" text spinners** (Android/web) — skeleton loading or content-shaped placeholders are iOS-native
- **Confirmation dialogs everywhere** (Android/Windows) — destructive action + undo (toast/snackbar) is iOS-native idiom
- **Snackbars / toasts at bottom** (Android) — iOS uses inline status, navigation-bar prompts, or system-provided affordances
- **Floating action buttons (FABs)** (Material) — iOS uses navigation-bar trailing item, tab-bar center, or contextual menus
- **Bottom-sheet built from scratch** (Android) — `UISheetPresentationController` / `.presentationDetents` are iOS-native
- **Back arrow drawn manually** (Android) — system-provided back chevron via `UINavigationController` is iOS-native
- **Drawer navigation** (Android/web) — split view (iPad), tab bar (iPhone), or sidebar on regular width

## Process

1. Receives input (code / screenshot / description)
2. Scans for known contamination patterns (above list, expandable)
3. For each finding, identifies:
   - The non-iOS instinct origin
   - The iOS-native equivalent (with property reference where applicable)
   - Severity assessment (load-bearing vs cosmetic)
4. Returns structured report
5. For high-severity findings, optionally chains into `/property-synthesize` on the iOS-native alternative

## Composes with

- `/property-library` — findings reference iOS-native properties from the library where they exist
- `/property-synthesize` — for each finding, synthesize can be invoked to deepen the iOS-native alternative
- `/design-lens-check` — this skill is one stage of the review orchestrator
- `/level-place` — useful when a finding spans multiple levels (e.g. modal pattern is L4 + L7)

## Example invocation

User pastes a SwiftUI settings screen using `Button` with custom hover modifiers, a full-screen `.fullScreenCover` for editing a single field, and `RoundedRectangle` borders around every row.

Skill returns three findings:

1. **Finding:** hover modifier on Button. **Origin:** web. **iOS-native:** press state via `ButtonStyle` with `configuration.isPressed`. **Severity:** cosmetic on iPhone, load-bearing on iPad-with-pointer.
2. **Finding:** `.fullScreenCover` for single-field edit. **Origin:** web modal instinct. **iOS-native:** `.sheet` with `.presentationDetents([.medium])`. **Severity:** load-bearing — wrong modality breaks navigation expectations.
3. **Finding:** `RoundedRectangle` borders on every row. **Origin:** web/Material card hierarchy. **iOS-native:** grouped/inset list style (`.listStyle(.insetGrouped)`) — tonal step does the work. **Severity:** load-bearing for native feel.

## Anti-patterns

- Flagging things that are LEGITIMATELY non-standard but intentional (some apps deliberately deviate; respect stated intent)
- Cosmetic-only findings that don't actually break iOS-native feel — keep the signal-to-noise high
- Generic "this is bad" without naming the iOS-native alternative — every finding must offer the replacement
- Treating audit as judgment rather than alignment-aid — the skill helps you align to iOS conventions, not shame the author
- Auto-applying fixes — the skill flags and recommends; the author decides
- Re-flagging items the author has explicitly marked as deliberate deviations
