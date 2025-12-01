#!/usr/bin/env bash
set -euo pipefail

# Simple static server to run the single-page calculator locally.
# Usage: PORT=3000 ./start.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${PORT:-3000}"
cd "$SCRIPT_DIR"

python -m http.server "$PORT" --bind 0.0.0.0
