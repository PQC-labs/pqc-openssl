#!/usr/bin/env bash

set -e

IMAGE_NAME="pqc_lab002_openssl-openssl-mlkem-generation-asn1-analysis"
CONTAINER_NAME="pqc_lab002_openssl-openssl-mlkem-generation-asn1-analysis"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "[*] Starting container: ${CONTAINER_NAME}"

docker run -dit \
    --name "${CONTAINER_NAME}" \
    --hostname "${CONTAINER_NAME}" \
    --user "$(id -u):$(id -g)" \
    -v "${EXPERIMENT_DIR}:/workspace" \
    -w /workspace \
    "${IMAGE_NAME}"

echo "[+] Container started."
echo "[*] Experiment directory mounted at /workspace"
echo

echo "[*] Opening interactive shell..."

docker exec -it "${CONTAINER_NAME}" bash
