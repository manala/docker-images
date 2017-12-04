FROM node:7.10.0-alpine

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache su-exec bash curl make git

# Dumb init
ENV DUMB_INIT_VERSION="1.2.1"
RUN apk add --no-cache --virtual=dumb-init-dependencies curl && \
    curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    apk del dumb-init-dependencies

# Goss
ENV GOSS_VERSION="0.3.5"
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["/bin/sh"]

# Working directory
WORKDIR /srv

########
# User #
########

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="test" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="test" \
    GROUP_ID="${GROUP_ID:-1000}"

RUN deluser --remove-home node && \
    addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/bash -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

##########
# Custom #
##########

# Npm packages
ENV JEST_VERSION="19.0.2" \
    JEST_JUNIT_VERSION="1.4.0"
RUN npm --global install \
      jest@${JEST_VERSION} \
      jest-junit@${JEST_JUNIT_VERSION} \
    && rm -rf /root/.npm
