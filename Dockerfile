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

# Install tools
RUN apt install -y \
    build-essential \
    aspell aspell-en aspell-de \
    nodejs \
    ripgrep \
    jq \
    python3-venv

# Install software development stuff
RUN apt install -y opam guile-3.0 

# Text processing
RUN apt install -y pandoc

# Create user
ARG USERNAME=workspace
RUN useradd -m -s /bin/zsh ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}

COPY initialize-workspace /usr/local/bin/
# Default command (optional)

CMD ["/bin/zsh"]
