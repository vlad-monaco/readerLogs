#!/bin/bash

mkdir -p /var/log/nginx/
touch /var/log/nginx/error.log
touch /var/log/nginx/access.log
chmod -R 777 /var/log/nginx

until nc -zvw3 nodejs.vlad-nginx_default 5000; do
    >&2 echo "nginx sleeping"
    sleep 5
done

echo "nginx starting"
exec $@

