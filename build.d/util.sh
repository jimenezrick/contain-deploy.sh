http_temp() {
	temp=$(mktemp)
	curl -L $1 >$temp
	echo $temp
}
