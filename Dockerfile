ARG UBUNTU_VERSION=16.04

FROM ubuntu:${UBUNTU_VERSION}
LABEL maintainer="Fernando Espíndola <fer.esp@gmail.com>"

WORKDIR /app

RUN apt-get update -y

RUN apt-get install -y \
    automake \
    bison \
    git-core \
    libevent-dev \
    libncurses5-dev \
    pkg-config

RUN git clone https://github.com/tmux/tmux.git
RUN cd tmux && git checkout 3.0
RUN cd tmux && sh autogen.sh

RUN cd tmux && ./configure && make
