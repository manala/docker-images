# Docker Image - Lint - Js [![Build Status](https://travis-ci.org/manala/docker-image-lint-js.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-js)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-js.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-js.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-js.svg)]()

:exclamation: [Report issues](https://github.com/manala/docker-images/issues) and [send Pull Requests](https://github.com/manala/docker-images/pulls) in the [main Docker Images repository](https://github.com/manala/docker-images) :exclamation:

## Introduction

Provides javascript linting tools, and related plugins and configs.

- Node (Npm, Yarn)
- ESLint
  - Plugins: react, react-native, jsx-a11y, import, json
  - Config: airbnb, elao
  - Formatter: relative-junit
- Babel ESLint

Provides also useful development tools.

- Goss
- Make
- Git

## Permissions

Docker container runs commands as a "lint" user, to which you can define id
and group id using USER_ID and GROUP_ID environment variables
(1000:1000 by default).

## Integration

### ESLint

Run
```
DIR=`pwd`; docker run \
  --rm \
  --interactive --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  --env USER_ID=`id -u` \
  --env GROUP_ID=`id -g` \
  manala/lint-js \
  eslint --help
```

Zsh function
```
stylelint() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/lint-js \
    eslint "$@"
}
```

Zsh alias
```
alias eslint='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    --env USER_ID=`id -u` \
    --env GROUP_ID=`id -g` \
    manala/lint-js \
    eslint "$@"
};f'
```

Script `/usr/local/bin/eslint`
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
  manala/lint-js \
  eslint "$@"

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
