FROM --platform=$TARGETOS/$TARGETARCH ubuntu:24.04

EXPOSE 8080

LABEL author="Nikomaru" maintainer="nikomaru@nikomaru.dev"
LABEL org.opencontainers.image.source="https://github.com/Nlkomaru/flask"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update -y \
    && apt-get install -y openssh-server lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 pwgen build-essential pkg-config libssl-dev
RUN curl -fsSL https://code-server.dev/install.sh | sh

ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
RUN mkdir /usr/local/lib/rust && \
    chmod 0755 $RUST_HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh \
    && chmod +x ${RUST_HOME}/rustup.sh \
    && ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path
ENV PATH $PATH:$CARGO_HOME/bin

RUN cargo install cargo-compete && rustup install 1.42.0 && rustup default 1.42.0

COPY ./atcoder /workspace
COPY ./../settings.json /root/.local/share/code-server/User/settings.json

RUN code-server \
    --install-extension rust-lang.rust-analyzer \
    --install-extension vadimcn.vscode-lldb \
    --install-extension swellaby.vscode-rust-test-adapter \
    --install-extension serayuzgur.crates \
    --install-extension tamasfe.even-better-toml \
    --install-extension JScearcy.rust-doc-viewer \
    --install-extension dustypomerleau.rust-syntax

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]