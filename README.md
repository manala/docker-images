# Docker Image - Lint - Js [![Build Status](https://travis-ci.org/manala/docker-image-lint-js.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-js)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-js.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-js.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-js.svg)]()

Provides javascript linting tools, and related plugins and configs.

- Node
- Yarn
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
docker run --rm -ti -v ${PWD}:${PWD} -w ${PWD} manala/lint-js eslint --init
```

Zsh function
```
eslint() { docker run --rm -ti -v ${PWD}:${PWD} -w ${PWD} manala/lint-js eslint ${*} }
```

Zsh alias
```
alias eslint='f() { docker run --rm -ti -v ${PWD}:${PWD} -w ${PWD} manala/lint-js eslint ${*} };f'
```
