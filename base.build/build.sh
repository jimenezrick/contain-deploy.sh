#!/bin/bash

. $(dirname $0)/build-common.sh

upgrade_packages

sed -i 's/^#\(en_US\)/\1/' /etc/locale.gen
locale-gen
install -m 644 $(temp_content 'LANG=en_US.UTF-8') /etc/locale.conf
