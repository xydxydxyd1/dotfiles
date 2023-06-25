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
			exit 1
		fi

		# remove previous mark_name entry
		grep -q -v "$mark_name" < $bookmarks > $bookmarks
	fi

	pwd | xargs printf "$mark_name='%s'\n"
	pwd | xargs printf "$mark_name='%s'\n" >> "$bookmarks"

	source "$bookmarks"	# reload bookmarks
}

# TODO: rm_mark <26-01-23, xydxydxyd1> #
