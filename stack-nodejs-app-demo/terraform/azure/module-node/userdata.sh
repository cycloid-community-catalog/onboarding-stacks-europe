#!/bin/bash
until sudo apt-get update; do sleep 1; done
until sudo apt-get install git curl -y; do sleep 1; done
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs -y
git clone ${git_app_url} webapp
cd webapp
sed -i 's/"homepage": ".*"/"homepage": "."/g' package.json
npm install
sudo npm start -- --port 80 --host 0.0.0.0