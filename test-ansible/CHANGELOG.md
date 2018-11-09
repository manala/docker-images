# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Changed
- Update Dumb-init 1.2.2

## [2.5.5-2] - 2018-07-02
### Added
- Force "xz-utils" package installation on debian images (even if only jessie were missing it)

## [2.5.5-1] - 2018-06-25
### Changed
- Update Goss 0.3.6
- Update Ansible-lint 3.4.23
- Update Ansible 2.5.5

## [2.5.3-1] - 2018-05-22
### Changed
- Update Ansible 2.5.3

## [2.5.2-1] - 2018-04-30
### Changed
- Update Ansible 2.5.2

## [2.5.1-1] - 2018-04-23
### Changed
- Update Ansible 2.5.1
- Remove setuptools debian package before installing it by pip

## [2.5.0-1] - 2018-03-30
### Changed
- Update Ansible 2.5.0
- Update Ansible-lint 3.4.21

## [2.4.3.0-1] - 2018-02-06
### Changed
- Update Ansible 2.4.3.0

## [2.4.2.0-1] - 2017-12-22
### Changed
- Update Ansible 2.4.2.0
- Update Ansible-lint 3.4.20
- Remove upstream init scripts prevention
- Remove upstream upstart scripts prevention (see: https://github.com/tianon/docker-brew-debian/issues/64)

## [2.3.2.0-7] - 2017-12-07
### Changed
- Update Dumb-init 1.2.1
- Use group/host combinations in ansible hosts files to ease host exclusions by group

### Fixed
- Python pip installation via easy_install on debian wheezy

## [2.3.2.0-6] - 2017-10-23
### Added
- Better centos cleanup

### Fixed
- Default centos user home umask

## [2.3.2.0-5] - 2017-10-20
### Fixed
- Append "/usr/local/bin" to centos sudo secure_path, as this is the default path where binaries such as goss are intalled

## [2.3.2.0-4] - 2017-10-08
### Changed
- Fix debian apt sources

## [2.3.2.0-3] - 2017-10-07
### Added
- Gnupg package on debian stretch, as - unlike other debian based distributions - not provided by default
- Distribution dependent tests

## [2.3.2.0-2] - 2017-10-05
### Changed
- Remove only apt docker-clean configuration on debian based distributions

## [2.3.2.0-1] - 2017-10-03
### Changed
- Update Ansible 2.3.2.0

## [2.3.1.0-1] - 2017-10-03
### Changed
- Update Ansible 2.3.1.0

## [2.2.1.0-1] - 2017-10-03
### Changed
- Update Ansible 2.2.1.0

## [2.2.0.0-4] - 2017-10-02
### Changed
- Update Goss 0.3.5
- Update Ansible-lint 3.4.16

## [2.2.0.0-3] - 2017-09-10
### Added
- Ubuntu xenial support

## [2.2.0.0-2] - 2017-09-10
### Added
- CentOS 7 support
- Better packages cleanup on debian

## [2.2.0.0-1] - 2017-09-10
### Added
- Initial release
