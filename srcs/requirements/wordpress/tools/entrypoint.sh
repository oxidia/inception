#!/bin/sh

# https://make.wordpress.org/cli/handbook/how-to/how-to-install/#step-1-download-wordpress

if ! wp --allow-root core is-installed; then

    wp --allow-root core download --path=/var/www/wordpress

    wp --allow-root config create \
        --dbhost="$DB_HOSTNAME" \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD"

    wp --allow-root db create

    # https://wordpress.org/plugins/redis-cache/#installation
    # https://github.com/rhubarbgroup/redis-cache/blob/develop/INSTALL.md

    wp --allow-root core install \
        --url="$DOMAIN_NAME" \
        --title="$TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL"

    wp --allow-root plugin install redis-cache --activate

    wp --allow-root config set WP_REDIS_HOST "$REDIS_HOST"

    wp --allow-root config set WP_REDIS_PORT "$REDIS_PORT"

fi

php-fpm7 -F
