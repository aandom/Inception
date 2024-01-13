#!/bin/bash

mkdir -p /var/www

wget --no-check-certificate "https://www.adminer.org/latest.php" -O /var/www/adminer.php

chown -R www-data:www-data /var/www/adminer.php
chmod 775 /var/www/adminer.php

cd /var/www

# rm -rf index.html

mv adminer.php index.php

# php -S 0.0.0.0:8080