# Anti-Questions & Anti-Patterns — Perceptual Auditing

## The Three Laws of Perceptual Questions

Every question in this skill obeys three laws:

1. **The Answer Must Require a Screenshot.** If answerable from CSS/HTML source alone, it's not perceptual.
2. **The Answer Must Be Describable in Plain Language.** No technical vocabulary (px, rem, hex, rgba, flex, grid).
3. **A Non-Designer Must Be Able to Validate the Answer.** If validation requires design expertise, the question tests expertise, not perception.

---

## Anti-Questions: How Rule-Checking Disguises Itself

For each perceptual question, there's an anti-question that LOOKS similar but is answerable without looking at the page. If an agent's answer could have been written from the anti-question, the answer is INVALID.

| PA Question | Anti-Question (INVALID) | Why It's Invalid |
|-------------|------------------------|-----------------|
| PA-01: What bothers you? | "Are all CSS properties correct?" | Answerable from source code |
| PA-02: Text uncomfortable? | "Is font-size >= 16px everywhere?" | Rule check, not perception |
| PA-03: One designer or three? | "Do all components use the same tokens?" | Token compliance ≠ visual coherence |
| PA-04: Where does eye go? | "Does h1 have the highest font-weight?" | Weight ≠ visual hierarchy |
| PA-05: Ship it? | "Do all rules pass?" | Rule compliance ≠ ship-ready |
| PA-06: Words stacking? | "Is min-width set on grid columns?" | CSS check, not visual check |
| PA-10: Squint test balanced? | "Are grid columns equal width?" | Equal width ≠ visual balance |
| PA-14: Columns have room? | "Is container width >= 860px?" | Width value ≠ content fit |
| PA-19: From different website? | "Are all colors in the token palette?" | Palette compliance ≠ visual belonging |

---

## 23 Anti-Patterns: The Complete Taxonomy

### Category A: Cognitive Escape (Agent Flees Perception)

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-01 | **Analytical Escape** | First action after screenshot is reading source code |
| AP-02 | **Grepping for Existence** | Answer could be written without a screenshot |
| AP-03 | **Technical Documentation** | Finding describes CSS properties, not visual experience |
| AP-04 | **Property-Name Answers** | Answer contains CSS property names |

### Category B: Rule-Checking in Disguise

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-05 | **Rule Checking in Disguise** | Answer is a compliance statement, not a visual reaction |
| AP-06 | **Spec Comparison Masquerading** | Answer references a specification value |
| AP-07 | **Pixel-Value Perception** | Answer includes pixel measurements without visual context |
| AP-08 | **Convention Worship** | Convention cited as proof of correctness despite visual evidence |

### Category C: Scope Failures

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-09 | **Component Blindness** | No finding references relationships between elements |
| AP-10 | **Viewport Tunnel Vision** | Only two viewport widths tested in Standalone |
| AP-11 | **Container vs Viewport Blindness** | Media query targets viewport when problem is container width |
| AP-12 | **Self-Reference Blindness** | No reference to industry standards |

### Category D: Completion Failures

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-13 | **Declaring Victory After Writing CSS** | No post-fix screenshot |
| AP-14 | **Premature Ship Declaration** | PA-05 answer is suspiciously fast or formulaic |
| AP-15 | **"Nothing New" Surrender** | Only one dimension examined before declaring clean |
| AP-16 | **Finding-Without-Looking** | Findings match task prompt verbatim but not actual page |

### Category E: Aesthetic Masking

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-17 | **Aesthetic-Usability Blindness** | High rating coexists with element-level problems |
| AP-18 | **Halo Effect** | Assessment focuses only on strongest dimension |

### Category F: Sovereignty Violations

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-19 | **Research Suppression** | Valid perceptual finding dismissed because "convention allows it" |
| AP-20 | **Perceptual Overreach** | Finding attacks a LOCKED decision (the WHAT) rather than execution (the HOW) |
| AP-21 | **Temporal Firewall Breach** | Auditor reads Lock Sheet or specs before completing Cold Look |
| AP-22 | **Post-Lock Revision** | Cold Look or PA answers modified after encountering research context |

### Category G: Scale Distortion

| ID | Anti-Pattern | The Tell |
|----|-------------|----------|
| AP-23 | **Thumbnail-Scale Blindness** | Agent evaluates page from full-page screenshot instead of scrolling through at viewport scale. Problems invisible at thumbnail size are missed — a crushed 130px column looks "fine" when a 15,000px page is compressed to fit one screen. |

---

## Quick Reference: Most Critical Anti-Patterns

**Embed these warnings in EVERY auditor prompt:**

- **AP-01 (Analytical Escape):** Your FIRST action after seeing a screenshot must be describing what you SEE, not opening a CSS file.
- **AP-04 (Property-Name Answers):** If your answer contains any CSS property name, rewrite it in human words.
- **AP-16 (Finding-Without-Looking):** Your findings must come from what you see in screenshots, not from what you expect based on the task prompt.
- **AP-23 (Thumbnail-Scale Blindness):** You MUST scroll through the page section by section. A full-page screenshot hides problems.

**Embed these warnings in EVERY synthesizer/weaver prompt:**

- **AP-08 (Convention Worship):** Do NOT dismiss a valid visual concern because "the convention allows it."
- **AP-19 (Research Suppression):** A valid perceptual finding stands even if conventions are satisfied.
- **AP-17 (Aesthetic-Usability Blindness):** A page can look beautiful overall and still have broken elements.
