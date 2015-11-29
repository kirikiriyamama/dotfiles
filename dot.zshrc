# initialize
. ${HOME}/.zsh.d/antigen/antigen.zsh

# environments
ZSH_CUSTOM=${HOME}/.zsh.d

case ${OSTYPE} in
  linux*) PLATFORM="linux" ;;
  darwin*) PLATFORM="osx" ;;
  *) PLATFORM="unknown" ;;
esac

# completions
fpath=(${ZSH_CUSTOM}/completions ${fpath})

# plugins
antigen bundle colored-man
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src

# configurations
for file (${ZSH_CUSTOM}/*.zsh(N)); do
  . ${file}
done
unset file

# functions
for file ($ZSH_CUSTOM/functions/*.zsh(N)); do
  . ${file}
done
unset file

# local configuration
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# finalize
antigen apply
typeset -U path
