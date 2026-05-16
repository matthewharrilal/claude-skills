#!/usr/bin/env bash
# compose.sh — The next phase of the research program
#
# DD->OD->AD->CD->content. Each phase carried the full mass forward.
# This script carries the ENTIRE research corpus to the compose agent
# through staged absorption passes, then iterative deepening.
#
# Architecture:
#   1. Collect all text files from the research corpus
#   2. Order by research phase (research->foundations->DD->OD->AD->CD->core->spec->pipeline)
#   3. Split into SMALL chunks for deep absorption (~3500 lines each)
#   4. Each pass: SKILL + corpus chunk + content + current HTML -> HTML
#   5. After all chunks absorbed: pure deepening passes
#   6. Agent has Read access to ALL corpus files throughout
#
# Small chunks (not max capacity) ensure the agent deeply absorbs
# every line. 40 passes of focused absorption > 4 passes of diluted
# maximum-capacity injection. Attention quality over token quantity.
#
# Usage: ./compose.sh <content-path> [max-iterations] [corpus-dir]

set -euo pipefail

CONTENT="${1:?Usage: compose.sh <content-path> [max-iterations] [corpus-dir]}"
MAX="${2:-100}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL="$SCRIPT_DIR/SKILL.md"

# ── Configuration ──────────────────────────────────────────────────

# Lines per absorption chunk. Small = deep absorption per pass.
# Corpus avg: 51 chars/line → ~14 tokens/line → 1000 lines ≈ 14K tokens.
# With SKILL (~2K) + content (~5K) + HTML (growing) + refs (~5K),
# total stays under 30-40K tokens — uniformly high attention.
# 114K research corpus / 1000 = ~114 absorption passes.
# Override with LINES_PER_CHUNK env var.
LINES_PER_CHUNK="${LINES_PER_CHUNK:-1000}"

# Model for compose agents
MODEL="${MODEL:-claude-opus-4-6}"

# ── Corpus discovery ───────────────────────────────────────────────

PROJECT_ROOT="$(git -C "$(pwd)" rev-parse --show-toplevel 2>/dev/null || pwd)"
CORPUS_ROOTS=()
if [ -n "${3:-}" ]; then
  CORPUS_ROOTS+=("$(cd "$3" && pwd)")
else
  [ -d "$PROJECT_ROOT/design-system" ] && CORPUS_ROOTS+=("$PROJECT_ROOT/design-system")
  [ -d "$PROJECT_ROOT/first-principles" ] && CORPUS_ROOTS+=("$PROJECT_ROOT/first-principles")
fi

# ── Path resolution ────────────────────────────────────────────────

CONTENT="$(cd "$(dirname "$CONTENT")" && pwd)/$(basename "$CONTENT")"

# ── Build directory ────────────────────────────────────────────────

DIR="./builds/$(basename "$CONTENT" .md)-$(date +%Y%m%d-%H%M%S)"
HTML="$DIR/page.html"
mkdir -p "$DIR"
cp "$CONTENT" "$DIR/content.md"

echo "compose"
echo "  content:      $CONTENT"
echo "  output:       $HTML"
echo "  max iter:     $MAX"
echo "  chunk size:   $LINES_PER_CHUNK lines"
if [ ${#CORPUS_ROOTS[@]} -gt 0 ]; then
  echo "  corpus roots: ${CORPUS_ROOTS[*]}"
fi
echo ""

# ── Corpus collection & ordering ───────────────────────────────────

NUM_CHUNKS=0
TOTAL_LINES=0
REF_LIST=""
declare -a ORDERED_FILES=()

if [ ${#CORPUS_ROOTS[@]} -eq 0 ]; then
  echo "  no corpus found — running without absorption phases"
  echo ""
else
  echo "collecting corpus..."

  # Find research artifacts only — no operational infrastructure or navigation
  # Included: explorations, research, case studies, first-principles,
  #           compositional core, specification/provenance, perceptual audit/research
  # Excluded: pipeline (operational), implementation, tension-test,
  #           README.md/CLAUDE.md (navigation indices), node_modules
  ALL_CORPUS_FILES=()
  for root in "${CORPUS_ROOTS[@]}"; do
    while IFS= read -r f; do
      ALL_CORPUS_FILES+=("$f")
    done < <(find -L "$root" -type f \
      \( -name "*.md" -o -name "*.html" -o -name "*.css" \) \
      ! -name ".DS_Store" \
      ! -name "README.md" \
      ! -name "CLAUDE.md" \
      ! -path "*/.git/*" \
      ! -path "*/screenshots/*" \
      ! -path "*/node_modules/*" \
      ! -path "*/implementation/*" \
      ! -path "*/tension-test/*" \
      ! -path "*/pipeline/*" \
      | sort)
  done

  echo "  found ${#ALL_CORPUS_FILES[@]} files"

  # ── Phase ordering ─────────────────────────────────────────────
  # Files ordered by the research program's trajectory.
  # Each phase's artifacts are grouped together so the agent
  # absorbs them in the order the research program produced them.
  #
  # Phase map (2-digit prefix for sort stability):
  #   00 - Design system root (CLAUDE.md, README.md)
  #   01 - Research corpus (R1-R5, synthesis)
  #   02 - First principles: foundations
  #   03 - First principles: compounding
  #   04 - First principles: operationalization
  #   05 - First principles: other
  #   06 - DD explorations (HTML artifacts)
  #   07 - DD provenance (stage-2 handoff, findings)
  #   08 - DD case studies (compositional core)
  #   09 - OD explorations (HTML artifacts)
  #   10 - OD provenance (stage-3 handoff, findings)
  #   11 - OD case studies (compositional core)
  #   12 - AD explorations (HTML artifacts)
  #   13 - AD perceptual audit (findings)
  #   14 - AD perceptual research (methodology)
  #   15 - AD provenance (stage-4 handoff, findings)
  #   16 - CD explorations (HTML artifacts)
  #   17 - CD provenance (stage-5 handoff, findings)
  #   18 - CD case studies (compositional core)
  #   19-27 - Compositional core layers
  #   28-31 - Specification layers
  #   32 - Pipeline
  #   33 - Validated explorations root
  #   99 - Uncategorized

  phase_of() {
    local f="$1"
    case "$f" in
      */design-system/CLAUDE*|*/design-system/README*) echo "00" ;;
      */research/*)                                    echo "01" ;;
      */first-principles/foundations/*)                 echo "02" ;;
      */first-principles/compounding/*)                echo "03" ;;
      */first-principles/operationalization/*)          echo "04" ;;
      */first-principles/*)                            echo "05" ;;
      */validated-explorations/density/*)               echo "06" ;;
      */stage-2-density*)                              echo "07" ;;
      */case-studies/[Dd][Dd]*)                        echo "08" ;;
      */validated-explorations/organizational/*)        echo "09" ;;
      */stage-3-org*)                                  echo "10" ;;
      */case-studies/[Oo][Dd]*)                        echo "11" ;;
      */axis/AD-*|*/axis/CLAUDE*)                      echo "12" ;;
      */axis/_perceptual-audit/*)                      echo "13" ;;
      */axis/_perceptual-research/*)                   echo "14" ;;
      */stage-4-axis*)                                 echo "15" ;;
      */validated-explorations/combination/*)           echo "16" ;;
      */stage-5-comb*)                                 echo "17" ;;
      */case-studies/[Cc][Dd]*)                        echo "18" ;;
      */case-studies/*)                                echo "18" ;;
      */compositional-core/identity/*)                 echo "19" ;;
      */compositional-core/vocabulary/*)               echo "20" ;;
      */compositional-core/grammar/*)                  echo "21" ;;
      */compositional-core/components/*)               echo "22" ;;
      */compositional-core/guidelines/*)               echo "23" ;;
      */compositional-core/process/*)                  echo "24" ;;
      */compositional-core/validation/*)               echo "25" ;;
      */compositional-core/skill-enrichments/*)        echo "26" ;;
      */compositional-core/*)                          echo "27" ;;
      */specification/tokens/*)                        echo "28" ;;
      */specification/patterns/*)                      echo "29" ;;
      */specification/provenance/original-research/*)  echo "30a" ;;
      */specification/provenance/*)                    echo "30" ;;
      */specification/*)                               echo "31" ;;
      */pipeline/*)                                    echo "32" ;;
      */validated-explorations/*)                      echo "33" ;;
      *)                                               echo "99" ;;
    esac
  }

  # Sort: phase prefix first, then alphabetical within phase
  while IFS= read -r line; do
    ORDERED_FILES+=("${line#*	}")
  done < <(
    for f in "${ALL_CORPUS_FILES[@]}"; do
      printf '%s\t%s\n' "$(phase_of "$f")" "$f"
    done | sort -t$'\t' -k1,1 -k2,2
  )

  echo "  ordered ${#ORDERED_FILES[@]} files by research phase"

  # ── Chunk splitting ────────────────────────────────────────────
  # Split into small chunks, keeping files whole within each chunk.
  # Each chunk stays under LINES_PER_CHUNK lines.
  # If a single file exceeds the limit, it gets its own chunk.

  CHUNK_NUM=1
  CHUNK_LINES=0
  CHUNK_FILE="$DIR/chunk-$(printf '%03d' $CHUNK_NUM).txt"
  : > "$CHUNK_FILE"

  for f in "${ORDERED_FILES[@]}"; do
    file_lines=$(/usr/bin/wc -l < "$f" | tr -d ' ')
    rel="${f#$PROJECT_ROOT/}"

    # Start new chunk if adding this file would exceed limit
    # (only if current chunk already has content — so single large
    # files get their own chunk rather than being skipped)
    if [ "$CHUNK_LINES" -gt 0 ] && \
       [ $((CHUNK_LINES + file_lines + 2)) -gt "$LINES_PER_CHUNK" ]; then
      CHUNK_NUM=$((CHUNK_NUM + 1))
      CHUNK_FILE="$DIR/chunk-$(printf '%03d' $CHUNK_NUM).txt"
      : > "$CHUNK_FILE"
      CHUNK_LINES=0
    fi

    printf '=== %s ===\n' "$rel" >> "$CHUNK_FILE"
    cat "$f" >> "$CHUNK_FILE"
    echo "" >> "$CHUNK_FILE"
    CHUNK_LINES=$((CHUNK_LINES + file_lines + 2))
  done

  NUM_CHUNKS=$CHUNK_NUM

  # Count total lines across all chunks
  TOTAL_LINES=0
  for c in "$DIR"/chunk-*.txt; do
    cl=$(/usr/bin/wc -l < "$c" | tr -d ' ')
    TOTAL_LINES=$((TOTAL_LINES + cl))
  done

  echo "  total: $TOTAL_LINES lines across $NUM_CHUNKS chunks"
  echo ""

  # ── Reference file list ────────────────────────────────────────
  # All corpus files as Read-accessible absolute paths.
  # Included in every pass for cross-referencing via Read tool.
  REF_LIST=""
  for f in "${ORDERED_FILES[@]}"; do
    REF_LIST="${REF_LIST}
- $f"
  done
fi

# ── Iteration loop ─────────────────────────────────────────────────

SKILL_TEXT="$(cat "$SKILL")"
CONTENT_TEXT="$(cat "$DIR/content.md")"

for i in $(seq 1 "$MAX"); do
  echo "--- pass $i ---"

  # ── Determine pass type ────────────────────────────────────────
  CHUNK_INDEX=$((i - 1))
  IS_ABSORPTION=false

  if [ "$CHUNK_INDEX" -lt "$NUM_CHUNKS" ]; then
    IS_ABSORPTION=true
    CHUNK_FILE="$DIR/chunk-$(printf '%03d' $((CHUNK_INDEX + 1))).txt"
    CHUNK_LINES=$(/usr/bin/wc -l < "$CHUNK_FILE" | tr -d ' ')
    echo "  absorption: chunk $((CHUNK_INDEX + 1))/$NUM_CHUNKS ($CHUNK_LINES lines)"
  else
    DEEPENING_NUM=$((i - NUM_CHUNKS))
    echo "  deepening: pass $DEEPENING_NUM (corpus fully absorbed)"
  fi

  # ── Build prompt ───────────────────────────────────────────────
  # Order: SKILL (orientation) -> corpus chunk (knowledge) ->
  #        content (subject, recency) -> current HTML (state) ->
  #        reference list + instructions (terminal)
  #
  # Content comes AFTER corpus so it's freshest in attention.
  # The agent reads orientation, absorbs knowledge, then re-engages
  # with the content — which is the thing it's actually building for.

  PROMPT="$SKILL_TEXT"

  # Corpus chunk (absorption passes only)
  if [ "$IS_ABSORPTION" = true ]; then
    CORPUS_CHUNK="$(cat "$CHUNK_FILE")"
    PROMPT="$PROMPT

---

Research corpus — absorption pass $((CHUNK_INDEX + 1)) of $NUM_CHUNKS.
Read and absorb everything below. These are actual artifacts of the
research program that preceded you — not summaries, not references.

$CORPUS_CHUNK"
  fi

  # Content (always present, always AFTER corpus for attention recency)
  PROMPT="$PROMPT

---

Content:

$CONTENT_TEXT"

  # Current HTML (passes 2+)
  if [ -f "$HTML" ]; then
    CURRENT_HTML="$(cat "$HTML")"
    PROMPT="$PROMPT

---

Current page:

$CURRENT_HTML"
  fi

  # Convergence signal
  # Only offered after ALL absorption complete + at least 3 deepening passes
  # AND at least 5 total passes (so no-corpus runs still get development time)
  DEEPENING_PASS=$((i - NUM_CHUNKS))
  if [ "$DEEPENING_PASS" -gt 3 ] && [ "$i" -gt 5 ]; then
    PROMPT="$PROMPT

---

When the form and content have fully converged — when changes would make it different rather than better — say only CONVERGED."
  fi

  # Reference file list (always — enables cross-referencing via Read tool)
  if [ -n "$REF_LIST" ]; then
    PROMPT="$PROMPT

---

Full research corpus (Read tool available — consult any file at any time):
$REF_LIST"
  fi

  # Output instruction
  PROMPT="$PROMPT

---

Output ONLY the complete HTML. No commentary, no explanation, no markdown fences."

  # ── Run agent ──────────────────────────────────────────────────
  # Always with Read tool — agent can cross-reference any corpus file.
  # One fresh agent per pass. Sees skill + knowledge + content + state.
  # Outputs HTML to stdout. Script handles file I/O.
  RESPONSE=$(echo "$PROMPT" | claude -p --model "$MODEL" --tools "Read" 2>>"$DIR/log.txt") || true
  echo "$RESPONSE" > "$DIR/pass-$i.txt"

  # ── Convergence detection ──────────────────────────────────────
  if echo "$RESPONSE" | grep -qi "CONVERGED"; then
    echo "  converged at pass $i."
    break
  fi

  # ── Write HTML ─────────────────────────────────────────────────
  # Strip markdown fences if agent wrapped them despite instructions
  echo "$RESPONSE" | sed '/^```html$/d; /^```$/d' > "$HTML"
  BYTES=$(/usr/bin/wc -c < "$HTML" | tr -d ' ')
  echo "  wrote $BYTES bytes"

done

echo ""
echo "done. $HTML"
echo "  absorption passes: $NUM_CHUNKS"
echo "  total passes: $i"
if [ ${#ORDERED_FILES[@]} -gt 0 ]; then
  echo "  corpus: ${#ORDERED_FILES[@]} files, $TOTAL_LINES lines"
fi
