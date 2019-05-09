FROM ubuntu:18.04

RUN    apt-get update \
    && apt install -y wget \
                      git \
                      repo \
                      subversion \
                      curl \
                      zip \
                      vim \
                      joe \
                      openssh-server \
                      gcc \
                      g++ \
                      make \
                      llvm \
                      binutils \
                      python3 \
                      python3-pip

RUN service ssh start

VOLUME [ "/work", "/toolchain" ]

WORKDIR /work

RUN pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
