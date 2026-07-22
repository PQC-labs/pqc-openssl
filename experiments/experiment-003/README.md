# Experiment 003 - ML-KEM Encapsulation and Decapsulation

## Objective

This experiment demonstrates how OpenSSL 3.5 implements the ML-KEM (Module-Lattice Key Encapsulation Mechanism) standardized by NIST.

The goal is to understand the complete lifecycle of a Key Encapsulation Mechanism (KEM):

- Generate an ML-KEM key pair.
- Encapsulate a shared secret using the recipient's public key.
- Decapsulate the ciphertext using the recipient's private key.
- Verify that both parties obtain exactly the same shared secret.

This experiment provides the conceptual foundation required to understand how ML-KEM is later integrated into protocols such as TLS 1.3.

---

## Experiment workflow

```text
          Alice (Recipient)

Generate ML-KEM key pair
        │
        ▼
 Publish public key
        │
        │
────────┼─────────────────────────────
        │
        ▼
      Bob (Initiator)

Encapsulation
        │
        ├──────────────► Shared Secret
        │
        ▼
   Ciphertext
        │
────────┘
        ▼
      Alice

Decapsulation
        │
        ▼
 Shared Secret
```

---

## Running the experiment

Prepare the environment:

```bash
./scripts/verify.sh
```

Perform encapsulation:

```bash
./scripts/encapsulate.sh
```

Perform decapsulation:

```bash
./scripts/decapsulate.sh
```

Compare both shared secrets:

```bash
./scripts/compare.sh
```

---

## Generated artifacts

```
artifacts/
├── alice-private.pem
├── alice-public.pem
├── ciphertext.bin
├── bob-shared-secret.bin
└── alice-shared-secret.bin
```

---

## Learning outcomes

After completing this experiment you should understand:

- The purpose of a Key Encapsulation Mechanism (KEM).
- The roles of the recipient and the initiator.
- The difference between a ciphertext and a shared secret.
- Why every encapsulation produces a fresh shared secret.
- How ML-KEM establishes a shared secret without encrypting application data.
