#!/usr/bin/env bash

set -e

echo "Uninstalling Gaba..."

REMOVED=0

remove_file() {
    FILE="$1"

    if [ -f "$FILE" ]; then
        echo "Found: $FILE"

        if rm -f "$FILE" 2>/dev/null; then
            echo "Removed: $FILE"
        else
            echo "Removing with sudo..."
            sudo rm -f "$FILE"
            echo "Removed: $FILE"
        fi

        REMOVED=1
    fi
}

# Remove every executable found in PATH
if command -v which >/dev/null 2>&1; then
    while IFS= read -r FILE; do
        [ -n "$FILE" ] && remove_file "$FILE"
    done < <(which -a gaba 2>/dev/null | sort -u)
fi

# Fallback locations
remove_file "$HOME/.local/bin/gaba"
remove_file "/usr/local/bin/gaba"
remove_file "/usr/bin/gaba"

# Refresh shell cache
hash -r 2>/dev/null || true

if [ "$REMOVED" -eq 1 ]; then
    echo ""
    echo "✅ Gaba uninstalled successfully!"
else
    echo ""
    echo "Gaba is not installed."
fi
