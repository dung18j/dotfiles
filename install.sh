#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "DOTFILES_DIR=$DOTFILES_DIR"

mkdir -p "$CONFIG_DIR/git"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/tmux"

cp -r "$DOTFILES_DIR/git/" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/nvim/" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/tmux/" "$CONFIG_DIR/"


echo "export EDITOR=nvim" >> $HOME/.bashrc
echo "complete -F _command doas" >> $HOME/.bashrc
echo "bind 'set completion-ignore-case on'" >> $HOME/.bashrc
echo "bind 'set mark-symlinked-directories on'" >> $HOME/.bashrc

echo "Dotfiles installed."
