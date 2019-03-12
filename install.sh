#!/usr/bin/env bash

echo "** updating apt and installing nginx"
apt-get update
apt-get install -y nginx

systemctl status nginx

echo "** enable autostart of nginx"
systemctl enable nginx

mkdir -p /var/www/web-FN
cp index.html /var/www/web-FN
cp web-fn.conf /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/web-fn.conf /etc/nginx/sites-enabled/web-fn.conf

nginx -t
systemctl restart nginx
