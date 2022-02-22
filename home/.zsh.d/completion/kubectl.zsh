if ! type kubectl &>/dev/null; then
  return
fi

source <(kubectl completion zsh)
complete -o default -F __start_kubectl kubecolor
