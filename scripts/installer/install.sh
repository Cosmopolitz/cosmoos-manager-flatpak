#!/usr/bin/env bash
set -e

echo "📦 Bygger og installerer CosmoOS Manager Flatpak…"

mkdir -p flatpak-build
cd flatpak-build

cp ../cosmo-manager .
cp ../cosmo.png .
cp ../org.cosmo.CosmoOSManager.desktop .
cp ../flatpak/org.cosmo.CosmoOSManager.json .

flatpak-builder --force-clean build-dir org.cosmo.CosmoOSManager.json
flatpak-builder --user --install --force-clean build-dir org.cosmo.CosmoOSManager.json

echo "🎉 Installert!"
echo "Kjør:"
echo "  flatpak run org.cosmo.CosmoOSManager"
