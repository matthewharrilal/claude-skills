# /deep-build — Deterministic Multi-Pass Corpus Integration Pipeline

## What to do

Run the deep-build orchestrator to build a designed HTML page through deterministic multi-pass corpus integration.

Parse the content file path from the command argument. If no path provided, ask the user.

### Usage

```bash
node /Users/spacewizardmoneygang/Desktop/Claude-Research-And-Tips/tools/deep-build/dist/cli.js --content {CONTENT_PATH}
```

### Options
- `--content <path>` — Path to content markdown file (required unless --resume)
- `--dry-run` — Validate config and print execution plan without running
- `--resume <path>` — Resume from existing state.json
- `--subset <N>` — Run only subset N (1-7)
- `--skip-phase-a` — Skip corpus integration, run PA hardening only
- `--help` — Show usage

### What it does
Runs 56-104 deterministic `claude -p` calls to build a designed HTML page:
- Phase 0: TC derivation + content analysis
- Phase A: 7 subsets × 8 passes of corpus integration
- Phase B: Up to 3 PA hardening cycles with 9 auditors each
