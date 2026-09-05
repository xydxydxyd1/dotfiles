#!/bin/bash
# restore to pre-setup state

read -r -p 'This removes a lot of files. Are you sure? ' yn
if [[ "$yn" != 'y' ]]; then
    exit 0
fi

rm -rf "$HOME/.condarc"
rm -rf "$HOME/.editorconfig" "$HOME/.tmux.conf"

read -r -p 'Delete scripts? This includes extra scripts that may not be saved ' yn
if [[ "$yn" == 'y' ]]; then
    rm -rf "$HOME/scripts"
fi

rm -rf "$HOME/.vim/plugged"
rm -rf "$HOME/.vim"

rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/gdb"

mv "$HOME/.dotfiles" "$HOME/dotfiles"
