FROM alpine:edge

MAINTAINER Manala <contact@manala.io>

USER root

# Packages
RUN apk add --no-cache \
# Entrypoint
      su-exec \
# Command
      bash \
# Tools
      curl make git dumb-init

# Goss
ENV GOSS_VERSION="0.3.2"
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
RUN apk add --no-cache nodejs nodejs-npm yarn \
# Image tools
      optipng libjpeg-turbo-utils imagemagick gifsicle pngquant \
# Compilation (optipng,gifsicle,pngquant,mozjpeg,...)
      gcc autoconf automake libtool nasm musl-dev zlib-dev libpng-dev

# Npm packages
ENV SVGO_VERSION="0.7.2"
RUN npm --global install \
      svgo@${SVGO_VERSION} \
    && rm -rf /root/.npm

# Hugo
ENV HUGO_VERSION="0.24.1"
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
      | tar -zxvf - -C /tmp && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    rm -Rf /tmp/hugo_${HUGO_VERSION}_linux_amd64

# Pip packages
ENV PYGMENTS_VERSION="2.2.0"
RUN apk add --no-cache python py-pip && \
    pip --no-cache-dir --disable-pip-version-check install \
      Pygments==${PYGMENTS_VERSION}

# Expose default hugo port
EXPOSE 1313
