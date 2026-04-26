#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BIND_ADDR="${BIND_ADDR:-127.0.0.1}"
PORT="${PORT:-8000}"

if [[ ! -f "$ROOT_DIR/site/index.html" ]]; then
  "$ROOT_DIR/scripts/update_and_build.sh"
fi

exec "$ROOT_DIR/robotics_course_venv/bin/python" -m http.server "$PORT" --bind "$BIND_ADDR" --directory "$ROOT_DIR/site"
