#!/bin/bash

result="$(psql --dbname "template1" -qc 'CREATE EXTENSION IF NOT EXISTS pg_stat_statements' 2>&1)"
ok=$?
if [ $ok -eq 0 -a -z "$result" ]; then
    log INFO PG Stat Statements extension installed in template1
elif [ $ok -ne 0 ]; then
    log WARNING Attempt to install pg_stat_statements in \
        template1@$PGHOST failed with this message: $result
fi

result="$(psql -qc 'CREATE EXTENSION IF NOT EXISTS pg_stat_statements' 2>&1)"
ok=$?
if [ $ok -eq 0 -a -z "$result" ]; then
    log INFO PG Stat Statements extension installed
elif [ $ok -ne 0 ]; then
    log WARNING Attempt to install pg_stat_statements in \
        $PGDATABASE@$PGHOST failed with this message: $result
fi

