HISTFILE="${HOME}/.zsh_history"

HISTSIZE=10000
SAVEHIST=100000

setopt extended_history
setopt inc_append_history
setopt hist_verify

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_space
