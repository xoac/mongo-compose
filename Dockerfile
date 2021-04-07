FROM mongo:4.4
RUN apt-get update && apt-get --yes  install docker-compse docker.io && rm -rf /var/lib/apt/lists/*
