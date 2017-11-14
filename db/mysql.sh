#!/bin/bash
#
# Database driver for MySQL
#

#
# Expected environment variables

# Database type must be mysql
DB_TYPE=${DB_TYPE:?}
if [ "$DB_TYPE" != "mysql" ]; then
    echo "Invalid/unknown value of DB_TYPE; the expected value is 'mysql'".
    exit
fi

# Default values for host and port
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-3306}
# The database connection parameters are required
DB_USER=${DB_USER:?}
DB_PASS=${DB_PASS:?}
DB_NAME=${DB_NAME:?}

# Default value for tools
MYSQL_CLIENT=${MYSQL_CLIENT:-/bin/mysql}


function database_url() {
    echo "mysql://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/$DB_NAME"
}


#
# Run a SQL script
# @param string $1 the full path of the SQL script to run
function run_sql_script() {
    local script="$1"

    echo "=== ${script##*/} ==="
    ${MYSQL_CLIENT} -h${DB_HOST} -u${DB_USER} -p${DB_PASS} -D${DB_NAME} < $script 2>/dev/null
}
