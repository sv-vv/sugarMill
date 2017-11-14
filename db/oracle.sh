#!/bin/bash
#
# Database driver for Oracle (oracle12c)
#

#
# Expected environment variables

# Database type must be oci8
DB_TYPE=${DB_TYPE:?}
if [ "$DB_TYPE" != "oci8" ]; then
    echo "Invalid/unknown value of DB_TYPE; the expected value is 'oci8'".
    exit
fi

# Default values for host and port
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-1521}
# The database connection parameters are required
DB_USER=${DB_USER:?}
DB_PASS=${DB_PASS:?}
DB_NAME=${DB_NAME:?}

# Oracle needs a special format for database name in Sugar config
# Keep the name in $_DB_NAME and update $DB_NAME to be used in the command line for Nusim
_DB_NAME=${DB_NAME}
DB_NAME="0.0.0.0/${_DB_NAME}"

# Default value for tools
SQLPLUS=${SQLPLUS:-/usr/bin/sqlplus64}


function database_url() {
    echo "$DB_TYPE, $DB_USER/$DB_PASS@//$DB_HOST:$DB_PORT/$_DB_NAME"
}


#
# Run a SQL script and display the number of rows inserted and/or updated
# @param string $1 the full path of the SQL script to run
function run_sql_script() {
    local script="$1"
    local DB_URL="$DB_USER/$DB_PASS@//$DB_HOST:$DB_PORT/$_DB_NAME"

    echo "=== ${script##*/} ==="
    ROWS=$(cat ${script} | ${SQLPLUS} -S ${DB_URL} | grep 'rows\? \(created\|updated\)\.')
    CREATED=$(($(echo "$ROWS" | grep created | sed 's/^\([0-9]*\) row.*/+\1/')))
    UPDATED=$(($(echo "$ROWS" | grep updated | sed 's/^\([0-9]*\) row.*/+\1/')))

    SEP=""
    if [ ${CREATED} -gt 0 ]; then echo -n "$CREATED row(s) created"; SEP=", "; fi
    if [ ${UPDATED} -gt 0 ]; then echo -n "$SEP$UPDATED row(s) updated"; SEP="."; fi
    if [ -z "$SEP" ]; then echo ">>> no INSERTs, no UPDATEs?"; else echo "."; fi
}
