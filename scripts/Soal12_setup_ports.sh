#!/bin/sh
echo "=== Setup Open Ports Knights ==="

if ! command -v sshd > /dev/null; then
    apk add openssh
fi

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -A
fi

pkill sshd 2>/dev/null
/usr/sbin/sshd

pkill nc 2>/dev/null
nc -lk -p 80 &

sleep 1
echo "=== Selesai ==="
ss -tlnp
