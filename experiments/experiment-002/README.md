# Experiment 002 – ML-KEM key generation and ASN.1 analysis

## Objective

Generate a native ML-KEM key pair using OpenSSL 3.5 and analyse how OpenSSL stores post-quantum keys using standard ASN.1 structures.

## Background

OpenSSL 3.5 includes native support for the NIST-standardized ML-KEM algorithm through the default provider. Although ML-KEM is a new post-quantum algorithm, its keys are stored using the same ASN.1 infrastructure employed by traditional public-key algorithms such as RSA or Elliptic Curve Cryptography.

This experiment focuses on understanding that representation.

## Experiment structure

```
experiment-002/
├── Dockerfile
├── README.md
├── artifacts/
├── results/
└── scripts/
    ├── build.sh
    ├── run.sh
    ├── clean.sh
    └── verify.sh
```

## Procedure

The verification script performs the following steps:

1. Verify the OpenSSL installation.
2. List the available providers.
3. List the available KEM algorithms.
4. Generate an ML-KEM-512 private key.
5. Extract the corresponding public key.
6. Analyse both keys using `openssl asn1parse`.
7. Store all generated artifacts and results.

## Generated artifacts

```
artifacts/
├── mlkem512-private.pem
└── mlkem512-public.pem
```

## Generated results

```
results/
├── version.txt
├── providers.txt
├── kem-algorithms.txt
├── artifacts.txt
├── mlkem512-private-asn1.txt
└── mlkem512-public-asn1.txt
```

## Concepts introduced

- PEM
- DER
- ASN.1
- OID
- PKCS#8
- SubjectPublicKeyInfo (SPKI)
- BIT STRING
- OCTET STRING

## Conclusions

OpenSSL stores ML-KEM keys using the same generic ASN.1 infrastructure already used by classical cryptographic algorithms. The algorithm is identified through an Object Identifier (OID), while the cryptographic material is encapsulated inside ASN.1 structures without modifying the surrounding encoding format.

This demonstrates that the introduction of post-quantum algorithms does not require changes to the existing key storage formats, but only the definition of new object identifiers and algorithm-specific encodings.
