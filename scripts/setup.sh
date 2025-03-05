#!/bin/bash

# Setup script for Unix-based systems (macOS, Linux, BSD)

# Error handling
set -e
trap 'echo "Error: Script failed on line $LINENO"' ERR

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/arch-release ]; then
            MACHINE="arch"
        elif [ -f /etc/qubes-release ]; then
            MACHINE="qubes"
        elif [ -f /etc/debian_version ] && grep -q "tails" /etc/debian_version; then
            MACHINE="tails"
        else
            MACHINE="linux"
        fi
        ;;
    Darwin*)    MACHINE="macos";;
    *)          MACHINE="UNKNOWN";;
esac

echo "Detected OS: $MACHINE"

# Check prerequisites
command -v node >/dev/null 2>&1 || { echo "Node.js is required but not installed. Aborting." >&2; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "npm is required but not installed. Aborting." >&2; exit 1; }

# Create necessary directories
mkdir -p ~/.cursor/config
mkdir -p ~/.vscode/extensions

# Copy configurations based on OS
case "$MACHINE" in
    "macos")
        # macOS specific setup
        cp -r platform/macos/* ~/.cursor/
        # Install Xcode Command Line Tools if not present
        xcode-select -p >/dev/null 2>&1 || xcode-select --install
        ;;
    "linux"|"arch")
        # Linux/Arch specific setup
        cp -r platform/linux/* ~/.cursor/
        ;;
    "qubes")
        # Qubes specific setup
        cp -r platform/qubes/* ~/.cursor/
        # Additional Qubes security measures
        chmod 700 ~/.cursor
        ;;
    "tails")
        # Tails specific setup
        cp -r platform/tails/* ~/.cursor/
        # Make configurations persistent
        if [ -d /live/persistence/TailsData_unlocked ]; then
            cp -r ~/.cursor /live/persistence/TailsData_unlocked/
        fi
        ;;
    *)
        echo "Unsupported OS"
        exit 1
        ;;
esac

# Copy common configurations
cp -r config/* ~/.cursor/config/
cp -r .vscode/* ~/.vscode/

# Set correct permissions
chmod -R 644 ~/.cursor/config/*
chmod 755 ~/.cursor ~/.cursor/config

# Install dependencies
npm install --global typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin

echo "Configuration setup complete for $MACHINE"
echo "Please restart your IDE for changes to take effect"
