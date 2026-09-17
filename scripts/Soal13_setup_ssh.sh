#!/bin/sh
echo "=== Setup SSH Server Knights ==="

if ! command -v sshd > /dev/null; then
    apk add openssh
fi

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -A
fi

# Buat user mika_admin kalau belum ada
id mika_admin > /dev/null 2>&1 || adduser -D mika_admin
echo "mika_admin:tempPass123" | chpasswd

# Setup authorized_keys
mkdir -p /home/mika_admin/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1vrSxvwo+d4UBb+QilJANsQLXVPti6RBsAKZv6lBOwnXpt7Gwri49jtzomyMrnsGhe5RXQxIrCdGm/6VyTK81Wll1c1kVJG1GSmKivExwVgKaNTtMbkutNOrzPTIlGtVJrAOQKAecADZq1JjxeHbHHc9FEMzrHnoElXbjEnT+p4heMe4hJ5w/v+BOP77srrpZq2MSOOdvx/kVb0HETw6q2Pag52AJHhXOXDr+PS1G1U1YYTMKbzsGpBGWANz92fhET0BZFd1tUkyFroJ7BN0aABEn1yFnP48bi38gMYO32hYzDqnMEspIKXLmm6q1i9NIZwYTKjxymXuWWWvClTJ7xsS/P6lowqKh7vSSgoR1kH77DRN2TIyOdQr9ihnaulkteT1xRDZ9rb2Yq7Rk3/wO9Rw9wICCe69usPNRJvpvui80zmoCeB+VI46Pjjpj/XzBl2948JgVbduHOgSqka5qg5y0dOwBySa1BMKE5tPNIYmjvMPWPNdo4SgYpvBG8Q8= root@Mika" > /home/mika_admin/.ssh/authorized_keys

chown -R mika_admin:mika_admin /home/mika_admin/.ssh
chmod 755 /home/mika_admin
chmod 700 /home/mika_admin/.ssh
chmod 600 /home/mika_admin/.ssh/authorized_keys

# Pastikan config sshd bener
grep -q "^PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
grep -q "^PubkeyAuthentication yes" /etc/ssh/sshd_config || echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

pkill sshd 2>/dev/null
/usr/sbin/sshd

sleep 1
echo "=== Selesai ==="
ss -tlnp | grep 22
