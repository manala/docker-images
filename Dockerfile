FROM node:7.5.0-alpine

MAINTAINER Manala <contact@manala.io>

ENV GOSS_VERSION                       0.2.5
ENV YARN_VERSION                       0.20.3
ENV ESLINT_VERSION                     3.15.0
ENV ESLINT_PLUGIN_REACT_VERSION        6.10.0
ENV ESLINT_PLUGIN_REACT_NATIVE_VERSION 2.2.1
ENV ESLINT_PLUGIN_JSX_A11Y_VERSION     4.0.0
ENV ESLINT_PLUGIN_IMPORT_VERSION       2.2.0
ENV ESLINT_CONFIG_AIRBNB_VERSION       14.1.0
ENV ESLINT_FORMATTER_RELATIVE_JUNIT    0.0.2
ENV BABEL_ESLINT_VERSION               7.1.1

# Goss
RUN apk add --no-cache --virtual=goss-dependencies curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies

# Alpine packages
RUN apk add --no-cache make git

# Yarn
RUN apk add --no-cache --virtual=yarn-dependencies curl tar && \
    mkdir -p /usr/local/share/yarn && \
    curl -L https://yarnpkg.com/downloads/${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz \
        | tar zxf - -C /usr/local/share/yarn --strip-components=1 && \
    ln -s /usr/local/share/yarn/bin/yarn /usr/local/bin && \
    ln -s /usr/local/share/yarn/bin/yarnpkg /usr/local/bin && \
    apk del yarn-dependencies

# Npm packages
RUN npm --global install \
      eslint@${ESLINT_VERSION} \
      eslint-plugin-react@${ESLINT_PLUGIN_REACT_VERSION} \
      eslint-plugin-react-native@${ESLINT_PLUGIN_REACT_NATIVE_VERSION} \
      eslint-plugin-jsx-a11y@${ESLINT_PLUGIN_JSX_A11Y_VERSION} \
      eslint-plugin-import@${ESLINT_PLUGIN_IMPORT_VERSION} \
      eslint-config-airbnb@${ESLINT_CONFIG_AIRBNB_VERSION} \
      eslint-formatter-relative-junit@${ESLINT_FORMATTER_RELATIVE_JUNIT} \
      babel-eslint@${BABEL_ESLINT_VERSION} \
    && rm -rf /root/.npm

# Lint user
RUN sed -i -e s/node:/lint:/g /etc/passwd /etc/group && \
    mv /home/node /home/lint

# User
USER lint

# Working directory
WORKDIR /home/lint
