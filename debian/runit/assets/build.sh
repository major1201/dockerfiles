#!/bin/bash
set -e

# 1. base
if [[ "${REGION}" = "cn" ]]; then
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
    sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
fi

apt update
apt install gnupg2 -y
DEBIAN_FRONTEND=noninteractive apt install vim localepurge python curl lsof wget less telnet -y --yes

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen

locale-gen --purge en_US

# set default editor to vim
update-alternatives --set editor /usr/bin/vim.basic

# disable ntp service
update-rc.d -f ntp remove

# 2. runit
apt install runit -y
apt install cron at unscd rsyslog -y

# install services
mv /build/services/* /etc/service

# clean
apt-get clean
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
rm -f /etc/cron.daily/*
