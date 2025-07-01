#!/usr/bin/env bash
# zen-docker-clean.sh - Lightweight Docker cleanup used by Zen MCP
set -euo pipefail

containers=( \
  "gemini-mcp-server" "gemini-mcp-redis" \
  "zen-mcp-server" "zen-mcp-redis" "zen-mcp-log-monitor" \
)

for c in "${containers[@]}"; do
  if docker ps -a --format '{{.Names}}' | grep -q "^${c}$"; then
    echo "Stopping and removing container $c"
    docker stop "$c" >/dev/null 2>&1 || true
    docker rm "$c"   >/dev/null 2>&1 || true
  fi
done

docker volume prune -f