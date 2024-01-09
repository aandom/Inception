FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
              curl \
              php \ 
              ca-certificates \
              php-fpm \
              php-mysql \
              php-mysqli \
              mariadb-client

#to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# copy php configuration file into the image
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY ./tools/create_wordpress.sh /tmp

WORKDIR /var/www/html/wordpress

RUN apt-get install --no-install-recommends -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/create_wordpress.sh"]