FROM alpine:3.17

RUN apk add --no-cache nginx

COPY ./conf/wordpress.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /etc/ssl/certs/wordpress && mkdir -p /etc/ssl/private/wordpress

COPY ./conf/wordpress.crt /etc/ssl/certs/wordpress/
COPY ./conf/wordpress.key /etc/ssl/private/wordpress/

# https://ubuntu.com/blog/avoiding-dropped-connections-in-nginx-containers-with-stopsignal-sigquit
STOPSIGNAL SIGQUIT

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
