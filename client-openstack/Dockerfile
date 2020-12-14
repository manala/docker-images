FROM alpine:3.12

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache \
# System
      sudo su-exec \
# Shell
      bash bash-completion \
# Tools
      curl make git dumb-init openssl

# Goss
ENV GOSS_VERSION="0.3.15"
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
ENV OPENSTACK_CLIENT_VERSION="5.4.0" \
    NEUTRON_CLIENT_VERSION="7.2.1" \
    SWIFT_CLIENT_VERSION="3.11.0" \
    MISTRAL_CLIENT_VERSION="4.1.1" \
    NOVA_CLIENT_VERSION="17.2.1" \
    CINDER_CLIENT_VERSION="7.2.0" \
    GLANCE_CLIENT_VERSION="3.2.2"

RUN apk add --no-cache \
      python3 py3-pip libssl1.1 && \
    apk add --no-cache --virtual=python-dependencies \
      build-base linux-headers python3-dev libffi-dev openssl-dev && \
    pip3 --no-cache-dir --disable-pip-version-check install \
      python-openstackclient==${OPENSTACK_CLIENT_VERSION} \
      python-neutronclient==${NEUTRON_CLIENT_VERSION} \
      python-swiftclient==${SWIFT_CLIENT_VERSION} \
      python-mistralclient==${MISTRAL_CLIENT_VERSION} \
      python-novaclient==${NOVA_CLIENT_VERSION} \
      python-cinderclient==${CINDER_CLIENT_VERSION} \
      python-glanceclient==${GLANCE_CLIENT_VERSION} && \
    apk del python-dependencies
