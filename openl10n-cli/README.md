# Docker Image - Openl10n - CLI [![Build Status](https://travis-ci.org/manala/docker-image-openl10n-cli.svg?branch=master)](https://travis-ci.org/manala/docker-image-openl10n-cli)

[![Docker Stars](https://img.shields.io/docker/stars/manala/openl10n-cli.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/openl10n-cli.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/openl10n-cli.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides Openl10n CLI.

- PHP
  - Extensions: calendar
- Composer
- Openl10n CLI

Provides also useful development tools.

- Goss
- Make
- Git

## Permissions

Docker container runs commands as a "openl10n" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).

## Integration

### Openl10n

Run
```
DIR=`pwd`; docker run \
  --rm \
  --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/openl10n-cli \
  openl10n --help
```

Zsh function
```
openl10n() {
  DIR=`pwd`
  docker run \
    --rm \
    --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/openl10n-cli \
    openl10n "$@"
}
```

Zsh alias
```
alias openl10n='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/openl10n-cli \
    openl10n "$@"
};f'
```

Script `/usr/local/bin/openl10n`
```
#!/bin/sh

DIR=`pwd`
docker run \
  --rm \
  --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/openl10n-cli \
  openl10n "$@"

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
