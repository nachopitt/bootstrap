#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

sudo apt-get install git vim curl neovim make gcc --yes --quiet

# https://github.com/nachopitt/dotfiles
if [ ! -f $HOME/bin/yadm ]; then
    curl -fLo $HOME/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x $HOME/bin/yadm
fi

if [ ! -d $($HOME/bin/yadm rev-parse --git-dir) ]; then
    curl -o ssh_config https://raw.githubusercontent.com/nachopitt/dotfiles/main/.ssh/config

    GIT_SSH_COMMAND="ssh -F ssh_config" $HOME/bin/yadm clone git@github.com:nachopitt/dotfiles.git

    rm ssh_config
fi

vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall
#nvim -E -s -u "$HOME\.vimrc" +PlugInstall +qall

# https://github.com/cykerway/complete-alias/
if [ ! -d "$HOME/complete-alias" ]; then
    git clone git@github.com:cykerway/complete-alias.git $HOME/complete-alias
fi
