FROM php:5.6.31-alpine

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache su-exec bash curl make git

# Dumb init
ENV DUMB_INIT_VERSION="1.2.1"
RUN curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init

# Goss
ENV GOSS_VERSION="0.3.5"
RUN curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh

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

# Php extensions
RUN docker-php-ext-install calendar

# Openl10n
# Must be installed by downloading the phar file because of openl10n issue
# See https://github.com/openl10n/openl10n-cli/issues/46
ENV OPENL10N_CLI_VERSION="0.2.0"
RUN curl -L -o /usr/local/bin/openl10n \
    https://github.com/openl10n/openl10n-cli/releases/download/v${OPENL10N_CLI_VERSION}/openl10n.phar && \
    chmod +x /usr/local/bin/openl10n
