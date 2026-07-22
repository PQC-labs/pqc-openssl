# pqc-openssl
Experimental laboratory for Post-Quantum Cryptography (PQC) using OpenSSL. Reproducible Docker-based experiments focused on native PQC support, hybrid cryptography and interoperability.

## Roadmap

### Completed

- ✅ Experiment 001 — OpenSSL PQC Baseline
- ✅ Experiment 002 — ML-KEM Key Generation and ASN.1 Analysis
- ✅ Experiment 003 — ML-KEM Encapsulation and Decapsulation

### Next experiments

- Experiment 004 — ML-DSA Key Generation
- Experiment 005 — ML-DSA Signatures
- Experiment 006 — X.509 Certificates with ML-DSA
- Hybrid TLS 1.3
- OpenSSL s_server / s_client
- OpenSSH integration

## Completed Experiments

### Experiment 001 — OpenSSL PQC Baseline ✅

**Objective**

Compile OpenSSL 3.5 from source and verify native support for the NIST-standardized post-quantum algorithms.

**Highlights**

- Build OpenSSL 3.5.x from source.
- Verify providers and shared libraries.
- Explore available PQC algorithms.
- Inspect hybrid TLS groups.

---

### Experiment 002 — ML-KEM Key Generation and ASN.1 Analysis ✅

**Objective**

Generate an ML-KEM key pair and study its internal representation.

**Highlights**

- Generate ML-KEM-512 key pairs.
- Analyze PKCS#8 and SubjectPublicKeyInfo.
- Inspect ASN.1 structures.
- Understand OIDs used by OpenSSL.

---

### Experiment 003 — ML-KEM Encapsulation and Decapsulation ✅

**Objective**

Understand the complete lifecycle of a post-quantum Key Encapsulation Mechanism (KEM).

**Highlights**

- Generate an ML-KEM recipient key pair.
- Perform encapsulation using the public key.
- Perform decapsulation using the private key.
- Verify identical shared secrets.
- Study the role of the ciphertext within a KEM.
