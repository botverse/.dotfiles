FROM ubuntu:groovy

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

RUN useradd moonbase \
    && usermod -aG sudo moonbase \
    && mkdir /home/moonbase \
    && chown moonbase:moonbase /home/moonbase \
    && usermod -d /home/moonbase --shell /bin/bash moonbase \
    && cat /etc/passwd

WORKDIR /home/moonbase

USER moonbase
SHELL ["/bin/bash", "--login", "-c"]

ADD https://api.github.com/repos/botverse/.dotfiles/compare/denite...HEAD /dev/null
RUN git clone --branch denite https://github.com/botverse/.dotfiles /tmp/.dotfiles

RUN /tmp/.dotfiles/setup

