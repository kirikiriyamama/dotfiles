bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey '^H'    backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
