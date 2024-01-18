#!/bin/bash

mkdir -p /var/www

# download latest verstion of adminer and skip ssl validation
wget --no-check-certificate "https://www.adminer.org/latest.php" -O /var/www/adminer.php

# Set Ownership and Permissions
chown -R www-data:www-data /var/www/adminer.php
chmod 775 /var/www/adminer.php

cd /var/www

# rm -rf index.html

mv adminer.php index.php

# php -S 0.0.0.0:8080