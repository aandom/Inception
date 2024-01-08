#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir /home/${USER}/data
        mkdir /home/${USER}/data/db
        mkdir /home/${USER}/data/wp

chown -R aandom42:aandom42 /home/${USER}/data/db
chown -R aandom42:aandom42 /home/${USER}/data/wp

fi