if ! type helm &>/dev/null; then
  return
fi

source <(helm completion zsh)
