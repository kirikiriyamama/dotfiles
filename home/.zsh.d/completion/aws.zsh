autoload -Uz bashcompinit && bashcompinit
complete -C $(which aws_completer) aws
