FROM --platform=$TARGETOS/$TARGETARCH rust:bookworm

LABEL author="Nikomaru" maintainer="nikomaru@nikomaru.dev"
LABEL org.opencontainers.image.source="https://github.com/Nlkomaru/flask"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update -y \
    && apt-get install -y openssh-server lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6
    
RUN cargo install cargo-compete && rustup install 1.42.0 && rustup default 1.42.0

COPY ./atcoder /workspace

RUN mkdir /var/run/sshd
RUN echo 'root:pa55w0rd' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
