# Arcade Games 🕹️

A collection of retro arcade games built with pure JavaScript and HTML5 Canvas. No frameworks, no dependencies — just code and pixels.

**Play Now**: [shawtim.github.io/arcade-games](https://shawtim.github.io/arcade-games)

---

## 🎮 Games

### Tetris
The classic block-stacking puzzle. SRS rotation with wall kicks, 10-level progression, increasing speed.

### Bubble Shooter
Aim and fire colored bubbles to match 3+. Physics-based aiming with bounce off walls.

### Space Invaders
Defend Earth against waves of descending aliens. Dodge bullets, destroy the fleet.

---

## ✨ Highlights

- 🎨 **Retro arcade cabinet aesthetic** — CRT scanlines, neon glows, pixel fonts
- 📱 **Mobile-friendly** — Touch controls on all games
- ⚡ **Zero dependencies** — Pure HTML5 Canvas + vanilla JS
- 🧩 **Modular** — Each game is self-contained, easy to add more

## 🎮 Controls

| Key | Action |
|-----|--------|
| ← → | Move |
| ↑ / Space | Rotate / Fire |
| ↓ | Drop / Aim |
| S | Start |
| P | Pause |

**Mobile**: On-screen touch buttons.

---

## 🛠️ Tech

- **HTML5 Canvas** for rendering
- **Vanilla JavaScript** — no build tools, no bundlers
- **CSS3** — responsive layout, animations

Each game follows the same architecture: game loop → state update → render. Clean separation of concerns, readable code.

---

## Run Locally

```bash
git clone https://github.com/ShawTim/arcade-games.git
cd arcade-games
python3 -m http.server 8000
# Open http://localhost:8000
```

---

## License

MIT

---

Built by [ShawTim](https://github.com/ShawTim)
