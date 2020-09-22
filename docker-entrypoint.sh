#!/bin/sh
mkdir -p /run/nginx/
touch /run/nginx/nginx.pid
nginx -g "daemon off;" 


#ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
#ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
#ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
#ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ed25519_key
