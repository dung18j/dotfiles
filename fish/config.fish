abbr l exa
abbr ls exa
abbr la "exa -a"
abbr ll "exa -l"
abbr vim nvim
abbr vi nvim
abbr rmr "rm -r"
abbr rmrf "rm -rf"

set fish_prompt_pwd_dir_length 3

setenv EDITOR           nvim
setenv JDTLS_HOME       /home/dun/.jdtls
setenv CARGO_TARGET_DIR /home/dun/.ctarget/

if status is-interactive
and not set -q TMUX
and not set -q VIMRUNTIME
	exec tmux -u new -As tmux
end
