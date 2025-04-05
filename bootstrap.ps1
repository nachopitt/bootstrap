Install-Script -Name yadm -Scope CurrentUser

try {
    $gitDir = & yadm rev-parse --git-dir 2>$null
} catch {
    $gitDir = $null
}

if (-not $gitDir -or -not (Test-Path -PathType container $gitDir)) {
    curl -o ssh_config https://raw.githubusercontent.com/nachopitt/dotfiles/main/.ssh/config

    $env:GIT_SSH_COMMAND="ssh -F ssh_config"; yadm clone git@github.com:nachopitt/dotfiles.git

    rm ssh_config
}

gvim -E -s -u "$HOME\.vimrc" +PlugInstall +qall
#nvim -E -s -u "$HOME\.vimrc" +PlugInstall +qall
