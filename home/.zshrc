OH_MY_ZSH=${HOME}/.zsh.d/plugin/oh-my-zsh

# Load settings
for f in ${HOME}/.zsh.d/*.zsh; do
  . ${f}
done

# Load functions
fpath=(${HOME}/.zsh.d/function ${fpath})

for f in ${HOME}/.zsh.d/function/*; do
  autoload -Uz ${f}
done

# Load plugins
. ${HOME}/.zsh.d/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ${HOME}/.zsh.d/plugin/tmux-xpanes/tmux-xpanes.plugin.zsh

# Load local settings
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# Remove duplicated entries from $PATH
typeset -U PATH path
