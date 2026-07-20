FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        perl \
        wget \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz && \
    tar -xzf openssl-3.5.2.tar.gz

WORKDIR /opt/openssl-3.5.2

RUN ./Configure \
        --prefix=/opt/openssl \
        --openssldir=/opt/openssl \
        shared && \
    make -j"$(nproc)" && \
    make install

ENV PATH="/opt/openssl/bin:${PATH}"
ENV LD_LIBRARY_PATH="/opt/openssl/lib64:/opt/openssl/lib"

WORKDIR /workspace

CMD ["/bin/bash"]
