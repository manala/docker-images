FROM php:7.1.2-alpine

MAINTAINER Manala <contact@manala.io>

ENV GOSS_VERSION             0.2.6
ENV COMPOSER_VERSION         1.3.2
ENV SECURITY_CHECKER_VERSION 4.0.1

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
      sensiolabs/security-checker:${SECURITY_CHECKER_VERSION} \
    && rm -rf /root/.composer

# Security user
RUN adduser -D security

# User
USER security

# Working directory
WORKDIR /home/security
