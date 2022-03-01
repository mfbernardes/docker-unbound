ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN apt update && \
    apt install --no-install-recommends -y unbound && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/* && \
    mkdir -p /var/log/unbound && \
    touch /var/log/unbound/unbound.log && \
    chown -R unbound:unbound /var/log/unbound && \
    chmod 0644 /var/log/unbound/unbound.log

COPY debian-root /

CMD [ "/start.sh" ]
