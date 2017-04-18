FROM node:7.9.0-alpine

MAINTAINER Manala <contact@manala.io>

ARG USER_ID
ARG GROUP_ID

ENV USER_DEFAULT="lint" \
    USER_ID="${USER_ID:-1000}" \
    GROUP_DEFAULT="lint" \
    GROUP_ID="${GROUP_ID:-1000}"

USER root

# Packages
RUN apk add --no-cache su-exec make git

# User
RUN deluser --remove-home node && \
    addgroup -g ${GROUP_ID} ${GROUP_DEFAULT} && \
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

# Npm packages
ENV ESLINT_VERSION="3.19.0" \
    ESLINT_PLUGIN_REACT_VERSION="6.10.3" \
    ESLINT_PLUGIN_REACT_NATIVE_VERSION="2.3.1" \
    ESLINT_PLUGIN_JSX_A11Y_VERSION="4.0.0" \
    ESLINT_PLUGIN_IMPORT_VERSION="2.2.0" \
    ESLINT_PLUGIN_JSON_VERSION="1.2.0" \
    ESLINT_CONFIG_AIRBNB_VERSION="14.1.0" \
    ESLINT_CONFIG_ELAO_VERSION="0.1.0" \
    ESLINT_FORMATTER_RELATIVE_JUNIT="0.0.3" \
    BABEL_ESLINT_VERSION="7.2.1"
RUN npm --global install \
      eslint@${ESLINT_VERSION} \
      eslint-plugin-react@${ESLINT_PLUGIN_REACT_VERSION} \
      eslint-plugin-react-native@${ESLINT_PLUGIN_REACT_NATIVE_VERSION} \
      eslint-plugin-jsx-a11y@${ESLINT_PLUGIN_JSX_A11Y_VERSION} \
      eslint-plugin-import@${ESLINT_PLUGIN_IMPORT_VERSION} \
      eslint-plugin-json@${ESLINT_PLUGIN_JSON_VERSION} \
      eslint-config-airbnb@${ESLINT_CONFIG_AIRBNB_VERSION} \
      eslint-config-elao@${ESLINT_CONFIG_ELAO_VERSION} \
      eslint-formatter-relative-junit@${ESLINT_FORMATTER_RELATIVE_JUNIT} \
      babel-eslint@${BABEL_ESLINT_VERSION} \
    && rm -rf /root/.npm
