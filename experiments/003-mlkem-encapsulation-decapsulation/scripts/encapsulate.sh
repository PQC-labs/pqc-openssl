#!/usr/bin/env bash

set -euo pipefail

WORKSPACE="/workspace"

ARTIFACTS_DIR="${WORKSPACE}/artifacts"

echo "[*] Bob is obtaining Alice's public key..."

if [[ ! -f "${ARTIFACTS_DIR}/alice-public.pem" ]]; then
    echo "[!] Alice public key not found."
    echo "[!] Run ./scripts/verify.sh first."
    exit 1
fi

echo "[*] Performing ML-KEM encapsulation..."

openssl pkeyutl \
    -encap \
    -inkey "${ARTIFACTS_DIR}/alice-public.pem" \
    -pubin \
    -out "${ARTIFACTS_DIR}/ciphertext.bin" \
    -secret "${ARTIFACTS_DIR}/bob-shared-secret.bin"

echo
echo "[+] Encapsulation completed."

echo
ls -lh \
    "${ARTIFACTS_DIR}/ciphertext.bin" \
    "${ARTIFACTS_DIR}/bob-shared-secret.bin"
