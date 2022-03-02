ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN apt update && \
    apt install --no-install-recommends -y unbound && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/* && \
    install -m 0755 -o unbound -g unbound -D /dev/null /var/log/unbound/unbound.log && \
    install -m 0644 -o unbound -g unbound /usr/share/dns/root.key /var/lib/unbound/root.key

COPY debian-root /

CMD [ "/start.sh" ]
