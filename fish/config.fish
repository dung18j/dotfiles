abbr l exa
abbr ls exa
abbr la "exa -a"
abbr ll "exa -l"
abbr cat bat
abbr vim nvim
abbr vi nvim
abbr rmr "rm -r"
abbr rmrf "rm -rf"
abbr dark_theme "gsettings set org.gnome.desktop.interface gtk-theme HighContrastInverse"
abbr light_theme "gsettings set org.gnome.desktop.interface gtk-theme HighContrast"

set fish_prompt_pwd_dir_length 3
setenv EDITOR nvim
setenv JDTLS_HOME /opt/jdtls/ 
setenv WORKSPACE /home/dun/.jdt_workspace/

if status is-interactive
and not set -q TMUX
    exec tmux -u new -As tmux
end
