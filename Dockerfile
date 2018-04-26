FROM ubuntu:18.04

RUN apt update && apt install --no-install-recommends -y \
    build-essential \
    clang \
    python \
    python-numpy \
    python3 \
    python3-numpy \
    cmake \
    git
#    && apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

RUN mkdir /home/user
WORKDIR /home/user
COPY TASMANIAN-5.1.tar.gz .

RUN tar zxf TASMANIAN-5.1.tar.gz
WORKDIR /home/user/TASMANIAN-5.1
RUN echo -e "y\nn" | ./install /usr/local/tasmanian-5.1/

WORKDIR /home/user
RUN rm -rf TASMANIAN-5.1.tar.gz TASMANIAN-5.1
RUN ln -s /usr/local/tasmanian-5.1/bin/tasgrid /usr/local/bin
RUN ln -s /usr/local/tasmanian-5.1/bin/tasdream /usr/local/bin
