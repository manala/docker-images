# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- ESLint - Plugin - json 1.2.0

## [0.2.2] - 2017-03-16
### Changed
- Update Node 7.7.3
- Update Goss 0.3.1

### Added
- ESLint - Config - elao 0.1.0

## [0.2.1] - 2017-03-14
### Changed
-  Better entrypoint to allow existing container user usage

## [0.2.0] - 2017-03-13
### Changed
- Update Node 7.7.2 (Yarn is now pre-included in the base alpine node docker image)
- Update ESLint 3.17.1
- Update Goss 0.3.0 (Use templates to access versions as environment variables)
- Update ESLint - Plugin - react-native 2.3.1
- Add a way to define USER_ID and GROUP_ID as environment variables

## [0.1.3] - 2017-02-23
### Changed
- Update Node 7.6.0

## [0.1.2] - 2017-02-22
### Changed
- Update Goss 0.2.6
- Update ESLint 3.16.0
- Update ESLint - Formatter - relative-junit 0.0.3

## [0.1.1] - 2017-02-17
### Added
- ESLint - Formatter - relative-junit 0.0.2

### Changed
- Don't specify goss bin destination, as /usr/local/bin is the default one
- Update Node 7.5.0
- Update Yarn 0.20.3
- Update ESLint 3.15.0
- Update ESLint - Plugin - react 6.10.0
- Update ESLint - Plugin - jsx-a11y 4.0.0
- Update ESLint - Config - airbnb 14.1.0

## [0.1.0] - 2017-01-26
### Added
- Git 2.8.3
- Yarn 0.19.1
- ESLint - Plugin - jsx-a11y 3.0.2
- ESLint - Plugin - import 2.2.0
- ESLint - Config - airbnb 14.0.0
- Goss 0.2.5

### Fixed
- Lint user home improperly set to /home/node

### Changed
- Stick versions
- Tests with goss

## [0.0.1] - 2017-01-24
### Added
- Make 4.1
- Node 7.4.0
- ESLint 3.14.0
- ESLint - Plugin - react 6.9.0
- ESLint - Plugin - react-native 2.2.1
