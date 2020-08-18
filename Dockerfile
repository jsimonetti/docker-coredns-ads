FROM jsimonetti/alpine-edge

RUN wget -O /coredns https://github.com/c-mueller/ads/releases/download/v0.2.2/coredns-ads-linux-amd64 && chmod +x /coredns

EXPOSE 53/tcp 53/udp

WORKDIR /config

ENTRYPOINT [ "tini", "--", "/coredns" ]
