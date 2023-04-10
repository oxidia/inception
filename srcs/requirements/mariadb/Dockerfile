FROM alpine:3.17

RUN apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/my.cnf.d

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod u+x  /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
