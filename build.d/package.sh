upgrade_packages() {
	pacman --noconfirm -Syu
}

install_packages() {
	pacman --needed --noconfirm -S $*
}
