# CLAUDE.md — Perceptual Auditing Skill Configuration

## Three Protocols

| Protocol | Files | Use When |
|----------|-------|----------|
| **v3: Perceptual Audit** (DEFAULT) | `GATES.md` + `PROTOCOL.md` + `TEAM.md` | Ship-readiness audits with binary gates and team structure |
| **v2: Perceptual Auditing** | `SKILL.md` + `EMBEDDED-PROMPT.md` + `ANTI-QUESTIONS.md` | Legacy — superseded by v3 for all audit/build/fix work |
| **v1: Perceptual Deepening** | (in perceptual-deepening skill) | You have a REFERENCE IMAGE to match (iterative comparison) |

**v3 is the DEFAULT for all audit, build, and fix work.** v2 is retained for backward compatibility but v3 should always be preferred. v1 (perceptual-deepening) activates only when reference images are available.

---

## Slash Commands

| Command | Protocol | Description |
|---------|----------|-------------|
| `/ship [page]` | v3 Standalone | Full perceptual audit — 7 gates, 28 questions, team structure |
| `/judge [page]` | v3 Standalone | Alias for /ship |
| `/look [page]` | v3 Quick | 60-second gut check — Tier 1 questions, ship verdict |
| `/audit [pages...]` | v3 Batch | Multi-page audit with cross-page synthesis |
| `/perceptual-audit [target]` | v3 (mode flag) | Default quick; `--mode standard`, `--mode standalone`, `--mode standalone --fix` |

---

## Trigger Phrases

### v3 (Perceptual Audit) — activates on:
- "Would you ship this?"
- "Does this look right?"
- "Visual judgment on [page]"
- "Perceptual audit of [page]"
- "Why does this look wrong?"
- "This doesn't look right"
- "Check this page visually"
- "Is this good?"
- "Audit these pages"
- ANY agent producing visual output (automatic Embedded Mode)

---

## Mandatory Embedded Mode (Q1-Q3)

**CRITICAL: Embedded Mode is MANDATORY for every agent that produces visual output.**

The embedded prompt block is in `PROTOCOL.md` Section 9. It MUST be included in:
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
  │  "Did the agent DO the right things?"
  │  MUST pass before Layer 2.
  │
Layer 2: Structured Judgment (PROTOCOL.md Sections 6-7)
  │  Bounded options. Choose from list.
  │  "What is the agent's ASSESSMENT?"
  │  MUST pass before Layer 3.
  │
Layer 3: Free Perception (PROTOCOL.md Sections 3-5)
     Open-ended perceptual questions.
     "What does the agent SEE?"
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

## Legacy v2 Files (retained, not primary)

| File | Purpose |
|------|---------|
| `SKILL.md` | v2: Complete skill definition — questions, protocols, team architecture, prompt templates |
| `EMBEDDED-PROMPT.md` | v2: Standalone Q1-Q5 block for embedding in agent prompts (now superseded by PROTOCOL.md Section 9 Q1-Q3) |
| `ANTI-QUESTIONS.md` | v2: Anti-questions + 23 anti-patterns reference (now in PROTOCOL.md Section 8) |

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
