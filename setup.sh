#!/bin/bash

sudo pacman --noconfirm -S\
    alacritty\
    tmux\
    fish\
    firefox\
    neovim\
    lua-language-server\
    rust-analyzer\
    docker\
    docker-compose\
    rustup\
    yarn\
    dbeaver\
    postgresql\
    sqlx-cli\
    ttf-fira-sans\
    ttf-fira-code\
    noto-fonts-cjk\
    exa\
    bat\
    transmission-cli\
    ripgrep\
    wl-clipboard\
    xclip\
    dnsmasq\
    gimp\
    htop

sudo pacman --noconfirm -R\
    cheese\
    totem\
    gnome-books\
    gnome-maps\
    gnome-music\
    gnome-weather\
    gnome-software\
    epiphany\
    gnome-terminal

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git yay-bin
cd yay-bin
makepkg -si
cd ../
rm -rf yay-bin

yay --noconfirm -S\
    teams\
    freeoffice\
    dropbox\
    ibus-bamboo\
    typescript-language-server-bin

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
