# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [2.2.0.0-4] - 2017-06-19
### Added
- Stretch support

## [2.2.0.0-3] - 2017-05-10
### Added
- Tests Makefile targets
- Travis tests

### Changed
- Install goss by official install script
- Keep python-pip package for goss tests
- Update Ansible-lint 3.4.13
- Update Goss 0.2.6
- Docker entrypoint to dynamically set non-root user

### Fixed
- Curl package was first installed in Dockerfile, then, re-installed by goss script, and, finally, removed by same goss script

### Removed
- Remove "push" Makefile targets, as docker hub automatic builds are now used

## [2.2.0.0-2] - 2017-02-02
### Fixed
- Downgrade to jinja < 2.9 to work around the jinja 2.9 gate (see: https://github.com/ansible/ansible/issues/20063)

## [2.2.0.0-1] - 2017-02-01
### Changed
- Follow upstream versioning schema

## [0.12.0] - 2017-02-01
### Changed
- Downgrade to ansible 2.2.0.0 due to a blocking bug (see: https://github.com/ansible/ansible/issues/20885)

## [0.11.1] - 2017-01-31
### Added
- Install curl (follow manala/build-debian)

## [0.11.0] - 2017-01-25
### Added
- Install procps
- Install vim

### Changed
- Update to ansible 2.2.1.0
- Update to ansible-lint 3.4.10

## [0.10.1] - 2016-12-12
### Changed
- Uncentralize versions in Makefile (as it blocks travis builds...)

## [0.10.0] - 2016-12-12
### Changed
- Update to goss 0.2.5
- Centralize versions in Makefile

## [0.9] - 2016-12-05
### Changed
- Update to ansible-lint 3.4.7

## [0.8] - 2016-11-23
### Added
- Install apt-transport-https

## [0.7] - 2016-11-19
### Changed
- Update to ansible-lint 3.4.4
- Debian version instead of "localhost" in /etc/ansible/hosts

## [0.6] - 2016-11-07
### Changed
- Update to ansible 2.2.0.0
- Update to ansible-lint 3.4.3

## [0.5] - 2016-10-03
### Changed
- Update to ansible 2.1.2.0
- Update to goss 0.2.4
- Update to ansible-lint 3.3.3

## [0.4] - 2016-09-12
### Changed
- Install wget & less for ansible-galaxy

## [0.3] - 2016-08-17
### Changed
- Update to goss 0.2.3
- Update to ansible-lint 3.2.5

## [0.2] - 2016-08-08
### Changed
- Update to ansible 2.1.1.0

## [0.1] - 2016-07-06
### Added
- Install ansible
- Install ansible-lint
- Install goss
