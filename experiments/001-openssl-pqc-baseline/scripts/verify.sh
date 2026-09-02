#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc_lab001_openssl-experiment-001"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
RESULTS_DIR="${EXPERIMENT_DIR}/results"

mkdir -p "${RESULTS_DIR}"

RESULT_FILE="${RESULTS_DIR}/verification.txt"

echo "[+] Saving verification results to:"
echo "    ${RESULT_FILE}"
echo

{
    echo "============================================================"
    echo "OpenSSL PQC Baseline Verification"
    echo "============================================================"
    echo
    echo "Container: ${CONTAINER_NAME}"
    echo "Date: $(date --iso-8601=seconds)"
    echo

    echo "== OpenSSL version =="
    docker exec "${CONTAINER_NAME}" openssl version -a

    echo
    echo "== Linked libraries =="
    docker exec "${CONTAINER_NAME}" ldd /opt/openssl/bin/openssl

    echo
    echo "== Providers =="
    docker exec "${CONTAINER_NAME}" openssl list -providers

    echo
    echo "== KEM algorithms =="
    docker exec "${CONTAINER_NAME}" openssl list -kem-algorithms

    echo
    echo "== Signature algorithms =="
    docker exec "${CONTAINER_NAME}" openssl list -signature-algorithms

    echo
    echo "== TLS groups =="
    docker exec "${CONTAINER_NAME}" openssl list -tls-groups

    echo
    echo "[+] Verification completed successfully."
} | tee "${RESULT_FILE}"
