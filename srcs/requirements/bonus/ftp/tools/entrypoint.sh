#!/bin/sh

adduser $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown -R $FTP_USER:$FTP_USER /var/www

echo $FTP_USER > /etc/vsftpd/vsftpd.userlist

vsftpd /etc/vsftpd/vsftpd.conf
