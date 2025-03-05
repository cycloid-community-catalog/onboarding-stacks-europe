#!/bin/bash
until sudo apt-get update; do sleep 1; done
until sudo apt-get install git curl -y; do sleep 1; done
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs -y
cd /tmp
git clone ${git_app_url} webapp
cd webapp
sed -i 's/"homepage": ".*"/"homepage": "."/g' package.json
sudo npm install
sudo npm run build
sudo mkdir /var/www/
sudo mv build/ /var/www/
until sudo apt-get install nginx -y; do sleep 1; done
sudo cat << EOF >/etc/nginx/sites-enabled/default
server {
    listen 0.0.0.0:80;
    server_name _;
    access_log /var/log/nginx/app.log;
    root /var/www/build;
    index index.html index.htm;
}
EOF
sudo service nginx stop
sudo service nginx start
