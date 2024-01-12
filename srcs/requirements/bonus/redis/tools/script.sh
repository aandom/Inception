#!/bin/bash

# set maxcache memory to size of our choice to limit amount of data redis can store
echo "maxmemory 100mb" >> /etc/redis/redis.conf

#maxmemory-policy
    # allkeys-lru Least Recently Used
    # allkeys-lfu Least Frequently Used
    # noeviction 

echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf

# comment out the line that binds Redis to localhost and to allow external connection
sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf
echo "bind 0.0.0.0" >> /etc/redis/redis.conf

# start Redis server with protected mode disabled, allowing it to accept connections outside localhost
redis-server --protected-mode no
