if (!(Test-Path -PathType container $HOME\.cfg)) {
    git clone git@github.com:nachopitt/dotfiles.git $HOME\.cfg
    git --git-dir=$HOME\.cfg\.git\ --work-tree=$HOME config --local status.showUntrackedFiles no
    git --git-dir=$HOME\.cfg\.git\ --work-tree=$HOME checkout -- $HOME\.
}

gvim -E -s -u "$HOME\.vimrc" +PlugInstall +qall
