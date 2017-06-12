#!/usr/bin/env bash

set -ue
set -x

exec >> /tmp/digdag.log
exec 2>&1

#export PATH="/home/uu59/.rbenv/shims:$PATH"

which -a java
which -a ruby

exec /usr/local/bin/digdag server \
  -o /usr/local/var/log/digdag/ \
  -O /usr/local/var/log/digdag/tasklogs \
  -A /usr/local/var/log/digdag/accesslogs \
  -L /usr/local/var/log/digdag/server.log \
  --config /usr/local/etc/digdag/postgresql.properties
