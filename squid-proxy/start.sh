#!/bin/sh

/usr/bin/htpasswd -bc /opt/passwd "${SQUID_PROXY_USERNAME}" "${SQUID_PROXY_PASSWORD}"
chown squid. /dev/stdout
/usr/sbin/squid -N
