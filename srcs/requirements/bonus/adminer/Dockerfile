FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     wget \
     php \
     php-mysql \
     && rm -rf /var/lib/apt/lists/*


COPY ./tools/script.sh /
RUN chmod +x /script.sh
RUN  sh /script.sh

EXPOSE 8080


RUN apt-get update --no-install-recommends -y \
    && apt-get install --no-install-recommends -y \
       dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["php", "-S", "[::]:8080", "-t", "/var/www"]
