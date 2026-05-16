# claude-skills

Personal backup of custom Claude Code skills + accumulated property library.

## What's here

```
.
├── skills/             Custom skills written by me (and the canonical reference doc)
└── property-library/   The personal design-property catalog the skills operate on
```

## What's deliberately NOT here

- `memory/`, `projects/`, settings, hooks — sensitive Claude config
- Third-party-managed skills (symlinks to `~/.agents/skills/`) — re-installed via their source package, not backed up here
- Any local sandboxes or temp data

## Skills suite — Property Lens

The 10-skill suite for property-based design thinking. See `skills/PROPERTY-LENS-SUITE.md` for the canonical reference. Skills:

- `/property-library` — persistent personal catalog
- `/property-extract` — extract a property from a concrete observed reference (de-domained)
- `/property-inquire` — Socratic articulation from a half-formed intuition
- `/exposure` — discovery (targeted topic OR cross-domain pulse)
- `/property-synthesize` — forward design synthesis from intent
- `/complementary` — adjacent polish + perimeter properties + leverage ranking
- `/contamination-check` — audit for non-iOS instincts
- `/level-place` — map a problem onto the L0–L13 taxonomy
- `/feature-pass` — full feature design pass with active research dispatch (orchestrator)
- `/design-lens-check` — lightweight property-first review pass (orchestrator)

## Other skills

The 10/90 framework family:
- `/gauge`, `/cartography`, `/ninety`, `/conjecture`, `/lens-check`

Plus various utility / domain skills (perceptual-deepening, root-cause-tracing, etc.)

## Restore

```bash
git clone git@github.com:matthewharrilal/claude-skills.git ~/.claude-skills-restore
# Then sync into ~/.claude/ deliberately (don't overwrite memory/, projects/, settings/)
```
