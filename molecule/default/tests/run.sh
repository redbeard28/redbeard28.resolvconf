#!/bin/bash
user_name=$1

mkdir -p /home/${user_name}/.ssh
chmod 700 /home/${user_name}/.ssh
touch /home/${user_name}/.ssh/authorized_keys
chmod 600 /home/${user_name}/.ssh/authorized_keys
cat pub.keys > /home/${user_name}/.ssh/authorized_keys
chown -R ${user_name}:${user_name} /home/${user_name}/.ssh

exec /usr/sbin/init