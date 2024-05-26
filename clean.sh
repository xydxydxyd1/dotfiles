#!/bin/bash
# restore to pre-setup state

rm -rf "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"
rm -rf "$HOME/.editorconfig"
rm -rf "$HOME/scripts"

rm -rf "$HOME/.vim/plugged"
rm -rf "$HOME/.vim"

rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/gdb"

mv "$HOME/.dotfiles" "$HOME/dotfiles"
