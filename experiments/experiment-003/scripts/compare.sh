#!/usr/bin/env bash

set -euo pipefail

WORKSPACE="/workspace"

ARTIFACTS_DIR="${WORKSPACE}/artifacts"

echo "[*] Comparing shared secrets..."

cmp \
    "${ARTIFACTS_DIR}/bob-shared-secret.bin" \
    "${ARTIFACTS_DIR}/alice-shared-secret.bin"

echo "[+] Shared secrets match."

echo
echo "[*] SHA-256 fingerprints"

sha256sum \
    "${ARTIFACTS_DIR}/bob-shared-secret.bin" \
    "${ARTIFACTS_DIR}/alice-shared-secret.bin"
