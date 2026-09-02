#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc-openssl-exp003"

if ! docker ps --format '{{.Names}}' | grep -qx "${CONTAINER_NAME}"; then
    echo "[!] Container '${CONTAINER_NAME}' is not running."
    echo "    Start it first with ./scripts/run.sh"
    exit 1
fi

docker exec -it "${CONTAINER_NAME}" /bin/bash
