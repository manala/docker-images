#!/bin/sh

USER_DEFAULT="security"
GROUP_DEFAULT="security"

USER=$(getent passwd "$USER_ID" | cut -d: -f1)

if [ ! "$USER" ]; then
  USER="$USER_DEFAULT"

  GROUP=$(getent group "$GROUP_ID" | cut -d: -f1)
  if [ ! "$GROUP" ]; then
    GROUP="$GROUP_DEFAULT"
    addgroup -g "$GROUP_ID" "$GROUP"
  fi

  adduser -D -u "$USER_ID" -G "$GROUP" -s /bin/sh "$USER"
fi

exec su-exec "$USER" "$@"
