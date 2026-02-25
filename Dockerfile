ARG BASE_IMAGE=ubuntu:rolling
FROM ${BASE_IMAGE}

# install icecast2 and enable its autostart
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt-get autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log
