FROM debian:bullseye 

ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD
ARG MARIADB_ROOT_PASSWORD

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     mariadb-server \
     dumb-init \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/create_user.sh /
RUN chmod +x /create_user.sh


RUN service mariadb start \
    &&  sh /create_user.sh


COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
