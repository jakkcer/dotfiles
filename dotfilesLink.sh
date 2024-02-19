#!/bin/sh

# git
ln -sfv ~/.dotfiles/.gitconfig ~

# vim files
ln -sfv ~/.dotfiles/vim/.vimrc ~
ln -sfv ~/.dotfiles/vim/.vimrc.common ~/.vim
ln -sfv ~/.dotfiles/vim/rc/* ~/.vim/rc

# ideavim
ln -sfv ~/.dotfiles/vim/.ideavimrc ~

# zsh files
ln -sfv ~/.dotfiles/zsh/.zshrc ~
ln -sfv ~/.dotfiles/zsh/.zpreztorc ~
