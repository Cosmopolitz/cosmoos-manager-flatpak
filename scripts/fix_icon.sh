#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/github/cosmoos-manager-flatpak"
ICON="$REPO_DIR/cosmo.png"

echo "🔧 Fixer ikon for Flatpak…"

if ! command -v convert >/dev/null 2>&1; then
    echo "⏳ Installerer ImageMagick…"
    sudo dnf install -y imagemagick
fi

if [ ! -f "$ICON" ]; then
    echo "❌ cosmo.png finnes ikke i repoet!"
    exit 1
fi

echo "📉 Skalerer cosmo.png til 256×256…"
convert "$ICON" -resize 256x256 "$ICON"

echo "✔ Ikon fikset."
echo "⏳ Bygger Flatpak på nytt…"

bash "$REPO_DIR/scripts/installer/install.sh"
