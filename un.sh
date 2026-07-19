#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

BIN="/usr/local/bin/gaba"

if [ ! -f "$BIN" ]; then
    echo "Gaba is not installed."
    exit 0
fi

if rm -f "$BIN" 2>/dev/null; then
    echo "✅ Gaba uninstalled successfully!"
else
    echo "Administrator permission required..."
    sudo rm -f "$BIN"
    echo "✅ Gaba uninstalled successfully!"
fi
