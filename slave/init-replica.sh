#!/bin/sh
set -e

echo "🔁 Starting base backup from master..."

rm -rf /var/lib/postgresql/data/*

PGPASSWORD=replicatorpass pg_basebackup -h db_master -D /var/lib/postgresql/data -U replicator -Fp -Xs -P -R

echo "✅ Base backup completed."

exec postgres -c config_file=/etc/postgresql/postgresql.conf
