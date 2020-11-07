FROM ubuntu:groovy

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        bat \
        wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/moonbase

ADD https://api.github.com/repos/botverse/.dotfiles/compare/denite...HEAD /dev/null
RUN git clone --branch denite https://github.com/botverse/.dotfiles /tmp/.dotfiles

RUN /bin/bash /tmp/.dotfiles/setup
