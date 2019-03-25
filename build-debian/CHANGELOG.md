# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.13.3] - 2019-03-25
### Changed
- Upstream update

### Fixed
- Fix apt sources

## [0.13.2] - 2018-11-08
### Changed
- Update Dumb-init 1.2.2
- Upstream update

## [0.13.1] - 2018-06-25
### Changed
- Update Goss 0.3.6
- Upstream update

## [0.13.0] - 2018-06-18
### Added
- Manala apt repository

### Changed
- Upstream update

## [0.12.11] - 2018-05-22
### Changed
- Upstream update

## [0.12.10] - 2018-04-23
### Changed
- Upstream update

## [0.12.9] - 2018-03-26
### Changed
- Upstream update

## [0.12.8] - 2018-01-23
### Changed
- Upstream update

## [0.12.7] - 2017-12-04
### Changed
- Update Dumb-init 1.2.1

## [0.12.6] - 2017-10-05
### Changed
- Remove apt docker-clean configuration

## [0.12.5] - 2017-10-04
### Added
- help2man

## [0.12.4] - 2017-10-02
### Changed
- Enhance tests

## [0.12.3] - 2017-09-22
### Changed
- Update Goss 0.3.5

## [0.12.2] - 2017-09-08
### Added
- unzip (needed for composer)

## [0.12.1] - 2017-09-07
### Added
- procps on every distributions
- Enhance goss tests

## [0.12.0] - 2017-09-04
### Added
- bash-completion
- jessie-backports-sloppy repository
- stretch-backports repository

### Changed
- Update Goss 0.3.4
- Switch to default user name "manala"

## [0.11.5] - 2017-07-06
### Added
- debian-keyring

## [0.11.4] - 2017-07-03
### Added
- gnupg (mainly used by nodesource nodejs install script)

## [0.11.3] - 2017-06-30
### Added
- libwww-perl & libjson-perl (debsnap dependencies)

## [0.11.2] - 2017-06-26
### Added
- Equivs (mk-build-deps dependency)

### Changed
- Bsdtar backports for wheezy

## [0.11.1] - 2017-06-19
### Added
- Dumb-init 1.2.0
- Git
- Stretch support

### Changed
- Update Goss 0.3.2

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
