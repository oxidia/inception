FROM alpine:3.15

RUN apk add --no-cache \
    php7 \
    php7-fpm \
    php7-common \
    php7-session \
    php7-gd \
    php7-mysqli \
    php7-cgi \
    fcgi \
    php7-pdo \
    php7-pdo_mysql

COPY ./conf/php-fpm.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/adminer

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php 

CMD [ "php-fpm7", "-F" ]
