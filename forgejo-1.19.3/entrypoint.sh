#!/bin/sh

chown -R forgejo:forgejo /app/data
chown -R forgejo:forgejo /app/log
chown -R forgejo:forgejo /app/custom
exec runuser -u forgejo "$@"
