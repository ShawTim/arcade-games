# Arcade Games 🕹️

A collection of retro arcade games built with vanilla JavaScript and CSS. Currently featuring **Tetris** — the classic block-stacking puzzle game.

**Live Demo**: [shawtim.github.io/arcade-games](https://shawtim.github.io/arcade-games)

---

## 🎮 Play Now

No installation needed. Just visit the [live demo](https://shawtim.github.io/arcade-games) or run locally:

```bash
python3 -m http.server 8000
# Open http://localhost:8000
```

### Controls

| Key | Action |
|-----|--------|
| ← / → | Move left / right |
| ↓ | Soft drop |
| ↑ / Space | Rotate piece |
| S | Start game |
| P | Pause |
| R | Restart (when game over) |

**Mobile**: Tap on-screen buttons — left, down, right arrows and ROTATE.

---

## ✨ Features

- 🎯 **Classic Tetris gameplay** — SRS rotation system with wall kicks
- 📱 **Mobile-friendly** — Touch controls and responsive layout
- 🎨 **Retro arcade aesthetic** — CRT scanlines, neon glows, pixel fonts
- ⚡ **Zero dependencies** — Pure HTML5 Canvas + vanilla JS
- 🖱️ **Keyboard & touch support** — Play on desktop or mobile

---

## 🛠️ Tech Stack

- **HTML5 Canvas** — 2D rendering
- **Vanilla JavaScript** — No frameworks, no build tools
- **CSS3** — Flexbox, animations, responsive design

**Why no frameworks?** This project is built to demonstrate core programming fundamentals — game loops, collision detection, state management — without framework abstractions. It also deploys anywhere with zero setup.

---

## 🏗️ Architecture

```
TetrisGame (Main Controller)
├── GameState          # Score, level, game status
├── Board              # 10x20 grid, collision detection
├── Piece              # Tetromino shapes & rotation
├── Renderer           # Canvas drawing
└── InputController    # Keyboard + touch events
```

The modular design makes it easy to add new games or features. Each class has a single responsibility and minimal coupling.

---

## 📝 Development Notes

This project was built using **vibe coding** — iterating quickly with AI assistance while maintaining clean, readable code. The focus is on:

- **Simplicity** over clever tricks
- **Readability** over premature optimization  
- **Playability** over complex features

---

## 🚀 Future Ideas

- [ ] Add more classic games (Snake, Pong, etc.)
- [ ] Sound effects and music
- [ ] High score persistence
- [ ] Dark/light theme toggle

---

## 📄 License

MIT — Feel free to fork and modify.

---

Built with 💙 by [ShawTim](https://github.com/ShawTim)
