#!/bin/bash

set -e
set -x

cd /root/rpmbuild

# build dependencies
yum-builddep -y "${@: -1}"  # last argument

# start build
rpmbuild --define "debug_package %{nil}" -bb $*
