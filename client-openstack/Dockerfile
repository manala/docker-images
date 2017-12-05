FROM alpine:3.7

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache \
# System
      sudo su-exec \
# Shell
      bash bash-completion \
# Tools
      curl make git dumb-init

# Goss
ENV GOSS_VERSION="0.3.5"
RUN curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Shell
CMD ["/bin/bash"]

# Working directory
WORKDIR /srv

########
# User #
########

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="manala" \
    USER_ID="${USER_ID:-1000}" \
    USER_SUDO="1" \
    GROUP_DEFAULT="manala" \
    GROUP_ID="${GROUP_ID:-1000}"

RUN addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/bash -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

##########
# Custom #
##########

# Pip packages
ENV OPENSTACK_CLIENT_VERSION="3.12.0" \
    NEUTRON_CLIENT_VERSION="6.1.1" \
    SWIFT_CLIENT_VERSION="3.4.0"
RUN apk add --no-cache \
      python3 && \
    apk add --no-cache --virtual=python-dependencies \
      build-base linux-headers python3-dev libffi-dev openssl-dev && \
    pip3 --no-cache-dir --disable-pip-version-check install \
      python-openstackclient==${OPENSTACK_CLIENT_VERSION} \
      python-neutronclient==${NEUTRON_CLIENT_VERSION} \
      python-swiftclient==${SWIFT_CLIENT_VERSION} && \
    apk del python-dependencies
