if ! type eksctl &>/dev/null; then
  return
fi

source <(eksctl completion zsh)
compdef _eksctl eksctl
