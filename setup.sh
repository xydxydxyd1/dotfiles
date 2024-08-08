#!/bin/bash

./clean.sh

export DF_DIR="$HOME/.dotfiles"
if [[ -e $DF_DIR ]]; then
    echo "$DF_DIR already exists. Repo not moved."
    exit 1
else
    mv "$HOME/dotfiles" "$DF_DIR"
fi

if [[ -z $XDG_CONFIG_HOME ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

# Link to home
ln -s "$DF_DIR/shell/bashrc" "$HOME/.bashrc"
ln -s "$DF_DIR/shell/zshrc" "$HOME/.zshrc"
ln -s "$DF_DIR/vim" "$HOME/.vim"
ln -s "$DF_DIR/misc/editorconfig.ini" "$HOME/.editorconfig"
ln -s "$DF_DIR/condarc" "$HOME/.condarc"

# Link to .config
ln -s "$DF_DIR/vim" "$XDG_CONFIG_HOME/nvim"
ln -s "$DF_DIR/gdb" "$XDG_CONFIG_HOME/gdb"

read -r -p "CXX Compiler (used in some of my scripts): " cxx
echo "export CXX='$cxx'" >> "$DF_DIR/bash/extraconf.sh"

read -r -p "Clone the scripts repo into $HOME/scripts?" yn
if [[ "$yn" == 'y' ]]; then
    git clone https://github.com/xydxydxyd1/scripts.git "$HOME/scripts"
fi

read -r -p 'Some vim plugins may require npm/yarn. Proceed? (y/n) ' yn
if [[ "$yn" == 'y' ]]; then
    nvim -c 'PlugInstall'
fi

read -r -p 'Setup tex styles?' yn
if [[ "$yn" == 'y' ]]; then
    source "$DF_DIR/tex/setup.sh"
fi
