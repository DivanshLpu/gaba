#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

INSTALL_DIR="$HOME/.local/bin"
BIN="$INSTALL_DIR/gaba"

if [ ! -e "$BIN" ]; then
    echo "❌ Gaba is not installed."
    exit 0
fi

rm -f "$BIN"

# Refresh shell command cache if supported
hash -r 2>/dev/null || true

echo ""
echo "✅ Gaba has been uninstalled successfully!"
echo ""
echo "Removed: $BIN"
