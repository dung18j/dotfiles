#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR/git"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/tmux"

cp -r "$DOTFILES_DIR/git/" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/nvim/" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/tmux/" "$CONFIG_DIR/"


while IFS= read -r line; do
  grep -qF "$line" "$HOME/.bashrc" || echo "$line" >> "$HOME/.bashrc"
done < "$DOTFILES_DIR/bashrc_append"

echo "Dotfiles installed."
