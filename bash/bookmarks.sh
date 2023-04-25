mydir="$( dirname -- "${BASH_SOURCE[0]}" )"
bookmarks="$mydir/bookmarks.txt"

# Import all bookmarks

if [[ -f "$bookmarks" ]]; then
    source "$bookmarks"
fi


set_mark(){
	# TODO: Input Validation <26-01-23, xydxydxyd1> #
	# TODO: Verbosity level <26-01-23, xydxydxyd1> #
	# TODO: Bookmark Description <26-01-23, xydxydxyd1> #
	pwd | xargs printf "mk_$1=\'%s\'\n"
	pwd | xargs printf "mk_$1=\'%s\'\n" >> "$bookmarks"
	source "$bookmarks"	# reload bookmarks
}


# TODO: rm_mark <26-01-23, xydxydxyd1> #
