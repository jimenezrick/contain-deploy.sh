upgrade_packages() {
	pacman --noconfirm -Syu
}

install_packages() {
	pacman --needed --noconfirm -S $*
}

install_aur_packages() {
	chmod o+w /build
	install_packages $1
	sudo -u nobody bash -c "cd /build && bash <(curl aur.sh) --skippgpcheck $2"
}
