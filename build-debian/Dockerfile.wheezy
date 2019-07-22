FROM debian:wheezy

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
COPY apt/sources.wheezy      /etc/apt/sources.list
COPY apt/preferences.wheezy  /etc/apt/preferences.d/preferences
COPY apt/conf.archive.wheezy /etc/apt/apt.conf.d/archive
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
      apt-utils apt-transport-https
COPY apt/sources.manala.wheezy /etc/apt/sources.list.d/manala.list
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 1394DEA3 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
# System
      adduser \
      sudo ca-certificates \
# Shell
      bash bash-completion \
# Tools
      procps less vim wget curl make git

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
    adduser --disabled-password --shell /bin/bash --gecos ${USER_DEFAULT} --uid ${USER_ID} --ingroup ${GROUP_DEFAULT} ${USER_DEFAULT}

##########
# Custom #
##########

# Packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
      bsdtar unzip \
      build-essential \
      devscripts help2man debian-keyring fakeroot lintian equivs libwww-perl libjson-perl

# Clean
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --purge autoremove && \
    rm -rf /var/lib/apt/lists/* && \
# Remove apt docker-clean configuration, to re-enable apt cache now that
# we have finished to play with it during docker building
    rm -rf /etc/apt/apt.conf.d/docker-clean
