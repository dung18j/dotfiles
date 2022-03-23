abbr l exa
abbr ls exa
abbr la "exa -a"
abbr ll "exa -l"
abbr vim nvim
abbr vi nvim
abbr rmr "rm -r"
abbr rmrf "rm -rf"
alias dark_theme "gsettings set org.gnome.desktop.interface gtk-theme HighContrastInverse &&sed -i -e 's/light/dark/' ~/.config/nvim/init.lua &&sed -i -e 's/*light/*dark/' ~/.config/alacritty/alacritty.yml"
alias light_theme "gsettings set org.gnome.desktop.interface gtk-theme HighContrast&&sed -i -e 's/dark/light/' ~/.config/nvim/init.lua &&sed -i -e 's/*dark/*light/' ~/.config/alacritty/alacritty.yml"

set fish_prompt_pwd_dir_length 3
setenv EDITOR nvim
setenv JDTLS_HOME /opt/jdtls/ 
setenv WORKSPACE /home/dun/.jdt_workspace/

if status is-interactive
and not set -q TMUX
    exec tmux -u new -As tmux
end
