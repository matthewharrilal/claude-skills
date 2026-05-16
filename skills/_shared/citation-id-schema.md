<!-- ID: _shared.citation-id-schema -->

# Citation ID Schema — Canonical Source

This file is the **single source of truth** for citation IDs that thread across the 10/90 framework skills. Citation IDs make cross-skill traceability explicit: a `/conjecture` output that references `CARTO-material-03` is naming a specific primitive enumerated in a prior `/cartography` run; a `/ninety` finding tagged `NINETY-gesture-D02` can be cited later without restating the finding.

## Format Specification

Each producing skill uses a stable prefix; each ID is per-domain, per-skill, zero-padded:

- **`CARTO-[domain]-[NN]`** — produced by `/cartography`. One ID per primitive enumerated. Example: `CARTO-material-01`, `CARTO-material-02`, `CARTO-gesture-01`.
- **`NINETY-[domain]-[manifestation-letter][NN]`** — produced by `/ninety`. The manifestation letter (A/B/C/D/E) indicates which of the five manifestations the finding belongs to. Example: `NINETY-material-A01` (first compositional-pattern finding in the material domain), `NINETY-material-B01` (first data-file finding), `NINETY-gesture-D03` (third behavioral-rule finding in the gesture domain).
- **`GAUGE-[domain]-[NN]`** — *proposed for future use*. Will tag specific tier classifications or blind-spot diagnoses so downstream skills can cite which gauge surfaced which concern.
- **`CONJECTURE-[domain]-[NN]`** — *proposed for future use*. Will tag specific load-bearing compositional decisions so subsequent compositions can cite them (or revise them).

## Domain Naming Convention

Domains are **lowercase, hyphenated**, named to match the iOS engineering territory rather than the skill that surfaced them:

- Single-word domains: `material`, `gesture`, `animation`, `color`, `haptic`, `transition`.
- Multi-word domains use hyphens: `color-extraction`, `cross-process-composition`, `ambient-backdrop`, `card-stack`.

Domains are stable across skills — the same domain name is used by `/cartography` and `/ninety` when working on the same iOS territory, so `CARTO-material-*` and `NINETY-material-*` co-reference the same domain.

## Sequence Numbering

- **Two-digit zero-padded** per domain per skill: `01`, `02`, ..., `09`, `10`, `11`, ...
- Numbering restarts at `01` for each new domain or each new producing skill.
- Manifestation letter (in NINETY-* IDs) is part of the numbering scope: `NINETY-material-A01`, `NINETY-material-A02`, `NINETY-material-B01` — the `A` and `B` sub-sequences are independent.

## Consumption Pattern

Downstream skills cite by ID in their output. Examples:

- `/conjecture` referencing a primitive: "Decision uses `CARTO-material-03` (`.layerEffect` with stitchable Metal shader) under the rule `NINETY-material-A02` (compose-then-blur, not blur-per-layer)."
- `/lens-check` Phase 5 coherence test: "For each primitive `/conjecture` uses, is it present in `/cartography`'s enumeration cited by CARTO-* ID? For each 90% rule `/conjecture` cites, is it present in `/ninety`'s findings cited by NINETY-* ID?"

Citations without IDs indicate upstream-skill output was unstructured; that is a flag to re-run the upstream skill with the citation-ID format enforced.
