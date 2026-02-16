# CLAUDE.md

## Project
Retro arcade game collection. Entirely vibe coded — AI generates all code, human provides direction and game feel.

## Tech Constraints
- **Zero dependencies** — no npm, no frameworks, no CDN scripts (Google Fonts OK)
- **Pure HTML5 Canvas + vanilla JS + CSS3**
- Each game is one folder: `game.js` + `index.html` + `style.css`
- All game graphics drawn with Canvas API (no image assets except stegosaurus background)

## Visual Style
- Unified retro arcade cabinet aesthetic
- CRT scanlines, neon glow (cyan/magenta/yellow), dark background
- Pixel fonts: Press Start 2P (headings), VT323 (body)
- See [SKILL.md](./SKILL.md) for full style guide

## Games
- `tetris/` — Block stacking, SRS rotation, wall kicks
- `bubble-shooter/` — Physics aiming, match-3, wall bounces
- `space-invaders/` — Wave defense, alien descent patterns
- `index.html` — Game select lobby

## Rules
- Every game must work on mobile (touch controls required)
- One `game.js` per game — no splitting
- Canvas resolution fixed, CSS scales to viewport
- All UI text in English
- Keep game.js readable — no minification, no clever tricks
- Commit messages follow conventional commits (feat/fix/style/docs)

## Adding a Game
1. Create `game-name/` folder
2. Follow SKILL.md style guide
3. Add to lobby `index.html`
4. Test desktop + mobile before push
