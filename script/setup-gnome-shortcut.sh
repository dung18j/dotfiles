dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Control>MonBrightnessDown'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Dark Theme'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command\
    "'sh -c \u0022gsettings set org.gnome.desktop.interface gtk-theme HighContrastInverse&&sed -i -e \u0027s/set bg=light/set bg=dark/\u0027 /home/dun/.config/nvim/background.lua&&sed -i -e \u0027s/*light/*dark/\u0027 /home/dun/.config/alacritty/alacritty.yml\u0022|systemd-cat'"

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Control>MonBrightnessUp'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Light Theme'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command\
    "'sh -c \u0022gsettings set org.gnome.desktop.interface gtk-theme HighContrast&&sed -i -e \u0027s/set bg=dark/set bg=light/\u0027 /home/dun/.config/nvim/background.lua&&sed -i -e \u0027s/*dark/*light/\u0027 /home/dun/.config/alacritty/alacritty.yml\u0022|systemd-cat'"

dconf write /org/gnome/shell/keybindings/screenshot "['Print']"
dconf write /org/gnome/shell/keybindings/show-screenshot-ui "['<Control>Print']"
