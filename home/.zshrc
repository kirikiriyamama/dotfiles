OH_MY_ZSH=${HOME}/.zsh.d/plugin/oh-my-zsh

# Load plugins and settings
. ${HOME}/.zsh.d/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

for f in ${HOME}/.zsh.d/*.zsh; do
  . ${f}
done

. ${OH_MY_ZSH}/plugins/colored-man-pages/colored-man-pages.plugin.zsh
. ${HOME}/.zsh.d/plugin/tmux-xpanes/tmux-xpanes.plugin.zsh

# Load functions
fpath=(${HOME}/.zsh.d/function ${fpath})

for f in ${HOME}/.zsh.d/function/*; do
  autoload -Uz ${f}
done

alias e='peco-src'
alias s='ec2ssh update >/dev/null && peco-ec2ssh'
zle -N peco-history
bindkey '^r' peco-history

# Load local settings
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# Remove duplicated entries from $PATH
typeset -U PATH path
