# Tetris CV - Interactive Resume Prototype

A Tetris game prototype designed as a foundation for an interactive CV/portfolio, with Computer Vision integration in mind.

**Why this exists**: Traditional resumes are boring PDFs. This project aims to showcase front-end skills, game logic implementation, and future CV integration capabilities in a playable, interactive format.

---

## 🎯 Project Goals

This is **not** just another Tetris clone. The goals are:

1. **Demonstrate core programming skills** - Game loop, collision detection, state management, modular design
2. **Prepare for CV integration** - Clean interfaces for gesture/pose control via MediaPipe or TensorFlow.js
3. **Serve as an interactive portfolio piece** - Eventually embed personal info, skill trees, project showcases within the game

**Current status**: Phase 1 complete ✅ (playable Tetris with CV-ready architecture)

---

## 🚀 Quick Start

### Run Locally

```bash
cd tetris-cv
python3 -m http.server 8000
# Open http://localhost:8000
```

Or just open `index.html` in a modern browser.

### Controls

| Key | Action |
|-----|--------|
| ← → | Move left/right |
| ↓ | Soft drop |
| ↑ / Space | Rotate |
| P | Pause |
| R | Restart (when game over) |

---

## 📁 Project Structure

```
tetris-cv/
├── index.html          # Main page (game canvas + info panel)
├── game.js             # Core game logic (~500 lines, modular)
├── style.css           # Styling
└── README.md           # This file
```

**Why so minimal?** No frameworks, no build tools, no bloat. Pure HTML/CSS/JavaScript. This demonstrates:
- Understanding of vanilla JS fundamentals
- Ability to structure code without framework crutches
- Performance (no framework overhead)

---

## 🏗️ Architecture Design

### Module Overview

The game is split into 6 classes, each with a single responsibility:

```
TetrisGame (Main controller)
├── GameState          # Score, level, game over flags
├── Board              # 10x20 grid, collision detection, line clearing
├── Piece              # Tetromino shape, rotation, movement
├── Renderer           # All Canvas drawing operations
└── InputController    # Keyboard + CV interface
```

**Why this structure?**
- **Low coupling**: Each module can be tested/modified independently
- **Easy CV integration**: `InputController` abstracts input sources (keyboard or CV gestures map to the same actions)
- **Scalability**: Adding features (animations, particles, sound) won't require rewriting core logic

### Data Flow

```
User Input / CV Gesture
    ↓
InputController.triggerAction('LEFT')
    ↓
TetrisGame.movePiece(-1, 0)
    ↓
Board.collide() checks validity
    ↓
Valid → update position | Invalid → revert or lock piece
    ↓
Board.merge() + clearLines()
    ↓
GameState.addScore() + level up
    ↓
Renderer draws updated state
```

---

## 🔧 Tech Stack & Decisions

### Why Vanilla JavaScript?

**Alternative considered**: Use Phaser.js, Three.js, or React

**Why I chose vanilla JS**:
- **Showcase fundamentals**: Frameworks abstract away the hard parts. This shows I understand game loops, rendering, and state management from scratch
- **Performance**: No framework overhead. 60fps is trivial
- **Portability**: Runs anywhere with zero dependencies
- **Learning value**: Building from scratch teaches more than using pre-built game engines

**Trade-off**: More boilerplate code. Worth it for demonstrating low-level understanding.

---

### Why Canvas API?

**Alternative considered**: DOM manipulation, WebGL

**Why Canvas**:
- **Performance**: Efficient for 2D grid-based games
- **Control**: Full control over rendering pipeline
- **Standard**: Widely supported, no polyfills needed

**Trade-off**: Less fancy visual effects than WebGL. For a Tetris game, Canvas is the right tool.

---

### Why Modular Class Design?

**Alternative considered**: Functional programming, single-file script

**Why classes**:
- **Testability**: Each class can be unit tested independently
- **Maintainability**: Clear separation of concerns
- **CV integration**: Easy to swap `InputController` implementation without touching game logic

**Example**: To add AI auto-play, I only need to extend `InputController`, not rewrite the entire game.

---

## 🔌 CV Integration Interface

One of the key goals is **CV-readiness**. The game exposes a clean interface for external control:

### 1. Global Game Instance

```javascript
window.tetrisGame  // Available after page load
```

### 2. Trigger Actions

```javascript
// External modules (CV, AI, network) can call:
window.tetrisGame.triggerCVAction('LEFT');
window.tetrisGame.triggerCVAction('RIGHT');
window.tetrisGame.triggerCVAction('DOWN');
window.tetrisGame.triggerCVAction('ROTATE');
```

### 3. Read Game State

```javascript
const state = window.tetrisGame.getGameState();
// Returns:
// {
//   board: 2D array of the grid,
//   currentPiece: { shape, x, y, typeId },
//   score, level, lines,
//   gameOver, paused
// }
```

**Use case**: CV module reads state → decides optimal move → calls `triggerCVAction()`

### 4. Debug Output

```javascript
window.tetrisGame.updateCVStatus('Gesture detected: swipe left');
```

Displays in the CV section of the UI (reserved for future CV integration).

---

## 🛠️ Challenges & Solutions

### Challenge 1: Arrow Key Scroll Conflict

**Problem**: Pressing arrow keys would scroll the page before moving the piece.

**Solution**: Added `e.preventDefault()` in `keydown` listener for arrow keys and space.

**Why this matters**: This is a common gotcha when building browser games. Shows attention to UX details.

---

### Challenge 2: Rotation Near Walls

**Problem**: Standard rotation fails if the piece is against a wall (collision after rotation).

**Solution**: Implemented **Wall Kick** - try shifting the piece left/right by 1-2 blocks after rotation. Only revert if all shifts fail.

**Code**:
```javascript
const kicks = [0, 1, -1, 2, -2];
for (let kick of kicks) {
    this.currentPiece.x += kick;
    if (!this.board.collide(this.currentPiece)) {
        adjusted = true;
        break;
    }
    this.currentPiece.x -= kick;
}
```

**Why this matters**: This is part of the [SRS (Super Rotation System)](https://tetris.fandom.com/wiki/SRS), the standard Tetris rotation system. Shows knowledge of game design patterns beyond basic implementation.

---

### Challenge 3: Game Loop Timing

**Problem**: JavaScript timers (`setInterval`, `setTimeout`) are unreliable for smooth animations.

**Solution**: Used `requestAnimationFrame()` for rendering and manual delta-time accumulation for drop speed.

**Code**:
```javascript
update(time = 0) {
    const deltaTime = time - this.state.lastTime;
    this.state.dropCounter += deltaTime;
    
    if (this.state.dropCounter > this.state.dropInterval) {
        this.movePiece(0, 1);  // Auto-drop
        this.state.dropCounter = 0;
    }
    
    this.renderer.drawBoard(this.board);
    this.renderer.drawPiece(this.currentPiece);
    
    requestAnimationFrame((t) => this.update(t));
}
```

**Why this matters**: `requestAnimationFrame` syncs with browser repaint (~60fps). This is the standard for smooth browser animations.

---

## 📊 What I Learned (Or: Why This Isn't Just Copy-Paste)

### 1. Game Loop Design

Building a game loop from scratch taught me:
- **Separation of update and render** (logic vs. drawing)
- **Delta-time accumulation** (consistent speed across different frame rates)
- **State management** (paused, game over, playing)

**Before this project**: I knew React state management. Game loops are different - state updates every frame, not on user events.

---

### 2. Collision Detection

The `Board.collide()` method checks:
- Out of bounds (x < 0, x >= cols, y >= rows)
- Overlapping with locked pieces (grid[y][x] !== 0)

**Insight**: You have to check the piece's shape matrix, not just its (x, y) position. Each tetromino has a 3x3 or 4x4 shape array with holes (0s).

**Why it's tricky**: The piece's position is top-left corner of its bounding box, not center. Off-by-one errors are easy if you're not careful.

---

### 3. Rotation Matrices

Tetris pieces rotate clockwise 90°. The trick is **matrix transposition + reversal**:

```javascript
rotate() {
    return this.shape[0].map((_, i) =>
        this.shape.map(row => row[i]).reverse()
    );
}
```

**What this does**:
1. `map((_, i) => ...)` - iterate over columns
2. `this.shape.map(row => row[i])` - extract column as new row
3. `.reverse()` - flip to get clockwise rotation

**Before this project**: I knew matrix operations in theory. Implementing it in a real use case solidified understanding.

---

## 🚧 Roadmap

### Phase 1: Playable Tetris ✅ (Complete)
- ✅ Core game logic
- ✅ Collision detection
- ✅ Line clearing & scoring
- ✅ Level system
- ✅ Wall kick
- ✅ Modular architecture
- ✅ CV-ready interfaces

### Phase 2: CV Integration 🚧 (Next)
- [ ] Integrate MediaPipe Hands
- [ ] Gesture recognition (swipe left/right, rotate gesture)
- [ ] Camera feed display in UI
- [ ] Debouncing (prevent accidental multiple triggers)
- [ ] Use Web Worker for CV processing (avoid blocking game loop)

**Tech choice**: MediaPipe Hands (Google's hand-tracking library)
- **Why**: Pre-trained model, runs in browser, good performance
- **Alternative considered**: TensorFlow.js with custom model. Rejected because MediaPipe is faster and requires less setup

### Phase 3: Interactive CV 📋 (Future)
- [ ] Embed personal info (name, skills, experience) in game UI
- [ ] "Unlock" portfolio items by clearing lines
- [ ] Each tetromino type represents a skill category (e.g., I-piece = backend, T-piece = frontend)
- [ ] Game over screen shows resume summary
- [ ] Deploy on GitHub Pages with custom domain

**Goal**: When recruiters visit my portfolio, they see a playable game that also tells my professional story. Memorable + demonstrates skills simultaneously.

---

## 🐛 Known Limitations

### Current Limitations
- **No sound effects** - Intentionally omitted (focus on core logic first)
- **No high score persistence** - Would need localStorage (easy to add)
- **Basic UI** - Function over form (CSS polish is Phase 3)
- **No mobile touch controls** - Keyboard only for now

**Why these aren't bugs**: This is a **prototype**. The goal is to demonstrate architecture and logic, not create a polished product (yet).

### Future Improvements
- Add particle effects for line clears
- Background music toggle
- Mobile-responsive touch controls
- Leaderboard (integrate with backend)

---

## 🎓 Learning Resources

If you want to build something similar, here's what helped me:

### Tetris Game Logic
- [Tetris Wiki - SRS](https://tetris.fandom.com/wiki/SRS) - Official rotation system
- [JavaScript Game Dev](https://developer.mozilla.org/en-US/docs/Games) - MDN game dev guide

### Canvas API
- [Canvas Tutorial](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial) - MDN official guide
- [requestAnimationFrame](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame) - Smooth animations

### CV Integration (for Phase 2)
- [MediaPipe Hands](https://google.github.io/mediapipe/solutions/hands.html) - Hand tracking
- [TensorFlow.js](https://www.tensorflow.org/js) - Alternative ML library

---

## 💡 If You're Building Something Similar

### Do:
- ✅ **Start with core logic** (game works in console before adding UI)
- ✅ **Modular design** (small classes with single responsibilities)
- ✅ **Comment your code** (your future self will thank you)
- ✅ **Test edge cases** (rotation near walls, game over conditions)

### Don't:
- ❌ **Over-engineer** (no need for Redux/MobX in a Tetris game)
- ❌ **Premature optimization** (make it work, then make it fast)
- ❌ **Skip planning** (I sketched class diagrams on paper first)

---

## 📄 License

MIT License - Feel free to fork, modify, and use. Attribution appreciated but not required.

---

## 📬 Contact

This is a portfolio project. If you found it interesting or want to chat about game dev / CV integration / job opportunities:

- **GitHub**: [ShawTim](https://github.com/ShawTim)
- **Portfolio**: (coming soon - this will be part of it!)

---

**Last Updated**: 2026-02-06  
**Version**: 1.0.0 (Phase 1 - Playable Prototype)  
**Status**: ✅ Playable | 🚧 Awaiting CV Integration

---

## 🙏 Acknowledgments

- Tetris design © The Tetris Company (this is a non-commercial educational project)
- Inspired by classic Tetris implementations and modern web game dev practices
