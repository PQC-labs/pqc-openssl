#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_DIR="$(dirname "${SCRIPT_DIR}")"

docker build \
    -t pqc-openssl:experiment-003 \
    "${EXPERIMENT_DIR}"
