#!/bin/bash

# Set default bookmark directory
[ -n "$mark_folder" ] || mark_folder="$HOME/.mk"

# Create bookmark directory if not present
[ -d "$mark_folder" ] || mkdir "$mark_folder"

# For easy access of bookmarks: $mk/mark_name
export mk="$mark_folder"

set_mark(){
	# TODO: Verbosity level <26-01-23, xydxydxyd1> #
	# TODO: Bookmark Description <26-01-23, xydxydxyd1> #

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

    # Create symlink
    ln -s "$(pwd)" "$curr_mark_path"
    echo "Symlink created: $curr_mark_path --> $(pwd)"
}

rm_mark(){
	curr_mark_path="$mark_folder/$1"

    if [[ ! -e "$curr_mark_path" ]]; then
        echo "$curr_mark_path does not exist"
        return
    fi

	read -r -p "Remove $curr_mark_path?" yn
	if [[ "$yn" != 'y' ]]; then
		echo "Aborting..."
		return
	fi
    rm -f "$curr_mark_path"
}
