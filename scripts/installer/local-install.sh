#!/usr/bin/env bash
set -e
flatpak-builder --user --install --force-clean build-dir flatpak/org.cosmo.CosmoOSManager.json
