FROM debian:buster

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
COPY debian/apt/sources.buster /etc/apt/sources.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
# System
      gnupg \
      sudo apt-transport-https ca-certificates \
# Shell
      bash \
# Tools
      procps less vim wget curl make git xz-utils sed

# Su exec
ENV SU_EXEC_VERSION="0.2"
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install build-essential && \
    curl -L https://github.com/ncopa/su-exec/archive/v${SU_EXEC_VERSION}.tar.gz \
      | tar zxfv - -C /tmp --strip-components=1 && \
    make --directory /tmp  && \
    mv /tmp/su-exec /usr/local/bin && \
    DEBIAN_FRONTEND=noninteractive apt-get -y purge build-essential

# Dumb init
ENV DUMB_INIT_VERSION="1.2.2"
RUN curl -L https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init

# Goss
ENV GOSS_VERSION="0.3.7"
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

RUN addgroup --gid ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser --disabled-password --shell /bin/bash --gecos ${USER_DEFAULT} --uid ${USER_ID} --ingroup ${GROUP_DEFAULT} ${USER_DEFAULT} && \
    sed -i '46iforce_color_prompt=yes' /home/manala/.bashrc && \
    echo "\nbind 'set show-all-if-ambiguous on'\nbind '"TAB": menu-complete'\nbind '"TAB": menu-complete-backward'" >> /home/manala/.bashrc

##########
# Custom #
##########

# Pip packages
ENV ANSIBLE_VERSION="2.6.5" \
    ANSIBLE_LINT_VERSION="4.1.1a0"
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
      python python-setuptools python-dev libssl-dev python-pip && \
    pip --no-cache-dir --disable-pip-version-check install \
      ansible==${ANSIBLE_VERSION} \
      ansible-lint==${ANSIBLE_LINT_VERSION} && \
    DEBIAN_FRONTEND=noninteractive apt-get -y purge python-setuptools python-dev libssl-dev

# Ansible hosts
COPY ansible/hosts.debian.buster /etc/ansible/hosts

# Clean
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --purge autoremove && \
    rm -rf /var/lib/apt/lists/* && \
# Remove apt docker-clean configuration, to re-enable apt cache now that
# we have finished to play with it during docker building
    rm -rf /etc/apt/apt.conf.d/docker-clean && \
# Enable init scripts
    echo "#!/bin/sh\nexit 0" \
        > /usr/sbin/policy-rc.d && \
# Remove upstream upstart scripts prevention
# See: https://github.com/tianon/docker-brew-debian/issues/64
    dpkg-divert --local --rename --remove /sbin/initctl && rm -rf /sbin/initctl
