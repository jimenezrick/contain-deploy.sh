die() {
	echo "Error: $*" >&2
	exit 1
}

usage() {
	echo "Usage: $0 <baseimage> [<image>]" >&2
	exit 2
}
