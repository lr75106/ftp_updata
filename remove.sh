#!/bin/bash
yum remove vsftpd -y
rm -rf /ftp
rm -rf /etc/vsftpd
