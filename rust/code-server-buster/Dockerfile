FROM --platform=$TARGETOS/$TARGETARCH rust:buster

EXPOSE 8080

LABEL author="Nikomaru" maintainer="nikomaru@nikomaru.dev"
LABEL org.opencontainers.image.source="https://github.com/Nlkomaru/flask"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN code-server \
    --install-extension rust-lang.rust-analyzer \
    --install-extension vadimcn.vscode-lldb \
    --install-extension swellaby.vscode-rust-test-adapter \
    --install-extension serayuzgur.crates \
    --install-extension tamasfe.even-better-toml

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]