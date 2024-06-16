#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")"

rm /var/www/html/index.nginx-debian.html

sed 44p"autoindex on;" /etc/ningx/sites-available/default
