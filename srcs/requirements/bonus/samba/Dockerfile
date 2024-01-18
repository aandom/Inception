FROM debian:bullseye
# Install Samba
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y samba && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user for Samba
ARG SMB_USER
ARG SMB_PASSWORD

COPY ./tools/script.sh /
RUN chmod +x /script.sh && sh /script.sh

# Copy Samba configuration file
COPY ./conf/smb.conf /etc/samba/smb.conf
COPY ./conf/smb.conf /data/

# Expose Samba ports
EXPOSE 139 445

# Start Samba
CMD ["smbd", "--foreground", "--no-process-group"]