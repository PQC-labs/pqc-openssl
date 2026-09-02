#!/usr/bin/env bash

set -euo pipefail

CONTAINER_NAME="pqc-openssl-exp001"

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
