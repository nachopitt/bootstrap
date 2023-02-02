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
fi
/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME checkout -- $HOME/.

# https://github.com/junegunn/vim-plug
mkdir -p "$HOME/.vim/autoload"
curl -fLo plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv plug.vim "$HOME/.vim/autoload/"
vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

# https://github.com/seebi/dircolors-solarized/
curl -fLo dircolors.ansi-dark https://raw.githubusercontent.com/huyz/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark "$HOME/.dircolors"

# https://github.com/mavnn/mintty-colors-solarized
curl -fLo minttyrc.dark https://raw.githubusercontent.com/mavnn/mintty-colors-solarized/master/.minttyrc.dark
cat minttyrc.dark >> $HOME/.minttyrc
rm minttyrc.dark

# https://github.com/cykerway/complete-alias/
if [ ! -d "$HOME/complete-alias" ]; then
    git clone git@github.com:cykerway/complete-alias.git $HOME/complete-alias
fi
