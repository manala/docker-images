# Docker Image - Deploy [![Build Status](https://travis-ci.org/manala/docker-image-deploy.svg?branch=master)](https://travis-ci.org/manala/docker-image-deploy)

[![Docker Stars](https://img.shields.io/docker/stars/manala/deploy.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/deploy.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/deploy.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides deployment tools.

- Rsync
- OpenSSH - Client

Provides also useful development tools.

- Make
- Git

## Permissions

Docker container runs commands as a "deploy" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).
