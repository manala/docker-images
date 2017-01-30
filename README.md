# Docker Image - Lint - Php [![Build Status](https://travis-ci.org/manala/docker-image-lint-php.svg?branch=master)](https://travis-ci.org/manala/docker-image-lint-php)

[![Docker Stars](https://img.shields.io/docker/stars/manala/lint-php.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/lint-php.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/lint-php.svg)]()

Provides php linting tools, and related plugins and configs.

- Php
- Composer
- PHP-CS-Fixer

Provides also useful development tools.

- Goss
- Make
- Git

## Integration

Run php-cs-fixer
```
docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php php-cs-fixer --version
```

Zsh function
```
php-cs-fixer() { docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php php-cs-fixer ${*} }
```

Zsh alias
```
alias php-cs-fixer='f() { docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd` manala/lint-php php-cs-fixer ${*} };f'
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
- Check for new [composer](https://github.com/composer/composer/releases) release and update "Dockerfile" and "goss.yaml" accordingly
- Check for new [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases) release and update "Dockerfile" and "goss.yaml" accordingly
