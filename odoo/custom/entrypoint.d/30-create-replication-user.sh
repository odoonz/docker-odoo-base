#!/bin/bash
set -e

if [ "$REPLICATION" == true ]; then
    echo "-- setting replication user"
    psql -q --dbname "template1" << EOF
  DO \$\$
  BEGIN
    CREATE ROLE $REPL_USER LOGIN REPLICATION PASSWORD '$REPL_PASS';
    EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'not creating role $REPL_USER -- it already exists';
  END
  \$\$
EOF

fi
