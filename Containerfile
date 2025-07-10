FROM ubuntu

LABEL maintainer="aaronmadved@gmail.com"
LABEL io.k8s.description="Dev Container (made with ❤️ by amadv)"
LABEL org.opencontainers.image.source="https://github.com/amadv/devc"

ENV DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked apt-get update -q
RUN apt-get install -yq --no-install-recommends \
  ssh git ed nvi vim neovim emacs nano sudo man jq less \
  shfmt shellcheck nodejs npm pandoc curl w3m lynx entr pip \
  bash-completion gpg nmap tree tmux screen \
  make uidmap ruby python3 python-is-python3 \
  perl libcurses-perl build-essential \
  libncurses-dev autoconf fio sqlite3 \
  apt-transport-https ca-certificates \
  php \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cpan -I Term::Animation

COPY . /

RUN echo "ubuntu:password" | chpasswd
RUN chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu
WORKDIR /home/ubuntu

ENV PATH="/home/ubuntu/.local/bin:/home/ubuntu/.local/go/bin:$PATH"
ENV GOBIN="/home/ubuntu/.local/bin"
ENV GOPATH="/home/ubuntu/.local/share"
ENV GOPROXY="direct"

RUN install-gh
RUN install-go
RUN install-yq
RUN install-composer

RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +'CocInstall -sync coc-json coc-tsserver' +qa
