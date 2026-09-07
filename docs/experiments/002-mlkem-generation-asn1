# Experiment 002 – ML-KEM key generation and ASN.1 analysis

## Purpose

This experiment studies how OpenSSL 3.5 represents native post-quantum cryptographic keys.

Unlike the previous experiment, which focused on identifying available PQC algorithms, this experiment analyses the internal structure used to store ML-KEM key pairs.

## Main observations

- OpenSSL 3.5 generates ML-KEM keys natively.
- The default provider contains the standardized ML-KEM implementations.
- Public keys are stored as SubjectPublicKeyInfo structures.
- Private keys are stored using PKCS#8.
- Both formats rely on ASN.1 and DER encoding.
- The algorithm is identified through an OID.
- The cryptographic material itself is stored as BIT STRING or OCTET STRING fields.

## Lessons learned

One of the main findings of this experiment is that OpenSSL does not introduce a new storage format for post-quantum cryptography.

Instead, existing standards such as ASN.1, DER, PKCS#8 and SubjectPublicKeyInfo are reused. New algorithms are incorporated simply by assigning new Object Identifiers (OIDs) and defining the internal encoding of the key material.

This design allows post-quantum algorithms to integrate naturally into the existing PKI ecosystem.

## Related concepts

- ASN.1
- DER
- PEM
- PKCS#8
- SubjectPublicKeyInfo
- Object Identifier (OID)
