FROM alpine:3.10

LABEL maintainer="Manala <contact@manala.io>"

ENV \
    ANSIBLE_VERSION="2.9.1" \
    ANSIBLE_LINT_VERSION="4.1.1a5" \
    MOLECULE_VERSION="2.22" \
    YAMLLINT_VERSION="1.19.0" \
    GOSS_VERSION="0.3.7"

RUN \
    apk add --no-cache \
      python3 docker rsync && \
    apk add --no-cache --virtual=ansible-dependencies \
      build-base python3-dev libffi-dev openssl-dev && \
    pip3 --no-cache-dir --disable-pip-version-check install \
      ansible==${ANSIBLE_VERSION} \
      ansible-lint==${ANSIBLE_LINT_VERSION} \
      molecule==${MOLECULE_VERSION} \
      yamllint==${YAMLLINT_VERSION} \
      docker-py && \
    apk del ansible-dependencies && \
    apk add --no-cache --virtual=goss-dependencies \
      curl && \
    curl -fsSL https://goss.rocks/install | GOSS_VER=v${GOSS_VERSION} sh && \
    apk del goss-dependencies
