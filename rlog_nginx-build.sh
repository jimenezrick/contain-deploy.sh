#!/bin/bash

. $(dirname $0)/common.sh

copy_container $base_container $container
build_container <<EOF
pacman -S nginx
EOF
