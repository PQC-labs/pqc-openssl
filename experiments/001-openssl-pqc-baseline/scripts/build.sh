#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="pqc-openssl:experiment-001"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_DIR="$(dirname "$SCRIPT_DIR")"

echo "[*] Building Docker image: ${IMAGE_NAME}"

docker build \
    -t "${IMAGE_NAME}" \
    -f "${EXPERIMENT_DIR}/Dockerfile" \
    "${EXPERIMENT_DIR}"

echo "[+] Build completed."
