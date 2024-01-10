#!/bin/bash


service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser $FTP_USR --disabled-password

echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd

echo "$FTP_USR" | tee -a /etc/vsftpd.userlist 


mkdir /home/$FTP_USR/ftp


chown nobody:nogroup /home/$FTP_USR/ftp
chmod a-w /home/$FTP_USR/ftp

mkdir /home/$FTP_USR/ftp/files
chown $FTP_USR:$FTP_USR /home/$FTP_USR/ftp/files

service vsftpd stop


/usr/sbin/vsftpd