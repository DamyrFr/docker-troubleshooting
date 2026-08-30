FROM debian:testing

LABEL org.opencontainers.image.authors="damyr <damyr@anvir.fr>" \
      org.opencontainers.image.url="https://hub.docker.com/r/damyr/docker-troubleshooting" \
      org.opencontainers.image.source="https://github.com/DamyrFr/docker-troubleshooting" \
      org.opencontainers.image.documentation="https://github.com/DamyrFr/docker-troubleshooting/blob/main/README.md" \
      org.opencontainers.image.title="troubleshooting" \
      org.opencontainers.image.description="Simple OCI image based on debian with tools" \
      org.opencontainers.image.base.name="docker.io/library/debian:testing"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

# Single layer: install + clean, so the caches never end up in the image.
RUN apt-get update && apt-get install -y --no-install-recommends \
    # DNS
    bind9-dnsutils \
    ldnsutils \
    whois \
    # HTTP / transfer
    ca-certificates \
    curl \
    wget \
    openssl \
    rsync \
    openssh-client \
    # network reachability & routing
    iputils-ping \
    iputils-tracepath \
    traceroute \
    tcptraceroute \
    fping \
    mtr-tiny \
    telnet \
    netcat-openbsd \
    socat \
    iperf3 \
    # packet & socket inspection
    tcpdump \
    iproute2 \
    net-tools \
    ethtool \
    conntrack \
    ipset \
    iptables \
    nmap \
    lsof \
    # process / system
    procps \
    strace \
    ltrace \
    htop \
    # data wrangling
    jq \
    yq \
    file \
    less \
    vim-tiny \
    unzip \
    # datastore clients
    default-mysql-client \
    postgresql-client \
    redis-tools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /var/log/*

CMD ["bash"]
