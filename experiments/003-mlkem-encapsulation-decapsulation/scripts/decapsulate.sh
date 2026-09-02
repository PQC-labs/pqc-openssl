#!/usr/bin/env bash

set -euo pipefail

WORKSPACE="/workspace"

ARTIFACTS_DIR="${WORKSPACE}/artifacts"

echo "[*] Alice is decapsulating the received ciphertext..."

if [[ ! -f "${ARTIFACTS_DIR}/alice-private.pem" ]]; then
    echo "[!] Alice private key not found."
    echo "[!] Run ./scripts/verify.sh first."
    exit 1
fi

if [[ ! -f "${ARTIFACTS_DIR}/ciphertext.bin" ]]; then
    echo "[!] Ciphertext not found."
    echo "[!] Run ./scripts/encapsulate.sh first."
    exit 1
fi

openssl pkeyutl \
    -decap \
    -inkey "${ARTIFACTS_DIR}/alice-private.pem" \
    -in "${ARTIFACTS_DIR}/ciphertext.bin" \
    -secret "${ARTIFACTS_DIR}/alice-shared-secret.bin"

echo
echo "[+] Decapsulation completed."

echo
ls -lh \
    "${ARTIFACTS_DIR}/alice-shared-secret.bin"
