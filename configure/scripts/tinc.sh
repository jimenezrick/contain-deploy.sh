#!/bin/bash

set -euo pipefail

source $(dirname $0)/../configs/$(basename $0)

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install ${base_pkgs[*]}
sudo apt-get --purge autoremove packagename
sudo apt-get clean

# TODO: install tinc files
rm -rf deploy.sh
(git clone $deploysh_repo && cd deploy.sh && ... XXX)
