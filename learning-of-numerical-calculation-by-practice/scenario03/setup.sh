#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")"

mkdir -p /root/work
apt-get update && apt-get install -y tig vim gfortran gcc nginx && \
rm /var/www/html/index.nginx-debian.html && \
sed -i '45i  autoindex on;' /etc/nginx/sites-available/default
