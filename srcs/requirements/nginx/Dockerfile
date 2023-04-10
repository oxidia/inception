FROM alpine:3.17

RUN apk add --no-cache nginx

COPY ./conf/wordpress.conf /etc/nginx/http.d/default.conf

# https://ubuntu.com/blog/avoiding-dropped-connections-in-nginx-containers-with-stopsignal-sigquit
STOPSIGNAL SIGQUIT

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
