FROM debian:bullseye

RUN		apt-get update --no-install-recommends -y
RUN		apt-get install --no-install-recommends -y \ 
                nginx \
                openssl

COPY ./tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf


EXPOSE	443

RUN apt-get install --no-install-recommends -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# CMD ["nginx", "-g", "daemon off;"]

CMD ["/usr/local/bin/script.sh"]
