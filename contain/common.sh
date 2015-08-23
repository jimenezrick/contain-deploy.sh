set -eu

basedir=$(dirname $0)
base_packages='base base-devel sudo wget'

for s in $basedir/common.d/*
do
	source $s
done

((EUID == 0)) || die "must be run as root"
