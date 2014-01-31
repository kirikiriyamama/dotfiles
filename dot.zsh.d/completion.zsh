setopt menu_complete
setopt magic_equal_subst
setopt nonomatch
setopt complete_in_word
setopt always_last_prompt
setopt globdots
setopt auto_pushd
setopt pushd_ignore_dups

zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*:*:*:*:processes' command "ps x -o pid,user,args"
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _list _history
zstyle ':completion:*:descriptions' format '%{'${fg[yellow]}'%}%d%{'${reset_color}'%}'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''
