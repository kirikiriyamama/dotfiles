setopt menu_complete

setopt magic_equal_subst

setopt auto_pushd
setopt pushd_ignore_dups

zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*:*:*:*:processes' command "ps x -o pid,user,args"
