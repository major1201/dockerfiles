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

# 2. systemd
apt install libsystemd0 systemd -y
apt install cron at unscd rsyslog -y

# drop some files
cd /lib/systemd/system/sysinit.target.wants/ && \
 	ls | grep -v systemd-tmpfiles-setup | xargs rm -f "$1" && \
 	rm -f /lib/systemd/system/sockets.target.wants/*udev*

# mask some services
systemctl mask -- \
 		swap.target \
 		getty.target \
 		getty-static.service \
 		dev-mqueue.mount \
 		systemd-tmpfiles-setup-dev.service \
 		systemd-tmpfiles-setup.service \
 		systemd-remount-fs.service \
 		systemd-update-utmp-runlevel.service \
 		systemd-logind.service  \
        systemd-timesyncd.service \
        apt-daily.timer \
        apt-daily-upgrade.timer \
        cgmanager.service \
        cgproxy.service \
        exim4.service

# map environment variables
mkdir -p /root/.system/
cp /build/configurator_dumpenv.sh /root/.system/
cp /build/configurator_dumpenv.service /etc/systemd/system/
chmod 700 /root/.system/configurator_dumpenv.sh
systemctl enable configurator_dumpenv.service

# config systemd
echo "DefaultLimitNOFILE=1048576:1048576" >> /etc/systemd/system.conf

# clean
apt-get clean
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
rm -f /etc/cron.daily/*
