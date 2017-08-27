#!/bin/bash

# install sudo
pacman -S --noconfirm sudo

echo "%wheel      ALL=(ALL) ALL" | tee -a /etc/sudoers.d/wheel

# add my user
groupadd hobag
useradd -m -g hobag -G wheel -s /bin/bash hobag

user_password="$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c16)"
echo "hobag:${user_password}" | chpasswd
echo "hobag's temporary password: ${user_password}"

# change hostname
sed -i 's/arch-linux/arch-devbox/g' '/etc/hostname'
sed -i 's/arch-linux/arch-devbox/g' '/etc/hosts'
