temp_http() {
	local temp=$(mktemp)

	curl -L $1 >$temp
	echo $temp
}

temp_content() {
	local temp=$(mktemp)

	echo "$1" >$temp
	echo $temp
}
