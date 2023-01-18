#!/bin/bash

# https://github.com/nachopitt/dotfiles
if [ ! -d "$HOME/.cfg" ]; then
    git clone git@github.com:nachopitt/dotfiles.git $HOME/.cfg
fi
/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME checkout .

# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/seebi/dircolors-solarized/
curl -fLo ~/.dircolors --create-dirs \
    https://raw.githubusercontent.com/huyz/dircolors-solarized/master/dircolors.ansi-dark
