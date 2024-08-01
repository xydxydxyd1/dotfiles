#!/bin/bash

./clean.sh

export DF_DIR="$HOME/.dotfiles"

mv "$HOME/dotfiles" "$DF_DIR"

# Link to home directory
# bash
ln -s "$DF_DIR/shell/bashrc" "$HOME/.bashrc"
# zsh
ln -s "$DF_DIR/shell/zshrc" "$HOME/.zshrc"
# vim
ln -s "$DF_DIR/vim" "$HOME/.vim"
# editorconfig
ln -s "$DF_DIR/misc/editorconfig.ini" "$HOME/.editorconfig"

# Link to .config directory
# nvim
ln -s "$DF_DIR/vim" "$HOME/.config/nvim"
# gdb
ln -s "$DF_DIR/gdb" "$HOME/.config/gdb"

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
