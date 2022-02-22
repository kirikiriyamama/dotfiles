if ! type kustomize &>/dev/null; then
  return
fi

source <(kustomize completion zsh)
compdef _kustomize kustomize
