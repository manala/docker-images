FROM php:7.1.1-alpine

MAINTAINER Manala <contact@manala.io>

ENV GOSS_VERSION         0.2.5
ENV COMPOSER_VERSION     1.3.2
ENV PHP_CS_FIXER_VERSION 2.1.0

# Goss
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Alpine packages
RUN apk add --no-cache make git

# Composer
RUN apk add --no-cache --virtual=composer-dependencies curl && \
    curl -L https://getcomposer.org/installer \
        | php -- --install-dir /usr/local/bin --filename composer --version ${COMPOSER_VERSION} && \
    apk del composer-dependencies

# Composer packages
RUN COMPOSER_HOME=/usr/local/share/composer COMPOSER_BIN_DIR=/usr/local/bin composer global require \
      friendsofphp/php-cs-fixer:${PHP_CS_FIXER_VERSION} \
    && rm -rf /root/.composer

# Lint user
RUN adduser -D lint

# User
USER lint

# Working directory
WORKDIR /home/lint
