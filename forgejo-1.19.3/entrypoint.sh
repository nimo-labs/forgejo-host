#!/bin/sh

chown -R forgejo:forgejo /app/data
chown -R forgejo:forgejo /app/log
exec runuser -u forgejo "$@"
