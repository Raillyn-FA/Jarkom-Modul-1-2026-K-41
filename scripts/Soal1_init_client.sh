#!/bin/bash
# Pasang Default Gateway
ip route add default via 10.84.1.1 2>/dev/null

# Pasang DNS Google
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "Konfigurasi Client berhasil dimuat ulang!"
