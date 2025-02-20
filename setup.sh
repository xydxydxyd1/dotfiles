#!/bin/bash

./clean.sh

export DF_DIR="$HOME/.dotfiles"
if [[ -e $DF_DIR ]]; then
    echo "$DF_DIR already exists. Repo not moved."
    exit 1
else
    mv "$HOME/dotfiles" "$DF_DIR"
fi

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi
if [[ ! -e "$XDG_CONFIG_HOME" ]]; then
    mkdir -p "$XDG_CONFIG_HOME"
fi

# Link to home
ln -s "$DF_DIR/shell/bashrc" "$HOME/.bashrc"
ln -s "$DF_DIR/shell/zshrc" "$HOME/.zshrc"
ln -s "$DF_DIR/vim" "$HOME/.vim"
ln -s "$DF_DIR/misc/editorconfig.ini" "$HOME/.editorconfig"
ln -s "$DF_DIR/misc/condarc" "$HOME/.condarc"
ln -s "$DF_DIR/misc/tmux.conf" "$HOME/.tmux.conf"

# Link to .config
ln -s "$DF_DIR/vim" "$XDG_CONFIG_HOME/nvim"
ln -s "$DF_DIR/gdb" "$XDG_CONFIG_HOME/gdb"

read -r -p "CXX Compiler (used in some of my scripts): " cxx
echo "export CXX='$cxx'" >> "$DF_DIR/bash/extraconf.sh"

read -r -p "Clone the scripts repo into $HOME/scripts?" yn
if [[ "$yn" == 'y' ]]; then
    git clone https://github.com/xydxydxyd1/scripts.git "$HOME/scripts"
fi

read -r -p 'Setup tex styles?' yn
if [[ "$yn" == 'y' ]]; then
    source "$DF_DIR/tex/setup.sh"
fi

read -r -p 'Setup empty config.local for neovim?' yn
if [[ "$yn" == 'y' ]]; then
    cp ./vim/lua/config/example_local.lua ./vim/lua/config/local.lua
fi
