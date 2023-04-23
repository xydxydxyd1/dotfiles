#!/bin/zsh

# Link to home directory
# bash
ln -s $HOME/.dotfiles/bash/bashrc $HOME/.zshrc
# zsh
ln -s $HOME/.dotfiles/bash/bashrc $HOME/.profile
# vim
ln -s $HOME/.dotfiles/vim $HOME/.vim

# Link to .config directory
# nvim
ln -s $HOME/.dotfiles/vim $HOME/.config/nvim
# gdb
ln -s $HOME/.dotfiles/gdb $HOME/.config/gdb
