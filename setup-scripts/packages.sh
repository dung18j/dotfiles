#!/bin/bash

sudo pacman -S\
    `#Essential`\
    alacritty\
    tmux\
    fish\
    firefox\
    neovim\
    `# Programming`\
    lua-language-server\
    rust-analyzer\
    docker\
    docker-compose\
    rustup\
    yarn\
    dbeaver\
    postgresql\
    `#Nice to have`\
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
