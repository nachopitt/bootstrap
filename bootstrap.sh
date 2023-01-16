#!/bin/bash

# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/seebi/dircolors-solarized/
curl -fLo ~/.dircolors --create-dirs \
    https://raw.githubusercontent.com/huyz/dircolors-solarized/master/dircolors.ansi-dark

# https://github.com/cykerway/complete-alias/
mkdir -p ~/env
git clone https://github.com/cykerway/complete-alias.git ~/env/complete-alias
