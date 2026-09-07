#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc_lab002_openssl-openssl-mlkem-generation-asn1-analysis"

docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[+] Container removed."
