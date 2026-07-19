#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

REMOVED=0

# User installation
if [ -f "$HOME/.local/bin/gaba" ]; then
    rm -f "$HOME/.local/bin/gaba"
    echo "Removed $HOME/.local/bin/gaba"
    REMOVED=1
fi

# System installation
if [ -f "/usr/local/bin/gaba" ]; then
    if [ -w "/usr/local/bin/gaba" ]; then
        rm -f "/usr/local/bin/gaba"
    else
        sudo rm -f "/usr/local/bin/gaba"
    fi
    echo "Removed /usr/local/bin/gaba"
    REMOVED=1
fi

if [ "$REMOVED" -eq 0 ]; then
    echo "Gaba is not installed."
else
    echo ""
    echo "✅ Gaba uninstalled successfully!"
fi
