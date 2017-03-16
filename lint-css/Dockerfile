FROM node:7.7.3-alpine

MAINTAINER Manala <contact@manala.io>

ENV USER_ID="1000" \
    GROUP_ID="1000"

USER root

# Alpine packages
RUN apk add --no-cache su-exec make git

# Remove user
RUN deluser --remove-home node

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
ENV STYLELINT_VERSION="7.9.0" \
    STYLELINT_SCSS_VERSION="1.4.3" \
    STYLELINT_CONFIG_STANDARD_VERSION="16.0.0" \
    STYLELINT_CONFIG_ELAO_VERSION="0.3.2" \
    STYLELINT_FORMATTER_RELATIVE_JUNIT_VERSION="0.0.2" \
    STYLEFMT_VERSION="5.2.0"
RUN npm --global install \
      stylelint@${STYLELINT_VERSION} \
      stylelint-scss@${STYLELINT_SCSS_VERSION} \
      stylelint-config-standard@${STYLELINT_CONFIG_STANDARD_VERSION} \
      stylelint-config-elao@${STYLELINT_CONFIG_ELAO_VERSION} \
      stylelint-formatter-relative-junit@${STYLELINT_FORMATTER_RELATIVE_JUNIT_VERSION} \
      stylefmt@${STYLEFMT_VERSION} \
    && rm -rf /root/.npm
