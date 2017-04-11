FROM python:3.6.1-alpine

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV DOCKER="1" \
    USER_DEFAULT="client" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="client" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages
RUN apk add --no-cache su-exec bash

# User
RUN addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/sh -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

# Dump init
ENV DUMB_INIT_VERSION="1.2.0"
RUN apk add --no-cache --virtual=dumb-init-dependencies curl && \
    curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    apk del dumb-init-dependencies

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["/bin/bash"]

# Working directory
WORKDIR /srv

# Goss
ENV GOSS_VERSION="0.3.1"
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Pip packages
ENV OPENSTACK_CLIENT_VERSION="3.9.0" \
    NEUTRON_CLIENT_VERSION="6.1.0" \
    SWIFT_CLIENT_VERSION="3.3.0"
RUN apk add --no-cache --virtual=python-dependencies build-base linux-headers && \
    pip --no-cache-dir --disable-pip-version-check install \
      python-openstackclient==${OPENSTACK_CLIENT_VERSION} \
      python-neutronclient==${NEUTRON_CLIENT_VERSION} \
      python-swiftclient==${SWIFT_CLIENT_VERSION} && \
    apk del python-dependencies
