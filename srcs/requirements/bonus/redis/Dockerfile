FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     redis \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /
RUN chmod +x /script.sh

EXPOSE 6379

RUN apt-get update --no-install-recommends -y \
    && apt-get install --no-install-recommends -y \
       dumb-init \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/script.sh"]