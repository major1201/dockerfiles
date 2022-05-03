#!/bin/bash

set -euo pipefail

# 1. base
if [[ "${REGION}" = "cn" ]]; then
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
fi

apt update

apt-get install -y jq

if [ ! -L /usr/lib/x86_64-linux-gnu/libGL.so.1 ]; then
  apt-get install -y libgl1-mesa-glx
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libxdamage.so.1 ]; then
  apt-get install -y libxdamage1
fi

# clean
apt-get clean
rm -rf /build
