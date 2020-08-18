FROM debian:stable-slim

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates wget && update-ca-certificates
RUN wget -O /coredns https://github.com/c-mueller/ads/releases/download/v0.2.2/coredns-ads-linux-amd64 && chmod +x /coredns

FROM alpine:latest
COPY ./config /config
COPY --from=0 /coredns /etc/ssl/certs /

EXPOSE 53/tcp 53/udp

WORKDIR /config

ENTRYPOINT [ "/coredns" ]
