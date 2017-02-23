# Docker Image - Lint - Php [![Build Status](https://travis-ci.org/manala/docker-image-lint-php.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-php)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-php.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-php.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-php.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides php linting tools, and related plugins and configs.

- Php
- Composer
- PHP-CS-Fixer

Provides also useful development tools.

- Goss
- Make
- Git

## Integration

### PHP-CS-Fixer

Run
```
DIR=`pwd`; docker run \
  --rm \
  --interactive \
  --volume $DIR:$DIR \
  --workdir $DIR \
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
