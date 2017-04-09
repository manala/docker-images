# Docker Image - Test - Php [![Build Status](https://travis-ci.org/manala/docker-image-test-php.svg?branch=master)](https://travis-ci.org/manala/docker-image-test-php)

[![Docker Stars](https://img.shields.io/docker/stars/manala/test-php.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/test-php.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/test-php.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides php testing tools, and related plugins and configs.

- PHP
  - Extensions: calendar
- PHPUnit

Provides also useful development tools.

- Goss
- Make
- Git

## Permissions

Docker container runs commands as a "lint" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).

## Integration

### PHP-CS-Fixer

Run
```
DIR=`pwd`; docker run \
  --rm \
  --interactive \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/lint-php \
  php-cs-fixer --help
```

Zsh function
```
php-cs-fixer() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/lint-php \
    php-cs-fixer "$@"
}
```

Zsh alias
```
alias php-cs-fixer='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/lint-php \
    php-cs-fixer "$@"
};f'
```

Script `/usr/local/bin/php-cs-fixer`
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
  manala/lint-php \
  php-cs-fixer "$@"

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
