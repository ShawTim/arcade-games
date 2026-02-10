#!/bin/bash
# Arcade Games - Quick Start Script

echo "Starting Arcade Games..."
echo ""
echo "Location: ~/work/arcade-games/"
echo "Server: http://localhost:8000"
echo ""
echo "Controls:"
echo "  Left/Right : Move"
echo "  Down       : Soft Drop"
echo "  Up/Space   : Rotate"
echo "  P          : Pause"
echo "  R          : Restart"
echo ""
echo "Press Ctrl+C to stop server"
echo "=============================="
echo ""

cd ~/work/arcade-games
python3 -m http.server 8000
