FROM node:7.4.0-alpine

MAINTAINER Manala <contact@manala.io>

ENV GOSS_VERSION                      0.2.5
ENV YARN_VERSION                      0.19.1
ENV STYLELINT_VERSION                 7.7.1
ENV STYLELINT_CONFIG_STANDARD_VERSION 15.0.1
ENV STYLELINT_CONFIG_ELAO_VERSION     0.2.1
ENV STYLELINT_JUNIT_FORMATTER_VERSION 0.1.0
ENV STYLEFMT_VERSION                  5.1.1

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
      stylelint@${STYLELINT_VERSION} \
      stylelint-config-standard@${STYLELINT_CONFIG_STANDARD_VERSION} \
      stylelint-config-elao@${STYLELINT_CONFIG_ELAO_VERSION} \
      stylelint-junit-formatter@${STYLELINT_JUNIT_FORMATTER_VERSION} \
      stylefmt@${STYLEFMT_VERSION} \
    && rm -rf /root/.npm

# Lint user
RUN sed -i -e s/node:/lint:/g /etc/passwd /etc/group && \
    mv /home/node /home/lint

# User
USER lint

# Working directory
WORKDIR /home/lint
