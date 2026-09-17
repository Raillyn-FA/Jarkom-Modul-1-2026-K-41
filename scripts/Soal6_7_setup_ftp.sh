#!/bin/sh

echo "=== Setup FTP Server Chisa (Full) ==="

if ! command -v vsftpd > /dev/null; then
    echo "[*] Installing vsftpd..."
    apk add vsftpd
fi

echo "[*] Writing vsftpd config..."
rm -f /etc/vsftpd/vsftpd.conf
echo "listen=YES" >> /etc/vsftpd/vsftpd.conf
echo "anonymous_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "xferlog_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "connect_from_port_20=YES" >> /etc/vsftpd/vsftpd.conf
echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=30000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=31000" >> /etc/vsftpd/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "userlist_deny=YES" >> /etc/vsftpd/vsftpd.conf
echo "userlist_file=/etc/vsftpd.user_list" >> /etc/vsftpd/vsftpd.conf

echo "[*] Setting up user alice..."
id alice > /dev/null 2>&1 || adduser -D alice
echo "alice:alicepass123" | chpasswd

echo "[*] Setting up user mika..."
id mika > /dev/null 2>&1 || adduser -D mika
echo "mika:mikapass123" | chpasswd
mkdir -p /home/mika/ftp
chown root:root /home/mika/ftp
chmod 555 /home/mika/ftp

if [ ! -f /home/mika/ftp/protocol7_manifesto.zip ]; then
    echo "[*] Downloading protocol7_manifesto.zip..."
    wget "https://drive.google.com/uc?export=download&id=1tKZu0rcti4t-fXX4jtXDSKDBWzsawfoN" -O /home/mika/ftp/protocol7_manifesto.zip
fi

echo "[*] Setting up user eiri (blacklisted)..."
id eiri > /dev/null 2>&1 || adduser -D eiri
echo "eiri:eiripass123" | chpasswd
echo "eiri" > /etc/vsftpd.user_list

echo "[*] Restarting vsftpd..."
pkill vsftpd 2>/dev/null
sleep 1
vsftpd /etc/vsftpd/vsftpd.conf &

sleep 1
echo "=== Setup selesai ==="
ps aux | grep vsftpd
