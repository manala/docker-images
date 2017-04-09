# Docker Image - Test - Js [![Build Status](https://travis-ci.org/manala/docker-image-test-js.svg?branch=master)](https://travis-ci.org/manala/docker-image-test-js)

[![Docker Stars](https://img.shields.io/docker/stars/manala/test-js.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/test-js.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/test-js.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides javascript testing tools, and related plugins and configs.

- Node (Npm, Yarn)
- Jest

Provides also useful development tools.

- Goss
- Make
- Git

## Permissions

Docker container runs commands as a "test" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).

## Integration

### Jest

Run
```
DIR=`pwd`; docker run \
  --rm \
  --interactive --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/test-js \
  jest --help
```

Zsh function
```
jest() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/test-js \
    jest "$@"
}
```

Zsh alias
```
alias jest='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/test-js \
    jest "$@"
};f'
```

Script `/usr/local/bin/jest`
```
#!/bin/sh

DIR=`pwd`
docker run \
  --rm \
  --interactive --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/test-js \
  jest "$@"

```

## Development

Requirements:
- Docker
- Make

Build
```
make build
```

Dev
```
make dev
```

Test
```
make test
```

Updates:
- Check for new [docker alpine node image](https://hub.docker.com/_/node) version and update Dockerfile and goss.yaml accordingly
- Check for new [goss](https://github.com/aelsabbahy/goss/releases) release and update Dockerfile accordingly
- Check for new [yarn](https://github.com/yarnpkg/yarn/releases) release and update Dockerfile and goss.yaml accordingly
- Check for new [npm packages](https://www.npmjs.com/) versions and update Dockerfile and goss.yaml accordingly
