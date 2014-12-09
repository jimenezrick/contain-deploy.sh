temp_http() {
	temp=$(mktemp)
	curl -L $1 >$temp
	echo $temp
}

temp_content() {
	temp=$(mktemp)
	echo "$1" >$temp
	echo $temp
}
