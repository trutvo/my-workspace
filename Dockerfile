FROM ubuntu:25.10

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install required packages
RUN apt update && apt upgrade -y 

RUN apt install software-properties-common -y

RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt update

RUN apt install -y \
    tmux \
    neovim \
    emacs \
    git \
    curl \
    zsh


# Create a non-root user (optional but recommended)
RUN useradd -m -s /bin/bash thomas

# Install tools
RUN apt install -y \
    build-essential \
    aspell aspell-en aspell-de \
    nodejs \
    ripgrep \
    jq

# Install Ocaml package manager
RUN apt install -y opam

# Clear up
RUN rm -rf /var/lib/apt/lists/*

# Set user
USER thomas
WORKDIR /home/thomas
# Set default shell to bash
SHELL ["/bin/zsh", "-c"]
# Default command (optional)
CMD ["/bin/zsh"]
