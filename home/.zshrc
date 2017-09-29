OH_MY_ZSH=${HOME}/.zsh.d/plugin/oh-my-zsh

. ${HOME}/.zsh.d/alias.zsh
. ${HOME}/.zsh.d/appearance.zsh
. ${HOME}/.zsh.d/completion.zsh
. ${HOME}/.zsh.d/history.zsh
. ${HOME}/.zsh.d/key-binding.zsh
. ${HOME}/.zsh.d/misc.zsh


# function
fpath=(${HOME}/.zsh.d/function ${fpath})

autoload -Uz ec2-hosts
autoload -Uz peco-src
autoload -Uz peco-ec2ssh
autoload -Uz peco-history
autoload -Uz xpanes-ec2ssh

alias e='peco-src'
alias s='ec2ssh update >/dev/null && peco-ec2ssh'
zle -N peco-history
bindkey '^r' peco-history


# plugin
. ${OH_MY_ZSH}/plugins/colored-man-pages/colored-man-pages.plugin.zsh
. ${HOME}/.zsh.d/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ${HOME}/.zsh.d/zsh-syntax-highlighting.zsh
. ${HOME}/.zsh.d/plugin/tmux-xpanes/tmux-xpanes.plugin.zsh


[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

typeset -U path
