#!/bin/bash
set -e

# this line is not actually required since "host records match either SSL or non-SSL connection attempts"
#sed -i 's/host/hostssl/g' "$PGDATA"/pg_hba.conf

cp /docker-entrypoint-initdb.d/server.{crt,key} "$PGDATA"
chown postgres:postgres "$PGDATA"/server.{crt,key}
chmod 0600 "$PGDATA"/server.key
