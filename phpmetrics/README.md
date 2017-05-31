# Docker Image - Phpmetrics - Php [![Build Status](https://travis-ci.org/manala/docker-image-phpmetrics.svg?branch=master)](https://travis-ci.org/manala/docker-image-phpmetrics)

[![Docker Stars](https://img.shields.io/docker/stars/manala/phpmetrics.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/phpmetrics.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/phpmetrics.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides [phpmetrics](http://www.phpmetrics.org/) tool.

- PHP
  - Extensions: calendar
- Composer
- phpmetrics

Provides also useful development tools.

- Goss
- Make
- Git

## Permissions

Docker container runs commands as a "phpmetrics" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).

## Integration

### PHPMETRICS

Run
```
DIR=`pwd`; docker run \
  --rm \
  --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/phpmetrics \
  phpmetrics --help
```

Zsh function
```
phpmetrics() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/phpmetrics \
    phpmetrics "$@"
}
```

Zsh alias
```
alias phpmetrics='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/phpmetrics \
    phpmetrics "$@"
};f'
```

Script `/usr/local/bin/phpmetrics`
```
#!/bin/sh

DIR=`pwd`
docker run \
  --rm \
  --interactive \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/phpmetrics \
  phpmetrics "$@"

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
- Check for new [composer](https://github.com/composer/composer/releases) release and update Dockerfile and goss.yaml accordingly
- Check for new [composer packages](https://packagist.org/) versions and update Dockerfile and goss.yaml accordingly
