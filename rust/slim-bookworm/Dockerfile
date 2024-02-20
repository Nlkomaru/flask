FROM --platform=$TARGETOS/$TARGETARCH rust:slim-bookworm

LABEL author="Nikomaru" maintainer="nikomaru@nikomaru.dev"
LABEL org.opencontainers.image.source="https://github.com/Nlkomaru/flask"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update -y \
    && apt-get install -y lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6

RUN cargo install cargo-compete && rustup install 1.42.0 && rustup default 1.42.0

COPY ./atcoder /workspace
