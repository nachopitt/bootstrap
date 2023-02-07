#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# https://github.com/nachopitt/dotfiles
if [ ! -d "$HOME/.cfg" ]; then
    git clone git@github.com:nachopitt/dotfiles.git $HOME/.cfg

    /usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
    /usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME checkout -- $HOME/.
fi

# https://github.com/cykerway/complete-alias/
if [ ! -d "$HOME/complete-alias" ]; then
    git clone git@github.com:cykerway/complete-alias.git $HOME/complete-alias
fi
