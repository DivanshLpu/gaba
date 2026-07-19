#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

INSTALL_DIR="$HOME/.local/bin"
BIN="$INSTALL_DIR/gaba"

if [ -f "$BIN" ]; then
    rm -f "$BIN"
    echo "✅ Gaba removed."
else
    echo "Gaba is not installed."
fi

echo ""
echo "Done."
