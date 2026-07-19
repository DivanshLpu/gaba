#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

BIN=$(command -v gaba 2>/dev/null)

if [ -z "$BIN" ]; then
    echo "Gaba is not installed."
    exit 0
fi

echo "Found: $BIN"

if rm -f "$BIN" 2>/dev/null; then
    echo "✅ Gaba uninstalled successfully!"
else
    echo "Administrator permission required..."
    sudo rm -f "$BIN"
    echo "✅ Gaba uninstalled successfully!"
fi
