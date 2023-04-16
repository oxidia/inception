#!/bin/sh

# https://stackoverflow.com/questions/16287559/mysql-adding-user-for-remote-access

if [ -z $DB_NAME ] || [ -z $DB_USER ] || [ -z $DB_PASSWORD ]; then
    echo "environment variables DB_NAME, DB_USER and DB_PASSWORD are required."
    exit 1
fi

# https://mariadb.com/kb/en/mysql_install_db/

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# https://sebhastian.com/mysql-skip-grant-tables-error-fix/

mariadbd --user=mysql --datadir=/var/lib/mysql --bootstrap << EOF
FLUSH PRIVILEGES;

CREATE DATABASE ${DB_NAME};

CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PASSWORD}';

GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}';

EOF

mariadbd-safe --datadir="/var/lib/mysql"
