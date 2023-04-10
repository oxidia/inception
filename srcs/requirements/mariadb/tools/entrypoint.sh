#!/bin/sh

# https://stackoverflow.com/questions/16287559/mysql-adding-user-for-remote-access

if [ -z $WP_DB_NAME ] || [ -z $WP_DB_USER ] || [ -z $WP_DB_PASSWORD ]; then
    echo "environment variables WP_DB_NAME, WP_DB_USER and WP_DB_PASSWORD are required."
    exit 1
fi

# https://mariadb.com/kb/en/mysql_install_db/

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# https://sebhastian.com/mysql-skip-grant-tables-error-fix/

mariadbd --user=mysql --datadir=/var/lib/mysql --bootstrap << EOF
FLUSH PRIVILEGES;

CREATE DATABASE ${WP_DB_NAME};

CREATE USER '${WP_DB_USER}' IDENTIFIED BY '${WP_DB_PASSWORD}';

GRANT ALL PRIVILEGES ON *.* TO '${WP_DB_USER}';

EOF

mariadbd-safe --datadir="/var/lib/mysql"
