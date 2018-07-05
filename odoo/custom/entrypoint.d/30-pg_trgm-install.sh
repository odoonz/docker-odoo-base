#!/bin/bash

result="$(psql --dbname "template1" -qc 'CREATE EXTENSION IF NOT EXISTS pg_trgm' 2>&1)"
ok=$?
if [ $ok -eq 0 -a -z "$result" ]; then
    log INFO Trigram extension installed
elif [ $ok -ne 0 ]; then
    log WARNING Attempt to install pg_trgm in \
        $PGDATABASE@$PGHOST failed with this message: $result
fi

result="$(psql -qc 'CREATE EXTENSION IF NOT EXISTS pg_trgm' 2>&1)"
ok=$?
if [ $ok -eq 0 -a -z "$result" ]; then
    log INFO Trigram extension installed
elif [ $ok -ne 0 ]; then
    log WARNING Attempt to install pg_trgm in \
        $PGDATABASE@$PGHOST failed with this message: $result
fi
