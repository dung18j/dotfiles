abbr l exa
abbr ls exa
abbr la "exa -a"
abbr ll "exa -l"
abbr rmr "rm -r"
abbr rmrf "rm -rf"
abbr vim nvim

set fish_prompt_pwd_dir_length 3

setenv EDITOR           nvim
setenv ESP_IDF_TOOLS_INSTALL_DIR global
#setenv JDTLS_HOME       /home/dun/.jdtls
#setenv CARGO_TARGET_DIR /home/dun/.ctarget

direnv hook fish | source

if status is-interactive
and not set -q TMUX
and not set -q VIMRUNTIME
	exec tmux -u new -As tmux
end
