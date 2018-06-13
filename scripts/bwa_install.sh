#!/bin/bash

set -o errexit
set -o nounset

apt-get update
apt-get install -y dpkg-dev gcc g++ libc6-dev make patch tar unzip zlib1g-dev
wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.8.tar.bz2
tar xjvf bwa-0.7.8.tar.bz2
cd bwa-0.7.8
make

