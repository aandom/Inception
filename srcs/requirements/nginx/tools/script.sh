#!/bin/bash

if [ ! -f /etc/ssl/aandom.crt ]; then
       echo "Nginx: setting up ssl ...";

       openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
              -out /etc/ssl/aandom.crt \
              -keyout /etc/ssl/aandom.key \
              -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42 School/OU=aandom/CN=aandom/"
fi

nginx -g "daemon off;"

