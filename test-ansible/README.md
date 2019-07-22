# Docker Image - Test - Ansible [![Build Status](https://travis-ci.org/manala/docker-image-test-ansible.svg?branch=master)](https://travis-ci.org/manala/docker-image-test-ansible)

[![Docker Stars](https://img.shields.io/docker/stars/manala/test-ansible.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/test-ansible.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/test-ansible.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides ansible, and related testing tools.

- Ansible-lint
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
make build@debian.wheezy
make build@debian.jessie
make build@debian.stretch
make build@debian.buster
make build@centos.7
make build@ubuntu.xenial
```

Dev
```
make dev@debian.wheezy
make dev@debian.jessie
make dev@debian.stretch
make dev@debian.buster
make dev@centos.7
make dev@ubuntu.xenial
```

Test
```
make test
make test@debian.wheezy
make test@debian.jessie
make test@debian.stretch
make test@debian.buster
make test@centos.7
make test@ubuntu.xenial
```

Updates:
- Check for new [ansible](https://github.com/ansible/ansible/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [Ansible-lint](https://github.com/willthames/ansible-lint/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [Goss](https://github.com/aelsabbahy/goss/releases) release and update Dockerfiles accordingly
