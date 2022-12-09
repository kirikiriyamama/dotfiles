if ! type kubectl &>/dev/null; then
  return
fi

source <(kubectl completion zsh)
