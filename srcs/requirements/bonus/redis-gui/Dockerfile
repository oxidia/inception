FROM alpine:3.17

RUN apk add --no-cache npm
RUN npm i -g redis-commander 
COPY ./tools/entrypoint.sh tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
