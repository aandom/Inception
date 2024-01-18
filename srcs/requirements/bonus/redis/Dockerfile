FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     redis \
     dumb-init \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /
RUN chmod +x /script.sh

EXPOSE 6379

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/script.sh"]