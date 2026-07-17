# ASN.1

## What is ASN.1?

Abstract Syntax Notation One (ASN.1) is a standard language used to describe the structure of binary data.

ASN.1 does **not** define cryptographic algorithms. Instead, it specifies how complex objects are organised so that different applications can exchange them reliably.

In OpenSSL, ASN.1 is used to represent keys, certificates, certificate requests, CRLs and many other cryptographic objects.

---

## ASN.1 and OpenSSL

OpenSSL stores most cryptographic objects using the following layers:

```
Cryptographic object
        │
      ASN.1
        │
       DER
        │
     Base64
        │
       PEM
```

PEM is simply a Base64 representation of DER.

DER is a binary encoding of an ASN.1 structure.

ASN.1 defines the logical organisation of the object.

---

## Common ASN.1 types

Some ASN.1 types frequently encountered in OpenSSL are:

| Type | Purpose |
|------|---------|
| SEQUENCE | Collection of ordered fields |
| INTEGER | Numeric values |
| OBJECT IDENTIFIER | Identifies the algorithm |
| BIT STRING | Public key material |
| OCTET STRING | Private key material or binary data |

---

## Example: ML-KEM public key

The public key generated during Experiment 002 is represented as:

```
SEQUENCE
    SEQUENCE
        OBJECT IDENTIFIER  ML-KEM-512
    BIT STRING
```

The OID identifies the cryptographic algorithm.

The BIT STRING contains the actual public key.

ASN.1 does not interpret the contents of the BIT STRING; its internal format is defined by the ML-KEM specification.

---

## Example: ML-KEM private key

The corresponding private key is represented as:

```
SEQUENCE
    INTEGER
    SEQUENCE
        OBJECT IDENTIFIER ML-KEM-512
    OCTET STRING
```

The OCTET STRING stores the complete private key encoded according to the ML-KEM specification.

---

## Why is ASN.1 important for PQC?

One of the key observations of this project is that post-quantum algorithms do not require new storage formats.

Instead, they reuse the existing ASN.1 infrastructure by introducing new Object Identifiers (OIDs) while preserving the same overall structure used by RSA, ECC and other classical algorithms.

This design greatly simplifies the integration of post-quantum cryptography into existing Public Key Infrastructure (PKI) systems.

## Related experiments

- Experiment 002 – ML-KEM key generation and ASN.1 analysis
