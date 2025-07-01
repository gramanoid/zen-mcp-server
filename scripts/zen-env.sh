#!/usr/bin/env bash
# zen-env.sh - Prepare Python virtual environment and install dependencies
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

VENV=".zen_venv"
PYTHON_BIN="python3"

if [[ -d "$VENV" ]]; then
  echo "Using existing virtualenv $VENV"
else
  echo "Creating virtualenv $VENV"
  $PYTHON_BIN -m venv "$VENV"
fi

source "$VENV/bin/activate"

pip install --upgrade pip wheel setuptools >/dev/null
pip install -r requirements.txt

echo "Environment ready. Activate with: source $VENV/bin/activate"