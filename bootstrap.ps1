if (!(Test-Path -PathType container $HOME\.cfg)) {
    curl -o ssh_config https://raw.githubusercontent.com/nachopitt/dotfiles/main/.ssh/config

    $env:GIT_SSH_COMMAND="ssh -F ssh_config"; git clone git@github.com:nachopitt/dotfiles.git $HOME\.cfg
    git --git-dir=$HOME\.cfg\.git\ --work-tree=$HOME config --local status.showUntrackedFiles no
    git --git-dir=$HOME\.cfg\.git\ --work-tree=$HOME checkout -- $HOME\.

    rm ssh_config
}

gvim -E -s -u "$HOME\.vimrc" +PlugInstall +qall
