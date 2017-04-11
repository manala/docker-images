# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- DOCKER environment variable

## [0.11.0] - 2017-04-05
### Changed
- Replace unzip package by bsdtar

## [0.10.1] - 2017-04-04
### Added
- User is now sudoer

### Changed
- Switch packages to backports when available

### Removed
 - pkg-php-tools

## [0.10.0] - 2017-03-31
### Changed
- Upstream update
- Switch to "build" user (using custom entrypoint, and dynamic uid/gid)
- "/bin/bash" as default command

## [0.9.0] - 2017-01-31
### Added
- Install wget (follow manala/ansible-debian)
- Install less (follow manala/ansible-debian)
- Install apt-transport-https (follow manala/ansible-debian)
- Install make (follow manala/ansible-debian)
- Install vim (follow manala/ansible-debian)

### Changed
- Better apt cleaning (```rm -rf * /var/lib/apt/lists/*``` instead of ```apt-get clean```)

### Fixed
- Use ```DEBIAN_FRONTEND=noninteractive``` in jessie packages installation

## [0.8.0] - 2017-01-02
### Changed
- Upstream update

## [0.7.0] - 2016-12-07
### Changed
- Upstream update

## [0.6] - 2016-11-07
### Changed
- Upstream update

## [0.5] - 2016-10-03
### Changed
- Upstream update

## [0.4] - 2016-08-29
### Changed
- Apt cache & Repository sources

## [0.3] - 2016-08-29
### Added
- Add dh-systemd

## [0.2] - 2016-08-25
### Added
- Add dh-exec

## [0.1] - 2016-08-08
### Added
- Initial release
