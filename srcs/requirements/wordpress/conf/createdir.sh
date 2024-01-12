#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir /home/${USER}/data
        mkdir /home/${USER}/data/db
        mkdir /home/${USER}/data/wp
        mkdir /home/${USER}/data/rd

chown -R ${USER}:${USER} /home/${USER}/data/db
chown -R ${USER}:${USER} /home/${USER}/data/wp
chown -R ${USER}:${USER} /home/${USER}/data/rd

fi