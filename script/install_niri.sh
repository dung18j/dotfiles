#!/bin/bash

sudo apt install waybar blueman

sudo bash -c "$(wget -q https://pacstall.dev/q/install -O -)"

pacstall -I niri
