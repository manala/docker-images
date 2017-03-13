#!/bin/sh

USER="security"
GROUP_DEFAULT="security"

GROUP=$(getent group "$GROUP_ID" | cut -d: -f1)

if [ ! "$GROUP" ]; then
  GROUP="$GROUP_DEFAULT"
  addgroup -g "$GROUP_ID" "$GROUP"
fi

adduser -D -u "$USER_ID" -G "$GROUP" -s /bin/sh "$USER"

exec su-exec "$USER" "$@"
