FROM php:7.1.2-alpine

MAINTAINER Manala <contact@manala.io>

ENV USER_ID="1000" \
    GROUP_ID="1000"

USER root

# Alpine packages
RUN apk add --no-cache su-exec make git

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["/bin/sh"]

# Working directory
WORKDIR /srv

# Goss
ENV GOSS_VERSION="0.3.0"
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
ENV SECURITY_CHECKER_VERSION="4.0.2"
RUN COMPOSER_HOME=/usr/local/share/composer COMPOSER_BIN_DIR=/usr/local/bin composer global require \
      sensiolabs/security-checker:${SECURITY_CHECKER_VERSION} \
    && rm -rf /root/.composer
