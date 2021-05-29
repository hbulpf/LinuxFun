#!/bin/bash
user='lipengfei'
key='chenqiren@504'
echo "create user [$user]"
groupadd -r $user
useradd -m -r -g $user $user -d /home/$user
echo $key | passwd --stdin $user
sed -i "/^root/a\\${user} ALL = (ALL:ALL) ALL" /etc/sudoers
usermod -aG docker ${user}
