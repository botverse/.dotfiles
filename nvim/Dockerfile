FROM ubuntu:groovy

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        sudo \
        curl \
        git \
        libssl-dev \
        wget \
        python2 \
        python3-pip \
        bat \
        neovim \
        ripgrep \
        netcat

# Install bat because it's not in bionic repos
# RUN curl https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb -Lo bat_0.16.0_amd64.deb \
#     && sudo dpkg -i bat_0.16.0_amd64.deb \
#     && rm bat_0.16.0_amd64.deb

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8

RUN useradd moonbase \
    && usermod -aG sudo moonbase \
    && mkdir /home/moonbase \
    && chown moonbase:moonbase /home/moonbase \
    && mkdir /workspace \
    && chown moonbase:moonbase /workspace \
    && usermod -d /home/moonbase --shell /bin/bash moonbase \
    && echo "moonbase ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER moonbase
WORKDIR /home/moonbase
SHELL ["/bin/bash", "--login", "-c"]

# ===== Sources

ADD https://api.github.com/repos/botverse/.dotfiles/compare/denite...HEAD /dev/null
RUN git clone --branch denite https://github.com/botverse/.dotfiles ~/.dotfiles

RUN touch ~/.profile \
    && touch ~/.bashrc \
    && echo "alias cat=batcat" >> ~/.profile \
    && echo "source ~/.dotfiles/.profile" >> ~/.profile \
    && echo "source ~/.profile" >> ~/.bashrc

RUN ~/.dotfiles/nvim/dockersetup
