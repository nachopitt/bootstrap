@echo off & setlocal
::
:: A Syntax-highlighted batch file
::

if not exist ~\.cfg\ (
    git clone git@github.com:nachopitt/dotfiles.git ~\.cfg
    git --git-dir=~\.cfg\.git\ --work-tree=~ config --local status.showUntrackedFiles no
    git --git-dir=~\.cfg\.git\ --work-tree=$HOME checkout -- ~\.
)

gvim -E -s -u "~\.vimrc" +PlugInstall +qall