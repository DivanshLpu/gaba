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

RELEASE_JSON=$(curl -fsSL "https://api.github.com/repos/$OWNER/$REPO/releases")

VERSION=$(echo "$RELEASE_JSON" \
    | grep '"tag_name"' \
    | head -n1 \
    | cut -d '"' -f4)

DOWNLOAD_URL=$(echo "$RELEASE_JSON" \
    | grep '"browser_download_url"' \
    | grep "$FILE" \
    | head -n1 \
    | cut -d '"' -f4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "❌ Could not find a release asset for $FILE"
    exit 1
fi

echo "Downloading $DOWNLOAD_URL"

TMP_DIR=$(mktemp -d)

curl -fL "$DOWNLOAD_URL" -o "$TMP_DIR/gaba.tar.gz"


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
