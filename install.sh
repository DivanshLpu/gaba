#!/usr/bin/env bash

set -e

OWNER="DivanshLpu"
REPO="gaba"

echo "Installing Gaba..."

case "$(uname -s)" in
    Linux)
        FILE="linux.tar.gz"
        ;;
    Darwin)
        FILE="macos.tar.gz"
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

echo "Getting latest release..."

DOWNLOAD_URL=$(curl -fsSL "https://api.github.com/repos/$OWNER/$REPO/releases" \
    | grep browser_download_url \
    | grep "$FILE" \
    | head -n1 \
    | cut -d '"' -f4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "No compatible release found."
    exit 1
fi

TMP_DIR=$(mktemp -d)

echo "Downloading..."
curl -fL "$DOWNLOAD_URL" -o "$TMP_DIR/gaba.tar.gz"

echo "Extracting..."
tar -xzf "$TMP_DIR/gaba.tar.gz" -C "$TMP_DIR"

BIN=$(find "$TMP_DIR" -type f -name "gaba" | head -n1)

if [ -z "$BIN" ]; then
    echo "Executable not found."
    rm -rf "$TMP_DIR"
    exit 1
fi

chmod +x "$BIN"

INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

mv "$BIN" "$INSTALL_DIR/gaba"

rm -rf "$TMP_DIR"

echo ""
echo "✅ Gaba installed successfully!"
echo ""

if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    echo "Add this to your shell profile:"
    echo ""
    echo 'export PATH="$HOME/.local/bin:$PATH"'
    echo ""
fi

echo "Run:"
echo "gaba"
