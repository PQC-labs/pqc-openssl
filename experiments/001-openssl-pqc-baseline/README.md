# Experiment 001 - Build OpenSSL with Native PQC Support

## Overview

This experiment builds OpenSSL **3.5.2** from source inside a reproducible Docker environment and validates its native Post-Quantum Cryptography (PQC) capabilities.

The resulting environment serves as the baseline for all subsequent experiments in this repository.

## Objectives

- Build OpenSSL from the official source code.
- Install it in an isolated location (`/opt/openssl`).
- Verify the installation.
- Inspect the available providers.
- Identify the native PQC algorithms included in OpenSSL.
- Establish a reproducible baseline for future experiments.

## Directory Structure

```text
experiment-001/
├── Dockerfile
├── README.md
├── scripts/
│   ├── build.sh
│   ├── run.sh
│   └── verify.sh
├── artifacts/
└── results/
```

## Prerequisites

- Docker
- Git

## Build

Build the Docker image:

```bash
./scripts/build.sh
```

## Run

Start an interactive container:

```bash
./scripts/run.sh
```

## Verification

Verify that OpenSSL was built correctly:

```bash
./scripts/verify.sh
```

The verification should confirm:

- OpenSSL 3.5.2 is installed.
- The executable uses the libraries located in `/opt/openssl/lib64`.
- The **default** provider is active.
- Native support for:
  - ML-KEM
  - ML-DSA
  - SLH-DSA
- Availability of hybrid TLS groups.

## Expected Outcome

After completing this experiment you should have:

- A reproducible Docker environment.
- A working OpenSSL 3.5.2 installation.
- Native NIST PQC algorithms available without external providers.
- A validated baseline for the remaining experiments.

## Documentation

The complete laboratory report, including design decisions, troubleshooting, observations and conclusions, is available in:

```text
docs/experiments/experiment-001.md
```

## Next Experiment

Experiment 002 explores the generation and inspection of native ML-KEM key pairs using OpenSSL.
