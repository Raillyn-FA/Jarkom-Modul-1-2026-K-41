#!/bin/sh
echo "=== Install FTP client di Knights ==="
apk add inetutils-ftp
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Selesai ==="
