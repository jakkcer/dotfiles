#!bin/sh

# create directory
mkdir -p ~/.vim/rc
mkdir -p ~/.vim/swp

# vim files
ln -sfv ~/.dotfiles/vim/.vimrc ~
ln -sfv ~/.dotfiles/vim/rc/* ~/.vim/rc

# zsh files
ln -sfv ~/.dotfiles/zsh/.zshrc ~
ln -sfv ~/.dotfiles/zsh/.zpreztorc ~
