#!/bin/sh

if [ ${USER_ID} != $(id -u manala) ]; then
  usermod --non-unique --uid ${USER_ID} manala
fi

if [ ${GROUP_ID} != $(id -g manala) ]; then
  groupmod --non-unique --gid ${GROUP_ID} manala
  chgrp -R manala /home/manala
fi

exec su-exec manala "${@}"
