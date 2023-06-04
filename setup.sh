#!/bin/bash

mv "$HOME/dotfiles" "$HOME/.dotfiles"

# Link to home directory
# bash
ln -s "$HOME/.dotfiles/bash/bashrc" "$HOME/.zshrc"
# zsh
ln -s "$HOME/.dotfiles/bash/bashrc" "$HOME/.profile"
# vim
ln -s "$HOME/.dotfiles/vim" "$HOME/.vim"
vim -c PlugInstall -c qa

# Link to .config directory
# nvim
ln -s "$HOME/.dotfiles/vim" "$HOME/.config/nvim"
# gdb
ln -s "$HOME/.dotfiles/gdb" "$HOME/.config/gdb"

read -r -p "CXX Compiler: " cxx
echo "export CXX='$cxx'" >> "$HOME/.dotfiles/bash/extraconf.sh"
