#!/bin/bash


mkdir -p /data && chmod -R 777 /data


mkdir -p /var/run/samba && chmod 1777 /var/run/samba

useradd -M -d /nonexistent -s /sbin/nologin -U ${SMB_USER} && \
    (echo ${SMB_PASSWORD}; echo ${SMB_PASSWORD}) | smbpasswd -s -a ${SMB_USER}

# -d /nonexistent: Sets the home directory to /nonexistent. used for system users that don't need an actual home directory.
# -M don't create home directory
# smbpasswd sets password for specific user

