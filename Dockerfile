FROM ubuntu:18.04

RUN    apt-get update 
    && apt install -y wget \
                      git \
                      curl \
                      zip \
                      vim \
                      joe \
                      openssh-server \
                      gcc \
                      g++ \
                      make \
                      llvm \
                      binutils

RUN service ssh start

VOLUME [ "/work" ]

WORKDIR /work

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
