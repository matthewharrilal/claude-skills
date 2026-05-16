---
name: property-inquire
description: Socratic articulation of a half-formed design intuition into a named, library-ready property
---

# /property-inquire

Surface and name a held design property through structured back-and-forth questioning, starting from intuition alone — no concrete reference required.

## When to invoke

- "Something about [observation] feels right but I can't name it"
- Stuck between two design options and can't articulate why one feels better
- Vague sense that a property matters but no reference to anchor it
- Mid-implementation, something feels off but you can't pinpoint why
- "I keep reaching for X in different features — what's underneath that habit?"
- A teammate's design lands and your own doesn't, but you can't say what differs

## When NOT to invoke

- You have a concrete reference (app, screenshot, video) → use `/property-extract` (faster, structured around the artifact)
- You need design output, not articulation → use `/property-synthesize`
- You want references to study → use `/exposure`
- You already know the property name and want to find it → use `/property-library query`

## Input

A half-formed intuition. The looser, the better — this skill exists precisely because you can't yet say it cleanly. Could be:

- "Something about how [App X] does [Y] feels good but I don't know what"
- "These two options both work but one feels better — why?"
- "I'm building [feature] and something doesn't sit right"
- "I keep wanting to add [vague gesture] but can't justify it"

## Output

A named property (potentially nuanced) plus a decision on whether to add to the library. The skill ends with one of:

- A property name + brief sketch the user agrees with → optional `/property-library add`
- A **tension** between two adjacent properties the user is actually feeling — both named
- Acknowledgment that the intuition **isn't a property yet** — needs more observation, no forced name

## Process — Socratic structure

The skill is conversational. It asks; user answers; it asks again. Typical question sequence:

1. **Locate the feeling.** Where does the intuition show up? "When you reach for it, what are you about to add, remove, or change?"
2. **Describe the observation.** Concrete, sensory: what does the eye see, what does the hand do, what does the screen look like?
3. **Test by absence.** What would feel wrong? Strip the candidate quality away — what breaks?
4. **Find cousins.** What other apps, contexts, or even non-software experiences give the same feeling? (Aim for 2-3 distant cousins to verify portability.)
5. **De-domain.** Strip the source domain entirely. What does this property let you *do* that has nothing to do with [chat / lyrics / onboarding / wherever it surfaced]?
6. **Mechanism check (gently).** What mechanism comes to mind? Then push back: is the mechanism the property, or just one delivery? Force the property up a layer.
7. **Name candidates.** Propose 2-3 candidate names. User picks, refines, or rejects.
8. **Confirm or release.** Does the user feel "yes, that's it"? If hesitant — name the tension or stop. Forcing a name corrupts the library.

The skill **stops short** when the intuition isn't ready. "Not yet a property — log this as an observation, return when you have a second instance" is a valid terminal state.

## Composes with

- `/property-library` — Socratic output may be added here on confirmation; query first to check for duplicates
- `/property-extract` — different starting condition; extract assumes a reference, inquire assumes only intuition. If a reference surfaces during the dialogue, the skill can pivot.
- `/property-synthesize` — once a property is named, synthesize can apply it forward to a design problem
- `/exposure --topic` — if the intuition needs more grounding observations before naming, exposure can surface references in the relevant area

## Example invocation

> **User:** /property-inquire — there's something about how Things 3 handles the "today" view that I keep wanting in my own app, but I can't say what.
>
> **Skill:** When you imagine "what I want," what does the screen look like in your head? What's there, what's not?
>
> **User:** It's quiet. Nothing is shouting at me. I see what I need and nothing else.
>
> **Skill:** "Nothing shouting" — is that about visual loudness (color, size, weight) or about quantity (less stuff on screen)?
>
> **User:** Both, but mostly loudness. There's stuff there, it just doesn't compete.
>
> **Skill:** What would feel wrong? Picture the opposite — a "today" view that violates this. What's different?
>
> **User:** Everything would have equal weight. Every item would have a colored tag, a due date, a priority chip — all at the same visual volume.
>
> **Skill:** Where else have you felt this same quality? Doesn't have to be a todo app.
>
> **User:** Linear's issue list, kind of. And Apple Notes when you have a clean note open. Maybe Letterboxd's profile page.
>
> **Skill:** Strip the domain. What is this property letting you *do* that has nothing to do with tasks, issues, or notes?
>
> **User:** Letting my eye land somewhere without being recruited everywhere first.
>
> **Skill:** Candidate names: (1) **single-focus surface** — the page commits to one thing your eye should reach. (2) **non-competing density** — multiple items present but none demand attention. (3) Or this might be the same as **focus-through-subtraction** (already in library) seen at L8 (screen level) instead of L2.
>
> **User:** It's not quite focus-through-subtraction — nothing is being demoted. They're already quiet. It's more like (1).
>
> **Skill:** Want to add **single-focus surface** to the library? Levels: L8, L10. Related: focus-through-subtraction (adjacent but distinct — subtraction demotes the non-focal; single-focus-surface prevents the non-focal from being loud in the first place).
>
> **User:** Yes, add it.

## Anti-patterns

- **Jumping to mechanism.** "Sounds like you want less padding" — stay at the property layer. Mechanism is `/property-synthesize`'s job.
- **Forcing a name.** If the user is hesitant after 3 candidates, the intuition isn't a property yet. Log as observation, suggest `/exposure --topic` or "return when you have a second instance."
- **Skipping de-domain.** A property named only in its source domain ("the Things 3 quietness") won't transfer. Always strip the domain before confirming.
- **Collapsing tensions.** If the user is actually feeling two properties in tension (e.g., density vs. air), name both — don't pick one and discard the other.
- **Duplicating library entries.** Always check `/property-library query` for adjacent names before adding. Refine the existing entry if it's the same property at a new level.
- **Letting the skill monologue.** It's a dialogue. One question at a time, wait for the answer, follow the thread the user opens.
