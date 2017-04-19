FROM alpine:edge

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache su-exec bash curl make git

# Dump init
ENV DUMB_INIT_VERSION="1.2.0"
RUN curl -fsSL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init

# Goss
ENV GOSS_VERSION="0.3.1"
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

ENV USER_DEFAULT="hugo" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="hugo" \
    GROUP_ID="${GROUP_ID:-1000}"

RUN addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
    adduser -D -s /bin/bash -g ${USER_DEFAULT} -u ${USER_ID} -G ${GROUP_DEFAULT} ${USER_DEFAULT}

##########
# Custom #
##########

# Packages
RUN apk add --no-cache nodejs yarn optipng libjpeg-turbo-utils imagemagick \
# Compilation (optipng,gifsicle,pngquant,mozjpeg,...)
    gcc autoconf automake libtool nasm musl-dev zlib-dev libpng-dev

# Hugo
ENV HUGO_VERSION="0.20.2"
RUN curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
      | tar -zxvf - -C /tmp && \
    mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo && \
    rm -Rf /tmp/hugo_${HUGO_VERSION}_linux_amd64

# Pip packages
ENV PYGMENTS_VERSION="2.2.0"
RUN apk add --no-cache python py-pip && \
    pip --no-cache-dir --disable-pip-version-check install \
      Pygments==${PYGMENTS_VERSION}

# Expose default hugo port
EXPOSE 1313
