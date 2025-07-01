#!/usr/bin/env bash
# zen-start.sh - Activate env and run Zen MCP server
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

VENV=".zen_venv"
if [[ ! -d "$VENV" ]]; then
  echo "Virtualenv not found. Run scripts/zen-env.sh first." >&2
  exit 1
fi

source "$VENV/bin/activate"

python -OO server.py