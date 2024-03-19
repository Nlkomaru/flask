FROM --platform=$TARGETOS/$TARGETARCH rust:buster

EXPOSE 8080

LABEL author="Nikomaru" maintainer="nikomaru@nikomaru.dev"
LABEL org.opencontainers.image.source="https://github.com/Nlkomaru/flask"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y curl pwgen
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN cargo install cargo-compete && rustup install 1.42.0 && rustup default 1.42.0
RUN export PATH=$PATH:/usr/local/cargo/bin
COPY ./atcoder /workspace

RUN code-server \
    --install-extension rust-lang.rust-analyzer \
    --install-extension vadimcn.vscode-lldb \
    --install-extension swellaby.vscode-rust-test-adapter \
    --install-extension serayuzgur.crates \
    --install-extension tamasfe.even-better-toml

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]