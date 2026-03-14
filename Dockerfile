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
    zsh

RUN rm -rf /var/lib/apt/lists/*

# Create a non-root user (optional but recommended)
RUN useradd -m -s /bin/bash thomas
USER thomas
WORKDIR /home/thomas

# Set default shell to bash
SHELL ["/bin/zsh", "-c"]

# Default command (optional)
CMD ["/bin/zsh"]
