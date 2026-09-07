#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc_lab001_openssl-openssl-build-baseline"

docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[+] Container removed."
