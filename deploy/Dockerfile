FROM alpine:3.5

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV DOCKER="1" \
    USER_DEFAULT="deploy" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="deploy" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages
RUN apk add --no-cache su-exec make git rsync openssh-client && \
    echo -e "\n\
Host *\n\
  StrictHostKeyChecking no\n\
  ForwardAgent          yes\n\
  UserKnownHostsFile    /dev/null\n\
  LogLevel              ERROR\n" >> /etc/ssh/ssh_config

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
CMD ["/bin/sh"]

# Working directory
WORKDIR /srv

# Goss
ENV GOSS_VERSION="0.3.1"
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies
