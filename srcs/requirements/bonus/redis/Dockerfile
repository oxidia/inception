FROM alpine:3.17

RUN apk add --no-cache redis

COPY ./conf/redis.conf /etc/redis.conf

CMD [ "redis-server", "/etc/redis.conf" ]
