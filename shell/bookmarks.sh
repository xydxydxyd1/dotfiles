#!/bin/bash

# Note: use `-P` flag when `cd` into symlink to resolve dot-dot. Otherwise, your pwd will look
# like ~/.mk/mark_name instead of ~/some/directory/mark_name, and when you try to go back with
# `cd ..` you will end up in the bookmark directory

# Set default bookmark directory
[ -n "$mark_folder" ] || mark_folder="$HOME/.mk"

# Create bookmark directory if not present
[ -d "$mark_folder" ] || mkdir "$mark_folder"

# For easy access of bookmarks: $mk/mark_name
export mk="$mark_folder"
export Mk="$mark_folder"

set_mark(){
	# TODO: Verbosity level <26-01-23, xydxydxyd1> #
	# TODO: Bookmark Description <26-01-23, xydxydxyd1> #

    dest="$(pwd)/$2"
    if [[ ! -e $dest ]]; then
        echo "$dest does not exist. Aborting..."
        return
    fi

	curr_mark_path="$mark_folder/$1"
	if [[ -e $curr_mark_path ]]; then
		read -r -p 'Mark already exists. Override (y/n)? ' yn
        if [[ "$yn" != 'y' ]]; then
            echo 'Aborting...'
            return
        fi

		# remove previous curr_mark_path entry
        rm -f "$curr_mark_path"
	fi

    ln -sr "$dest" "$curr_mark_path"
    echo "Symlink created: $curr_mark_path --> $dest"
}

rm_mark(){
	curr_mark_path="$mark_folder/$1"

    if [[ ! -e "$curr_mark_path" ]]; then
        echo "$curr_mark_path does not exist"
        return
    fi

	read -r -p "Remove $curr_mark_path? " yn
	if [[ "$yn" != 'y' ]]; then
		echo "Aborting..."
		return
	fi
    rm -f "$curr_mark_path"
}
