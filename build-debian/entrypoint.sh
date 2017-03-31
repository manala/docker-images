#!/bin/sh

USER_DEFAULT="build"
GROUP_DEFAULT="build"

GROUP=$(getent group "$GROUP_ID" | cut -d: -f1)

if [ ! "$GROUP" ]; then
  GROUP="$GROUP_DEFAULT"
  sed -i s/$GROUP:x:[0-9]*:/$GROUP:x:$GROUP_ID:/ /etc/group
fi

USER=$(getent passwd "$USER_ID" | cut -d: -f1)

if [ ! "$USER" ]; then
  USER="$USER_DEFAULT"
fi

sed -i s/$USER:x:[0-9]*:[0-9]*:/$USER:x:$USER_ID:$GROUP_ID:/ /etc/passwd

exec su-exec "$USER" "$@"
