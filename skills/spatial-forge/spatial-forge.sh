#!/usr/bin/env bash
# spatial-forge.sh v8 — Enrichment engine: SKILL as deepening, shell as logistics
#
# Usage:
#   ./spatial-forge.sh <content-path> [iterations] [port] [pa-interval] [shake-interval]
#
# Arguments:
#   content-path   Path to the content markdown file (required)
#   iterations     Number of forge iterations (default: 10)
#   port           HTTP server port (default: 8787)
#   pa-interval    Run a perceptual audit every N iterations (default: 8)
#   shake-interval Trigger scheduled shake-up every N iterations (default: 50, effectively
#                  disabled — plateau-triggered shake-ups still fire automatically at 3
#                  consecutive stalls). PA grade is the sole stopping gate.
#
# Prerequisites:
#   - Run from the project root (where design-system/ lives)
#   - agent-browser must be installed (npm install -g agent-browser && agent-browser install)
#   - claude CLI must be installed and authenticated
#   - perl must be available (stock macOS includes it)
#
# Examples:
#   ./spatial-forge.sh ~/content/essay.md              # 10 iters, PA every 8th
#   ./spatial-forge.sh ~/content/essay.md 25            # 25 iterations
#   ./spatial-forge.sh ~/content/essay.md 25 8787 8     # PA every 8th iteration (default)
#   ./spatial-forge.sh ~/content/essay.md 25 8787 5     # PA every 5th (more frequent)
#   ./spatial-forge.sh ~/content/essay.md 25 8787 8 10  # scheduled shake-up every 10th
#
# To continue a previous session (same content, same date):
#   Just run again — the script detects existing build dirs and resumes.
#
# NOTE: Parallel instances on the same project root are NOT supported.
#   The pkill patterns and port usage would conflict.
#
# Key design decisions (see git history for full changelog):
#   - PA interval minimum 3, default 5 since v4.1
#   - Scheduled shake-ups default 50 (effectively disabled; plateau auto-detect at 3 stalls)
#   - SKILL.md inlined into prompt (no Skill tool dependency, since v2)
#   - Enrichment engine: 98-line SKILL.md core, logistics injected by shell, PA-only stopping

# v8 changes (enrichment engine):
#   - SKILL.md rewritten as enrichment engine: 98 lines core (+ 124 Initial Build Guide,
#     trimmed after iteration 1). Content that naturally deepens the builder's relationship
#     with the content on every re-application.
#   - MOVED TO SHELL INJECTION: PA Protocol, Notebook instructions, Looking Protocol,
#     Checkpoint format, Shake-Up Protocol. These are logistics that produce the same
#     response regardless of page state — they belong in the prompt header.
#   - NEW in SKILL: "The Work" section — loss detection, swap test, content-form coupling,
#     8 perceptual dimensions (structural, temporal, material, chromatic, typographic,
#     behavioral, relational, atmospheric), generative loop concept.
#   - SKILL ratio: 64% enrichment, 17% constraints, 19% structure
#     (was: 65% logistics, 23% enrichment, 11% constraints in v7)
#   - Philosophy: the SKILL is what enriches the HTML page. The shell is the iteration
#     mechanism that circumvents context rot by re-applying the SKILL through fresh agents.
#     The SKILL must naturally enrich rather than start over when re-applied.
#
# v7 changes (radical reduction — preserved from v7):
#   - REMOVED: Convergence detection, compose stance, taste check threshold,
#     creative direction injection, 5 dead TRIM-stripping sed patterns
#   - Notebook injection: windowed (first + last 8 entries)
#   - Stopping condition: PA grade A- only
#   - Root cause: instruction volume inversely correlates with output quality.

set -euo pipefail

# === CONFIGURATION ===
# All tunable parameters in one place. Override via CLI arguments where supported.
DEFAULT_MODEL="claude-opus-4-6"
DEFAULT_PA_INTERVAL=5
DEFAULT_SHAKE_INTERVAL=50
DEFAULT_BUILD_TIMEOUT=2400     # 40 minutes
DEFAULT_PA_TIMEOUT=1200        # 20 minutes
DEFAULT_SHAKEUP_TIMEOUT=1800   # 30 minutes (fresh-eyes + competitive alts sequentially)
DEFAULT_DERIVE_TIMEOUT=600     # 10 minutes
DEFAULT_HARD_MAX=100
STALL_THRESHOLD=3              # Consecutive stalls before plateau detection
NOTEBOOK_WINDOW=8              # Max recent entries injected (first entry always included)

# Global tracking variables (used by cleanup trap and inter-iteration cleanup)
CURRENT_PGID=""
TAIL_PID=""
TIMER_PID=""
STALL_COUNT=0
DEFERRED_SHAKEUP=false
DEFERRED_SHAKEUP_REASON=""
SHAKEUP_COUNT=0
SHAKEUP_PROPOSALS=0

# Timing tracking (SH-035)
TOTAL_BUILD_TIME=0
TOTAL_PA_TIME=0
BUILD_COUNT=0
PA_COUNT=0
FORGE_START_TIME=$(date +%s)


# Helper: kill the tail -f live display.
# Pipeline uses process substitution so $TAIL_PID IS the tail -f process directly.
# Killing it closes the pipe, the >(while...) subshell gets EOF and exits on its own.
kill_tail_pipeline() {
  if [[ -n "${TAIL_PID:-}" ]]; then
    kill "$TAIL_PID" 2>/dev/null || true
    wait "$TAIL_PID" 2>/dev/null || true
    TAIL_PID=""
  fi
}

# ─── Arguments ────────────────────────────────────────────────────────

CONTENT_PATH="${1:?Usage: spatial-forge.sh <content-path> [iterations] [port] [pa-interval] [shake-interval]}"
MAX_ITERATIONS="${2:-10}"
PORT="${3:-8787}"
PA_INTERVAL="${4:-$DEFAULT_PA_INTERVAL}"
SHAKE_INTERVAL="${5:-$DEFAULT_SHAKE_INTERVAL}"
MODEL="${DEFAULT_MODEL}"

# Apply configuration defaults
BUILD_TIMEOUT=$DEFAULT_BUILD_TIMEOUT
PA_TIMEOUT=$DEFAULT_PA_TIMEOUT
SHAKEUP_TIMEOUT=$DEFAULT_SHAKEUP_TIMEOUT
DERIVE_TIMEOUT=$DEFAULT_DERIVE_TIMEOUT
HARD_MAX_ITERATIONS=$DEFAULT_HARD_MAX

# Validate numeric arguments
if ! [[ "$MAX_ITERATIONS" =~ ^[0-9]+$ ]] || (( MAX_ITERATIONS < 1 )); then
  echo "Error: iterations must be a positive integer (got: $MAX_ITERATIONS)"
  exit 1
fi
if ! [[ "$PA_INTERVAL" =~ ^[0-9]+$ ]] || (( PA_INTERVAL < 3 )); then
  echo "Error: pa-interval must be >= 3 (got: $PA_INTERVAL). PA every 1-2 iterations starves research."
  exit 1
fi
if ! [[ "$PORT" =~ ^[0-9]+$ ]]; then
  echo "Error: port must be a number (got: $PORT)"
  exit 1
fi
if ! [[ "$SHAKE_INTERVAL" =~ ^[0-9]+$ ]] || (( SHAKE_INTERVAL < 3 )); then
  echo "Error: shake-interval must be >= 3 (got: $SHAKE_INTERVAL)."
  exit 1
fi

# Resolve absolute content path
CONTENT_PATH="$(cd "$(dirname "$CONTENT_PATH")" && pwd)/$(basename "$CONTENT_PATH")"

if [[ ! -f "$CONTENT_PATH" ]]; then
  echo "Error: Content file not found: $CONTENT_PATH"
  exit 1
fi

# ─── Project Root Detection ──────────────────────────────────────────

PROJECT_ROOT="$(pwd)"

# Detect design-system directory
DESIGN_SYSTEM_DIR=""
if [[ -d "${PROJECT_ROOT}/design-system" ]]; then
  DESIGN_SYSTEM_DIR="${PROJECT_ROOT}/design-system"
elif [[ -d "${PROJECT_ROOT}/../design-system" ]]; then
  DESIGN_SYSTEM_DIR="$(cd "${PROJECT_ROOT}/../design-system" && pwd)"
fi

if [[ -z "$DESIGN_SYSTEM_DIR" ]]; then
  echo "Warning: design-system/ directory not found."
  echo "Research absorption will be unavailable."
  echo "Run this script from the project root (where design-system/ lives)"
  echo ""
  DESIGN_SYSTEM_DIR="NOT_FOUND"
else
  echo "[setup] Design system found: ${DESIGN_SYSTEM_DIR}"
fi

# ─── S6-08: Manifest File Path Resolution ──────────────────────────
# Verify key manifest files exist at startup. Warn but don't error if missing.
if [[ "$DESIGN_SYSTEM_DIR" != "NOT_FOUND" ]]; then
  MANIFEST_MISSING=0
  MANIFEST_CHECKED=0

  # Tier 1 critical files (must exist for research sprint to work)
  TIER1_FILES=(
    "compositional-core/grammar/mechanism-catalog.md"
    "validated-explorations/density/DD-006-fractal.html"
    "research/R2-CREATIVE-LAYOUTS.md"
    "research/R3-DENSITY-DIMENSIONS.md"
    "validated-explorations/combination/CD-006-pilot-migration.html"
    "research/R4-AXIS-INNOVATIONS.md"
    "compositional-core/case-studies/DD-006-fractal.md"
    "validated-explorations/organizational/OD-006-creative.html"
  )

  for f in "${TIER1_FILES[@]}"; do
    MANIFEST_CHECKED=$((MANIFEST_CHECKED + 1))
    if [[ ! -f "${DESIGN_SYSTEM_DIR}/${f}" ]]; then
      echo "[warning] Manifest Tier 1 file missing: ${f}"
      MANIFEST_MISSING=$((MANIFEST_MISSING + 1))
    fi
  done

  # Spot-check a few Tier 2 files
  TIER2_SPOT=(
    "research/R1-DOCUMENTATION-PATTERNS.md"
    "research/R5-COMBINATION-THEORY.md"
    "validated-explorations/density/DD-003-islands.html"
    "axis/AD-006-compound.html"
    "compositional-core/components/components.css"
  )

  for f in "${TIER2_SPOT[@]}"; do
    MANIFEST_CHECKED=$((MANIFEST_CHECKED + 1))
    if [[ ! -f "${DESIGN_SYSTEM_DIR}/${f}" ]]; then
      echo "[warning] Manifest Tier 2 file missing: ${f}"
      MANIFEST_MISSING=$((MANIFEST_MISSING + 1))
    fi
  done

  if (( MANIFEST_MISSING == 0 )); then
    echo "[setup] Manifest verification: ${MANIFEST_CHECKED}/${MANIFEST_CHECKED} checked files present"
  else
    echo "[warning] Manifest verification: ${MANIFEST_MISSING}/${MANIFEST_CHECKED} checked files MISSING"
    echo "[warning] Research absorption may be degraded — missing files will be skipped"
  fi
fi

# ─── Read Skill Content ─────────────────────────────────────────────

SKILL_PATH="${HOME}/.claude/skills/spatial-forge/SKILL.md"
if [[ ! -f "$SKILL_PATH" ]]; then
  echo "Error: SKILL.md not found at $SKILL_PATH"
  exit 1
fi

# Read skill content — will be inlined into the prompt
SKILL_CONTENT="$(cat "$SKILL_PATH")"
echo "[setup] Loaded SKILL.md ($(wc -l < "$SKILL_PATH" | tr -d ' ') lines)"

# Resolve claude CLI once (not per-iteration)
CLAUDE_BIN="$(which claude 2>/dev/null)" || true
if [[ -z "$CLAUDE_BIN" ]]; then
  echo "Error: claude CLI not found on PATH."
  exit 1
fi
echo "[setup] Claude CLI: ${CLAUDE_BIN}"

# Verify perl is available (used for process group management)
if ! command -v perl &>/dev/null; then
  echo "Error: perl is required for process group management but was not found."
  exit 1
fi

# Verify agent-browser is available (used for screenshot capture)
if ! command -v agent-browser &>/dev/null; then
  echo "Error: agent-browser CLI not found. Install: npm install -g agent-browser && agent-browser install"
  exit 1
fi
echo "[setup] agent-browser: $(agent-browser --version 2>/dev/null || echo 'installed')"

# Verify jq is available (used for JSONL live display)
if ! command -v jq &>/dev/null; then
  echo "Error: jq is required for JSONL log display but was not found."
  echo "Install: brew install jq (macOS) or apt-get install jq (Linux)"
  exit 1
fi

# ─── Derive names ────────────────────────────────────────────────────

CONTENT_NAME="$(basename "$CONTENT_PATH" .md)"
DATE="$(date +%Y-%m-%d)"
BUILD_DIR="${PROJECT_ROOT}/ephemeral/builds/${CONTENT_NAME}-forged-${DATE}"
LOG_DIR="${BUILD_DIR}/_logs"

CONVICTION_BRIEF_FILE="${BUILD_DIR}/_conviction-brief.md"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  SPATIAL FORGE v8 — Enrichment Engine                       ║"
echo "╠══════════════════════════════════════════════════════════════╣"
echo "║  Content:      $(basename "$CONTENT_PATH")"
echo "║  Iterations:   ${MAX_ITERATIONS} (guideline) / ${HARD_MAX_ITERATIONS} (hard max)"
echo "║  PA interval:  every ${PA_INTERVAL}th iteration (first PA at iter 5+)"
echo "║  Shake-ups:    every ${SHAKE_INTERVAL}th iteration + auto-detect plateau"
echo "║  Port:         ${PORT}"
echo "║  Output:       ${BUILD_DIR}/"
echo "║  Design Sys:   ${DESIGN_SYSTEM_DIR}"
echo "║  Model:        ${MODEL}"
echo "║  Build timeout: ${BUILD_TIMEOUT}s  PA timeout: ${PA_TIMEOUT}s  Shake-up: ${SHAKEUP_TIMEOUT}s"
echo "║  Stop condition: PA grade A- (max: ${HARD_MAX_ITERATIONS})"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# ─── Setup (once) ────────────────────────────────────────────────────

mkdir -p "${BUILD_DIR}/_screenshots"
mkdir -p "${LOG_DIR}"

# S5-04/S5-05: Copy Tier 1-2 exploration references for shake-up agents
mkdir -p "${BUILD_DIR}/_references"
if [[ "$DESIGN_SYSTEM_DIR" != "NOT_FOUND" ]]; then
  echo "[setup] Copying Tier 1-2 exploration references..."
  # Tier 1 density explorations
  for f in DD-006-fractal DD-003-islands DD-004-layers DD-005-rivers; do
    cp "${DESIGN_SYSTEM_DIR}/validated-explorations/density/${f}.html" "${BUILD_DIR}/_references/" 2>/dev/null || true
  done
  # Tier 1-2 combination explorations
  for f in CD-006-pilot-migration; do
    cp "${DESIGN_SYSTEM_DIR}/validated-explorations/combination/${f}.html" "${BUILD_DIR}/_references/" 2>/dev/null || true
  done
  # Tier 1-2 organizational explorations
  for f in OD-006-creative OD-001-conversational OD-005-spatial; do
    cp "${DESIGN_SYSTEM_DIR}/validated-explorations/organizational/${f}.html" "${BUILD_DIR}/_references/" 2>/dev/null || true
  done
  # AD files are at axis/ (NOT validated-explorations/axis/)
  for f in AD-006-compound AD-002-f-pattern AD-003-bento-grid; do
    cp "${DESIGN_SYSTEM_DIR}/axis/${f}.html" "${BUILD_DIR}/_references/" 2>/dev/null || true
  done
  REF_COUNT=$(ls "${BUILD_DIR}/_references/"*.html 2>/dev/null | wc -l | tr -d ' ')
  echo "[setup] Copied ${REF_COUNT} exploration references to _references/"
fi

# Copy content source if not already there
if [[ ! -f "${BUILD_DIR}/_content-source.md" ]]; then
  cp "$CONTENT_PATH" "${BUILD_DIR}/_content-source.md"
  echo "[setup] Copied content source to ${BUILD_DIR}/_content-source.md"
fi

# Create empty checkpoint if not exists
if [[ ! -f "${BUILD_DIR}/_checkpoint.md" ]]; then
  touch "${BUILD_DIR}/_checkpoint.md"
  echo "[setup] Created empty checkpoint"
fi

# Initialize conviction brief if not exists
if [[ ! -f "$CONVICTION_BRIEF_FILE" ]]; then
  touch "$CONVICTION_BRIEF_FILE"
  echo "[setup] Created empty conviction brief"
fi

# Initialize notebook file if not exists
NOTEBOOK_FILE="${BUILD_DIR}/_notebook.md"
if [[ ! -f "$NOTEBOOK_FILE" ]]; then
  touch "$NOTEBOOK_FILE"
  echo "[setup] Created empty builder notebook"
fi

# Detect content size for large-content mode
CONTENT_LINES=$(wc -l < "$CONTENT_PATH" | tr -d ' ')
CONTENT_BYTES=$(wc -c < "$CONTENT_PATH" | tr -d ' ')
LARGE_CONTENT=false
if (( CONTENT_LINES > 800 || CONTENT_BYTES > 40000 )); then
  LARGE_CONTENT=true
  echo "[setup] Large content detected (${CONTENT_LINES} lines, ${CONTENT_BYTES} bytes)"
  echo "[setup] Progressive disclosure will be recommended to the builder"
fi

# ─── HTTP Server ─────────────────────────────────────────────────────

# Kill any existing server on this port
lsof -ti:"${PORT}" 2>/dev/null | xargs kill -9 2>/dev/null || true
sleep 0.5

# Verify port is actually free
if lsof -ti:"${PORT}" &>/dev/null; then
  echo "Error: Port ${PORT} is still in use after cleanup attempt."
  exit 1
fi

# Start server
python3 -m http.server "${PORT}" --directory "${BUILD_DIR}" &>/dev/null &
SERVER_PID=$!
sleep 1

# Verify server started
if ! kill -0 "$SERVER_PID" 2>/dev/null; then
  echo "Error: Failed to start HTTP server on port ${PORT}"
  exit 1
fi
echo "[setup] HTTP server started on port ${PORT} (PID: ${SERVER_PID})"

# Clean any lingering agent-browser session from previous runs
echo "[setup] Cleaning any lingering agent-browser session..."
agent-browser close 2>/dev/null || true
echo "[setup] Browser cleanup complete."

# Cleanup on exit — kills ALL tracked processes
cleanup() {
  # Block further signals during cleanup and disable set -e
  trap '' INT TERM
  set +e

  echo ""
  echo "[cleanup] Stopping all processes..."

  # Kill tail -f pipeline (uses pkill -f to find the tail process by log file path)
  kill_tail_pipeline

  # Kill the runner's process group if running
  if [[ -n "${CURRENT_PGID:-}" ]]; then
    kill -- -"$CURRENT_PGID" 2>/dev/null || true
    sleep 1
    kill -9 -- -"$CURRENT_PGID" 2>/dev/null || true
  fi

  # Kill the timer if running
  if [[ -n "${TIMER_PID:-}" ]]; then
    kill "$TIMER_PID" 2>/dev/null || true
  fi

  # Close agent-browser session
  agent-browser close 2>/dev/null || true

  # Kill HTTP server
  kill "$SERVER_PID" 2>/dev/null || true
  wait "$SERVER_PID" 2>/dev/null || true

  # Belt-and-suspenders: kill any children of this script
  pkill -P $$ 2>/dev/null || true

  # Clean temp files
  rm -f /tmp/spatial-forge-prompt.* /tmp/spatial-forge-runner.* /tmp/spatial-forge-derive.* 2>/dev/null || true

  echo "[cleanup] Done."
}
trap cleanup EXIT INT TERM

# ─── Timeout Helper ──────────────────────────────────────────────────

# Runs a command with a timeout using process groups (perl setsid).
# Usage: run_with_timeout <seconds> <command> [args...]
# Returns the command's exit code, or 124 if timed out.
run_with_timeout() {
  local timeout_secs="$1"; shift
  local start_time=$(date +%s)

  # Run command in its own process group via setsid
  perl -e 'use POSIX qw(setsid); setsid(); exec @ARGV' -- "$@" &
  local cmd_pid=$!
  CURRENT_PGID=$cmd_pid  # PGID equals leader PID

  # Polling timer (checks every 2s, no long-sleep orphan problem)
  (
    local elapsed=0
    while (( elapsed < timeout_secs )); do
      sleep 2
      elapsed=$(( elapsed + 2 ))
      if ! kill -0 "$cmd_pid" 2>/dev/null; then
        exit 0  # Process died on its own
      fi
    done
    echo ""
    echo "[timeout] Killing iteration after ${timeout_secs}s"
    kill -- -"$cmd_pid" 2>/dev/null
    sleep 2
    kill -9 -- -"$cmd_pid" 2>/dev/null
  ) &
  TIMER_PID=$!

  # Wait for command
  wait "$cmd_pid" 2>/dev/null
  local exit_code=$?

  # Kill the timer (do NOT wait — it exits within 2s on its own)
  kill "$TIMER_PID" 2>/dev/null || true

  # Clear globals
  CURRENT_PGID=""
  TIMER_PID=""

  # Early exit detection
  local elapsed=$(( $(date +%s) - start_time ))
  if (( elapsed < 5 && exit_code != 0 )); then
    echo "[warning] Process exited in ${elapsed}s with code ${exit_code} — likely failed to start"
  fi

  # Detect timeout kill
  if [[ $exit_code -eq 137 || $exit_code -eq 143 ]]; then
    return 124
  fi
  return $exit_code
}

# Runner script creation function (DRY — used for both build and PA)
create_runner_script() {
  local script_path="$(mktemp /tmp/spatial-forge-runner.XXXXXX)"
  cat > "$script_path" <<RUNNER_HEREDOC
#!/usr/bin/env bash
PROMPT_CONTENT="\$(<"\$1")"
${CLAUDE_BIN} --model ${MODEL} --dangerously-skip-permissions --verbose --output-format stream-json --include-partial-messages -p "\$PROMPT_CONTENT" > "\$2" 2>&1
RUNNER_HEREDOC
  chmod +x "$script_path"
  echo "$script_path"
}

# ─── Helper Functions (SH-013, SH-014, SH-015, SH-020, SH-012) ─────

# Start JSONL live display pipeline for a log file (SH-013)
# $1 = log file path
start_live_display() {
  local log_file="$1"
  touch "$log_file"
  tail -f "$log_file" > >(while IFS= read -r line; do
    echo "$line" | jq -r 'select(.type == "assistant") | .content // empty' 2>/dev/null
  done) &
  TAIL_PID=$!
}

# Run a claude agent with prompt, timeout, and live display (SH-014)
# $1 = prompt content (string), $2 = log file path, $3 = timeout seconds
# Returns the exit code of the agent invocation
run_claude_agent() {
  local prompt_content="$1"
  local log_file="$2"
  local timeout="$3"

  local prompt_file="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
  printf '%s' "$prompt_content" > "$prompt_file"
  local runner_script="$(create_runner_script)"

  start_live_display "$log_file"

  set +e
  run_with_timeout "$timeout" bash "$runner_script" "$prompt_file" "$log_file"
  local exit_code=$?
  set -e

  kill_tail_pipeline
  rm -f "$prompt_file" "$runner_script"

  return $exit_code
}

# Inject existing findings content for BS-30 append protection (SH-015)
# $1 = existing findings content (may be empty)
inject_bs30_findings() {
  local existing_findings="$1"
  if [[ -n "$existing_findings" ]]; then
    cat <<BS30_EXISTING

The output file already contains content from previous agents. You MUST preserve it.
Use the Write tool to write the COMPLETE file: the existing content below, followed by
your new section. Do NOT read the file — the content is provided here.

<existing-findings-content>
${existing_findings}
</existing-findings-content>

APPEND your section after the existing content above. Your section format:
BS30_EXISTING
  else
    cat <<'BS30_NEW'

Use the Write tool to write your findings to the output file. Your section format:
BS30_NEW
  fi
}

# ─── Prompt Builders ─────────────────────────────────────────────────

# The forge prompt (building iterations) — skill content inlined
# $1 = iteration number, $2 = max iterations
build_forge_prompt() {
  local iter_num="$1"
  local iter_max="$2"

  # Part 1: Variable-expanded header
  cat <<FORGE_HEADER
You are executing the /spatial-forge skill for an iterative spatial deepening build.

This is iteration ${iter_num} of ${iter_max}.
You are iteration ${iter_num}. When you write your checkpoint and log output, refer to yourself
as iteration ${iter_num}. Do not use internal pass numbering that contradicts the iteration number
the orchestrator assigned you.

## Status Markers
You MUST output these markers as plain text between tool calls. This is how the orchestrator
tracks your progress. If the log file has no markers, the orchestrator assumes you stalled.
Print each marker BEFORE the corresponding phase — not at the end as a summary.

Output these markers as you work:
  [FORGE] Reading checkpoint...
  [FORGE] Reading PA findings...  (if _pa-findings.md exists)
  [FORGE] Reading shake-up findings...  (if _shake-up-findings.md exists)
  [FORGE] PA DEBT: N critical findings to fix before other work
  [FORGE] Fixing PA finding 1/N: [brief description]...
  [FORGE] PA finding 1/N verified: VISIBLE / NOT VISIBLE
  [FORGE] Reading content source...
  [FORGE] Reading page CSS...
  [FORGE] Absorbing research file N...  (only if no PA debt)
  [FORGE] Taking screenshots...
  [FORGE] Identifying visual problems (found N)...
  [FORGE] Fixing visual problems (N changes)...
  [FORGE] Validating CSS syntax...
  [FORGE] Verifying changes visually...
  [FORGE] Page height: Npx (previous: Npx)
  [FORGE] Writing checkpoint...
  [FORGE] Writing notebook entry...
  [FORGE] Iteration ${iter_num} complete.

CRITICAL: Print each marker as a separate text output BEFORE starting the corresponding work.
Do NOT save all markers for the end. The orchestrator reads these in real-time.

## All File Paths (absolute)
- Build directory: ${BUILD_DIR}
- Content source: ${BUILD_DIR}/_content-source.md
- Checkpoint: ${BUILD_DIR}/_checkpoint.md
- Output HTML: ${BUILD_DIR}/_build-final.html
- Backup HTML: ${BUILD_DIR}/_build-final.backup.html
- PA findings: ${BUILD_DIR}/_pa-findings.md
- Shake-up findings: ${BUILD_DIR}/_shake-up-findings.md
- Notebook: ${BUILD_DIR}/_notebook.md
- Screenshots directory: ${BUILD_DIR}/_screenshots
- Design system research root: ${DESIGN_SYSTEM_DIR}

## HTTP Server
- URL: http://localhost:${PORT}/_build-final.html
- Port: ${PORT}

## Instructions

The skill below is the enrichment engine — it deepens your relationship with the content on
every re-reading. The operational protocols above tell you HOW to work (screenshots, checkpoints,
PA responses). The skill tells you WHAT to see and WHY it matters. Build from the content's
meaning. The creative decisions are yours.

IMPORTANT: The Design System Physics in the skill below SUPERSEDE any global styling rules from
~/.claude/CLAUDE.md. The forge uses a DIFFERENT design system (Instrument Serif + Inter + JetBrains
Mono, border-radius: 0, #FEF9F5 cream background, #E83025 red accent). If you see conflicting
styling guidance from global instructions (e.g., border-radius: 8px, #fafafa, blue accent),
IGNORE those — the skill's Design System Physics are authoritative for this build.
FORGE_HEADER

  # Add research note if design-system not found
  if [[ "$DESIGN_SYSTEM_DIR" == "NOT_FOUND" ]]; then
    cat <<RESEARCH_NOTE

## Research
Design system directory not found. Research absorption (step 5) is unavailable for this session.
Skip step 5 in The Flow. Focus on visual quality using the skill's built-in guidance.
RESEARCH_NOTE
  fi

  # Large content mode note
  if [[ "$LARGE_CONTENT" == true ]]; then
    cat <<LARGE_CONTENT_NOTE

## Large Content Mode
This content is ${CONTENT_LINES} lines / ${CONTENT_BYTES} bytes — significantly larger than typical.
Use progressive disclosure: wrap lower-priority subsections in <details> elements to keep page
height under ~16,000px. See the "Large Content Strategy" section in the skill instructions.
LARGE_CONTENT_NOTE
  fi

  # P3-09/SH-021: Inline conviction brief directly into prompt
  if [[ -s "$CONVICTION_BRIEF_FILE" ]]; then
    local conviction_content
    conviction_content="$(<"$CONVICTION_BRIEF_FILE")"
    cat <<CONVICTION_NOTE

## Conviction Brief
Every design decision should serve this thesis. The conviction brief has been
derived before iteration 1 from the content source.

${conviction_content}
CONVICTION_NOTE
  fi

  # Inject notebook entries — accumulated seeing across iterations
  # Cap: first entry (original vision) + last NOTEBOOK_WINDOW entries (recent context)
  # Prevents notebook from exceeding SKILL.md in volume at high iteration counts
  if [[ -f "${BUILD_DIR}/_notebook.md" && -s "${BUILD_DIR}/_notebook.md" ]]; then
    local notebook_content
    notebook_content="$(<"${BUILD_DIR}/_notebook.md")"
    if [[ -n "$notebook_content" ]]; then
      # Count iteration entries
      local entry_count
      entry_count=$(grep -c '^## Iteration' "${BUILD_DIR}/_notebook.md" 2>/dev/null || echo 0)

      if (( entry_count <= NOTEBOOK_WINDOW + 1 )); then
        # Few enough entries — inject all
        cat <<NOTEBOOK_NOTE

## Notebook — Accumulated Seeing (${entry_count} entries)
Every previous builder's observations, changes, and evolving understanding.

${notebook_content}
NOTEBOOK_NOTE
      else
        # Too many entries — inject first (origin) + last NOTEBOOK_WINDOW (recent)
        local first_entry last_entries
        # First entry: from first "## Iteration" to second "## Iteration"
        first_entry=$(awk '/^## Iteration/{n++} n==1{print} n==2{exit}' "${BUILD_DIR}/_notebook.md")
        # Last N entries: from the Nth-from-last "## Iteration" to end
        last_entries=$(awk -v w="$NOTEBOOK_WINDOW" '
          /^## Iteration/ { entries[++count] = NR }
          { lines[NR] = $0 }
          END {
            start_entry = count - w + 1
            if (start_entry < 2) start_entry = 2
            start_line = entries[start_entry]
            for (i = start_line; i <= NR; i++) print lines[i]
          }
        ' "${BUILD_DIR}/_notebook.md")
        local skipped=$(( entry_count - NOTEBOOK_WINDOW - 1 ))
        cat <<NOTEBOOK_NOTE

## Notebook — Accumulated Seeing (${entry_count} entries, showing first + last ${NOTEBOOK_WINDOW})

${first_entry}

---
*[${skipped} earlier entries omitted — see _notebook.md for full history]*
---

${last_entries}
NOTEBOOK_NOTE
      fi
    fi
  fi

  # SH-028: Inline PA top-5 findings if available
  if [[ -f "${BUILD_DIR}/_pa-top5.md" ]]; then
    local pa_top5_content
    pa_top5_content="$(<"${BUILD_DIR}/_pa-top5.md")"
    cat <<PA_INLINE

## PA Findings Summary (BLOCKING — fix before other work)
${pa_top5_content}

Full findings: ${BUILD_DIR}/_pa-findings.md
PA_INLINE
  elif [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
    cat <<PA_INLINE

## PA Findings (BLOCKING)
Read PA findings before building: ${BUILD_DIR}/_pa-findings.md
PA_INLINE
  fi

  # --- Operational Protocols (logistics — injected by shell, not in SKILL.md) ---
  # These are procedural instructions that produce the same response regardless of
  # page state. They belong in the prompt header, not in the enrichment engine.
  cat <<'OPERATIONAL_PROTOCOLS'

---

## Operational Protocols

### Looking Protocol
**Tool:** `agent-browser` CLI via Bash. Do NOT use mcp__playwright tools — they produce blank screenshots.
**Two-step:** `agent-browser screenshot <path>` saves to disk. You MUST then Read the file to see it.
**Reload:** After editing HTML, `agent-browser open <URL>` before screenshots.
**Capture:** Open page → set viewport 1440x900 → wait for fonts → disable animations →
screenshot at 600px scroll increments ALL THE WAY TO BOTTOM → Read each → REACT. Then 768px.
Disable animations: `agent-browser eval "document.querySelectorAll('*').forEach(el => { el.style.animation = 'none'; el.style.opacity = '1'; })"`
**Verify:** Real content = 30KB+. Blank = ~5KB (close and reopen if blank).
Coverage: screenshots must cover 80%+ of page height.

### PA Protocol
PA findings are BLOCKING. Fix all critical findings THIS iteration before other work.
Fix one at a time: Read finding → make fix → reload → screenshot → "Before: [X]. After: [Y]."
If NOT visible → increase magnitude, retry. Mark FIXED in checkpoint with screenshot evidence.
Verification screenshot name: `iter{N}-verify-{finding-number}-{scroll}.png`
PA findings remain active until the next PA confirms resolution.
**Recurring findings** (from previous PA): CSS-only fixes PROHIBITED — must make structural HTML change.
**Disagree protocol:** Max 1 disagreement per PA cycle. Must provide screenshot evidence.
**Anti-additive rule:** During PA debt, do NOT add new features. Only FIX existing issues.

### Notebook
Write an entry to `_notebook.md` each iteration (~10-20 lines, free-form — write what is actually true).
The shell passes previous entries to future builders — they are the accumulated seeing across iterations.

### Shake-Up Protocol
When `_shake-up-findings.md` exists, respond to EVERY proposal before other work.
For each: **ACCEPT** (implement) / **INTEGRATE** (modify and implement) / **REJECT** (screenshot evidence, max 1).
Mandatory restructure targets require structural HTML changes — CSS-only prohibited.

OPERATIONAL_PROTOCOLS

  # Checkpoint format — injected by shell with iteration-specific template
  cat <<CHECKPOINT_PROTOCOL
### Checkpoint
Write to \`_checkpoint.md\`. Keep under 40 lines. Focus on PROBLEMS, not accomplishments.

\`\`\`markdown
## Checkpoint

### This Iteration
What was done: [2-3 sentences]
Problems fixed: [list] | Problems remaining: [list]

### Visual Quality
Current level: [0/1/2/2.5/3] — [evidence from screenshots, not CSS]
Page height: [px] (prev: [px])

### PA Response (if applicable)
[For each finding: Fix | Screenshot | Before/After | Verdict]

### Dead Zones
[Specific scroll positions where page feels dead]

### Problem Ledger
[Every open problem. 0 items = look harder.]

### Content Integrity
[All major sections present/missing]

### Compositional Arc
[One sentence — the visual arc from opening to closing]

### Status: CONTINUE / READY_FOR_FINAL_PA
<!-- FORGE-CHECKPOINT: STATUS=CONTINUE -->
\`\`\`

CHECKPOINT_PROTOCOL

  cat <<FORGE_SEPARATOR

---

## THE SKILL: /spatial-forge

FORGE_SEPARATOR

  # Part 2: The skill content — dynamically trimmed based on iteration phase
  local trimmed_skill="$SKILL_CONTENT"

  # Strip YAML frontmatter (always — metadata only)
  trimmed_skill=$(echo "$trimmed_skill" | sed '1{/^---$/d}' | sed '1,/^---$/d' 2>/dev/null) || trimmed_skill="$SKILL_CONTENT"

  # Strip Initial Build Guide after iteration 1
  if (( iter_num > 1 )); then
    trimmed_skill=$(echo "$trimmed_skill" | sed '/<!-- TRIM:INITIAL_BUILD_GUIDE_START -->/,/<!-- TRIM:INITIAL_BUILD_GUIDE_END -->/d')
  fi

  printf '%s\n' "$trimmed_skill"
}

# The perceptual audit prompt — rewritten for mechanical reliability
# No bash tool dependency. Sectional viewport screenshots only (not full-page).
# $1 = iteration number, $2 = max iterations
build_pa_prompt() {
  local iter_num="$1"
  local iter_max="$2"
  cat <<'PA_HEREDOC_START'
You are a PERCEPTUAL AUDITOR performing a cold-eyes visual assessment.

Your job is to LOOK at this page with fresh eyes and assess it VISUALLY — by looking at
screenshots and reacting to what you SEE. Not by reading CSS. Not by analyzing code.

## Rules
- Do NOT read _checkpoint.md — you must have zero knowledge of the builder's intent
- Do NOT read the <style> block before looking — see the PAGE, not the code
- Do NOT read _content-source.md first — experience the page as a visitor would
- Take screenshots FIRST, react SECOND, analyze THIRD
- Use the Bash tool ONLY for agent-browser CLI commands (browser automation). Use Read and Write tools for file operations. Do NOT use Bash for anything other than agent-browser commands.
- Do NOT use any mcp__playwright tools (browser_navigate, browser_evaluate, browser_take_screenshot, etc.) even if they appear in your available tools. They produce blank screenshots on tall pages. Use ONLY agent-browser CLI commands via the Bash tool for ALL browser interaction.
- IMPORTANT — Two-step screenshot viewing: agent-browser saves screenshots to disk but does NOT return the image to you. After EVERY `agent-browser screenshot <path>` command, you MUST use the Read tool on the saved file to actually view the screenshot. Without this step, you are blind.
- This page uses a CUSTOM design system (not the global CLAUDE.md defaults). Assess it
  against its own design language, not standard web conventions. Key properties:
  border-radius: 0 (always), custom font trinity, warm color palette.
- Grade calibration: If a previous PA's findings are still present (even partially), the grade
  cannot be higher than the previous PA's grade plus one half-step. If PA-2 gave C+ and 3 of its
  5 findings persist, this PA cannot grade higher than B-. Grade improvement must reflect ACTUAL
  visual improvement, not correction of the previous PA's false findings.
- If correcting a false finding from a previous PA (e.g., a tool artifact mistaken for a page
  bug), explicitly note this does NOT count as visual improvement. The grade adjusts for the
  correction but does not benefit further from it.

## Setup
PA_HEREDOC_START

  # Extract previous PA grade for calibration
  local prev_pa_grade=""
  if [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
    prev_pa_grade=$(grep -i "Overall Visual Grade:" "${BUILD_DIR}/_pa-findings.md" 2>/dev/null | head -1 | sed 's/.*Grade:[[:space:]]*//' || true)
  fi
  # Find the most recent archived PA findings for recurring finding comparison
  local prev_pa_file=""
  local latest_archive=$(ls -1 "${BUILD_DIR}"/_pa-findings-iter*.md 2>/dev/null | sort | tail -1 || true)
  if [[ -n "$latest_archive" ]]; then
    prev_pa_file="$latest_archive"
  fi

  # S6-14: List ALL archived PA files for comprehensive recurring finding comparison
  local all_pa_archives
  all_pa_archives=$(ls -1 "${BUILD_DIR}"/_pa-findings-iter*.md 2>/dev/null | sort || true)

  cat <<PA_VARS
- This is PA iteration ${iter_num} of ${iter_max}.
- HTTP server: http://localhost:${PORT}/_build-final.html
- Build directory: ${BUILD_DIR}
- Screenshots directory: ${BUILD_DIR}/_screenshots
- Output file: ${BUILD_DIR}/_pa-findings.md
- Content source: ${BUILD_DIR}/_content-source.md
- HTML file: ${BUILD_DIR}/_build-final.html
- Previous PA grade: ${prev_pa_grade:-"none (first PA)"}
- Previous PA findings file: ${prev_pa_file:-"none (first PA)"}
- All archived PA findings: ${all_pa_archives:-"none (first PA)"}
PA_VARS

  # S6-13: PA acknowledges multiple build iterations since last PA
  cat <<PA_CONTEXT
- Build iterations since last PA: $((PA_INTERVAL - 1))
- This PA covers significant visual changes from $((PA_INTERVAL - 1)) build iterations. Assess the FULL page state, not just incremental changes.
PA_CONTEXT

  cat <<'PA_HEREDOC_BODY'

## Step 1: Take Screenshots (Viewport-Only — NO Full-Page)

IMPORTANT: Do NOT take full-page screenshots. Tall pages (10,000px+) exceed image dimension
limits and will fail. Instead, take VIEWPORT screenshots at multiple scroll positions.

### 1440px Pass

All browser commands use `agent-browser` via the Bash tool.

1. Open the page: `agent-browser open <HTTP_URL>` (use the HTTP server URL from Setup above)
2. Set viewport: `agent-browser set viewport 1440 900 1`
3. Wait for fonts: `agent-browser wait --fn "document.fonts.status === 'loaded'"`
4. Inject animation disable: `agent-browser eval "document.querySelectorAll('*').forEach(el => { el.style.animation = 'none'; el.style.opacity = '1'; })"`
5. Get the page height: `agent-browser eval "document.documentElement.scrollHeight"`
6. Take a screenshot at scroll position 0: `agent-browser screenshot <SCREENSHOTS_DIR>/pa-{iteration}-1440-scroll0.png` (use the screenshots directory from Setup above)
7. Use the Read tool to view the screenshot file you just saved. REACT to what you see.
8. Scroll down ~600px: `agent-browser eval "window.scrollTo(0, 600)"`
9. Wait briefly: `agent-browser wait 500`
10. Take another screenshot: `agent-browser screenshot <SCREENSHOTS_DIR>/pa-{iteration}-1440-scroll600.png`
11. Use the Read tool to view it. REACT.
12. Continue scrolling in ~600px increments. At each position:
    - `agent-browser eval "window.scrollTo(0, Y)"`
    - `agent-browser wait 500`
    - `agent-browser screenshot <path>`
    - Read the screenshot file with the Read tool and REACT
13. Keep scrolling until you reach the BOTTOM of the page. Do NOT stop early — the most critical
    issues (voids, dead zones, broken endings) are often at the bottom. For a 25,000px page this
    means ~31 screenshots. That's fine — viewport screenshots are small and fit in context.
14. COVERAGE CHECK: After all screenshots, verify you have captured at least 80% of the page.
    If the page is 14,000px and you have screenshots only from 0-2400px, you have assessed 17%
    of the page. You MUST scroll to the bottom. If any scroll position produces a blank screenshot
    (file size < 10KB), use the error recovery procedure and retry. Do NOT assess sections you
    cannot see. Do NOT substitute code reading for visual assessment — if you can't see it, say
    "Section X: NOT ASSESSED (no screenshot)" rather than reading CSS and guessing.

**Efficiency tip:** You may batch several screenshot Bash calls first (fast, text-only returns),
then batch-Read them all — as long as you REACT to each one before moving to analysis.

If the page contains <details> elements (collapsed sections), click on each summary to expand it
using `agent-browser click "summary"` (or a more specific selector like `agent-browser click "details:nth-of-type(N) summary"`).
Assess BOTH the collapsed state (are summaries descriptive and styled?) and the expanded content
(does the content pass visual quality checks?). Take screenshots of both states for important sections.

### 768px Pass
15. Resize viewport: `agent-browser set viewport 768 1024`
16. Scroll to top: `agent-browser eval "window.scrollTo(0, 0)"`
17. Take a screenshot at the top, Read it, REACT
18. Scroll down ~600px, take screenshots until you reach the bottom (at least 4-5 positions)

Total: as many screenshots as needed to see the ENTIRE page. Each one is a standard viewport capture, NOT full-page.

Name screenshots using scroll offset in pixels: `pa-{iteration}-1440-scroll{pixels}.png`
(e.g., `pa-3-1440-scroll0.png`, `pa-3-1440-scroll600.png`, `pa-3-768-scroll0.png`)
Save to the screenshots directory above.

**Error recovery:** If any agent-browser command fails, run `agent-browser close` then
`agent-browser open <HTTP_URL>` (the HTTP server URL from Setup) and retry from the failed step.

## Step 2: Experiential Pass — LOOK Before You Think
Look at each screenshot. For each one, write your GUT REACTION first:
- What draws your eye?
- What repels you?
- Does this feel like a professionally designed page or a developer template?
- What is the MOOD? Does this page feel like SOMETHING or is it neutral?
- Where does the page feel ALIVE? Where does it feel DEAD?

## Step 3: Granular Visual Assessment

### Typography (look, don't read code)
- Can you FEEL the hierarchy? H1 vs H2 vs H3 — do they feel like different levels or just different sizes?
- Does each font feel RIGHT for its context? Where does a font feel wrong or forced?
- Is the body text comfortable to read? Line length, line height, spacing — does it feel effortless or laborious?
- Where does text feel too small, too large, too tight, too loose?
- Do labels, metadata, and secondary text recede properly, or do they compete with primary content?

### Color and Visual Harmony
- Where does color ADD MEANING? Where does it feel arbitrary or decorative?
- Are there any color combinations that CLASH or feel visually uncomfortable?
- Is there sufficient contrast? Any text hard to read against its background?
- Do dark sections feel intentional or just "different"? Do they serve the content's register shift?
- Is the accent color used meaningfully or scattered?

### Spacing and Rhythm
- Does the page have visual RHYTHM — variation in density, spacing, weight? Or is it metronomic (everything equally spaced)?
- Where is there TOO MUCH whitespace? Where NOT ENOUGH?
- Do sections breathe differently, or do they all have the same padding?
- Are there spacing "voids" — stacked margins creating dead zones?

### Borders and Structure
- Where do borders add structure? Where are they decorative noise?
- Can you see the spatial argument from borders alone, or do they look uniform?
- Are there progressive encoding sequences visible (borders thickening, backgrounds deepening)?

### Visual Composition
- Do section transitions feel DESIGNED or accidental?
- Is there visual drama anywhere? A moment that makes you stop scrolling?
- Could any section be copy-pasted onto a completely different website and still work? (That's the generic section.)
- Does the page feel like it has MASS and WEIGHT, or is it floating and empty?

### Responsive (768px screenshots)
- At 768px, does the page feel DESIGNED or just reflowed?
- What spatial arguments survive the viewport change?
- What breaks, collapses, or looks wrong?

### The Hard Questions
- What is the single UGLIEST thing on this page?
- If you showed this to a designer, what would they critique first?
- What's the ONE change that would have the most visual impact?
- Does anything look like "bad taste" — visually inappropriate, overworked, or trying too hard?

## Step 4: Read Content + Code (AFTER visual assessment)
NOW use the Read tool to read the content source file (skim for themes and register shifts).
NOW use the Read tool to read the HTML file (skim the <style> block).
- Does the CSS INTENT match what you SAW? Where is there a gap between what the code tries to do and what actually comes through visually?
- Are there CSS encodings that are IMPERCEPTIBLE? (border-left changes below 2px, background tints below 0.01 alpha, letter-spacing differences below 0.5px)

Use the Read tool to read the content source and HTML file paths given in the Setup section above.

## Step 5: Write Findings
Use the Write tool to write ALL findings to the output file path given above, in this format:

```markdown
# Perceptual Audit Findings — {timestamp}

## Overall Visual Grade: [A through F, +/- allowed]
[One paragraph: immediate impression, mood, professionalism]

## Biggest Visual Problem
[The single most impactful visual issue — described in terms of what you SEE, not what the code does]

## Section-by-Section Assessment
[For each visible section:]
- **{Section}:** [ALIVE / FUNCTIONAL / DEAD / NOT ASSESSED (no screenshot at this position)]
  - Visual: {what you see — colors, spacing, type, borders}
  - Feel: {experiential reaction — mood, weight, energy}
  - Issue: {specific visual problem, if any}

## Typography Issues
[Specific observations grounded in screenshots — "the heading in section 3 feels too heavy for the light content around it"]

## Color Issues
[Clashing combinations, meaningless color, insufficient contrast]

## Spacing Issues
[Voids, cramping, metronomic rhythm, missing variation]

## Imperceptible Encodings
[CSS that tries to encode meaning but produces no visible difference]

## Generic Sections
[Sections that could appear on any website — the swap test failures]

## Responsive Issues (768px)
[What breaks or degrades]

## Top 5 Visual Priorities (ordered by impact)
Number these explicitly — the builder will reference them as "PA finding #1", "PA finding #2", etc.
1. [Most impactful change needed — visual description]
2. ...
3. ...
4. ...
5. ...

## The One Change
[If you could make ONE visual change, what would it be and why?]
```

IMPORTANT: Ground EVERY finding in what you SEE in the screenshots.
- WRONG: "The border-left is 2px solid rgba(0,0,0,0.3)"
- RIGHT: "The left edge of this section has a barely visible line that adds no visual structure"
- WRONG: "The padding-block is 48px"
- RIGHT: "This section feels cramped — there's not enough breathing room between the heading and the content above"

## Recurring Findings (compare against previous PA if available)
If a previous PA findings file is listed in Setup above, read it AFTER your visual assessment
(Step 4). Compare your findings against the previous PA's findings. For each finding that
appeared in the previous PA and STILL exists:
- Mark it as **RECURRING** in your findings
- Recommend a STRUCTURAL fix (layout/HTML change), not a CSS value tweak
- Note how many PA cycles it has persisted

Recurring findings are the most important findings. A problem that survived a fix attempt is
harder than the builder thinks.

Your assessment must be HONEST. If the page looks bad, say so. If a section is generic, call it out. If typography clashes, name the clash. The builder needs adversarial truth, not encouragement.
PA_HEREDOC_BODY
}

# ─── S4-08/S4-09: Fresh-Eyes Agent Prompt ───────────────────────────
# $1 = iteration number, $2 = max iterations
build_fresh_eyes_prompt() {
  local iter_num="$1"
  local iter_max="$2"

  # Part 1: Variable-expanded header
  cat <<FRESH_EYES_HEADER
You are a FRESH-EYES AGENT performing a cold-look creative assessment of a web page.

Your job is to LOOK at this page with ZERO context and identify what feels GENERIC, BORING,
or TEMPLATE-LIKE. You have never seen this page before. You know nothing about its history.

## Rules — READ THESE FIRST
- Do NOT read _checkpoint.md — you must have zero knowledge of the builder's intent or history
- Do NOT read _pa-findings.md — you must not be influenced by previous assessments
- Do NOT read the <style> block before looking at screenshots — see the PAGE first
- LOOK first, REACT second, read code THIRD
- Use the Bash tool ONLY for agent-browser CLI commands. Use Read and Write tools for file operations.
- Do NOT use any mcp__playwright tools — use ONLY agent-browser CLI via Bash.
- Two-step screenshot viewing: after every agent-browser screenshot command, use Read on the saved file.

## Setup
- This is shake-up iteration ${iter_num} of ${iter_max}.
- HTTP server: http://localhost:${PORT}/_build-final.html
- Build directory: ${BUILD_DIR}
- Screenshots directory: ${BUILD_DIR}/_screenshots
- Content source: ${BUILD_DIR}/_content-source.md
- Output file: ${BUILD_DIR}/_shake-up-findings.md
FRESH_EYES_HEADER

  # Part 2: Literal content (no variable expansion)
  cat <<'FRESH_EYES_BODY'

## Step 1: Take Screenshots (LOOK FIRST)

All browser commands use `agent-browser` via the Bash tool.

### 1440px Pass
1. Open the page: `agent-browser open <HTTP_URL>` (use the HTTP server URL from Setup)
2. Set viewport: `agent-browser set viewport 1440 900 1`
3. Wait for fonts: `agent-browser wait --fn "document.fonts.status === 'loaded'"`
4. Inject animation disable: `agent-browser eval "document.querySelectorAll('*').forEach(el => { el.style.animation = 'none'; el.style.opacity = '1'; })"`
5. Get page height: `agent-browser eval "document.documentElement.scrollHeight"`
6. Screenshot at scroll 0: `agent-browser screenshot <SCREENSHOTS_DIR>/shakeup-1440-scroll0.png`
7. Read the screenshot file. REACT to what you see — gut reaction, not analysis.
8. Scroll in ~600px increments, screenshot + Read + React at each position until bottom.
9. COVERAGE CHECK: You must see the ENTIRE page. Do not stop early.

### 768px Pass
10. Resize: `agent-browser set viewport 768 1024`
11. Scroll to top, take screenshots at 3-4 positions, Read and React to each.

## Step 2: Identify the TOP 2 WEAKEST Sections

After seeing the entire page, identify the TWO sections that are:
- Most GENERIC (could appear on any website — the "swap test" failures)
- Most BORING (no visual drama, no surprise, no personality)
- Most TEMPLATE-FEELING (looks auto-generated rather than designed)

For each weak section, you MUST provide:
- **Section identifier:** The CSS class name or a scroll position range (e.g., ".automation-section" or "scroll 2400-3200px")
- **Why it's weak:** What makes it generic/boring — described visually, not technically
- **3-5 structural proposals:** Layout changes, component replacements, section restructurings. NOT CSS tweaks. Think "replace the bullet list with a bento grid" not "change the font-size."
- Each proposal should describe the VISUAL EFFECT, not the CSS implementation.

## Step 3: What's MISSING

After identifying weak sections, answer: What is this page MISSING that would make it feel DESIGNED rather than STYLED?
- Is there a moment of visual drama? A scroll-stopping section?
- Does the page have a visual ARGUMENT or is it just "content in boxes"?
- What ONE structural addition would transform the page's personality?

## Step 4: Read Code (AFTER visual assessment)

NOW read the HTML file to understand the current structure. Look at element types, class names,
and the <style> block. Where does the code TRY to be interesting but FAIL visually?

## Step 5: Write Findings

Use the Write tool to write findings to the output file path from Setup, in this format:

```markdown
# Shake-Up Findings — Fresh Eyes Assessment

## Weakest Section #1: [section identifier]
- **Visual problem:** [what you SEE that makes this section weak]
- **Scroll position:** [approximate px range]
- **Proposals:**
  1. [structural proposal with visual description]
  2. [structural proposal with visual description]
  3. [structural proposal with visual description]
  4. [optional]
  5. [optional]

## Weakest Section #2: [section identifier]
- **Visual problem:** [what you SEE that makes this section weak]
- **Scroll position:** [approximate px range]
- **Proposals:**
  1. [structural proposal with visual description]
  2. [structural proposal with visual description]
  3. [structural proposal with visual description]
  4. [optional]
  5. [optional]

## What This Page Is Missing
[1-2 paragraphs on what would make this page feel DESIGNED vs STYLED]

## The One Structural Move
[If you could add ONE structural element or transformation, what would it be?]
```

Be BRUTALLY HONEST. The builder has been staring at this page for hours. You're the fresh perspective.
FRESH_EYES_BODY
}

# ─── S4-10/S4-11: Competitive Alternatives Agent Prompt ─────────────
# $1 = iteration number, $2 = direction type, $3 = weak section id, $4 = reference files (space-separated)
# $5 = existing shake-up-findings content (injected by orchestrator to prevent overwrite)
build_competitive_alt_prompt() {
  local iter_num="$1"
  local direction_type="$2"
  local weak_section_id="$3"
  local reference_files="$4"
  local existing_findings="${5:-}"

  # Part 1: Variable-expanded header
  cat <<COMP_ALT_HEADER
You are a COMPETITIVE ALTERNATIVES agent providing visual REFERENCES and creative direction.

Your job is NOT to build anything. You CURATE visual references from existing exploration pages
and explain what makes them work — so the builder can integrate the patterns.

## Setup
- This is shake-up iteration ${iter_num}.
- HTTP server: http://localhost:${PORT}/
- Build page: http://localhost:${PORT}/_build-final.html
- References directory: http://localhost:${PORT}/_references/
- Build directory: ${BUILD_DIR}
- Screenshots directory: ${BUILD_DIR}/_screenshots
- Content source: ${BUILD_DIR}/_content-source.md
- HTML file: ${BUILD_DIR}/_build-final.html
- Target weak section: ${weak_section_id}
- Creative direction: ${direction_type}
- Reference exploration files: ${reference_files}
- Output file: ${BUILD_DIR}/_shake-up-findings.md (APPEND to existing content)

## Rules
- Use the Bash tool ONLY for agent-browser CLI commands. Use Read and Write for file operations.
- Do NOT use any mcp__playwright tools — use ONLY agent-browser CLI via Bash.
- Two-step screenshot viewing: after every agent-browser screenshot command, use Read on the saved file.
- You are NOT building. You are CURATING references and explaining structural patterns.
COMP_ALT_HEADER

  # Part 2: Direction-specific instructions
  case "$direction_type" in
    density)
      cat <<'DENSITY_DIR'

## Your Creative Direction: DENSITY

Look for references that use DENSITY techniques:
- Fractal layouts (nested grids, information at multiple scales)
- Layered compositions (overlapping elements, depth through stacking)
- Compressed information displays (data-dense without feeling cramped)
- Islands of high detail within calm surrounds
DENSITY_DIR
      ;;
    editorial)
      cat <<'EDITORIAL_DIR'

## Your Creative Direction: EDITORIAL

Look for references that use EDITORIAL techniques:
- Pull-quotes that break the grid and create visual drama
- Asymmetric grid layouts that feel intentional and magazine-like
- Dramatic typography scale shifts (hero text vs fine print)
- Whitespace used as a compositional element, not just padding
EDITORIAL_DIR
      ;;
    compositional)
      cat <<'COMPOSITIONAL_DIR'

## Your Creative Direction: COMPOSITIONAL

Look for references that use COMPOSITIONAL techniques:
- Multi-mechanism combinations (spatial + temporal + material encodings together)
- Progressive encoding sequences (borders thickening, backgrounds deepening)
- Register shifts (tonal changes between sections: analytical → philosophical → evidential)
- Cross-section visual arguments that create a coherent spatial narrative
COMPOSITIONAL_DIR
      ;;
  esac

  # Part 3: Common workflow — Step 1 and 2 are literal, Step 3 has injected content
  cat <<'COMP_ALT_BODY'

## Step 1: Look at the Weak Section

1. Open the build page: `agent-browser open <BUILD_PAGE_URL>` (from Setup)
2. Set viewport: `agent-browser set viewport 1440 900 1`
3. Scroll to the weak section identified in Setup. Take a screenshot. Read it.
4. What makes this section weak? Describe in visual terms.

## Step 2: Browse Reference Explorations

For each reference file listed in Setup:
1. Open it: `agent-browser open <REFERENCE_URL>` (e.g., http://localhost:PORT/_references/FILENAME.html)
2. Set viewport: `agent-browser set viewport 1440 900 1`
3. Wait for fonts: `agent-browser wait --fn "document.fonts.status === 'loaded'"`
4. Inject animation disable: `agent-browser eval "document.querySelectorAll('*').forEach(el => { el.style.animation = 'none'; el.style.opacity = '1'; })"`
5. Scroll through the entire page, taking screenshots at ~600px intervals. Read each one.
6. Identify sections that handle SIMILAR content types to the weak section but with much stronger visual treatment.
7. Screenshot those specific sections and note the scroll position.

## Step 3: Write Findings
COMP_ALT_BODY

  # BS-30: Inject existing findings content (SH-015: shared function)
  inject_bs30_findings "$existing_findings"

  cat <<'COMP_ALT_BODY2'

```markdown

## Competitive Alternative: [DIRECTION TYPE] Direction

### Target: [weak section identifier]

### Reference Screenshots
For each reference that applies:
- **[Reference filename] at scroll [position]px:** [What this reference does well for this content type]
- **Structural pattern:** [The layout/component technique — e.g., "bento grid with 3 density levels"]

### What the Weak Section is Missing
[Explain the structural gap — what pattern from the references would transform this section]

### Transferable Patterns (optional)
[If you can identify specific CSS techniques from the references, list them. But the screenshots
and structural explanations above are the PRIMARY deliverable.]
```

Focus on the VISUAL EFFECT of references, not their code. "This exploration turns a simple list
into a density island with nested grids at three scales" — not "it uses grid-template-columns: repeat(3, 1fr)".
COMP_ALT_BODY2
}

# ─── S4-14/S4-15: Design Director Prompt (Severe Plateau Only) ──────
# $1 = iteration number, $2 = existing shake-up findings content (BS-30 injection)
build_design_director_prompt() {
  local iter_num="$1"
  local existing_findings="${2:-}"

  # Part 1: Variable-expanded header
  cat <<DD_HEADER
You are a DESIGN DIRECTOR providing META-level creative direction for a page that has plateaued.

The builder has been working on this page for many iterations and the visual quality has stalled.
Your job is not to fix individual sections — it's to push the OVERALL composition forward with
high-level creative direction that breaks the current aesthetic comfort zone.

## Setup
- This is shake-up iteration ${iter_num} (severe plateau — STALL_COUNT >= 5).
- HTTP server: http://localhost:${PORT}/_build-final.html
- Build directory: ${BUILD_DIR}
- Screenshots directory: ${BUILD_DIR}/_screenshots
- Checkpoint: ${BUILD_DIR}/_checkpoint.md
- Content source: ${BUILD_DIR}/_content-source.md
- HTML file: ${BUILD_DIR}/_build-final.html
- PA findings history: ${BUILD_DIR}/_pa-findings*.md
- Output file: ${BUILD_DIR}/_shake-up-findings.md (APPEND to existing content)

## Rules
- Use the Bash tool ONLY for agent-browser CLI commands. Use Read and Write for file operations.
- Do NOT use any mcp__playwright tools — use ONLY agent-browser CLI via Bash.
- Two-step screenshot viewing: after every agent-browser screenshot command, use Read on the saved file.
DD_HEADER

  # Part 2: Literal content
  cat <<'DD_BODY'

## Your Role

You provide META-level creative direction — not section-level fixes. You watch the page's
trajectory and push the overall composition forward.

The page has settled into a rhythm that's comfortable but not exciting. Your job is to
identify what would create genuine VISUAL DRAMA.

## Step 1: See the Page

1. Open: `agent-browser open <HTTP_URL>` (from Setup)
2. Set viewport: `agent-browser set viewport 1440 900 1`
3. Wait for fonts: `agent-browser wait --fn "document.fonts.status === 'loaded'"`
4. Inject animation disable: `agent-browser eval "document.querySelectorAll('*').forEach(el => { el.style.animation = 'none'; el.style.opacity = '1'; })"`
5. Scroll through the entire page, taking screenshots every ~600px. Read each one.
6. At 768px, take 3-4 screenshots to assess responsive treatment.

## Step 2: Read the History

NOW read the checkpoint (full iteration history). NOW read PA findings.
- What has the builder been doing? Where did they get stuck?
- What patterns repeat across iterations? What was tried and abandoned?
- Is the page improving or just churning?

## Step 3: Provide Direction

Think about the page as a WHOLE COMPOSITION, not a stack of sections:
- Does it have a visual ARC (building tension, climax, resolution)?
- Where does the scrolling experience feel ALIVE? Where does it go FLAT?
- Is there a unifying visual ARGUMENT or just consistent styling?
- What would make someone STOP scrolling and take notice?

## Step 4: Write Findings
DD_BODY

  # BS-30: Inject existing findings content (SH-015: shared function)
  inject_bs30_findings "$existing_findings"

  cat <<'DD_BODY2'
```markdown

## Design Director Notes

### Page Trajectory
[What the page has been doing across iterations — improving, churning, or plateauing? Where?]

### The Rhythm Problem
[What rhythm has the page settled into? Why is it comfortable but not exciting?]

### Creative Direction (META-level)
1. [High-level direction — e.g., "The middle third needs a register shift from analytical to visceral"]
2. [High-level direction — e.g., "Add a visual EVENT at ~4000px — something that breaks the grid"]
3. [High-level direction — e.g., "Typography is too uniform — introduce a dramatic size break"]

### The One Thing
[If you could change ONE thing about the overall composition, what would it be?]
```

You are NOT fixing bugs. You are DIRECTING the creative vision. Think like a creative director
reviewing a junior designer's work — what would you say to push them past "competent" to "compelling"?
DD_BODY2
}

# ─── S6-16: Reference Selection Lookup Table ────────────────────────
# $1 = section type (list, sequence, prose, narrative, comparison, or default)
# Returns space-separated file paths to reference explorations
select_references_for_section() {
  local section_type="$1"
  local ref_dir="${BUILD_DIR}/_references"
  case "$section_type" in
    list|sequence)   echo "${ref_dir}/DD-003-islands.html ${ref_dir}/AD-003-bento-grid.html" ;;
    prose|narrative) echo "${ref_dir}/OD-006-creative.html ${ref_dir}/DD-004-layers.html" ;;
    comparison|contrast) echo "${ref_dir}/CD-006-pilot-migration.html ${ref_dir}/AD-006-compound.html" ;;
    *)               echo "${ref_dir}/DD-006-fractal.html ${ref_dir}/CD-006-pilot-migration.html" ;;
  esac
}

# ─── Conviction Derive Prompt ─────────────────────────────────────────
# P3-03a: Conviction derive prompt — one-time pre-forge phase
build_conviction_derive_prompt() {
  cat <<DERIVE_HEADER
You are executing a ONE-TIME pre-forge conviction derive phase.

## Your Task
Read the content source file and derive the page's initial thesis/conviction.
This is a lightweight tension-composition analysis — identify what the content
is ABOUT at its deepest level, what tensions it explores, and what the page
should FEEL like when fully realized.

## File Paths
- Content source: ${BUILD_DIR}/_content-source.md
- Output file: ${CONVICTION_BRIEF_FILE}

## Status Markers
Output these as you work:
  [DERIVE] Reading content source...
  [DERIVE] Identifying core tensions...
  [DERIVE] Writing conviction brief...
  [DERIVE] Complete.

## Instructions
1. Read the content source file.
2. Identify the core tensions, themes, and emotional register of the content.
3. Write a conviction brief to the output file in this format:

\`\`\`markdown
# Conviction Brief

## Core Thesis
[One sentence: what should this page FEEL like when someone scrolls through it?]

## Key Tensions
- [Tension 1: e.g., "surveillance vs. liberation"]
- [Tension 2: e.g., "individual vs. systemic"]
- [Tension 3: if applicable]

## Emotional Arc
[How should the emotional register shift as the reader scrolls? What builds, what releases?]

## Design Implications
[What do these tensions suggest about visual treatment? Width, density, rhythm, color?]
\`\`\`

Write the conviction brief to the output file using the Write tool.
Keep it concise — this is a SEED that will be enriched as research is absorbed.
DERIVE_HEADER
}

# ─── Pre-Forge: Conviction Derive Phase (P3-03a) ─────────────────────
# One-time setup before iteration 1 — run tension-composition on content
# to produce initial conviction brief. Skipped on resume if brief already has content.
if [[ ! -s "$CONVICTION_BRIEF_FILE" ]]; then
  echo ""
  echo "┌─────────────────────────────────────────────────────────────┐"
  echo "│  PRE-FORGE: Deriving conviction brief from content...      │"
  echo "└─────────────────────────────────────────────────────────────┘"

  DERIVE_PROMPT_FILE="$(mktemp /tmp/spatial-forge-derive.XXXXXX)"
  build_conviction_derive_prompt > "$DERIVE_PROMPT_FILE"

  DERIVE_LOG="${LOG_DIR}/pre-forge-conviction-derive.jsonl"
  DERIVE_RUNNER="$(create_runner_script)"

  start_live_display "$DERIVE_LOG"

  set +e
  run_with_timeout "$DERIVE_TIMEOUT" bash "$DERIVE_RUNNER" "$DERIVE_PROMPT_FILE" "$DERIVE_LOG"
  DERIVE_EXIT=$?
  set -e

  kill_tail_pipeline
  rm -f "$DERIVE_PROMPT_FILE" "$DERIVE_RUNNER"

  if [[ -s "$CONVICTION_BRIEF_FILE" ]]; then
    echo "[setup] Conviction brief derived ($(wc -l < "$CONVICTION_BRIEF_FILE" | tr -d ' ') lines)"
  else
    echo "[warning] Conviction derive did not produce output — builder will create thesis on iteration 1"
  fi
fi

# ─── Forge Loop ──────────────────────────────────────────────────────

# ─── Machine-Readable Contracts (SH-031) ─────────────────────────────
# The shell parses these exact strings from agent-produced files.
# CHANGING THESE STRINGS IN SKILL.md OR HOOK SKILL BREAKS THE SHELL.
#
# From _checkpoint.md (written by builder, parsed by shell):
#   "Page height: NNN"     -> extracted for display
#   "Verdict: FAILED"      -> counted for PA failure warning
#   "Iterations unresolved:"-> counted for problem ledger check
#   "STATUS: PLATEAUED"    -> checked for plateau detection
#   "READY_FOR_FINAL_PA"   -> checked for completion gate
#   "N/M files"            -> extracted for absorption tracking
#   "Iteration: N"         -> extracted for resume detection
#   "Current Level:"       -> displayed in session summary
#   "Status:"              -> displayed in session summary
#   "Content Integrity"    -> displayed in session summary
#
#
# From _pa-findings.md (written by PA, parsed by shell):
#   "Overall Visual Grade:" -> extracted for grade calibration and display

# ─── Resume Detection (SH-036: checkpoint-based + log fallback) ──────
# Primary: read iteration number from checkpoint
START_ITER=1
if [[ -f "${BUILD_DIR}/_checkpoint.md" ]]; then
  CKPT_ITER=$(grep -oE 'Iteration: [0-9]+' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 | grep -oE '[0-9]+') || CKPT_ITER=""
  if [[ -n "$CKPT_ITER" ]] && (( CKPT_ITER > 0 )); then
    START_ITER=$((CKPT_ITER + 1))
    echo "[resume] Checkpoint reports last completed iteration: ${CKPT_ITER}"
  fi
fi
# Fallback: log file counting
if (( START_ITER == 1 )) && ls "${LOG_DIR}"/iteration-*.log &>/dev/null; then
  LAST_LOG="$(ls -1 "${LOG_DIR}"/iteration-*.log 2>/dev/null | sort | tail -1)"
  # Handle -final-pa suffix in log filenames
  LAST_NUM="$(basename "$LAST_LOG" .log | sed 's/iteration-//' | sed 's/-final-pa//' | sed 's/^0//')"
  if [[ -n "$LAST_NUM" ]] && (( LAST_NUM > 0 )); then
    START_ITER=$(( LAST_NUM + 1 ))
    echo "[resume] Found existing logs through iteration ${LAST_NUM}"
    echo "[resume] Resuming from iteration ${START_ITER}"
  fi
fi

# MAX_ITERATIONS is total desired, not additional
END_ITER=$MAX_ITERATIONS
if (( START_ITER > END_ITER )); then
  echo "[resume] All ${MAX_ITERATIONS} iterations already completed."
  echo "[resume] To continue, specify a higher iteration count."
  exit 0
fi

# Cross-midnight resume warning
PREV_DIRS=$(ls -d "${PROJECT_ROOT}/ephemeral/builds/${CONTENT_NAME}-forged-"* 2>/dev/null | grep -v "${DATE}" || true)
if [[ -n "$PREV_DIRS" ]]; then
  echo "[warning] Found build directories from previous dates:"
  echo "$PREV_DIRS"
  echo "[warning] This session will use: ${BUILD_DIR}"
  echo "[warning] To continue a previous session, use the same date or copy files."
fi

# Load persisted stall count for resume
STALL_COUNT_FILE="${BUILD_DIR}/_stall-count"
STALL_COUNT=0
if [[ -f "$STALL_COUNT_FILE" ]]; then
  STALL_COUNT=$(<"$STALL_COUNT_FILE")
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Beginning forge loop: iterations ${START_ITER}-${END_ITER} (hard max: ${HARD_MAX_ITERATIONS})"
echo "  Stop condition: PA grade A- OR hard max ${HARD_MAX_ITERATIONS}"
echo "  Perceptual audit every ${PA_INTERVAL} iterations (first at iter 5+)"
echo "  Shake-up every ${SHAKE_INTERVAL} iterations + plateau auto-detect"
echo "═══════════════════════════════════════════════════════════════"
echo ""

MAX_ITERATIONS_WARNING_SHOWN=false

for (( i=START_ITER; i<=HARD_MAX_ITERATIONS; i++ )); do

  # P3-10: MAX_ITERATIONS is a warning threshold, not a stop
  if (( i == END_ITER + 1 )) && [[ "$MAX_ITERATIONS_WARNING_SHOWN" != true ]]; then
    MAX_ITERATIONS_WARNING_SHOWN=true
    echo ""
    echo "[warning] Reached ${END_ITER} iterations — PA has not graded A- or above yet"
    echo "[warning] Continuing until PA grade A- (hard max: ${HARD_MAX_ITERATIONS})"
    echo ""
  fi

  # ─── Determine iteration type (S2-15, S4-04, S4-05, S4-06, S6-09, S6-10) ───
  IS_PA=false
  IS_SHAKEUP=false
  SHAKEUP_REASON=""

  # S6-10: Handle deferred shake-up from previous PA collision
  # Restore the ORIGINAL reason (e.g., "plateau") so mandatory restructure path fires correctly
  if [[ "$DEFERRED_SHAKEUP" == true ]]; then
    IS_SHAKEUP=true
    SHAKEUP_REASON="${DEFERRED_SHAKEUP_REASON:-deferred}"
    DEFERRED_SHAKEUP=false
    DEFERRED_SHAKEUP_REASON=""
  fi

  # S2-15: PA cannot fire before iteration 5
  if (( i > 1 && i >= 5 && i % PA_INTERVAL == 0 )); then
    # Only run PA if HTML exists (can't audit what doesn't exist)
    if [[ -f "${BUILD_DIR}/_build-final.html" ]]; then
      IS_PA=true
    fi
  fi

  # S4-05: Scheduled shake-up detection
  if (( i > 1 && i >= SHAKE_INTERVAL && i % SHAKE_INTERVAL == 0 )); then
    IS_SHAKEUP=true
    if [[ -z "$SHAKEUP_REASON" ]]; then
      SHAKEUP_REASON="scheduled"
    fi
  fi

  # S4-06: Auto-detect plateau shake-up (STALL_COUNT >= STALL_THRESHOLD or checkpoint says PLATEAUED)
  if (( STALL_COUNT >= STALL_THRESHOLD )); then
    IS_SHAKEUP=true
    SHAKEUP_REASON="plateau"
  fi
  if [[ -f "${BUILD_DIR}/_checkpoint.md" ]] && grep -q "STATUS: PLATEAUED" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null; then
    IS_SHAKEUP=true
    SHAKEUP_REASON="plateau"
  fi

  # S6-09: PA + shake-up collision handling — PA takes priority
  # Preserve original reason so deferred plateau shake-ups still fire mandatory restructure
  if [[ "$IS_PA" == true && "$IS_SHAKEUP" == true ]]; then
    IS_SHAKEUP=false
    DEFERRED_SHAKEUP=true
    DEFERRED_SHAKEUP_REASON="$SHAKEUP_REASON"
    echo "[forge] Shake-up deferred (reason: ${SHAKEUP_REASON}) — PA takes priority this iteration"
  fi

  # ─── Display iteration type ───
  if [[ "$IS_PA" == true ]]; then
    echo "┌─────────────────────────────────────────────────────────────┐"
    printf "│  ITERATION %2d / %-2d  ◆  PERCEPTUAL AUDIT                   │\n" "$i" "$END_ITER"
    echo "└─────────────────────────────────────────────────────────────┘"
    ITER_TIMEOUT=$PA_TIMEOUT
  elif [[ "$IS_SHAKEUP" == true ]]; then
    echo "┌─────────────────────────────────────────────────────────────┐"
    printf "│  ITERATION %2d / %-2d  ★  SHAKE-UP (%-24s) │\n" "$i" "$END_ITER" "$SHAKEUP_REASON"
    echo "└─────────────────────────────────────────────────────────────┘"
    ITER_TIMEOUT=$SHAKEUP_TIMEOUT
  else
    echo "┌─────────────────────────────────────────────────────────────┐"
    printf "│  ITERATION %2d / %-2d  ◇  BUILD                              │\n" "$i" "$END_ITER"
    echo "└─────────────────────────────────────────────────────────────┘"
    ITER_TIMEOUT=$BUILD_TIMEOUT
  fi
  echo ""

  # Backup HTML before each iteration (only if file appears valid)
  if [[ -f "${BUILD_DIR}/_build-final.html" ]]; then
    HTML_SIZE=$(wc -c < "${BUILD_DIR}/_build-final.html" | tr -d ' ')
    if (( HTML_SIZE > 500 )); then
      cp "${BUILD_DIR}/_build-final.html" "${BUILD_DIR}/_build-final.backup.html"
    else
      echo "[warning] _build-final.html is only ${HTML_SIZE} bytes — skipping backup (may be corrupted)"
      echo "[warning] Previous backup preserved at _build-final.backup.html"
    fi
  fi

  # BS-21: Backup checkpoint before each iteration (corruption protection)
  if [[ -f "${BUILD_DIR}/_checkpoint.md" ]]; then
    CKPT_SIZE=$(wc -c < "${BUILD_DIR}/_checkpoint.md" | tr -d ' ')
    if (( CKPT_SIZE > 50 )); then
      cp "${BUILD_DIR}/_checkpoint.md" "${BUILD_DIR}/_checkpoint.backup.md"
    fi
  fi

  # S6-11: Extra backup before shake-up-informed iterations
  # When _shake-up-findings.md exists from a previous shake-up, the next BUILD iteration
  # will make structural changes. Backup with a distinct name so we can roll back.
  if [[ "$IS_SHAKEUP" != true && -f "${BUILD_DIR}/_shake-up-findings.md" && -f "${BUILD_DIR}/_build-final.html" ]]; then
    cp "${BUILD_DIR}/_build-final.html" "${BUILD_DIR}/_build-final.pre-shakeup-response.html"
    echo "[forge] Pre-shake-up-response backup saved"
  fi

  ITERATION_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$i").log"
  ITERATION_START=$(date +%s)

  # ─── S4-07/S4-09b: Shake-up iteration flow ───
  if [[ "$IS_SHAKEUP" == true ]]; then
    echo "[forge] === SHAKE-UP ITERATION === (reason: ${SHAKEUP_REASON})"

    # Archive previous shake-up findings before overwriting
    if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
      cp "${BUILD_DIR}/_shake-up-findings.md" "${BUILD_DIR}/_shake-up-findings-iter${i}.md"
      echo "[forge] Archived previous shake-up findings as _shake-up-findings-iter${i}.md"
    fi

    # Step 1: Detect SHAKE_UP trigger — already done above (SHAKEUP_REASON set)
    echo "[forge] Shake-up trigger: ${SHAKEUP_REASON}"

    # Step 2: Spawn fresh-eyes agent (Opus, sequential)
    echo "[forge] Spawning fresh-eyes agent..."
    FRESH_EYES_PROMPT="$(build_fresh_eyes_prompt "$i" "$MAX_ITERATIONS")"
    FRESH_EYES_PROMPT_FILE="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
    printf '%s' "$FRESH_EYES_PROMPT" > "$FRESH_EYES_PROMPT_FILE"

    FRESH_EYES_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$i")-fresh-eyes.log"
    FRESH_EYES_RUNNER="$(create_runner_script)"

    start_live_display "$FRESH_EYES_LOG"

    set +e
    run_with_timeout "$SHAKEUP_TIMEOUT" bash "$FRESH_EYES_RUNNER" "$FRESH_EYES_PROMPT_FILE" "$FRESH_EYES_LOG"
    FRESH_EYES_EXIT=$?
    set -e

    # Stop live display
    kill_tail_pipeline
    rm -f "$FRESH_EYES_PROMPT_FILE" "$FRESH_EYES_RUNNER"

    # S4-19: Close agent-browser between sub-agents
    agent-browser close 2>/dev/null || true

    if [[ $FRESH_EYES_EXIT -eq 124 ]]; then
      echo "[forge] Fresh-eyes agent TIMED OUT"
    elif [[ $FRESH_EYES_EXIT -ne 0 ]]; then
      echo "[warning] Fresh-eyes agent exited with code ${FRESH_EYES_EXIT}"
    else
      echo "[forge] Fresh-eyes agent completed"
    fi

    # Track proposals from fresh-eyes
    SHAKEUP_AGENT_COUNT=1
    ITER_PROPOSALS=0
    if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
      ITER_PROPOSALS=$(grep -c "^[[:space:]]*[0-9][0-9]*\." "${BUILD_DIR}/_shake-up-findings.md" 2>/dev/null) || ITER_PROPOSALS=0
    fi

    # Parse fresh-eyes output for weak section identifiers
    WEAK_SECTION_1=""
    WEAK_SECTION_2=""
    if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
      # Extract section identifiers from "## Weakest Section #1:" and "#2:" headers
      WEAK_SECTION_1=$(grep -m1 "^## Weakest Section #1:" "${BUILD_DIR}/_shake-up-findings.md" 2>/dev/null | sed 's/^## Weakest Section #1:[[:space:]]*//' || true)
      WEAK_SECTION_2=$(grep -m1 "^## Weakest Section #2:" "${BUILD_DIR}/_shake-up-findings.md" 2>/dev/null | sed 's/^## Weakest Section #2:[[:space:]]*//' || true)
    fi

    echo "[forge] Weak section #1: ${WEAK_SECTION_1:-'(not identified)'}"
    echo "[forge] Weak section #2: ${WEAK_SECTION_2:-'(not identified)'}"

    # Step 3: If plateau — mandatory restructure + competitive alternatives
    if [[ "$SHAKEUP_REASON" == "plateau" ]]; then
      echo "[forge] Plateau shake-up: writing mandatory restructure directive..."

      # S4-09a: Write mandatory restructure directive to _shake-up-findings.md
      if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
        cat >> "${BUILD_DIR}/_shake-up-findings.md" <<MANDATORY_RESTRUCTURE

## Mandatory Restructure

The following 2 sections are identified as the weakest by the fresh-eyes agent and MUST be restructured:

1. ${WEAK_SECTION_1:-"(Section #1 — see fresh-eyes assessment above)"} — MANDATORY: Change HTML structure (different element types, different layout pattern, different component). CSS-only changes are PROHIBITED.
2. ${WEAK_SECTION_2:-"(Section #2 — see fresh-eyes assessment above)"} — MANDATORY: Same structural requirement.

Mandatory restructure is NOT rejectable. The builder MUST implement structural changes to both sections. ACCEPT/INTEGRATE are the only valid responses (no REJECT).
MANDATORY_RESTRUCTURE
      fi

      # Spawn 2-3 competitive alternative agents SEQUENTIALLY
      DIRECTION_TYPES=("density" "editorial" "compositional")
      COMP_ALT_COUNT=0
      for direction in "${DIRECTION_TYPES[@]}"; do
        # Use weak section #1 for density/editorial, #2 for compositional
        TARGET_SECTION="$WEAK_SECTION_1"
        if [[ "$direction" == "compositional" ]]; then
          TARGET_SECTION="$WEAK_SECTION_2"
        fi

        # Skip if we have no target section identifier
        if [[ -z "$TARGET_SECTION" ]]; then
          echo "[forge] Skipping ${direction} competitive alt — no target section identified"
          continue
        fi

        # BS-18: Skip competitive alts if design-system not found (references don't exist)
        if [[ "$DESIGN_SYSTEM_DIR" == "NOT_FOUND" ]]; then
          echo "[forge] Skipping competitive alts — design-system not found, no reference files available"
          break
        fi

        # BS-08: Select references based on creative direction, not hardcoded "default"
        case "$direction" in
          density)       COMP_REFS="$(select_references_for_section "list")" ;;
          editorial)     COMP_REFS="$(select_references_for_section "prose")" ;;
          compositional) COMP_REFS="$(select_references_for_section "comparison")" ;;
          *)             COMP_REFS="$(select_references_for_section "default")" ;;
        esac

        # BS-30: Read existing findings content to inject into prompt (prevents overwrite)
        EXISTING_FINDINGS=""
        if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
          EXISTING_FINDINGS="$(<"${BUILD_DIR}/_shake-up-findings.md")"
        fi

        echo "[forge] Spawning competitive alternative agent (${direction})..."
        COMP_ALT_PROMPT="$(build_competitive_alt_prompt "$i" "$direction" "$TARGET_SECTION" "$COMP_REFS" "$EXISTING_FINDINGS")"
        COMP_ALT_PROMPT_FILE="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
        printf '%s' "$COMP_ALT_PROMPT" > "$COMP_ALT_PROMPT_FILE"

        COMP_ALT_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$i")-comp-alt-${direction}.log"
        COMP_ALT_RUNNER="$(create_runner_script)"

        start_live_display "$COMP_ALT_LOG"

        set +e
        run_with_timeout "$SHAKEUP_TIMEOUT" bash "$COMP_ALT_RUNNER" "$COMP_ALT_PROMPT_FILE" "$COMP_ALT_LOG"
        COMP_ALT_EXIT=$?
        set -e

        # Stop live display
        kill_tail_pipeline
        rm -f "$COMP_ALT_PROMPT_FILE" "$COMP_ALT_RUNNER"

        # S4-19: Close agent-browser between sub-agents
        agent-browser close 2>/dev/null || true

        COMP_ALT_COUNT=$((COMP_ALT_COUNT + 1))
        SHAKEUP_AGENT_COUNT=$((SHAKEUP_AGENT_COUNT + 1))

        if [[ $COMP_ALT_EXIT -eq 124 ]]; then
          echo "[forge] Competitive alt (${direction}) TIMED OUT"
        elif [[ $COMP_ALT_EXIT -ne 0 ]]; then
          echo "[warning] Competitive alt (${direction}) exited with code ${COMP_ALT_EXIT}"
        else
          echo "[forge] Competitive alt (${direction}) completed"
        fi
      done

      echo "[forge] ${COMP_ALT_COUNT} competitive alternative agents completed"

      # Step 7: If severe plateau (STALL_COUNT >= 5) — also run design director
      if (( STALL_COUNT >= 5 )); then
        echo "[forge] Severe plateau detected (STALL_COUNT=${STALL_COUNT}) — spawning design director..."
        # BS-30: Read existing findings to inject into DD prompt
        DD_EXISTING_FINDINGS=""
        if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
          DD_EXISTING_FINDINGS="$(<"${BUILD_DIR}/_shake-up-findings.md")"
        fi
        DD_PROMPT="$(build_design_director_prompt "$i" "$DD_EXISTING_FINDINGS")"
        DD_PROMPT_FILE="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
        printf '%s' "$DD_PROMPT" > "$DD_PROMPT_FILE"

        DD_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$i")-design-director.log"
        DD_RUNNER="$(create_runner_script)"

        start_live_display "$DD_LOG"

        set +e
        run_with_timeout "$SHAKEUP_TIMEOUT" bash "$DD_RUNNER" "$DD_PROMPT_FILE" "$DD_LOG"
        DD_EXIT=$?
        set -e

        # Stop live display
        kill_tail_pipeline
        rm -f "$DD_PROMPT_FILE" "$DD_RUNNER"

        # S4-19: Close agent-browser after design director
        agent-browser close 2>/dev/null || true

        SHAKEUP_AGENT_COUNT=$((SHAKEUP_AGENT_COUNT + 1))

        if [[ $DD_EXIT -eq 124 ]]; then
          echo "[forge] Design director TIMED OUT"
        elif [[ $DD_EXIT -ne 0 ]]; then
          echo "[warning] Design director exited with code ${DD_EXIT}"
        else
          echo "[forge] Design director completed"
        fi
      fi

    else
      # Scheduled shake-up — fresh-eyes proposals only (no mandatory restructure, no competitive alternatives)
      echo "[forge] ${SHAKEUP_REASON^} shake-up — fresh-eyes proposals only (no mandatory restructure)"
    fi

    # S4-20: Post-shake-up metrics
    # Re-count proposals from the final _shake-up-findings.md
    FINAL_PROPOSALS=0
    if [[ -f "${BUILD_DIR}/_shake-up-findings.md" ]]; then
      FINAL_PROPOSALS=$(grep -c "^[[:space:]]*[0-9][0-9]*\." "${BUILD_DIR}/_shake-up-findings.md" 2>/dev/null) || FINAL_PROPOSALS=0
    fi
    echo ""
    echo "[forge] Shake-up complete: ${FINAL_PROPOSALS} proposals from 1 fresh-eyes + $((SHAKEUP_AGENT_COUNT - 1)) competitive agents"
    echo "[forge] Weakest sections: #1 [${WEAK_SECTION_1:-unknown}], #2 [${WEAK_SECTION_2:-unknown}]"
    if [[ "$SHAKEUP_REASON" == "plateau" ]]; then
      echo "[forge] Mandatory restructure: YES (plateau)"
    else
      echo "[forge] Mandatory restructure: NO (scheduled)"
    fi

    # Update session-level shake-up tracking
    SHAKEUP_COUNT=$((SHAKEUP_COUNT + 1))
    SHAKEUP_PROPOSALS=$((SHAKEUP_PROPOSALS + FINAL_PROPOSALS))

    # Reset stall count after plateau shake-up (S4-06)
    # BS-20: Only reset if fresh-eyes produced usable output — otherwise plateau won't re-trigger
    if [[ "$SHAKEUP_REASON" == "plateau" ]]; then
      if (( FINAL_PROPOSALS > 0 )); then
        STALL_COUNT=0
        echo "$STALL_COUNT" > "$STALL_COUNT_FILE"
        echo "[forge] Stall count reset after plateau shake-up (${FINAL_PROPOSALS} proposals generated)"
      else
        echo "[warning] Stall count NOT reset — fresh-eyes produced no usable proposals"
        echo "[warning] Plateau shake-up will re-trigger next iteration"
      fi
    fi

    echo ""

    # Defensive cleanup before skipping to next iteration (mirrors inter-iteration cleanup)
    if [[ -n "${CURRENT_PGID:-}" ]]; then
      if kill -0 -- -"$CURRENT_PGID" 2>/dev/null; then
        echo "[warning] Orphaned processes after shake-up. Killing..."
        kill -9 -- -"$CURRENT_PGID" 2>/dev/null || true
        sleep 1
      fi
      CURRENT_PGID=""
    fi
    if [[ -n "${TIMER_PID:-}" ]]; then
      kill "$TIMER_PID" 2>/dev/null || true
      TIMER_PID=""
    fi
    agent-browser close 2>/dev/null || true
    sleep 3  # Inter-iteration pause

    # Skip the normal build/PA prompt flow for shake-up iterations
    continue
  fi

  # ─── Build the prompt ────────────────────────────────────────────
  if [[ "$IS_PA" == true ]]; then
    # Archive previous PA findings before overwriting (enables recurring finding detection)
    if [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
      PREV_PA_COUNT=$(ls "${BUILD_DIR}"/_pa-findings-iter*.md 2>/dev/null | wc -l | tr -d ' ') || PREV_PA_COUNT=0
      PREV_PA_NUM=$((PREV_PA_COUNT + 1))
      cp "${BUILD_DIR}/_pa-findings.md" "${BUILD_DIR}/_pa-findings-iter${PREV_PA_NUM}.md"
      echo "[forge] Archived previous PA findings as _pa-findings-iter${PREV_PA_NUM}.md"
    fi
    PROMPT="$(build_pa_prompt "$i" "$MAX_ITERATIONS")"
    echo "[forge] Starting cold-eyes perceptual audit (timeout: ${ITER_TIMEOUT}s)..."
  else
    PROMPT="$(build_forge_prompt "$i" "$MAX_ITERATIONS")"
    # Gap 9: Inject timeout warning if previous iteration timed out
    PREV_ITER=$((i - 1))
    PREV_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$PREV_ITER").log"
    if [[ -f "$PREV_LOG" ]] && grep -q "TIMED OUT" "$PREV_LOG" 2>/dev/null; then
      PROMPT="${PROMPT}

WARNING: Iteration ${PREV_ITER} TIMED OUT. Its changes may be incomplete. Re-verify the page
state before trusting the checkpoint. Take screenshots and compare against the checkpoint's claims."
    fi
    echo "[forge] Starting build iteration ${i} (timeout: ${ITER_TIMEOUT}s)..."
  fi

  # Write prompt to a named temp file
  PROMPT_FILE="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
  printf '%s' "$PROMPT" > "$PROMPT_FILE"

  # ─── Run with timeout and live display ─────────────────────────
  # Direct redirect to log, tail -f for live display
  RUNNER_SCRIPT="$(create_runner_script)"

  # Start live display (SH-013: shared function)
  start_live_display "$ITERATION_LOG"

  set +e
  run_with_timeout "$ITER_TIMEOUT" bash "$RUNNER_SCRIPT" "$PROMPT_FILE" "$ITERATION_LOG"
  EXIT_CODE=$?
  set -e

  # Stop live display before printing status
  kill_tail_pipeline
  echo ""  # Ensure clean line after tail output

  # Clean up temp files
  rm -f "$PROMPT_FILE" "$RUNNER_SCRIPT"

  ITERATION_END=$(date +%s)
  ITERATION_DURATION=$(( ITERATION_END - ITERATION_START ))

  # SH-035: Track build/PA time
  if [[ "$IS_PA" == true ]]; then
    TOTAL_PA_TIME=$((TOTAL_PA_TIME + ITERATION_DURATION))
    PA_COUNT=$((PA_COUNT + 1))
  else
    TOTAL_BUILD_TIME=$((TOTAL_BUILD_TIME + ITERATION_DURATION))
    BUILD_COUNT=$((BUILD_COUNT + 1))
  fi

  if [[ $EXIT_CODE -eq 124 ]]; then
    echo "[forge] TIMED OUT after ${ITERATION_DURATION}s (limit: ${ITER_TIMEOUT}s)"
    echo "[forge] Log: ${ITERATION_LOG}"
    # Write timeout sentinel to the log so next iteration's timeout check can find it
    echo '{"type":"timeout","message":"TIMED OUT"}' >> "$ITERATION_LOG"
  elif [[ "$IS_PA" == true ]]; then
    echo "[forge] PA completed in ${ITERATION_DURATION}s (exit code: ${EXIT_CODE})"
    if [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
      echo "[forge] PA findings written to _pa-findings.md"
      # Show the grade
      grep -i "Overall Visual Grade:" "${BUILD_DIR}/_pa-findings.md" 2>/dev/null | head -1 || true
      # SH-038: Extract top 5 findings for builder prompt injection
      sed -n '/## Top 5 Visual Priorities/,/## /p' "${BUILD_DIR}/_pa-findings.md" 2>/dev/null | head -20 > "${BUILD_DIR}/_pa-top5.md" || true
      if [[ -s "${BUILD_DIR}/_pa-top5.md" ]]; then
        echo "[forge] Extracted top 5 PA findings to _pa-top5.md"
      fi
    fi
  else
    echo "[forge] Build iteration ${i} completed in ${ITERATION_DURATION}s (exit code: ${EXIT_CODE})"
  fi

  if [[ $EXIT_CODE -ne 0 && $EXIT_CODE -ne 124 ]]; then
    echo "[warning] Non-zero exit code. Check log: ${ITERATION_LOG}"
    echo "[warning] Continuing to next iteration..."
    echo ""
  fi

  # Log completeness check (JSONL logs are much larger than plain text)
  if [[ -f "$ITERATION_LOG" ]]; then
    LOG_SIZE=$(wc -c < "$ITERATION_LOG" | tr -d ' ')
    echo "[forge] Log: ${ITERATION_LOG} (${LOG_SIZE} bytes)"
    if (( LOG_SIZE < 100 )); then
      echo "[warning] Log is nearly empty (${LOG_SIZE} bytes). Claude may have failed to produce output."
    fi
  fi

  # Zero-output detection
  if [[ $EXIT_CODE -eq 0 && -f "$ITERATION_LOG" ]]; then
    if (( LOG_SIZE < 100 )); then
      echo "[warning] Claude exited 0 but produced almost no output (${LOG_SIZE} bytes)."
      echo "[warning] This usually means an authentication or configuration error."
    fi
  fi

  # Post-iteration checkpoint metric extraction (Change W + Gap 12)
  # Requires Change J (page height tracking) in SKILL.md to populate these fields
  if [[ "$IS_PA" != true && -f "${BUILD_DIR}/_checkpoint.md" ]]; then
    PAGE_HEIGHT=$(grep -o 'Page height: [0-9]*' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 | sed 's/Page height: //' ) || true
    PA_FAILED=$(grep -c 'Verdict: FAILED' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null) || PA_FAILED=0
    PROBLEMS_COUNT=$(grep -c 'Iterations unresolved:' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null) || PROBLEMS_COUNT=0
    if [[ -n "$PAGE_HEIGHT" ]]; then
      echo "[forge] Page height: ${PAGE_HEIGHT}px"
    fi
    if (( PA_FAILED > 0 )); then
      echo "[warning] ${PA_FAILED} PA findings marked FAILED in checkpoint"
    fi
    if (( PROBLEMS_COUNT == 0 )); then
      echo "[warning] Problem ledger is empty — builder may have stopped looking"
    fi
  fi

  # SH-017: Post-build CSS physics lint gate
  if [[ "$IS_PA" != true && -f "${BUILD_DIR}/_build-final.html" ]]; then
    CSS_LINT_ISSUES=0
    # Check for border-radius violations (Design System Physics: border-radius: 0)
    if grep -qE 'border-radius:\s*[1-9]' "${BUILD_DIR}/_build-final.html" 2>/dev/null; then
      BR_COUNT=$(grep -cE 'border-radius:\s*[1-9]' "${BUILD_DIR}/_build-final.html" 2>/dev/null) || BR_COUNT=0
      echo "[CSS lint] WARNING: ${BR_COUNT} border-radius > 0 declarations (Design System Physics requires border-radius: 0)"
      CSS_LINT_ISSUES=$((CSS_LINT_ISSUES + BR_COUNT))
    fi
    # Check for box-shadow violations (Design System Physics: no decorative shadows)
    if grep -qE 'box-shadow:\s*[^n]' "${BUILD_DIR}/_build-final.html" 2>/dev/null; then
      BS_COUNT=$(grep -cE 'box-shadow:\s*[^n]' "${BUILD_DIR}/_build-final.html" 2>/dev/null) || BS_COUNT=0
      echo "[CSS lint] WARNING: ${BS_COUNT} box-shadow declarations (Design System Physics: no decorative shadows)"
      CSS_LINT_ISSUES=$((CSS_LINT_ISSUES + BS_COUNT))
    fi
    if (( CSS_LINT_ISSUES > 0 )); then
      echo "[CSS lint] ${CSS_LINT_ISSUES} physics violations found — builder should fix on next iteration"
    fi
  fi

  # PA-specific screenshot count check for gaming prevention
  if [[ "$IS_PA" == true ]]; then
    PA_SCREENSHOTS=$(ls "${BUILD_DIR}/_screenshots/pa-${i}-"*.png 2>/dev/null | wc -l | tr -d ' ')
    if (( PA_SCREENSHOTS < 5 )); then
      echo "[warning] PA produced only ${PA_SCREENSHOTS} screenshot files — PA may have skipped visual assessment"
    else
      echo "[forge] PA captured ${PA_SCREENSHOTS} screenshots"
    fi
  fi

  # BS-07: Spot-check screenshot file sizes for blank detection
  # Real content = 30KB+, blank white = ~5-6KB
  BLANK_SCREENSHOTS=0
  CHECKED_SCREENSHOTS=0
  for screenshot in $(ls -t "${BUILD_DIR}/_screenshots/"*.png 2>/dev/null | head -3); do
    CHECKED_SCREENSHOTS=$((CHECKED_SCREENSHOTS + 1))
    SS_SIZE=$(wc -c < "$screenshot" | tr -d ' ')
    if (( SS_SIZE < 10000 )); then
      BLANK_SCREENSHOTS=$((BLANK_SCREENSHOTS + 1))
    fi
  done
  if (( BLANK_SCREENSHOTS > 0 && CHECKED_SCREENSHOTS > 0 )); then
    echo "[WARNING] ${BLANK_SCREENSHOTS}/${CHECKED_SCREENSHOTS} recent screenshots are < 10KB — likely BLANK"
    echo "[WARNING] agent-browser may be producing blank screenshots. Check browser health."
  fi

  # ─── Inter-iteration cleanup ──────────────────────────────────────
  # Kill tail -f pipeline and children from this iteration
  kill_tail_pipeline

  # Verify the runner's process group is fully dead
  if [[ -n "${CURRENT_PGID:-}" ]]; then
    if kill -0 -- -"$CURRENT_PGID" 2>/dev/null; then
      echo "[warning] Orphaned processes detected from iteration ${i}. Killing..."
      kill -9 -- -"$CURRENT_PGID" 2>/dev/null || true
      sleep 1
    fi
    CURRENT_PGID=""
  fi

  # Clear timer
  if [[ -n "${TIMER_PID:-}" ]]; then
    kill "$TIMER_PID" 2>/dev/null || true
    TIMER_PID=""
  fi

  # Close agent-browser session from this iteration
  agent-browser close 2>/dev/null || true

  # Archive notebook entry for this iteration
  if [[ "$IS_PA" != true && -f "${BUILD_DIR}/_notebook.md" ]]; then
    cp "${BUILD_DIR}/_notebook.md" "${BUILD_DIR}/_notebook-iter$(printf '%02d' "$i").md"
  fi

  # ─── SH-023: Stalled iteration detection (HTML diff only) ──────────
  if [[ "$IS_PA" != true && -f "${BUILD_DIR}/_build-final.html" && -f "${BUILD_DIR}/_build-final.backup.html" ]]; then
    DIFF_LINES=$(diff "${BUILD_DIR}/_build-final.backup.html" "${BUILD_DIR}/_build-final.html" 2>/dev/null | wc -l | tr -d ' ') || true
    if [[ "$DIFF_LINES" -lt 10 ]]; then
      STALL_COUNT=$(( STALL_COUNT + 1 ))
      echo "[warning] STALLED ITERATION (${STALL_COUNT} consecutive) — only ${DIFF_LINES} lines of diff."
      if (( STALL_COUNT >= STALL_THRESHOLD )); then
        echo "[warning] PLATEAU DETECTED — ${STALL_THRESHOLD} consecutive stalled iterations."
        echo "[warning] Builder should RESTRUCTURE, not refine."
      fi
    else
      STALL_COUNT=0
    fi
    echo "$STALL_COUNT" > "$STALL_COUNT_FILE"
  fi

  # (v7: Convergence detection removed — PA grade is the sole stopping gate)

  # ─── Check completion ───────────────────────────────────────────
  if [[ "$IS_PA" != true && -f "${BUILD_DIR}/_checkpoint.md" ]]; then
    if grep -q "READY_FOR_FINAL_PA" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null; then
      echo ""
      echo "╔══════════════════════════════════════════════════════════════╗"
      echo "║  FORGE — READY FOR FINAL PA                                 ║"
      printf "║  Builder marked READY_FOR_FINAL_PA after iteration %-2d      ║\n" "$i"
      echo "║  Running one final perceptual audit to validate...          ║"
      echo "╚══════════════════════════════════════════════════════════════╝"
      echo ""

      # Run the final PA (keep this section as-is from the existing code)
      FINAL_PA_ITER=$(( i + 1 ))
      FINAL_PA_LOG="${LOG_DIR}/iteration-$(printf '%02d' "$FINAL_PA_ITER")-final-pa.log"

      echo "┌─────────────────────────────────────────────────────────────┐"
      printf "│  ITERATION %2d        ◆  FINAL PERCEPTUAL AUDIT             │\n" "$FINAL_PA_ITER"
      echo "└─────────────────────────────────────────────────────────────┘"
      echo ""

      if [[ -f "${BUILD_DIR}/_build-final.html" ]]; then
        cp "${BUILD_DIR}/_build-final.html" "${BUILD_DIR}/_build-final.backup.html"
      fi

      PROMPT="$(build_pa_prompt "$FINAL_PA_ITER" "$MAX_ITERATIONS")"
      echo "[forge] Starting FINAL cold-eyes perceptual audit (timeout: ${PA_TIMEOUT}s)..."

      PROMPT_FILE="$(mktemp /tmp/spatial-forge-prompt.XXXXXX)"
      printf '%s' "$PROMPT" > "$PROMPT_FILE"

      RUNNER_SCRIPT="$(create_runner_script)"

      start_live_display "$FINAL_PA_LOG"

      FINAL_PA_START=$(date +%s)
      set +e
      run_with_timeout "$PA_TIMEOUT" bash "$RUNNER_SCRIPT" "$PROMPT_FILE" "$FINAL_PA_LOG"
      FINAL_EXIT=$?
      set -e

      kill_tail_pipeline
      rm -f "$PROMPT_FILE" "$RUNNER_SCRIPT"

      FINAL_PA_END=$(date +%s)
      FINAL_PA_DURATION=$(( FINAL_PA_END - FINAL_PA_START ))

      echo ""
      if [[ $FINAL_EXIT -eq 124 ]]; then
        echo "[forge] FINAL PA TIMED OUT after ${FINAL_PA_DURATION}s"
      else
        echo "[forge] FINAL PA completed in ${FINAL_PA_DURATION}s (exit code: ${FINAL_EXIT})"
        if [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
          echo "[forge] Final PA findings written to _pa-findings.md"
          grep -i "Overall Visual Grade:" "${BUILD_DIR}/_pa-findings.md" 2>/dev/null | head -1 || true
        fi
      fi
      echo ""

      break
    fi
  fi

  # ─── Inter-iteration pause with verification ──────────────────────
  if (( i < HARD_MAX_ITERATIONS )); then
    echo ""

    # Verify HTTP server is still alive
    if ! kill -0 "$SERVER_PID" 2>/dev/null; then
      echo "[warning] HTTP server died. Restarting on port ${PORT}..."
      lsof -ti:"${PORT}" 2>/dev/null | xargs kill -9 2>/dev/null || true
      sleep 0.5
      python3 -m http.server "${PORT}" --directory "${BUILD_DIR}" &>/dev/null &
      SERVER_PID=$!
      sleep 1
      if ! kill -0 "$SERVER_PID" 2>/dev/null; then
        echo "[error] Failed to restart HTTP server. Exiting."
        exit 1
      fi
      echo "[forge] HTTP server restarted (PID: ${SERVER_PID})"
    fi

    # Verify no claude processes linger
    REMAINING=$(pgrep -f "claude.*dangerously-skip-permissions" 2>/dev/null | wc -l | tr -d ' ') || true
    if (( REMAINING > 0 )); then
      echo "[warning] ${REMAINING} claude processes still running. Waiting 5s..."
      sleep 5
      pkill -9 -f "claude.*dangerously-skip-permissions" 2>/dev/null || true
      sleep 1
    fi

    echo "[forge] Pausing 3s before next iteration..."
    echo ""
    sleep 3
  fi
done

# ─── Summary ─────────────────────────────────────────────────────────

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  FORGE SESSION COMPLETE"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "  Output:       ${BUILD_DIR}/_build-final.html"
echo "  Checkpoint:   ${BUILD_DIR}/_checkpoint.md"
echo "  PA Findings:  ${BUILD_DIR}/_pa-findings.md"
echo "  Screenshots:  ${BUILD_DIR}/_screenshots/"
echo "  Logs:         ${LOG_DIR}/"
echo ""

# Show final state
if [[ -f "${BUILD_DIR}/_checkpoint.md" ]]; then
  echo "  ─── Final Checkpoint ───"
  echo ""
  grep -i "Current Level:" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 || true
  grep -i "Status:" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | tail -1 || true
  grep -i "Content Integrity" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 || true
  grep -i "SUPPLEMENTARY\|missing" "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -3 || true
  echo ""
fi

if [[ -f "${BUILD_DIR}/_pa-findings.md" ]]; then
  echo "  ─── Last PA Grade ───"
  echo ""
  grep -i "Overall Visual Grade:" "${BUILD_DIR}/_pa-findings.md" 2>/dev/null | head -1 || true
  echo ""
fi

# S5-09: Research absorption summary
if [[ -f "${BUILD_DIR}/_checkpoint.md" ]]; then
  TOTAL_ABSORBED=$(grep -oE '[0-9]+/[0-9]+ files' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 || true)
  if [[ -n "$TOTAL_ABSORBED" ]]; then
    echo "  ─── Research Summary ───"
    echo ""
    echo "  [summary] Research absorbed: ${TOTAL_ABSORBED}"
    # Try to extract tier breakdown if checkpoint has it
    TIER1_COUNT=$(grep -oE 'Tier 1: [0-9]+/[0-9]+' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 || true)
    TIER2_COUNT=$(grep -oE 'Tier 2: [0-9]+/[0-9]+' "${BUILD_DIR}/_checkpoint.md" 2>/dev/null | head -1 || true)
    if [[ -n "$TIER1_COUNT" || -n "$TIER2_COUNT" ]]; then
      echo "  [summary] ${TIER1_COUNT:-Tier 1: unknown}, ${TIER2_COUNT:-Tier 2: unknown}"
    fi
    echo ""
  fi
fi

# Notebook summary
if [[ -f "${BUILD_DIR}/_notebook.md" ]]; then
  NOTEBOOK_ENTRIES=$(grep -c "^## Iteration" "${BUILD_DIR}/_notebook.md" 2>/dev/null) || NOTEBOOK_ENTRIES=0
  echo "  ─── Builder's Notebook ───"
  echo ""
  echo "  [summary] Notebook entries: ${NOTEBOOK_ENTRIES}"
  # Show last definition of good
  LAST_DEF=$(grep -A1 "### My Definition" "${BUILD_DIR}/_notebook.md" 2>/dev/null | tail -1 || true)
  if [[ -n "$LAST_DEF" ]]; then
    echo "  [summary] Last definition of good: ${LAST_DEF}"
  fi
  echo ""
fi

# S5-10: Shake-up summary
if (( SHAKEUP_COUNT > 0 )); then
  echo "  ─── Shake-Up Summary ───"
  echo ""
  echo "  [summary] Shake-ups: ${SHAKEUP_COUNT}"
  echo "  [summary] Total proposals generated: ${SHAKEUP_PROPOSALS}"
  echo ""
fi

# SH-035: Timing summary
FORGE_TOTAL_TIME=$(($(date +%s) - FORGE_START_TIME))
echo "  ─── Timing Summary ───"
echo ""
if (( BUILD_COUNT > 0 )); then
  echo "  [timing] Build: ${BUILD_COUNT} iterations, ${TOTAL_BUILD_TIME}s total, $((TOTAL_BUILD_TIME / BUILD_COUNT))s avg"
fi
if (( PA_COUNT > 0 )); then
  echo "  [timing] PA: ${PA_COUNT} audits, ${TOTAL_PA_TIME}s total, $((TOTAL_PA_TIME / PA_COUNT))s avg"
fi
echo "  [timing] Session total: ${FORGE_TOTAL_TIME}s ($((FORGE_TOTAL_TIME / 60))m)"
echo ""

echo "  To continue forging:"
echo "    $0 \"$CONTENT_PATH\" <more-iterations> ${PORT} ${PA_INTERVAL} ${SHAKE_INTERVAL}"
echo ""
