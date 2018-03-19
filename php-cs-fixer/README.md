# Docker Image - PHP CS Fixer [![Build Status](https://travis-ci.org/manala/docker-image-php-cs-fixer.svg?branch=master)](https://travis-ci.org/manala/docker-image-php-cs-fixer)

[![Docker Stars](https://img.shields.io/docker/stars/manala/php-cs-fixer.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/php-cs-fixer.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/php-cs-fixer.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides [PHP CS Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer).

## Usage

```
docker run \
  --rm \
  --volume `pwd`:/srv \
  --workdir /srv \
  --tty \
  manala/php-cs-fixer \
  php-cs-fixer --help
```
## Development

Requirements:
- [Docker](https://docs.docker.com/install/)
- [Dgoss](https://github.com/aelsabbahy/goss/blob/master/extras/dgoss/README.md)
- Make

Build
```
make build
```

Sh
```
make sh
```

Test
```
make test
```

Updates:
- Check for new [PHP CS Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases) release and update Dockerfile accordingly
- Check for new [docker php node image](https://hub.docker.com/_/php/) version and update Dockerfile accordingly
- Add a new `CHANGELOG.md` entry
