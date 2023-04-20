#!/bin/sh

if [ -z $REDIS_HOST ] || [ -z $REDIS_PORT ]; then
    echo "environment variables REDIS_HOST and REDIS_PORT are required."
    exit 1
fi

while true; do
    ping_result=$(echo "PING" | nc $REDIS_HOST $REDIS_PORT | tr -d "\r\n")

    [ "$ping_result" = "+PONG" ] && break || echo "redis server is not ready..."
	sleep 1
done

redis-commander --redis-host="$REDIS_HOST" --redis-port="$REDIS_PORT"
