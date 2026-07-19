#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

BIN="$HOME/.local/bin/gaba"

if [ ! -f "$BIN" ]; then
    echo "Gaba is not installed."
    exit 0
fi

rm -f "$BIN"

echo "✅ Gaba uninstalled successfully!"
