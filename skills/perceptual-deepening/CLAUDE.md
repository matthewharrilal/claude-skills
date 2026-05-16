# CLAUDE.md — Perceptual Deepening Skill Configuration

## Three Protocols

| Protocol | Files | Use When |
|----------|-------|----------|
| **v3: Perceptual Audit** (DEFAULT) | `GATES.md` + `PROTOCOL.md` + `TEAM.md` | Ship-readiness audits with binary gates and team structure |
| **v1: Perceptual Deepening** | `SKILL.md` | You have a REFERENCE IMAGE to match (iterative comparison) |
| **v2: Visual Judgment** | `SKILL-v2.md` | Legacy — superseded by v3 for audit work |

**v3 is the DEFAULT for all audit, build, and fix work.** v1 activates only when reference images are available. v2 is retained for backward compatibility but v3 should be preferred.

---

## Slash Commands

| Command | Protocol | Description |
|---------|----------|-------------|
| `/ship [page]` | v3 Standalone | Full perceptual audit — 7 gates, 28 questions, team structure |
| `/judge [page]` | v3 Standalone | Alias for /ship |
| `/look [page]` | v3 Quick | 60-second gut check — Tier 1 questions, ship verdict |
| `/audit [pages...]` | v3 Batch | Multi-page audit with cross-page synthesis |
| `/soul [component]` | v1 Full | Reference-matching perceptual deepening (requires reference image) |
| `/perceive [component]` | v1 Full | Alias for /soul |
| `/squint [ref] [attempt]` | v1 Quick | Quick squint test comparison against reference |

---

## Trigger Phrases

### v3 (Perceptual Audit) — activates on:
- "Would you ship this?"
- "Does this look right?"
- "Visual judgment on [page]"
- "Perceptual audit of [page]"
- "Why does this look wrong?" (if no reference available)
- "This doesn't look right"
- "Check this page"
- "Audit these pages"
- ANY agent producing visual output (automatic Embedded Mode)

### v1 (Perceptual Deepening) — activates on:
- "Extract soul from [component]"
- "Make this match the reference"
- "Perceptual deepening on [component]"
- "Why does this look wrong?" (if reference IS available)

---

## Mandatory Embedded Mode (Q1-Q3)

**CRITICAL: Embedded Mode is MANDATORY for every agent that produces visual output.**

The embedded prompt block is in PROTOCOL.md Section 9. It MUST be included in:
- Every builder agent prompt
- Every fixer agent prompt
- Every visual auditor prompt
- Every verifier prompt

The block requires agents to answer Q1-Q3 before declaring done:
- Q1: "What's the first thing that bothers me?"
- Q2: "Is any text uncomfortable to read?"
- Q3: "Would a designer ship this as-is?"

If an agent's report is missing these answers, the work is INCOMPLETE.

---

## v3 Key Files (the active protocol)

| File | Purpose | Lines |
|------|---------|-------|
| **`GATES.md`** | 7 binary validation gates — automated, blocking, no exceptions | The most critical file |
| **`PROTOCOL.md`** | 28 questions, cold look, anti-patterns, sovereignty, language rules | The audit protocol |
| **`TEAM.md`** | Team topologies, agent prompts, Playwright management, execution checklist | How to run audits |

### Three-Layer Architecture

```
Layer 1: Binary Gates (GATES.md)
  │  Automated. Blocking. YES/NO.
  │  MUST pass before Layer 2.
  │
Layer 2: Structured Judgment (PROTOCOL.md Sections 6-7)
  │  Bounded options. Choose from list.
  │  MUST pass before Layer 3.
  │
Layer 3: Free Perception (PROTOCOL.md Sections 3-5)
     Open-ended perceptual questions.
     The skill's core value.
```

### The Seven Gates (Quick Reference)

| Gate | When | Check |
|------|------|-------|
| 1: PLAYWRIGHT ALIVE | Pre-flight | Can navigate and screenshot? |
| 2: SCREENSHOT EXISTS | Per-auditor | >= 6 PNG files? |
| 3: COLD LOOK LOCKED | Per-auditor | Cold-look file written before findings? |
| 4: PERCEPTUAL LANGUAGE | Per-auditor | < 4 CSS property names in findings? |
| 5: SYSTEMIC SYNTHESIS | After 3+ pages | Cross-page synthesis file exists? |
| 6: FIX TRIGGER | After all audits | Severe verdicts? Must propose fixes. |
| 7: INDEPENDENT VERIFICATION | After fixes | Non-fixer verification report exists? |

---

## Legacy Files (v1/v2 — retained, not primary)

| File | Purpose |
|------|---------|
| `SKILL.md` | v1: Reference-matching perceptual deepening protocol |
| `SKILL-v2.md` | v2: Ship-readiness visual judgment (superseded by v3) |
| `EMBEDDED-PROMPT.md` | v2: Standalone Q1-Q3 block (now in PROTOCOL.md Section 9) |
| `TURBO-ORCHESTRATOR.md` | v1: Full orchestrator prompt for reference matching |
| `QUICK-INVOKE.md` | v1: Copy-paste invocation options |
| `PERCEPTUAL-DEEPENING-PROTOCOL.md` | v1: Deep philosophy + forcing questions |
| `prompts/ZONE-SUB-AGENTS.md` | v1: Zone agent definitions |
| `templates/` | Log and discovery templates |
| `scripts/` | Setup scripts |
| `tests/` | Playwright test specs |

---

## The One Rule

> **Look at the page. Would you ship it?**
>
> Every other rule, checklist, convention, and specification exists to serve
> the design. The moment rules prevent you from seeing that a column is too
> narrow or text is unreadable, the rules have failed. This skill ensures
> that visual judgment is never suppressed by rule-checking.
>
> v3 adds: **and the 7 gates ensure that agents actually LOOK.**
