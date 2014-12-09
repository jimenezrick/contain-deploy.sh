http_temp() {
	temp=$(mktemp)
	curl $1 >$temp
	echo $temp
}
