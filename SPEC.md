# SPEC.md — Arcade Games Portal

## Overview

A retro arcade games portal with a nostalgic CRT/16-bit aesthetic. Pure vanilla HTML/CSS/JS — no frameworks, no build tools. Deployable as static files anywhere (GitHub Pages, any HTTP server).

**Language**: All user-facing text in **正體中文 (Traditional Chinese)**. Code comments in English.

---

## Tech Stack

- **HTML5 Canvas** — Game rendering
- **Vanilla JavaScript (ES6+)** — Game logic, class-based architecture
- **CSS3** — Layout, CRT effects, animations, responsive design
- **Google Fonts** — `Press Start 2P` (titles/UI), `VT323` (body text)
- **No dependencies** — Zero npm, zero build step

---

## Project Structure

```
arcade-games/
├── index.html              # Portal / homepage
├── README.md               # GitHub readme
├── SPEC.md                 # This file
├── QA_REPORT.md            # QA testing results
├── tetris/
│   ├── index.html          # Game page
│   ├── style.css           # Game styles
│   └── game.js             # Game logic
├── bubble-shooter/
│   ├── index.html          # Game page
│   ├── style.css           # Game styles
│   └── game.js             # Game logic
└── space-invaders/
    ├── index.html          # Game page
    ├── style.css           # Game styles
    └── game.js             # Game logic
```

### Naming Conventions

- **Folders**: lowercase, hyphen-separated (e.g., `bubble-shooter/`)
- **Files**: Always `index.html`, `style.css`, `game.js` inside each game folder
- **CSS classes**: lowercase, hyphen-separated (e.g., `.arcade-cabinet`, `.crt-overlay`)
- **JS classes**: PascalCase (e.g., `GameState`, `Renderer`)
- **JS constants**: UPPER_SNAKE_CASE (e.g., `BLOCK_SIZE`, `CANVAS_WIDTH`)

---

## Design Guidelines

### Aesthetic: Retro Arcade / CRT / 16-bit Pixel Art

| Element | Style |
|---------|-------|
| Background | Near-black (`#0a0a0f`) with subtle radial gradient |
| Primary accent | Neon cyan (`#00ffff`) |
| Secondary accent | Neon magenta/pink (`#ff00ff`) |
| Score/highlight | Neon yellow (`#ffff00`) |
| Success/positive | Neon green (`#00ff00`) |
| Title font | `Press Start 2P` |
| Body font | `VT323` |
| Border radius | Minimal (0-8px) for pixel feel |

### CRT Effects (Required on every page)

1. **Scanlines** — Repeating horizontal lines overlay (`pointer-events: none; z-index: 1000`)
2. **Vignette** — Radial gradient darkening edges (optional)
3. **Screen glow** — Subtle colored box-shadow on game canvas
4. **Neon glow** — `text-shadow` with matching color on key text

### CSS Variables (use across all pages)

```css
:root {
    --neon-pink: #ff00ff;
    --neon-cyan: #00ffff;
    --neon-yellow: #ffff00;
    --neon-green: #00ff00;
    --dark: #0a0a0f;
}
```

### Responsive / Mobile

- All games must work on mobile (320px+)
- Touch controls required for all games
- Use `touch-action: none` and `overscroll-behavior: none` on game pages
- `user-scalable=no` in viewport meta
- Info panels collapse/reflow on narrow screens

---

## How to Add a New Game

1. **Create folder**: `game-name/` in project root
2. **Create files**: `index.html`, `style.css`, `game.js`
3. **HTML template** — Use `lang="zh-Hant"`, include:
   - Viewport meta with `user-scalable=no`
   - Google Fonts link (`Press Start 2P`, `VT323`)
   - CRT scanline overlay
   - "← 返回遊戲廳" back link to `../index.html`
   - Canvas element for the game
   - Touch controls for mobile
4. **CSS** — Include CRT effects, use shared color variables, responsive breakpoints
5. **JS** — Class-based architecture:
   - `GameState` — Score, level, status
   - `Board` / `Grid` — Game field
   - `Renderer` — Canvas drawing
   - `InputController` — Keyboard + touch
   - Main game class orchestrating everything
6. **Add to portal** — In `index.html`, add an `.arcade-cabinet` div with:
   - `.cabinet-marquee` with game name
   - `.screen` with placeholder or screenshot
   - `.control-panel` with joystick/buttons decoration
   - `.start-btn` link to `game-name/index.html`

### Portal Cabinet Template

```html
<div class="arcade-cabinet">
    <div class="cabinet-marquee">
        <h3>GAME NAME</h3>
    </div>
    <div class="screen">
        <div class="screen-placeholder">PREVIEW</div>
    </div>
    <div class="control-panel">
        <div class="joystick-area"><div class="joystick"></div></div>
        <div class="buttons">
            <div class="arcade-btn red"></div>
            <div class="arcade-btn blue"></div>
        </div>
    </div>
    <a href="game-name/index.html" class="start-btn blink">投幣開始</a>
</div>
```

---

## Running Locally

```bash
cd arcade-games
python3 -m http.server 8080
# Open http://localhost:8080
```

No build step required.
