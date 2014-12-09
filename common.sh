set -eu

basedir=$(dirname $0)
base_packages='base'

for s in $basedir/common.d/*
do
	source $s
done

((EUID == 0)) || die "must be run as root"
