image_dir() {
	echo $1.image
}

build_dir() {
	echo $1.build
}

create_base() {
	local image=$(image_dir base)

	echo '* Creating base'
	rm -rf $image
	mkdir -p $image
	pacstrap -c -d -M $image $base_packages
	sed -i 's/\(^#\)\(.*kernel\.org.*\)/\2/' $image/etc/pacman.d/mirrorlist
}

copy_image() {
	local src_image=$(image_dir $1)
	local dst_image=$(image_dir $2)

	echo "* Copying $1 as $2"
	rm -rf $dst_image
	cp -r --preserve=all $src_image $dst_image
}

build_image() {
	local image=$(image_dir $1)
	local build=$(build_dir $1)

	date +%Y%m%d%H%M%S >$image/etc/systemd-container-timestamp
	if [[ -x $build/build.sh ]]
	then
		bootstrap_build $1
		echo "* Building $1"
		systemd-nspawn -D $image /build/build.sh
		rm -rf $image/build
	fi
}

bootstrap_build() {
	local image=$(image_dir $1)
	local build=$(build_dir $1)

	echo "* Bootstrapping $1"
	cp -r $build $image/build
	cp -r $basedir/build.d $image/build
	cp $basedir/build-common.sh $image/build
}

compress_image() {
	local image=$(image_dir $1)
	local timestamp=$(cat $image/etc/systemd-container-timestamp)

	echo "* Compressing $1"
	tar -c -f $1-$timestamp.tgz -z --transform s/^$image/$1-$timestamp/ $image
}
