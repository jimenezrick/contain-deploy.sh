image_dir() {
	echo $1.image
}

compressed_image() {
	echo $1.image.cpio.xz
}

build_dir() {
	echo $1.build
}

create_base() {
	local image=$(image_dir base)

	echo '==> Creating base'
	rm -rf $image
	mkdir -p $image
	pacstrap -c -d -M $image $base_packages
	sed -i 's/\(^#\)\(.*kernel\.org.*\)/\2/' $image/etc/pacman.d/mirrorlist
}

copy_image() {
	local src_image=$(image_dir $1)
	local dst_image=$(image_dir $2)

	echo "==> Copying $1 as $2"
	rm -rf $dst_image
	cp -a $src_image $dst_image
}

build_image() {
	local image=$(image_dir $1)
	local build=$(build_dir $1)

	date +%Y%m%d%H%M%S >$image/etc/systemd-container-timestamp
	if [[ -x $build/build.sh ]]
	then
		bootstrap_build $1
		echo "==> Building $1"
		systemd-nspawn -D $image /build/build.sh
		rm -rf $image/build
	fi
}

bootstrap_build() {
	local image=$(image_dir $1)
	local build=$(build_dir $1)

	echo "==> Bootstrapping $1"
	cp -r $build $image/build
	cp -r $basedir/build.d $image/build
	cp $basedir/build-common.sh $image/build
}

compress_image() {
	local image=$(image_dir $1)
	local ts=$(cat $image/etc/systemd-container-timestamp)
	local image_ts=$(image_dir $1-$ts)

	mv $image $image_ts
	ln -s $image_ts $image

	echo "==> Compressing $image_ts"
	find $image_ts -depth | cpio -o | xz >$(compressed_image $1-$ts)
}

uncompress_image() {
	local image=$(compressed_image $1)

	echo "==> Uncompressing $image"
	xz -d <$image | cpio -id
}
