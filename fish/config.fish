abbr l exa
abbr ls exa
abbr la "exa -a"
abbr ll "exa -l"
abbr vim nvim
abbr vi nvim
abbr rmr "rm -r"
abbr rmrf "rm -rf"

set fish_prompt_pwd_dir_length 3

if status is-interactive
and not set -q TMUX
    exec tmux -u new -As tmux
end
