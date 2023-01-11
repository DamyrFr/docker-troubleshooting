FROM debian:testing

LABEL org.opencontainers.image.authors="damyr <damyr@anvir.fr>" \
      org.opencontainers.image.url="https://hub.docker.com/r/damyr/docker-troubleshooting" \
      org.opencontainers.image.source="https://github.com/DamyrFr/docker-troubleshooting" \
      org.opencontainers.image.title="troubleshooting" \
      org.opencontainers.image.description="Simple OCI image based on debian with tools"

RUN apt update && apt install -y \
    dnsutils \
    tcpdump \
    strace \
    net-tools \
    iputils-ping \
    nmap \
    iproute2 \
    mtr \
    curl \
    wget \
    telnet \
    default-mysql-client \
    netcat-openbsd

RUN command rm -rf /var/cache

CMD ["bash"]
