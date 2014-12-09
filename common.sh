set -eu

base_container=$(dirname $0)/base
base_packages='base base-devel'
container=$(dirname $0)/$(basename -s -build.sh $0)
container_build=$container/build.sh

die() {
	echo "Error: $*" >&2
	exit 1
}

copy_container() {
	echo "* Copying $1 container as $2"
	rm -rf $2
	cp -r --preserve=all $1 $2
}

build_container() {
	echo '#!/bin/sh' >$container_build
	echo 'set -eu' >>$container_build
	echo "echo '* Building container'" >>$container_build
	cat >>$container_build
	chmod +x $container_build
	systemd-nspawn -D $container /build.sh
}

compress_container() {
	echo '* Compressing container'
	tar cfz $container.tar.gz $container
}

((EUID == 0)) || die "must be run as root"
