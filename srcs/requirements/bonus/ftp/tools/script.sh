#!/bin/bash

service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders
adduser $FTP_USR --disabled-password

#Sets the password for the newly created user
echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd
#Adds the new user to the vsftpd userlist
echo "$FTP_USR" | tee -a /etc/vsftpd.userlist 

#Create FTP Directory Structure
mkdir /home/$FTP_USR/ftp
chown nobody:nogroup /home/$FTP_USR/ftp
chmod a-w /home/$FTP_USR/ftp

#Create Subdirectory for Files
mkdir /home/$FTP_USR/ftp/files
chown $FTP_USR:$FTP_USR /home/$FTP_USR/ftp/files

# restart the vsftpd service
service vsftpd stop
/usr/sbin/vsftpd