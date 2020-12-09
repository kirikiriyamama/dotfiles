OH_MY_ZSH=${HOME}/.zsh.d/plugin/oh-my-zsh

# Load plugins and settings
. ${HOME}/.zsh.d/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

for f in ${HOME}/.zsh.d/*.zsh; do
  . ${f}
done

. ${HOME}/.zsh.d/plugin/tmux-xpanes/tmux-xpanes.plugin.zsh

# Load functions
fpath=(${HOME}/.zsh.d/function ${fpath})

for f in ${HOME}/.zsh.d/function/*; do
  autoload -Uz ${f}
done

# Load local settings
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# Remove duplicated entries from $PATH
typeset -U PATH path
