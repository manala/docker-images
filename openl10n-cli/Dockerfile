FROM php:5.6.30-alpine

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache su-exec bash curl make git

# Dump init
ENV DUMB_INIT_VERSION="1.2.0"
RUN curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init

# Goss
ENV GOSS_VERSION="0.3.2"
RUN curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh

# Php extensions
RUN docker-php-ext-install calendar

# Composer
ENV COMPOSER_VERSION="1.4.2"
RUN curl -L https://getcomposer.org/installer \
        | php -- --install-dir /usr/local/bin --filename composer --version ${COMPOSER_VERSION}

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["/bin/bash"]

# Working directory
WORKDIR /srv

########
# User #
########

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="openl10n" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="openl10n" \
    GROUP_ID="${GROUP_ID:-1000}"

RUN addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/bash -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

##########
# Custom #
##########

# Composer packages
ENV OPENL10N_CLI_VERSION="0.2.1"
RUN COMPOSER_HOME=/usr/local/share/composer COMPOSER_BIN_DIR=/usr/local/bin composer global require \
      openl10n/cli:${OPENL10N_CLI_VERSION} \
    && rm -rf /root/.composer