#!/bin/sh

# Try to get group by its given id...
GROUP=$(getent group "$GROUP_ID" | cut -d: -f1)

# ...fallback to default
if [ ! "$GROUP" ]; then
  GROUP="$GROUP_DEFAULT"
  # Update group id
  sed -i s/$GROUP:x:[0-9]*:/$GROUP:x:$GROUP_ID:/ /etc/group
fi

# Try to get user by its given id...
USER=$(getent passwd "$USER_ID" | cut -d: -f1)

# ...fallback to default
if [ ! "$USER" ]; then
  USER="$USER_DEFAULT"
fi

# Update user id
sed -i s/$USER:x:[0-9]*:[0-9]*:/$USER:x:$USER_ID:$GROUP_ID:/ /etc/passwd

exec su-exec "$USER" "$@"
