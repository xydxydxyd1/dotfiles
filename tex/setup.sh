#!/bin/bash
# setup.sh 
# Called by DF_DIR/setup.sh
echo "Setting up tex..."

sty_dir="$HOME/texmf/tex/latex"
mkdir -p "$sty_dir"
echo "DF_DIR=$DF_DIR"

# Loop through each .sty file
for file in $DF_DIR/tex/*.sty; do
    # Check if the file is a regular file (not a directory or symlink)
    if [ -f "$file" ]; then
        # Extract the file name without extension
        dirname=$(basename "$file" .sty)
        
        # Create a directory with the same name as the file (without extension)
        mkdir -p "$sty_dir/$dirname"
        
        # Create a symbolic link to the file in the directory
        ln -s "$file" "$sty_dir/$dirname/$dirname.sty"
        
        echo "Created directory '$sty_dir/$dirname' and linked '$file' to it."
    fi
done
