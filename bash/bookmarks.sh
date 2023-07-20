mydir="$( dirname -- "${BASH_SOURCE[0]}" )"
bookmarks="$mydir/bookmarks.txt"

# Import all bookmarks

if [[ -f "$bookmarks" ]]; then
    source "$bookmarks"
fi


set_mark(){
	# TODO: Verbosity level <26-01-23, xydxydxyd1> #
	# TODO: Bookmark Description <26-01-23, xydxydxyd1> #

	mark_name="mk_$1"

	if [[ -n ${!mark_name} ]]; then
		read -r -p 'Mark already exists. Override (y/n)? ' yn
		if [[ "$yn" != 'y' ]]; then
			return
		fi

		# remove previous mark_name entry
		sed -i -e "/$mark_name/d" "$bookmarks"
	fi

	pwd | xargs printf "$mark_name='%s'\n"
	pwd | xargs printf "$mark_name='%s'\n" >> "$bookmarks"

	source "$bookmarks"	# reload bookmarks
}

rm_mark(){
	mark_name="mk_$1"
	if [[ -z $(cat $bookmarks | grep -e $mark_name=) ]]; then
		echo "$mark_name does not exist"
		return
	fi
	read -r -p "Remove $mark_name?" yn
	if [[ "$yn" != 'y' ]]; then
		echo "Aborted"
		return
	fi
	sed -i -e "/$mark_name/d" "$bookmarks"
	echo "restart shell for removal to take effect"
}
