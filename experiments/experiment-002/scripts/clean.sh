#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc-openssl-exp002"

docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[+] Container removed."
