#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout wordpress.key -out wordpress.crt -config openssl-wordpress.conf
