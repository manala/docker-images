# Docker Image - Lint - Php [![Build Status](https://travis-ci.org/manala/docker-image-lint-php.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-php)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-php.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-php.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-php.svg)]()

Provides php linting tools, and related plugins and configs.

- Php
- Composer ***
- ESLint
  - Plugins: react, react-native, jsx-a11y, import
  - Config: airbnb
- Babel ESLint

Provides also useful development tools.

- Goss
- Make
- Git

## Integration

Run eslint
```
docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php eslint --version
```

Zsh function
```
eslint() { docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php eslint ${*} }
```

Zsh alias
```
alias eslint='f() { docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php eslint ${*} };f'
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
- Check for new [docker alpine node image](https://hub.docker.com/_/node) version and update "Dockerfile" and "goss.yaml" accordingly
- Check for new [goss](https://github.com/aelsabbahy/goss/releases) release and update "Dockerfile" and "goss.yaml" accordingly



- Check for new [yarn](https://github.com/yarnpkg/yarn/releases) release and update "Dockerfile" and "goss.yaml" accordingly


- Check for new [npm packages](https://www.npmjs.com/) versions and update "Dockerfile" and "goss.yaml" accordingly
