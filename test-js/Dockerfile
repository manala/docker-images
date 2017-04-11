FROM node:7.8.0-alpine

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV DOCKER="1" \
    USER_DEFAULT="test" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="test" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages
RUN apk add --no-cache su-exec make git

# User
RUN deluser --remove-home node && \
    addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
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

# Npm packages
ENV JEST_VERSION="19.0.2"
RUN npm --global install \
      jest@${JEST_VERSION} \
    && rm -rf /root/.npm
