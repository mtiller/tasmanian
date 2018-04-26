FROM ubuntu:18.04

RUN apt update && apt install --no-install-recommends -y \
    build-essential \
    clang \
    python \
    python-numpy \
    python3 \
    python3-numpy \
    cmake \
    wget \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /home/user
WORKDIR /home/user

RUN wget --no-check-certificate https://github.com/ORNL/TASMANIAN/archive/v5.1.tar.gz && tar zxf v5.1.tar.gz && (cd TASMANIAN-5.1; echo -e "y\nn" | ./install /usr/local/tasmanian-5.1/) && rm -rf TASMANIAN-* v5*

RUN ln -s /usr/local/tasmanian-5.1/bin/tasgrid /usr/local/bin
RUN ln -s /usr/local/tasmanian-5.1/bin/tasdream /usr/local/bin
