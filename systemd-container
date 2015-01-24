#!/bin/bash

. $(dirname $0)/common.sh

if [[ $# == 1 && $1 == base ]]
then
	create_base
	build_image base
elif [[ $# == 2 ]]
then
	copy_image $1 $2
	build_image $2
	compress_image $2
else
	usage
fi

# TODO:
# systemd-container build ...
# systemd-container deploy ...
