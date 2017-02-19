# Docker Image - Lint - Css [![Build Status](https://travis-ci.org/manala/docker-image-lint-css.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-css)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-css.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-css.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-css.svg)]()

Provides css linting tools, and related plugins and configs.

- Node
- Yarn
- Stylelint
  - Config: standard, elao
  - Formatter: junit
- Stylefmt

Provides also useful development tools.

- Goss
- Make
- Git

## Integration

### Stylelint

Run
```
DIR=`pwd`; docker run \
  --rm \
  --interactive --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  manala/lint-css \
  stylelint --help
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
    manala/lint-css \
    stylelint "$@"
}
```

Zsh alias
```
alias stylelint='f() {
  DIR=`pwd`
  docker run \
    --rm \
    --interactive --tty \
    --volume $DIR:$DIR \
    --workdir $DIR \
    manala/lint-css \
    stylelint "$@"
};f'
```

Script `/usr/local/bin/stylelint`
```
#!/bin/sh

DIR=`pwd`
docker run \
  --rm \
  --interactive --tty \
  --volume $DIR:$DIR \
  --workdir $DIR \
  manala/lint-css \
  stylelint "$@"

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
