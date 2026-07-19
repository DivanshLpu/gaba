#!/usr/bin/env bash

set -e

OWNER="DivanshLpu"
REPO="gaba"

echo "Installing Gaba..."

OS=$(uname -s)

case "$OS" in
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

VERSION=$(curl -s https://api.github.com/repos/$OWNER/$REPO/releases/latest \
| grep '"tag_name"' \
| cut -d '"' -f4)

DOWNLOAD_URL="https://github.com/$OWNER/$REPO/releases/download/$VERSION/gaba-${VERSION}-${FILE}"

TMP_DIR=$(mktemp -d)

echo "Downloading $DOWNLOAD_URL"

curl -L "$DOWNLOAD_URL" -o "$TMP_DIR/gaba.tar.gz"

echo "Extracting..."

tar -xzf "$TMP_DIR/gaba.tar.gz" -C "$TMP_DIR"

BIN=$(find "$TMP_DIR" -type f -name "gaba" | head -n 1)

if [ -z "$BIN" ]; then
    echo "Executable not found."
    exit 1
fi

chmod +x "$BIN"

if [ -w /usr/local/bin ]; then
    mv "$BIN" /usr/local/bin/gaba
else
    sudo mv "$BIN" /usr/local/bin/gaba
fi

rm -rf "$TMP_DIR"

echo ""
echo "✅ Gaba installed successfully!"
echo ""
echo "Run:"
echo ""
echo "gaba"