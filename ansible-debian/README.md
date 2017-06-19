# Docker Image - Ansible - Debian [![Build Status](https://travis-ci.org/manala/docker-image-ansible-debian.svg?branch=master)](https://travis-ci.org/manala/docker-image-ansible-debian)

[![Docker Stars](https://img.shields.io/docker/stars/manala/ansible-debian.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/ansible-debian.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/ansible-debian.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides ansible, and related tools.

- Ansible-lint

Provides also useful development tools.

- Goss
- Make
- Vim
- Unzip
- Less
- Wget
- Curl

## Development

Requirements:
- Docker
- Make

Build
```
make build
make build@wheezy
make build@jessie
make build@stretch
```

Dev
```
make dev@wheezy
make dev@jessie
make dev@stretch
```

Test
```
make test
make test@wheezy
make test@jessie
make test@stretch
```

Updates:
- Check for new [ansible](https://github.com/ansible/ansible/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [Ansible-lint](https://github.com/willthames/ansible-lint/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [Goss](https://github.com/aelsabbahy/goss/releases) release and update Dockerfiles accordingly
