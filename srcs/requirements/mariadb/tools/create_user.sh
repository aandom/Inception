#!/bin/bash

# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
# mysql -u root -e  "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO 'root'@'%';"
# mysql -u root -e "FLUSH PRIVILEGES;"

 mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; \
                    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; \
                    GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; \
                    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; \
                    FLUSH PRIVILEGES;"

#  mysql -u root -e  "FLUSH PRIVILEGES;"