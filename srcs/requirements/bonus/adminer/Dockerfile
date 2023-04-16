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

COPY ./tools/entrypoint.sh /tmp

RUN chmod u+x /tmp/entrypoint.sh

WORKDIR /var/www/adminer

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
