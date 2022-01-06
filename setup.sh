#!/bin/bash

sudo pacman -S\
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
    libreoffice-fresh\
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

sudo pacman -R\
    cheese\
    totem\
    gnome-books\
    gnome-maps\
    gnome-music\
    gnome-weather\
    gnome-software\
    epiphany

yay -S\
    teams\
    dropbox\
    ibus-bamboo\
    typescript-language-server-bin

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git yay-bin
cd yay-bin
makepkg -si
cd ../
rm -rf yay-bin

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
