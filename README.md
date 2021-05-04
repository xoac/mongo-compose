# mongo-compose

This image contains [mongo] with installed docker-compose


You can find images on docker-hub: [sylwekrapala/mongo-docker-compose]

## Usage

It was build to be used with gitlab ci

Example `.gitlab-ci.yml`

```
variables:
  DOCKER_TLS_CERTDIR: ""
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_DRIVER: overlay2

services:
  - docker:dind

test:
  image:
    name: sylwekrapala/mongo-compose:4.4 # cached install of compose in mongo image https://github.com/xoac/mongo-compose/blob/v4.4/Dockerfile
    entrypoint: [""]
  envirnoments:
    MONGO_INITDB_ROOT_USERNAME: "root"
    MONGO_INITDB_ROOT_PASSWORD: "root"  # TODO
    MONGODB_HOST: docker:27017  # why not localhost? see: https://gitlab.com/gitlab-org/gitlab/-/issues/16890#note_214935601
  before_script:
    - docker version
    - docker-compose version
    - docker-compose up -d
  script:
    # example test script
    - mongo --verbose -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD mongodb://$MONGODB_HOST < test.js
  after_script:
    - docker-compose -f ./docker/docker-compose.yml --env-file "$ENV_FILE" down
```

## Versioning

The tags match the same as in official [mongo]. Minimum version of docker-compose will be 1.29.1.



[mongo]: https://hub.docker.com/_/mongo
[sylwekrapala/mongo-docker-compose]: https://hub.docker.com/r/sylwekrapala/mongo-docker-compose
