#!/bin/bash
# restore to pre-setup state

rm -rf "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"
rm -rf "$HOME/.editorconfig"

read -r -p 'Delete scripts? This includes extra scripts that may not be saved ' yn
if [[ "$yn" == 'y' ]]; then
    rm -rf "$HOME/scripts"
fi

rm -rf "$HOME/.vim/plugged"
rm -rf "$HOME/.vim"

rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/gdb"

mv "$HOME/.dotfiles" "$HOME/dotfiles"
