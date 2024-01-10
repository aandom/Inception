FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     vsftpd \
     && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /
RUN chmod +x /script.sh

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# RUN apt-get install -y dumb-init

RUN apt-get update --no-install-recommends -y \
    && apt-get install --no-install-recommends -y \
       dumb-init \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/script.sh"]
