#!/usr/bin/env bash
# run-server.sh – Compatibility shim that delegates to modular scripts.
# Usage: ./run-server.sh <command>
# Commands:
#   env            – create/activate Python env and install deps
#   clean-docker   – remove old Docker containers/images/volumes
#   start          – start the Zen MCP server (requires env)
#   full           – run legacy monolithic workflow (original script)
# -----------------------------------------------------------------------------
set -euo pipefail

CMD="${1:-start}"
shift || true
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$CMD" in
  env)
    exec "$SCRIPT_DIR/scripts/zen-env.sh" "$@"
    ;;
  clean-docker)
    exec "$SCRIPT_DIR/scripts/zen-docker-clean.sh" "$@"
    ;;
  start)
    exec "$SCRIPT_DIR/scripts/zen-start.sh" "$@"
    ;;
  full)
    # Fall back to legacy script preserved as run-server-full.sh if it exists
    if [[ -f "$SCRIPT_DIR/run-server-full.sh" ]]; then
      exec "$SCRIPT_DIR/run-server-full.sh" "$@"
    else
      echo "Legacy full script not found." >&2; exit 1
    fi
    ;;
  *)
    echo "Unknown command: $CMD"
    echo "Available commands: env, clean-docker, start, full" >&2
    exit 1
    ;;
esac
