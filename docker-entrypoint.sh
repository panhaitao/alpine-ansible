#!/bin/sh

mkdir -pv /data/ 
cd /data && git clone https://github.com/panhaitao/ansible-playbook-store.git playbook

mkdir -p /run/nginx/
touch /run/nginx/nginx.pid
nginx -g "daemon off;" 
chown root:nginx /var/www/localhost/* 

ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -P "" -q
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -P "" -q
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P "" -q
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ed25519_key -P "" -q
/usr/sbin/sshd -f /etc/ssh/sshd_config
