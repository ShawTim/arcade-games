# Arcade Games 🕹️

A collection of retro arcade games, entirely **vibe coded** — designed and built through AI-assisted development from concept to completion. No manual pixel-pushing, no copy-pasting tutorials. Just vibes, prompts, and iteration.

**Play**: [shawtim.github.io/arcade-games](https://shawtim.github.io/arcade-games)

---

## 🎮 Games

| Game | Description |
|------|-------------|
| [**Tetris**](https://shawtim.github.io/arcade-games/tetris/) | Classic block-stacking. SRS rotation, wall kicks, 10 levels. |
| [**Bubble Shooter**](https://shawtim.github.io/arcade-games/bubble-shooter/) | Aim, bounce, match 3+. Physics-based trajectory with wall reflections. |
| [**Space Invaders**](https://shawtim.github.io/arcade-games/space-invaders/) | Defend Earth. Descending alien waves, dodge and shoot. |

All games share a unified **retro arcade cabinet** aesthetic — CRT scanlines, neon glow, pixel fonts, stegosaurus background (don't ask).

---

## 🤖 Vibe Coded

This entire project was built through **vibe coding** — a workflow where:

1. **AI generates the code** from high-level descriptions and iterative feedback
2. **Human provides direction** — game feel, visual style, what's fun and what isn't
3. **No boilerplate, no frameworks** — every line exists because it was prompted into being

The [SKILL.md](./SKILL.md) defines the project's style guide and constraints. Think of it as a creative brief that keeps every game consistent.

### Why vibe code?

- Proves AI can ship real, playable games — not just demos
- Every game is self-contained and readable (no framework magic)
- Fast iteration: concept → playable in hours, not weeks
- The constraint of "no dependencies" forces clean architecture

---

## ✨ Shared Style

Every game in this collection follows the same visual DNA:

- 🖥️ **CRT cabinet frame** with scanline overlay
- 🎨 **Neon color palette** — cyan, magenta, yellow on dark
- 🔤 **Pixel fonts** — Press Start 2P / VT323
- 📱 **Mobile-first** — touch controls, responsive layout
- 🦕 **Stegosaurus** — the unofficial mascot (again, don't ask)

---

## 🛠️ Tech

```
HTML5 Canvas + Vanilla JavaScript + CSS3
```

That's it. No React, no bundlers, no npm install. Open `index.html` and play.

### Architecture (per game)

```
game.js    → Game loop, state, logic, rendering (all-in-one)
index.html → Canvas + UI elements
style.css  → Cabinet frame, responsive layout, effects
```

Each game is a single `game.js` that handles everything. Simple, readable, hackable.

---

## 🚀 Run Locally

```bash
git clone https://github.com/ShawTim/arcade-games.git
cd arcade-games
python3 -m http.server 8000
```

Then open [localhost:8000](http://localhost:8000) for the game select screen, or go directly to any game's folder.

---

## 🎯 Adding a New Game

Follow the [SKILL.md](./SKILL.md) — it defines the rules for adding games to this collection. TL;DR:

1. Create `your-game/` with `game.js`, `index.html`, `style.css`
2. Match the cabinet aesthetic (CRT frame, neon palette, pixel font)
3. Include mobile controls
4. Zero dependencies
5. Add to the lobby (`index.html` at root)

---

## License

MIT

---

Vibe coded by [ShawTim](https://github.com/ShawTim) 🎮
