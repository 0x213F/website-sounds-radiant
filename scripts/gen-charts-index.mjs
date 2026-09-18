#!/usr/bin/env node
// Writes browsable index pages for public/assets/charts:
//   /assets/charts/                  - every tune
//   /assets/charts/<tune>/           - the charts for one tune
// Each row links to the PDF and to that file's commit history on GitHub.
// Run it after dropping new charts in: `node scripts/gen-charts-index.mjs`.

import { execFileSync } from 'node:child_process'
import { readdirSync, statSync, writeFileSync } from 'node:fs'
import { join, relative } from 'node:path'
import { fileURLToPath } from 'node:url'

const ROOT = fileURLToPath(new URL('..', import.meta.url))
const CHARTS = join(ROOT, 'public/assets/charts')
const REPO = 'https://github.com/0x213F/website-sounds-radiant'

// Longest suffix wins, so "-bass-vox" beats "-bass".
const LABELS = [
  ['score', 'Full score'],
  ['bass-vox', 'Bass + vocal'],
  ['drums', 'Drums'],
  ['bass', 'Bass'],
  ['guitar', 'Guitar'],
  ['sax', 'Sax (bari, E♭)'],
]

const titleCase = (slug) =>
  slug.split('-').map((w) => w[0].toUpperCase() + w.slice(1)).join(' ')

const label = (file) => {
  const stem = file.replace(/\.pdf$/, '')
  for (const [suffix, name] of LABELS) if (stem.endsWith(`-${suffix}`)) return name
  return titleCase(stem)
}

// Score first, then the parts in the order they sit on the page.
const rank = (file) => {
  const stem = file.replace(/\.pdf$/, '')
  const i = LABELS.findIndex(([suffix]) => stem.endsWith(`-${suffix}`))
  return i === -1 ? LABELS.length : i
}

const kb = (bytes) => `${Math.round(bytes / 1024)} KB`

const lastChanged = (path) => {
  try {
    const iso = execFileSync('git', ['log', '-1', '--format=%cI', '--', path], {
      cwd: ROOT,
      encoding: 'utf8',
    }).trim()
    if (!iso) return { text: 'uncommitted', iso: '' }
    const d = new Date(iso)
    return {
      text: d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' }),
      iso,
    }
  } catch {
    return { text: '', iso: '' }
  }
}

const esc = (s) =>
  s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')

const page = (title, subtitle, back, rows) => `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${esc(title)}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&family=Playfair+Display:wght@400;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --text-primary: #e4d5c1;
    --text-secondary: #c4ae94;
    --text-light: #9d8770;
    --bg-primary: #1a1108;
    --bg-secondary: #2f2419;
    --accent: #a8845f;
    --border: #3d2f22;
  }
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: 'Inter', sans-serif;
    background: var(--bg-primary);
    color: var(--text-primary);
    line-height: 1.6;
    padding: 4rem 1rem 6rem;
  }
  .wrap { max-width: 44rem; margin: 0 auto; }
  .back {
    display: inline-block; margin-bottom: 2rem; color: var(--text-light);
    text-decoration: none; font-size: 0.85rem; letter-spacing: 0.04em;
  }
  .back:hover { color: var(--accent); }
  h1 {
    font-family: 'Playfair Display', serif; font-weight: 700;
    font-size: clamp(2rem, 6vw, 2.75rem); line-height: 1.15;
  }
  .sub { color: var(--text-light); margin-top: 0.5rem; font-size: 0.95rem; }
  ul { list-style: none; margin-top: 2.5rem; }
  li + li { margin-top: 0.75rem; }
  .row {
    display: flex; align-items: baseline; gap: 1rem; flex-wrap: wrap;
    background: var(--bg-secondary); border: 1px solid var(--border);
    border-radius: 12px; padding: 1rem 1.25rem;
    transition: border-color 0.2s ease, transform 0.2s ease;
  }
  .row:hover { border-color: var(--accent); transform: translateY(-1px); }
  .name {
    font-family: 'Playfair Display', serif; font-size: 1.15rem;
    color: var(--text-primary); text-decoration: none; flex: 1 1 12rem;
  }
  .name:hover { color: var(--accent); }
  .meta { color: var(--text-light); font-size: 0.8rem; font-variant-numeric: tabular-nums; }
  .history { color: var(--text-light); font-size: 0.8rem; text-decoration: none; }
  .history:hover { color: var(--accent); text-decoration: underline; }
  footer { margin-top: 3rem; color: var(--text-light); font-size: 0.8rem; }
  footer a { color: var(--text-secondary); }
</style>
</head>
<body>
<div class="wrap">
${back ? `<a class="back" href="${back.href}">&larr; ${esc(back.text)}</a>` : ''}
<h1>${esc(title)}</h1>
<p class="sub">${esc(subtitle)}</p>
<ul>
${rows.join('\n')}
</ul>
<footer>
Every chart is engraved in LilyPond and regenerated from one master file.
Past versions live in <a href="${REPO}/commits/main/public/assets/charts">the repository history</a>.
</footer>
</div>
</body>
</html>
`

const tunes = readdirSync(CHARTS, { withFileTypes: true })
  .filter((d) => d.isDirectory())
  .map((d) => d.name)
  .sort()

const tuneRows = []

for (const tune of tunes) {
  const dir = join(CHARTS, tune)
  const files = readdirSync(dir)
    .filter((f) => f.endsWith('.pdf'))
    .sort((a, b) => rank(a) - rank(b) || a.localeCompare(b))
  if (!files.length) continue

  const rows = files.map((file) => {
    const abs = join(dir, file)
    const rel = relative(ROOT, abs)
    const { text, iso } = lastChanged(rel)
    return `  <li><div class="row">
    <a class="name" href="${file}">${esc(label(file))}</a>
    <span class="meta">${kb(statSync(abs).size)}</span>
    <span class="meta"${iso ? ` title="${iso}"` : ''}>updated ${esc(text)}</span>
    <a class="history" href="${REPO}/commits/main/${rel}">history</a>
  </div></li>`
  })

  writeFileSync(
    join(dir, 'index.html'),
    page(titleCase(tune), `${files.length} charts · click a part to open the PDF`,
         { href: '../', text: 'All charts' }, rows)
  )

  const newest = files
    .map((f) => lastChanged(relative(ROOT, join(dir, f))).text)
    .filter(Boolean)
    .pop()
  tuneRows.push(`  <li><div class="row">
    <a class="name" href="${tune}/">${esc(titleCase(tune))}</a>
    <span class="meta">${files.length} parts</span>
    <span class="meta">updated ${esc(newest || '')}</span>
    <a class="history" href="${REPO}/commits/main/${relative(ROOT, dir)}">history</a>
  </div></li>`)
}

writeFileSync(
  join(CHARTS, 'index.html'),
  page('Charts', 'Transcriptions and parts, as engraved PDFs.', { href: '/', text: 'Home' }, tuneRows)
)

console.log(`wrote index pages for ${tunes.length} tune(s)`)
