#!/bin/bash

set -o errexit
set -o nounset

sudo apt-get update
sudo apt-get -y install nfs-common
git clone https://github.com/aws/efs-utils
cd efs-utils
sudo apt-get update
sudo apt-get -y install binutils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb
cd ~
mkdir efs
sudo mount -t efs $target_efs:/ efs
ls efs
