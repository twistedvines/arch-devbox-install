#!/bin/bash

# This script tidies up after the installation process.

passwd_group="$(grep "nopasswd" /etc/group)"
if [ -n "$passwd_group" ]; then
  # revoke hobag's nopasswd group membership
  gpasswd -d hobag nopasswd
fi

# add hobag to wheel group for password sudo
usermod -a -G wheel hobag

exit 0
