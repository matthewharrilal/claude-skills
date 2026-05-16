/**
 * PERCEPTUAL DEEPENING: Visual Audit Test Suite
 *
 * This Playwright test file automates screenshot capture for the
 * perceptual deepening process. It captures:
 * - Full component screenshots
 * - Zone-specific crops (typography, spacing, containers, etc.)
 * - Diff images between reference and attempt
 *
 * Usage:
 *   ITERATION=1 COMPONENT_URL=http://localhost:3000 npx playwright test visual-audit.spec.ts
 */

import { test, expect, Page, Locator } from '@playwright/test';
import * as fs from 'fs';
import * as path from 'path';

// Configuration from environment
const ITERATION = process.env.ITERATION || '1';
const COMPONENT_URL = process.env.COMPONENT_URL || 'http://localhost:3000';
const COMPONENT_SELECTOR = process.env.COMPONENT_SELECTOR || 'body';
const REFERENCE_PATH = process.env.REFERENCE_PATH || './reference-images';
const OUTPUT_PATH = process.env.OUTPUT_PATH || './perceptual-audit';

// Ensure directories exist
const dirs = [
  `${OUTPUT_PATH}/attempt-screenshots/iteration-${ITERATION}`,
  `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}`,
  `${OUTPUT_PATH}/diff-images/iteration-${ITERATION}`,
];

dirs.forEach(dir => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
});

test.describe(`Perceptual Audit - Iteration ${ITERATION}`, () => {

  test.beforeEach(async ({ page }) => {
    await page.goto(COMPONENT_URL);
    await page.waitForLoadState('networkidle');
    // Wait for fonts to load
    await page.waitForTimeout(500);
  });

  /**
   * FULL COMPONENT CAPTURE
   * Captures the entire component for overall comparison
   */
  test('capture-full-component', async ({ page }) => {
    const component = page.locator(COMPONENT_SELECTOR).first();

    // Verify component exists
    await expect(component).toBeVisible();

    // Capture full component
    await component.screenshot({
      path: `${OUTPUT_PATH}/attempt-screenshots/iteration-${ITERATION}/full.png`,
      animations: 'disabled',
    });

    console.log(`✓ Full component captured: iteration-${ITERATION}/full.png`);
  });

  /**
   * ZONE: TYPOGRAPHY
   * Captures text elements for typography analysis
   */
  test('capture-zone-typography', async ({ page }) => {
    const typographySelectors = [
      'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
      '.display-text', '.headline', '.title',
      '.body-text', 'p',
      '.caption', '.label',
    ];

    let captureCount = 0;

    for (const selector of typographySelectors) {
      const elements = page.locator(selector);
      const count = await elements.count();

      for (let i = 0; i < Math.min(count, 2); i++) {
        const element = elements.nth(i);
        if (await element.isVisible()) {
          try {
            await element.screenshot({
              path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/typography-${selector.replace(/[^a-z0-9]/gi, '')}-${i}.png`,
            });
            captureCount++;
          } catch (e) {
            // Element might be too small or hidden
          }
        }
      }
    }

    console.log(`✓ Typography zone: ${captureCount} elements captured`);
  });

  /**
   * ZONE: SPACING
   * Captures areas to analyze whitespace and padding
   */
  test('capture-zone-spacing', async ({ page }) => {
    const spacingSelectors = [
      'main', 'section', 'article',
      '.container', '.content', '.wrapper',
      '.card', '.box', '.panel',
    ];

    let captureCount = 0;

    for (const selector of spacingSelectors) {
      const elements = page.locator(selector);
      const count = await elements.count();

      for (let i = 0; i < Math.min(count, 2); i++) {
        const element = elements.nth(i);
        if (await element.isVisible()) {
          try {
            await element.screenshot({
              path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/spacing-${selector.replace(/[^a-z0-9]/gi, '')}-${i}.png`,
            });
            captureCount++;
          } catch (e) {
            // Element might not be suitable
          }
        }
      }
    }

    console.log(`✓ Spacing zone: ${captureCount} elements captured`);
  });

  /**
   * ZONE: CONTAINERS
   * Captures bordered/boxed elements for container analysis
   */
  test('capture-zone-containers', async ({ page }) => {
    const containerSelectors = [
      '[class*="card"]', '[class*="box"]', '[class*="panel"]',
      '[class*="container"]', '[class*="wrapper"]',
      '[class*="border"]', '[class*="frame"]',
      'blockquote', 'aside', 'figure',
    ];

    let captureCount = 0;

    for (const selector of containerSelectors) {
      try {
        const elements = page.locator(selector);
        const count = await elements.count();

        for (let i = 0; i < Math.min(count, 3); i++) {
          const element = elements.nth(i);
          if (await element.isVisible()) {
            await element.screenshot({
              path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/container-${captureCount}.png`,
            });
            captureCount++;
          }
        }
      } catch (e) {
        // Selector might not match
      }
    }

    console.log(`✓ Container zone: ${captureCount} elements captured`);
  });

  /**
   * ZONE: HIERARCHY
   * Captures different scale views for hierarchy analysis
   */
  test('capture-zone-hierarchy', async ({ page }) => {
    const component = page.locator(COMPONENT_SELECTOR).first();

    // Full view for overall hierarchy
    await component.screenshot({
      path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/hierarchy-full.png`,
    });

    // Get bounding box for cropped views
    const box = await component.boundingBox();
    if (box) {
      // Top section (usually headers/titles)
      await page.screenshot({
        path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/hierarchy-top.png`,
        clip: {
          x: box.x,
          y: box.y,
          width: box.width,
          height: Math.min(box.height * 0.3, 400),
        },
      });

      // Middle section
      await page.screenshot({
        path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/hierarchy-middle.png`,
        clip: {
          x: box.x,
          y: box.y + box.height * 0.35,
          width: box.width,
          height: Math.min(box.height * 0.3, 400),
        },
      });
    }

    console.log(`✓ Hierarchy zone: 3 views captured`);
  });

  /**
   * ZONE: COMPOSITION
   * Captures at different scales for composition analysis
   */
  test('capture-zone-composition', async ({ page }) => {
    // Full page at reduced scale (to see overall composition)
    await page.screenshot({
      path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/composition-overview.png`,
      fullPage: true,
    });

    // Viewport-sized capture (typical viewing)
    await page.screenshot({
      path: `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}/composition-viewport.png`,
    });

    console.log(`✓ Composition zone: 2 views captured`);
  });

  /**
   * CAPTURE MANIFEST
   * Creates a manifest of all captured files for sub-agent processing
   */
  test('generate-capture-manifest', async ({ page }) => {
    const iterationDir = `${OUTPUT_PATH}/zone-crops/iteration-${ITERATION}`;
    const files = fs.readdirSync(iterationDir);

    const manifest = {
      iteration: parseInt(ITERATION),
      timestamp: new Date().toISOString(),
      componentUrl: COMPONENT_URL,
      componentSelector: COMPONENT_SELECTOR,
      captures: {
        full: `attempt-screenshots/iteration-${ITERATION}/full.png`,
        zones: files.reduce((acc, file) => {
          const zone = file.split('-')[0];
          if (!acc[zone]) acc[zone] = [];
          acc[zone].push(`zone-crops/iteration-${ITERATION}/${file}`);
          return acc;
        }, {} as Record<string, string[]>),
      },
    };

    fs.writeFileSync(
      `${OUTPUT_PATH}/attempt-screenshots/iteration-${ITERATION}/manifest.json`,
      JSON.stringify(manifest, null, 2)
    );

    console.log(`✓ Manifest generated with ${files.length} zone captures`);
  });
});

/**
 * DIFF GENERATION TEST
 * Run separately after captures to generate diff images
 */
test.describe('Diff Generation', () => {

  test.skip(({ }, testInfo) => {
    // Skip if no reference exists
    const refPath = `${REFERENCE_PATH}/full.png`;
    return !fs.existsSync(refPath);
  });

  test('generate-diff-images', async ({ page }) => {
    // This test uses pixelmatch for diff generation
    // Requires: npm install pngjs pixelmatch

    const { PNG } = require('pngjs');
    const pixelmatch = require('pixelmatch');

    const referencePath = `${REFERENCE_PATH}/full.png`;
    const attemptPath = `${OUTPUT_PATH}/attempt-screenshots/iteration-${ITERATION}/full.png`;
    const diffPath = `${OUTPUT_PATH}/diff-images/iteration-${ITERATION}/diff.png`;

    if (!fs.existsSync(referencePath) || !fs.existsSync(attemptPath)) {
      console.log('⚠ Skipping diff: reference or attempt not found');
      return;
    }

    const reference = PNG.sync.read(fs.readFileSync(referencePath));
    const attempt = PNG.sync.read(fs.readFileSync(attemptPath));

    // Handle size mismatch
    const width = Math.min(reference.width, attempt.width);
    const height = Math.min(reference.height, attempt.height);

    const diff = new PNG({ width, height });

    const numDiffPixels = pixelmatch(
      reference.data,
      attempt.data,
      diff.data,
      width,
      height,
      { threshold: 0.1 }
    );

    fs.writeFileSync(diffPath, PNG.sync.write(diff));

    const totalPixels = width * height;
    const percentDiff = ((numDiffPixels / totalPixels) * 100).toFixed(2);

    console.log(`✓ Diff generated: ${percentDiff}% difference`);
    console.log(`  Path: ${diffPath}`);

    // Write diff stats
    const stats = {
      iteration: parseInt(ITERATION),
      numDiffPixels,
      totalPixels,
      percentDiff: parseFloat(percentDiff),
      diffPath,
    };

    fs.writeFileSync(
      `${OUTPUT_PATH}/diff-images/iteration-${ITERATION}/stats.json`,
      JSON.stringify(stats, null, 2)
    );
  });
});

/**
 * COMPARISON HELPER
 * Utility test for side-by-side output
 */
test.describe('Comparison Helpers', () => {

  test('create-side-by-side', async ({ page }) => {
    // Creates an HTML file for easy side-by-side viewing

    const html = `
<!DOCTYPE html>
<html>
<head>
  <title>Perceptual Audit - Iteration ${ITERATION}</title>
  <style>
    body {
      font-family: system-ui;
      margin: 0;
      padding: 20px;
      background: #f5f5f5;
    }
    h1 { margin-bottom: 20px; }
    .comparison {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 20px;
      margin-bottom: 40px;
    }
    .panel {
      background: white;
      padding: 10px;
      border-radius: 4px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .panel h3 {
      margin: 0 0 10px 0;
      font-size: 14px;
      color: #666;
    }
    .panel img {
      width: 100%;
      height: auto;
      display: block;
    }
    .stats {
      background: #333;
      color: white;
      padding: 20px;
      border-radius: 4px;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <h1>Perceptual Audit - Iteration ${ITERATION}</h1>

  <div class="stats">
    <strong>Instructions:</strong> Squint at these images. Don't analyze — feel.
    What feels different between Reference and Attempt?
  </div>

  <div class="comparison">
    <div class="panel">
      <h3>REFERENCE</h3>
      <img src="../reference-images/full.png" alt="Reference">
    </div>
    <div class="panel">
      <h3>ATTEMPT (Iteration ${ITERATION})</h3>
      <img src="attempt-screenshots/iteration-${ITERATION}/full.png" alt="Attempt">
    </div>
    <div class="panel">
      <h3>DIFF</h3>
      <img src="diff-images/iteration-${ITERATION}/diff.png" alt="Diff">
    </div>
  </div>

  <h2>Zone Crops</h2>
  <div id="zones"></div>

  <script>
    // Dynamically load zone images
    const zones = ['typography', 'spacing', 'container', 'hierarchy', 'composition'];
    const zonesDiv = document.getElementById('zones');

    zones.forEach(zone => {
      const section = document.createElement('div');
      section.innerHTML = '<h3>' + zone.toUpperCase() + '</h3>';
      section.innerHTML += '<div class="comparison" id="zone-' + zone + '"></div>';
      zonesDiv.appendChild(section);
    });
  </script>
</body>
</html>
    `;

    fs.writeFileSync(`${OUTPUT_PATH}/comparison-iteration-${ITERATION}.html`, html);
    console.log(`✓ Comparison HTML created: comparison-iteration-${ITERATION}.html`);
  });
});
