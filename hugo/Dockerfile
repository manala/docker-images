FROM node:7.9.0-alpine

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="hugo" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="hugo" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages
RUN apk add --no-cache su-exec bash make \
# Third parties compilation (optipng,gifsicle,pngquant,mozjpeg,...)
    gcc autoconf automake libtool nasm musl-dev zlib-dev libpng-dev

# Dump init
ENV DUMB_INIT_VERSION="1.2.0"
RUN apk add --no-cache --virtual=dumb-init-dependencies curl && \
    curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    apk del dumb-init-dependencies

# User
RUN deluser --remove-home node && \
    addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/bash -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

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

# Hugo
ENV HUGO_VERSION="0.20.2"
RUN apk add --no-cache --virtual=hugo-dependencies curl && \
    curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
      | tar -zxvf - -C /tmp && \
    mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo && \
    rm -Rf /tmp/hugo_${HUGO_VERSION}_linux_amd64 && \
    apk del hugo-dependencies

# Expose default hugo port
EXPOSE 1313
