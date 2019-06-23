#!/bin/sh

sed -i "/^token/c\\token = ${FRP_TOKEN}" /etc/frps.ini
/usr/local/frp/frps -c /etc/frps.ini
