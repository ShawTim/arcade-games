# SKILL.md — Arcade Games Style Guide

This document defines the rules, aesthetics, and constraints for every game in this collection. Follow it when adding or modifying games.

---

## Philosophy

- **Vibe coded** — AI writes the code, human steers the feel
- **Zero dependencies** — no libraries, no frameworks, no build step
- **Self-contained** — each game is one folder, playable by opening `index.html`
- **Retro arcade** — everything looks like it came from a 1980s cabinet
- **Mobile-first** — if it doesn't work on a phone, it's not done

---

## Visual Style

### Color Palette

```
--dark:        #0a0a0f     (background)
--neon-pink:   #ff00ff     (accents, highlights)
--neon-cyan:   #00ffff     (primary UI, text glow)
--neon-yellow: #ffff00     (score, warnings)
--neon-green:  #00ff00     (success, ready states)
--text:        #ffffff     (body text)
--text-dim:    #888888     (secondary text)
```

### Typography

- **Headings / UI**: `'Press Start 2P'` (Google Fonts)
- **Body / scores**: `'VT323'` (Google Fonts)
- Fallback: `monospace`

### Effects

- **CRT scanlines**: Semi-transparent horizontal lines overlay (`body::before`)
- **Neon glow**: `text-shadow` or `box-shadow` with palette colors
- **Cabinet frame**: Dark border around game area simulating an arcade machine
- **Stegosaurus background**: `stegosaurus.jpg` — subtle, dark, tiled or fixed

### Layout

- Game canvas centered in a cabinet-style frame
- Info panels (score, level, controls) beside or below the canvas
- Marquee header with game title in neon
- Dark background, no white space

---

## File Structure

Each game lives in its own folder:

```
your-game/
├── game.js      # ALL game logic — loop, state, input, rendering
├── index.html   # Canvas element, UI containers, font imports
└── style.css    # Cabinet frame, layout, CRT effects, responsive
```

### Rules

1. **One `game.js`** — no splitting into multiple JS files. Keep it simple.
2. **No external JS libraries** — no Phaser, no p5.js, no lodash
3. **Google Fonts are OK** — Press Start 2P and VT323 only
4. **One image max** — the stegosaurus background. All game graphics are code-drawn (Canvas API).
5. **No `<script src="cdn...">` allowed**

---

## Game Lobby

The root `index.html` is the game select screen. When adding a new game:

1. Add a card/button linking to `your-game/index.html`
2. Match the existing card style (neon border, pixel font, hover glow)
3. Include a brief one-line description

---

## Controls

### Keyboard

Every game must support keyboard input. Common mappings:

| Key | Typical Use |
|-----|-------------|
| ← → ↑ ↓ | Movement / aim |
| Space | Action / fire / rotate |
| S | Start game |
| P | Pause / resume |
| R | Restart (game over state only) |

### Touch / Mobile

Every game must have on-screen touch controls:

- Visible buttons for all essential actions
- Large tap targets (min 44×44px)
- No hover-dependent interactions
- Prevent default touch behaviors (no scroll, no zoom)
- `<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">`

---

## Game Architecture Pattern

```javascript
class Game {
  constructor(canvas) { /* init state */ }
  start() { /* begin game loop */ }
  update(dt) { /* physics, logic, AI */ }
  render(ctx) { /* draw everything */ }
  handleInput(key) { /* keyboard events */ }
  handleTouch(x, y) { /* touch events */ }
}
```

Core loop:
```javascript
function gameLoop(timestamp) {
  const dt = timestamp - lastTime;
  lastTime = timestamp;
  game.update(dt);
  game.render(ctx);
  requestAnimationFrame(gameLoop);
}
```

### State Management

Use a simple state machine:
```javascript
this.state = 'menu' | 'playing' | 'paused' | 'gameOver';
```

### Collision Detection

- Grid-based for tile games (Tetris)
- Distance-based for projectile games (Bubble Shooter, Space Invaders)
- No physics engines — roll your own

---

## Responsive Design

```css
/* Desktop: fixed cabinet size */
#game-container { width: 480px; height: 640px; }

/* Mobile: full screen */
@media (max-width: 520px) {
  #game-container { width: 100vw; height: 100vh; }
  canvas { width: 100% !important; }
}
```

Canvas internal resolution stays fixed (e.g., 480×640). CSS scales it to fit. Use `getBoundingClientRect()` to convert touch/click coordinates.

---

## Quality Checklist

Before merging a new game:

- [ ] Plays correctly on desktop (Chrome, Firefox)
- [ ] Plays correctly on mobile (iOS Safari, Android Chrome)
- [ ] Touch controls work and are visible
- [ ] CRT / cabinet aesthetic matches other games
- [ ] No external dependencies
- [ ] Added to lobby (`index.html`)
- [ ] `game.js` is readable without comments explaining obvious things
- [ ] Game has a clear win/lose condition
- [ ] Score or progression visible to player

---

## Future Game Ideas

When adding games, prioritize classics that work well on mobile:

- Snake
- Pong
- Breakout / Arkanoid
- Pac-Man
- Frogger
- Asteroids

Each should bring something mechanically distinct — don't add two games that feel the same.

---

*This is a living document. Update it as the collection grows.*
