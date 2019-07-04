#!/bin/sh

set -e

if [ "${DANTE_USERNAME}" = "" ]; then
    sed -i '/SOCKSMETHOD_TAG/{n;s/.*/    socksmethod: none/;}' /etc/sockd/sockd.conf
    sed -i '/SOCKSMETHOD_SOCKS/{n;s/.*/    # DO NOT DELETE THIS LINE/;}' /etc/sockd/sockd.conf
else
    sed -i '/SOCKSMETHOD_TAG/{n;s/.*/    socksmethod: username/;}' /etc/sockd/sockd.conf
    sed -i '/SOCKSMETHOD_SOCKS/{n;s/.*/    socksmethod: username/;}' /etc/sockd/sockd.conf
    id "${DANTE_USERNAME}" > /dev/null 2>&1 || adduser -DH "${DANTE_USERNAME}"
    echo "${DANTE_USERNAME}:${DANTE_PASSWORD}" | chpasswd
fi

# shellcheck disable=SC2068
sockd -f /etc/sockd/sockd.conf $@
