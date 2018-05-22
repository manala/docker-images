# Docker Images [![Build Status](https://travis-ci.org/manala/docker-images.svg?branch=master)](https://travis-ci.org/manala/docker-images)

## Release

```
make release
```

### Set Chandler github api token

```
export CHANDLER_GITHUB_API_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
travis login
travis repos -o manala -a --no-interactive | xargs -n1 travis env set CHANDLER_GITHUB_API_TOKEN $CHANDLER_GITHUB_API_TOKEN --private --repo
```
