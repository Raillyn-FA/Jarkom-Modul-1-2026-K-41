#!/bin/sh
echo "=== Setup Telnetd Chisa ==="

if ! command -v telnetd > /dev/null; then
    echo "[*] Installing busybox-extras..."
    apk add busybox-extras
fi

echo "[*] Setting up user phantom_user..."
id phantom_user > /dev/null 2>&1 || adduser -D phantom_user
echo "phantom_user:wired_ghost" | chpasswd

echo "[*] Starting telnetd..."
pkill telnetd 2>/dev/null
telnetd -l /bin/login &

sleep 1
echo "=== Setup selesai ==="
ss -tlnp | grep 23
