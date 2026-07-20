  GNU nano 7.2                                ./experiments/experiment-002/scripts/clean.sh                                         
#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc-openssl-exp003"

docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "[+] Container removed."
