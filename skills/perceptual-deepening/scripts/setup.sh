#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
# PERCEPTUAL DEEPENING SKILL — SETUP SCRIPT
# ═══════════════════════════════════════════════════════════════════════════════
#
# This script sets up the Perceptual Deepening skill in your project.
#
# Usage:
#   chmod +x setup.sh
#   ./setup.sh
#
# Or:
#   bash setup.sh
#
# ═══════════════════════════════════════════════════════════════════════════════

set -e

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "PERCEPTUAL DEEPENING SKILL — SETUP"
echo "═══════════════════════════════════════════════════════════════════════════════"
echo ""

# Get the directory where this script is located
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directory (current directory or specified)
TARGET_DIR="${1:-.}"

echo "Skill source: $SKILL_DIR"
echo "Target project: $TARGET_DIR"
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 1: Create directory structure
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 1: Creating directory structure..."

mkdir -p "$TARGET_DIR/reference-images"
mkdir -p "$TARGET_DIR/perceptual-audit/attempt-screenshots"
mkdir -p "$TARGET_DIR/perceptual-audit/zone-crops"
mkdir -p "$TARGET_DIR/perceptual-audit/diff-images"

echo "  ✓ Created reference-images/"
echo "  ✓ Created perceptual-audit/"
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 2: Copy CLAUDE.md if not exists
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 2: Setting up CLAUDE.md..."

if [ -f "$TARGET_DIR/CLAUDE.md" ]; then
    echo "  ⚠ CLAUDE.md already exists"
    echo "  Appending perceptual deepening config..."
    echo "" >> "$TARGET_DIR/CLAUDE.md"
    echo "---" >> "$TARGET_DIR/CLAUDE.md"
    echo "" >> "$TARGET_DIR/CLAUDE.md"
    cat "$SKILL_DIR/CLAUDE.md" >> "$TARGET_DIR/CLAUDE.md"
else
    cp "$SKILL_DIR/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
    echo "  ✓ Created CLAUDE.md"
fi
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 3: Copy templates
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 3: Copying templates..."

cp "$SKILL_DIR/templates/PERCEPTUAL-AUDIT-LOG-TEMPLATE.md" "$TARGET_DIR/perceptual-audit/"
cp "$SKILL_DIR/templates/SOUL-DISCOVERIES-TEMPLATE.md" "$TARGET_DIR/perceptual-audit/SOUL-DISCOVERIES.md"

echo "  ✓ Copied PERCEPTUAL-AUDIT-LOG-TEMPLATE.md"
echo "  ✓ Initialized SOUL-DISCOVERIES.md"
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 4: Copy Playwright test
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 4: Setting up Playwright tests..."

if [ -d "$TARGET_DIR/tests" ]; then
    cp "$SKILL_DIR/tests/visual-audit.spec.ts" "$TARGET_DIR/tests/"
    echo "  ✓ Copied visual-audit.spec.ts to tests/"
else
    mkdir -p "$TARGET_DIR/tests"
    cp "$SKILL_DIR/tests/visual-audit.spec.ts" "$TARGET_DIR/tests/"
    echo "  ✓ Created tests/ and copied visual-audit.spec.ts"
fi
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 5: Check/install dependencies
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 5: Checking dependencies..."

if [ -f "$TARGET_DIR/package.json" ]; then
    echo "  Found package.json"

    # Check for Playwright
    if grep -q "@playwright/test" "$TARGET_DIR/package.json"; then
        echo "  ✓ Playwright already installed"
    else
        echo "  Installing Playwright..."
        cd "$TARGET_DIR" && npm install --save-dev @playwright/test
        echo "  ✓ Installed @playwright/test"
    fi

    # Check for pngjs
    if grep -q "pngjs" "$TARGET_DIR/package.json"; then
        echo "  ✓ pngjs already installed"
    else
        echo "  Installing pngjs..."
        cd "$TARGET_DIR" && npm install --save-dev pngjs
        echo "  ✓ Installed pngjs"
    fi

    # Check for pixelmatch
    if grep -q "pixelmatch" "$TARGET_DIR/package.json"; then
        echo "  ✓ pixelmatch already installed"
    else
        echo "  Installing pixelmatch..."
        cd "$TARGET_DIR" && npm install --save-dev pixelmatch
        echo "  ✓ Installed pixelmatch"
    fi
else
    echo "  ⚠ No package.json found"
    echo "  Run these commands manually:"
    echo "    npm init -y"
    echo "    npm install --save-dev @playwright/test pngjs pixelmatch"
fi
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# STEP 6: Create quick-start script
# ───────────────────────────────────────────────────────────────────────────────

echo "Step 6: Creating quick-start scripts..."

cat > "$TARGET_DIR/perceptual-audit.sh" << 'EOF'
#!/bin/bash
# Quick-start script for perceptual auditing

ITERATION="${1:-1}"
COMPONENT_URL="${2:-http://localhost:3000}"
COMPONENT_SELECTOR="${3:-body}"

echo "Running perceptual audit..."
echo "  Iteration: $ITERATION"
echo "  URL: $COMPONENT_URL"
echo "  Selector: $COMPONENT_SELECTOR"

ITERATION=$ITERATION \
COMPONENT_URL=$COMPONENT_URL \
COMPONENT_SELECTOR=$COMPONENT_SELECTOR \
npx playwright test visual-audit.spec.ts

echo ""
echo "Screenshots captured. Now run perceptual deepening in Claude:"
echo "  /soul [component-name]"
EOF

chmod +x "$TARGET_DIR/perceptual-audit.sh"
echo "  ✓ Created perceptual-audit.sh"
echo ""

# ───────────────────────────────────────────────────────────────────────────────
# COMPLETE
# ───────────────────────────────────────────────────────────────────────────────

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "SETUP COMPLETE"
echo "═══════════════════════════════════════════════════════════════════════════════"
echo ""
echo "Directory structure:"
echo "  $TARGET_DIR/"
echo "  ├── CLAUDE.md                     # Skill configuration"
echo "  ├── reference-images/             # Put reference images here"
echo "  ├── perceptual-audit/"
echo "  │   ├── SOUL-DISCOVERIES.md       # Accumulated soul knowledge"
echo "  │   ├── attempt-screenshots/      # Iteration screenshots"
echo "  │   ├── zone-crops/               # Zone-specific captures"
echo "  │   └── diff-images/              # Pixel diffs"
echo "  ├── tests/"
echo "  │   └── visual-audit.spec.ts      # Playwright capture tests"
echo "  └── perceptual-audit.sh           # Quick-start script"
echo ""
echo "Next steps:"
echo "  1. Add reference images to reference-images/"
echo "  2. Start your dev server"
echo "  3. Run: ./perceptual-audit.sh 1 http://localhost:3000 '.your-component'"
echo "  4. In Claude: /soul your-component"
echo ""
echo "═══════════════════════════════════════════════════════════════════════════════"
