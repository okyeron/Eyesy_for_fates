#!/bin/bash
pidof pd | xargs -r kill

amixer cset numid=11 off

systemctl stop eyesy-python.service
systemctl stop eyesy-web.service
systemctl stop eyesy-web-socket.service

