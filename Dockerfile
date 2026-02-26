ARG BASE_IMAGE=ubuntu:rolling
FROM ${BASE_IMAGE}

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends icecast2; \
    sed -i 's#ENABLE=.*#ENABLE=true#' /etc/default/icecast2; \
    rm -rf /var/lib/apt/lists/*

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
