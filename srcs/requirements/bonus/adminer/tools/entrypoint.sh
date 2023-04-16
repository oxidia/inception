#!/bin/sh

mkdir -p /var/www

wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/index.php

php-fpm7 -F
