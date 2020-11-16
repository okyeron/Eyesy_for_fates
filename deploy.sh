#!/bin/bash

set -ex

# Add nodejs Debian package as source.
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

# Debian packages
sudo apt install -y python-pygame python-liblo python-alsaaudio python-pip nodejs

# Python packages
sudo pip install psutil cherrypy

# Node packages
cd web/node && npm install && cd ../..

services=("eyesy-python.service" "eyesy-web.service" "eyesy-web-socket.service" "eyesy-pd.service")
for i in "${services[@]}"
do
  sudo chmod 644 systemd/$i
  sudo cp systemd/$i /etc/systemd/system
done

cp pd/*.pd_linux ../../pdexternals

sudo systemctl daemon-reload
