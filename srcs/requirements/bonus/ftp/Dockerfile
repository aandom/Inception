FROM debian:bullseye 

RUN apt-get update --no-install-recommends -y

RUN apt-get install --no-install-recommends -y \
     vsftpd \
     dumb-init \
     && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /
RUN chmod +x /script.sh

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/script.sh"]
