FROM node:7.7.2-alpine

MAINTAINER Manala <contact@manala.io>

ENV GOSS_VERSION="0.3.0"

# Goss
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Alpine packages
RUN apk add --no-cache make git

# Lint user
RUN sed -i -e s/node:/lint:/g /etc/passwd /etc/group && \
    mv /home/node /home/lint

ENV STYLELINT_VERSION="7.9.0" \
    STYLELINT_SCSS_VERSION="1.4.3" \
    STYLELINT_CONFIG_STANDARD_VERSION="16.0.0" \
    STYLELINT_CONFIG_ELAO_VERSION="0.3.2" \
    STYLELINT_FORMATTER_RELATIVE_JUNIT_VERSION="0.0.2" \
    STYLEFMT_VERSION="5.2.0"

# Npm packages
RUN npm --global install \
      stylelint@${STYLELINT_VERSION} \
      stylelint-scss@${STYLELINT_SCSS_VERSION} \
      stylelint-config-standard@${STYLELINT_CONFIG_STANDARD_VERSION} \
      stylelint-config-elao@${STYLELINT_CONFIG_ELAO_VERSION} \
      stylelint-formatter-relative-junit@${STYLELINT_FORMATTER_RELATIVE_JUNIT_VERSION} \
      stylefmt@${STYLEFMT_VERSION} \
    && rm -rf /root/.npm

# User
USER lint

# Working directory
WORKDIR /home/lint
