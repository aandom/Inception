#!/bin/bash

# -newkey rsa:4096 - new rsa key length of 4096
# -x509 used to create self-signed certificate
# -sha256 algorithm for generating the certeficate
# -days 365 validity period
# -nodes used to create key without passphrase

if [ ! -f /etc/ssl/aandom.crt ]; then
       echo "Nginx: setting up ssl ...";

       openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
              -out /etc/ssl/aandom.crt \
              -keyout /etc/ssl/aandom.key \
              -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42 School/OU=aandom/CN=aandom/"
fi

# start nginx in foreground and turnof the background process
nginx -g "daemon off;"

