#!/bin/sh
echo "[+] Mengatur DNS dan menginstal lftp di Mika..."
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apk update && apk add lftp 2>/dev/null

echo "[+] Menghubungkan ke Chisa untuk Download File & Uji Upload (Read-Only)..."
lftp -u mika,mikapass123 10.84.2.2 -e "get protokol_tujuh.txt; put /etc/passwd -o test_upload.txt; quit"

echo "[✓] Selesai! Periksa apakah file protokol_tujuh.txt sudah ada dan error 550 muncul saat upload."
