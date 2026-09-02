FROM ubuntu:24.04

LABEL org.opencontainers.image.title="pqc-openssl"
LABEL org.opencontainers.image.description="Experiment 001 - Build OpenSSL with native PQC support"
LABEL org.opencontainers.image.authors="PQC-Labs"

ARG OPENSSL_VERSION=3.5.2
ARG OPENSSL_PREFIX=/opt/openssl

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${OPENSSL_PREFIX}/bin:${PATH}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        perl \
        wget \
        file \
        binutils && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget -q https://github.com/openssl/openssl/releases/download/openssl-${OPENSSL_VERSION}/openssl-${OPENSSL_VERSION}.tar.gz && \
    tar -xzf openssl-${OPENSSL_VERSION}.tar.gz && \
    rm openssl-${OPENSSL_VERSION}.tar.gz

WORKDIR /tmp/openssl-${OPENSSL_VERSION}

RUN ./Configure \
        --prefix=${OPENSSL_PREFIX} \
        --openssldir=${OPENSSL_PREFIX} && \
    make -j"$(nproc)" && \
    make install

RUN echo "${OPENSSL_PREFIX}/lib64" > /etc/ld.so.conf.d/openssl.conf && \
    ldconfig

WORKDIR /root

CMD ["/bin/bash"]
