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

# Activate the plugins
wp plugin update --allow-root --all

# launch php-fpm
fi

# exec "$@"
mkdir -p /run/php/

php-fpm7.4 -F