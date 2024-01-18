if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	echo "installing now"

# Download wordpress files
wp core download  --path="/var/www/html/wordpress" --allow-root

# Generate and configure the wp-config.php file
wp config create --path="/var/www/html/wordpress" --allow-root \
				 --dbname=$MARIADB_DATABASE \
				 --dbuser=$MARIADB_USER \
				 --dbpass=$MARIADB_PASSWORD \
				 --dbhost=$MYSQL_HOST \
				 --dbprefix=wp_

# Runs the standard wordpress installation process - create the wordpress tables in db
wp core install --path="/var/www/html/wordpress" --allow-root \
				--url=$WP_URL \
				--title="$WP_TITLE" \
				--admin_user=$WP_ADMIN_USR \
				--admin_password=$WP_ADMIN_PWD \
				--admin_email=$WP_ADMIN_EMAIL

# Create user in wordpress
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" \
			   --allow-root $WP_USR $WP_EMAIL \
			   --user_pass=$WP_PWD

# install the Astra theme for WordPress and activate it
# wp theme install astra --activate --allow-root
# mkdir -p /var/www/html/wordpress/wp-content/cache

# install the Redis Cache plugin and activate it
wp plugin install redis-cache --activate --allow-root

wp config set WP_CONTENT_DIR /var/www/html/wordpress/wp-content --type=constant --add --allow-root
wp config set WP_CONTENT_URL https://aandom.42.fr/wordpress/wp-content --type=constant --add --allow-root

chmod -R 0777 /var/www/html/wordpress/wp-content/
chown -R www-data:www-data /var/www/html/wordpress/wp-content



# Activate the plugins
wp plugin update --allow-root --all

# Set Redis-related constants
wp config set WP_CACHE true --raw --allow-root
wp config set WP_REDIS_HOST 'redis' --type=constant --add --allow-root
wp config set WP_REDIS_PORT 6379 --type=constant --add --allow-root

wp config set WP_REDIS_PLUGIN_PATH /var/www/html/wordpress/wp-content/plugins/redis-cache --type=constant --add --allow-root
wp redis enable --allow-root

chown www-data:www-data /var/www/html/wordpress/wp-content/object-cache.php
chmod 666 /var/www/html/wordpress/wp-content/object-cache.php

# wp plugin update --allow-root --all

wp core update --allow-root
wp plugin update --all --allow-root  

# launch php-fpm
fi

# exec "$@"
mkdir -p /run/php/

php-fpm7.4 -F