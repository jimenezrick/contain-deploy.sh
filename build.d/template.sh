render_template() {
	local temp=$(mktemp)
	local config=$1.conf
	local template=$1.tmpl

	source $config
	source $template >$temp
	echo $temp
}
