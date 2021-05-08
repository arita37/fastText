#!/usr/bin/env bash
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

yum update -y > /dev/null
yum install -y gcc gcc-c++ make cmake openssl-devel bzip2-devel wget libffi-devel perl > /dev/null

DIR=$(pwd)
cd /usr/src
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz > /dev/null
tar xzf Python-3.7.0.tgz > /dev/null
cd Python-3.7.0
./configure --enable-optimizations > /dev/null
make altinstall > /dev/null
ln -s /usr/local/bin/python3.7 /usr/bin/python3.7
ln -s /usr/local/bin/pip3.7 /usr/bin/pip3.7
rm /usr/src/Python-3.7.0.tgz
cd $DIR