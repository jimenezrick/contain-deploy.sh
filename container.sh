#!/bin/bash

. $(dirname $0)/common.sh

rm -rf $container
mkdir -p $container

if [[ $# == 1 ]]
then
	pacstrap -c -d -M $container $base_packages
	sed -i 's/\(^#\)\(.*kernel\.org.*\)/\2/' $container/etc/pacman.d/mirrorlist
else
	copy_container $base_container $container
	build_container
fi
