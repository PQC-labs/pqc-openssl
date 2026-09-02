#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="pqc_lab001_openssl-experiment-001"
CONTAINER_NAME="pqc_lab001_openssl-experiment-001"

# Remove any previous container with the same name
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[*] Starting container: ${CONTAINER_NAME}"

docker run \
    -d \
    --name "${CONTAINER_NAME}" \
    "${IMAGE_NAME}" \
    tail -f /dev/null

echo "[+] Container started."

echo "[*] Opening interactive shell..."

docker exec -it "${CONTAINER_NAME}" /bin/bash
