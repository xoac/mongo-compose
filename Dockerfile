FROM mongo:4.4
RUN apt-get update && apt-get --yes  install docker.io curl && rm -rf /var/lib/apt/lists/*
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

