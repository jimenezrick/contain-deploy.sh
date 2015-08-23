#!/bin/bash

# TODO: Usage, getopts, check script exists, copy files, remove trap EXIT files

set -euo pipefail

function source_script() {
	local conf_path=$(dirname $0)/confs/$1.sh
	local script_path=$(dirname $0)/scripts/$1.sh

	if [[ -e $conf_path ]]
	then
		source $conf_path
	fi
	source $script_path
}

host=$1
for script in "${@:2}"
do
	echo "==> Executing $script in $host"
	ssh $host "$(source_script $script)"
done
echo "==> Done"
