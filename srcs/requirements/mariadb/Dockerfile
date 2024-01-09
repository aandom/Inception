FROM debian:bullseye 

ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD
ARG MARIADB_ROOT_PASSWORD

# RUN apt-get update

# RUN apt-get install -y mariadb-server \
#     && rm -rf /var/lib/apt/lists/*

# # creates a directory to hold the database socket file.
# RUN mkdir -p /var/run/mysql
# RUN chown -R mysql:mysql /var/run/mysql

# # RUN mkdir -p /var/run/mysqld \
# # && chown -R mysql:mysql /var/run/mysqld \
# # && chmod 777 /var/run/mysqld

# # RUN service mysql start \

# RUN service mariadb start \
#     &&  mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; \
#                         ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; \
#                         GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; \
#                         FLUSH PRIVILEGES;"

# COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# # COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# EXPOSE 3306

# # COPY ./tools/create_user.sh /usr/local/bin/
# # RUN chmod +x /usr/local/bin/create_user.sh
# # RUN sh /usr/local/bin/create_user.sh

# RUN apt-get update && apt-get install -y dumb-init
# # COPY ./tools/create_user.sh /
# # RUN chmod +x /create_user.sh
# # RUN bash /create_user.sh

# # COPY ./tools/init_db.sh /docker-entrypoint-initdb.d/init_db.sh
# # RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh


# ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# CMD ["mysqld", "--bind-address=0.0.0.0"]


RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/create_user.sh /
RUN chmod +x /create_user.sh


RUN service mariadb start \
    &&  sh /create_user.sh

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306

RUN apt-get update --no-install-recommends -y
RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

















