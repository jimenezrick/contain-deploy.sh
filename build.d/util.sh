temp_http() {
	local temp=$(mktemp -p /build)

	curl -L $1 >$temp
	echo $temp
}

temp_content() {
	local temp=$(mktemp -p /build)

	echo "$1" >$temp
	echo $temp
}
