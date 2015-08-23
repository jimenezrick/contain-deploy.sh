render_template() {
	local temp=$(mktemp)
	local template=$1.tmpl
	local config=$1.tmpl-conf

	source $config
	source $template >$temp
	echo $temp
}
