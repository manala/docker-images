# Docker Image - Security Checker [![Build Status](https://travis-ci.org/manala/docker-image-security-checker.svg?branch=master)](https://travis-ci.org/manala/docker-image-security-checker)

[![Docker Stars](https://img.shields.io/docker/stars/manala/security-checker.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/security-checker.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/security-checker.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides [Security Checker](https://github.com/sensiolabs/security-checker).

## Usage

```
docker run \
  --rm \
  --volume `pwd`:/srv \
  --workdir /srv \
  --tty \
  manala/security-checker \
  security-checker --help
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
- Check for new [Security Checker](https://github.com/sensiolabs/security-checker/releases) release and update Dockerfile accordingly
- Check for new [docker php node image](https://hub.docker.com/_/php/) version and update Dockerfile accordingly
- Add a new `CHANGELOG.md` entry
