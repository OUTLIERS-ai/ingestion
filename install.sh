#!/usr/bin/env bash
# Outliers Ingestion — installer (macOS / Linux)
#
#   ./install.sh ~/Documents/My\ Vault
#
# Copies the five agents into the vault, creates the folders they expect, and drops in a
# starter operating manual if there is not one already. Safe to run twice: it never
# overwrites an existing _CLAUDE.md and never touches your notes.

set -e

VAULT="$1"
if [ -z "$VAULT" ]; then
  echo "Usage: ./install.sh /path/to/your/vault"
  exit 1
fi
if [ ! -d "$VAULT" ]; then
  echo "That folder does not exist: $VAULT"
  exit 1
fi

HERE="$(cd "$(dirname "$0")" && pwd)"

# 1. the agents
mkdir -p "$VAULT/.claude/agents"
cp "$HERE"/.claude/agents/*.md "$VAULT/.claude/agents/"
echo "Installed 5 agents to $VAULT/.claude/agents"

# 2. the folders they expect
for f in Projects Areas People Meetings Resources Ideas Wiki Archive AI; do
  if [ ! -d "$VAULT/$f" ]; then
    mkdir -p "$VAULT/$f"
    echo "  created $f/"
  fi
done

# 3. the operating manual, only if absent
if [ -f "$VAULT/_CLAUDE.md" ]; then
  echo "_CLAUDE.md already exists, left untouched"
else
  cp "$HERE/_CLAUDE.md" "$VAULT/_CLAUDE.md"
  echo "Added a starter _CLAUDE.md — edit it, it is yours"
fi

echo
echo "Done. Open Claude Code in your vault and try:"
echo "  run the-connector - who have I not spoken to?"
