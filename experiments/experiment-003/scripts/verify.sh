#!/usr/bin/env bash

set -euo pipefail

WORKSPACE="/workspace"

ARTIFACTS_DIR="${WORKSPACE}/artifacts"
RESULTS_DIR="${WORKSPACE}/results"

mkdir -p "${ARTIFACTS_DIR}"
mkdir -p "${RESULTS_DIR}"

echo "[*] Cleaning previous artifacts..."
find "${ARTIFACTS_DIR}" -type f -delete
find "${RESULTS_DIR}" -type f -delete

echo "[*] Recording execution information..."

cat > "${RESULTS_DIR}/run-info.txt" <<EOF
Experiment : experiment-003
Description: ML-KEM encapsulation and decapsulation
Date       : $(date -u)
Hostname   : $(hostname)

EOF

echo
echo "[*] OpenSSL version..."
openssl version -a | tee "${RESULTS_DIR}/version.txt"

echo
echo "[*] Available providers..."
openssl list -providers -verbose \
    | tee "${RESULTS_DIR}/providers.txt"

echo
echo "[*] Available KEM algorithms..."
openssl list -kem-algorithms \
    | tee "${RESULTS_DIR}/kem-algorithms.txt"

echo
echo "[*] Available TLS groups..."
openssl list -tls-groups \
    | tee "${RESULTS_DIR}/tls-groups.txt"

echo
echo "[*] Available signature algorithms..."
openssl list -signature-algorithms \
    > "${RESULTS_DIR}/signature-algorithms.txt"

echo
echo "[*] Available public key algorithms..."
openssl list -public-key-algorithms \
    > "${RESULTS_DIR}/public-key-algorithms.txt"

echo
echo "[*] Generating ML-KEM-512 key pair..."

openssl genpkey \
    -algorithm ML-KEM-512 \
    -out "${ARTIFACTS_DIR}/mlkem512-private.pem"

openssl pkey \
    -in "${ARTIFACTS_DIR}/mlkem512-private.pem" \
    -pubout \
    -out "${ARTIFACTS_DIR}/mlkem512-public.pem"

echo "[+] Key pair generated."

echo
echo "[*] Inspecting private key..."

openssl pkey \
    -in "${ARTIFACTS_DIR}/mlkem512-private.pem" \
    -text \
    > "${RESULTS_DIR}/mlkem512-private.txt"

echo
echo "[*] Inspecting public key..."

openssl pkey \
    -pubin \
    -in "${ARTIFACTS_DIR}/mlkem512-public.pem" \
    -text \
    > "${RESULTS_DIR}/mlkem512-public.txt"

echo
echo "[*] Parsing ASN.1 structures..."

openssl asn1parse \
    -in "${ARTIFACTS_DIR}/mlkem512-private.pem" \
    > "${RESULTS_DIR}/mlkem512-private-asn1.txt"

openssl asn1parse \
    -in "${ARTIFACTS_DIR}/mlkem512-public.pem" \
    > "${RESULTS_DIR}/mlkem512-public-asn1.txt"

echo
echo "[*] Measuring generated files..."

wc -c "${ARTIFACTS_DIR}"/* \
    > "${RESULTS_DIR}/sizes.txt"

echo
echo "[*] Generated artifacts:"
ls -lh "${ARTIFACTS_DIR}"

echo
echo "[*] Generated result files:"
ls -lh "${RESULTS_DIR}"

echo
echo "[+] Environment ready for encapsulation experiment."
