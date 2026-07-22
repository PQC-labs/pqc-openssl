#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="pqc-openssl:experiment-003"
CONTAINER_NAME="pqc-openssl-exp003"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "[*] Removing previous container (if any)..."
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[*] Starting container: ${CONTAINER_NAME}"

docker run -dit \
    --name "${CONTAINER_NAME}" \
    --hostname "${CONTAINER_NAME}" \
    --user "$(id -u):$(id -g)" \
    -v "${EXPERIMENT_DIR}:/workspace" \
    -w /workspace \
    "${IMAGE_NAME}" \
    tail -f /dev/null

echo "[+] Container started."
echo "[*] Experiment directory mounted at /workspace"
echo

echo "[*] Opening interactive shell..."

docker exec -it "${CONTAINER_NAME}" bash
