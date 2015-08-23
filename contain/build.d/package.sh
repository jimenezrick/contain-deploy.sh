upgrade_packages() {
	pacman --noconfirm -Syu
}

install_packages() {
	pacman --needed --noconfirm -S $*
}

install_local_packages() {
	pacman --needed --noconfirm -U $*
}

install_aur_packages() {
	chmod o+w /build
	sudo -u nobody bash -c "cd /build && bash <(curl aur.sh) --skippgpcheck $1"
	install_local_packages /build/$1/$1-*.pkg.tar.xz
}
