FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
        curl \
        devscripts \
        pkg-php-tools
