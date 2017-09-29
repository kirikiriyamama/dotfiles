autoload -Uz colors && colors

eval $(dircolors --bourne-shell)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# theme
setopt prompt_subst

. "${OH_MY_ZSH}/lib/git.zsh"
. "${OH_MY_ZSH}/themes/robbyrussell.zsh-theme"
