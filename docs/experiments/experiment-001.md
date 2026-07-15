# Experiment 001 - Build and Validate Native PQC Support in OpenSSL

## Overview

This experiment establishes the baseline environment for the `pqc-openssl` repository by building OpenSSL **3.5.2** from source inside a reproducible Docker container.

Beyond validating the build process, the experiment confirms the native Post-Quantum Cryptography (PQC) capabilities provided by the official OpenSSL distribution.

## Objectives

- Build OpenSSL 3.5.2 from the official source code.
- Install OpenSSL in an isolated location (`/opt/openssl`).
- Validate the installation and runtime environment.
- Inspect the provider architecture.
- Identify the native PQC algorithms available.
- Establish a reproducible baseline for future experiments.

## Environment

| Component | Version |
|----------|---------|
| Ubuntu | 24.04 LTS |
| OpenSSL | 3.5.2 |
| Installation prefix | `/opt/openssl` |

## Implementation

OpenSSL was compiled directly from the official source release using the default provider configuration.

The installation was isolated under `/opt/openssl`, avoiding interference with the operating system libraries.

During the initial validation, the OpenSSL executable attempted to load the system versions of `libcrypto.so.3` and `libssl.so.3`, resulting in symbol version mismatches. This was resolved by updating the dynamic linker configuration to include `/opt/openssl/lib64`, ensuring that the executable loads the libraries generated during the build process.

## Results

The validation confirmed that:

- OpenSSL 3.5.2 was successfully compiled and installed.
- The executable links against the libraries installed in `/opt/openssl/lib64`.
- The **Default Provider** is active.
- No external PQC providers are required.

### Native PQC algorithms

The default provider includes native implementations of the NIST standardized post-quantum algorithms:

| Standard | Algorithms |
|----------|------------|
| FIPS 203 | ML-KEM-512, ML-KEM-768, ML-KEM-1024 |
| FIPS 204 | ML-DSA-44, ML-DSA-65, ML-DSA-87 |
| FIPS 205 | SLH-DSA (all SHA-2 and SHAKE parameter sets) |

### Hybrid TLS groups

OpenSSL also provides hybrid key exchange groups intended for transition deployments, including:

- X25519MLKEM768
- X448MLKEM1024
- SecP256r1MLKEM768
- SecP384r1MLKEM1024

These groups combine classical elliptic-curve cryptography with ML-KEM to support hybrid TLS key establishment.

## Conclusions

OpenSSL 3.5.2 provides native support for the three NIST standardized post-quantum cryptographic algorithms without requiring external providers such as Open Quantum Safe.

The provider architecture exposes PQC algorithms through the same EVP framework used by traditional public-key algorithms, enabling transparent integration into existing applications.

This experiment establishes a validated and reproducible baseline environment for all subsequent experiments in this repository.

## Next Steps

The next experiment will focus on generating, inspecting and using native ML-KEM key pairs with OpenSSL.

## Key Findings

- ✅ OpenSSL 3.5.2 includes native support for the NIST PQC standards.
- ✅ No external provider is required.
- ✅ Hybrid TLS groups are available by default.
- ✅ The build is fully reproducible using Docker.
