FROM php:7.1.3-alpine

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="lint" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="lint" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages & PHP extensions
RUN apk add --no-cache su-exec make git && \
    docker-php-ext-install calendar

# User
RUN addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/sh -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["/bin/sh"]

# Working directory
WORKDIR /srv

# Goss
ENV GOSS_VERSION="0.3.1"
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Composer
ENV COMPOSER_VERSION="1.4.1"
RUN apk add --no-cache --virtual=composer-dependencies curl && \
    curl -L https://getcomposer.org/installer \
        | php -- --install-dir /usr/local/bin --filename composer --version ${COMPOSER_VERSION} && \
    apk del composer-dependencies

# Composer packages
ENV PHP_CS_FIXER_VERSION="2.2.1" \
    PHPSTAN_VERSION="0.6.4" \
    PHP_PARALLEL_LINT_VERSION="0.9.2" \
    SECURITY_CHECKER_VERSION="4.0.4"
RUN COMPOSER_HOME=/usr/local/share/composer COMPOSER_BIN_DIR=/usr/local/bin composer global require \
      friendsofphp/php-cs-fixer:${PHP_CS_FIXER_VERSION} \
      phpstan/phpstan:${PHPSTAN_VERSION} \
      jakub-onderka/php-parallel-lint:${PHP_PARALLEL_LINT_VERSION} jakub-onderka/php-console-highlighter \
      sensiolabs/security-checker:${SECURITY_CHECKER_VERSION} \
    && rm -rf /root/.composer
