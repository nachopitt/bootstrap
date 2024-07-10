# bootstrap

## To clone this repo behind Corporate Network
```console
curl -o ssh_config https://raw.githubusercontent.com/nachopitt/dotfiles/main/.ssh/config && \
    GIT_SSH_COMMAND="ssh -F ssh_config" git clone git@github.com:nachopitt/bootstrap.git && \
    rm -rf ssh_config
```

## Required packages
```console
sudo apt-get install git vim curl neovim make gcc ca-certificates
```

## VMware packages
```console
sudo apt-get install open-vm-tools open-vm-tools-desktop
```

## VirtualBox GA packages
```console
sudo apt-get install build-essential bzip2 gcc make perl linux-headers-$(uname -r)
```
