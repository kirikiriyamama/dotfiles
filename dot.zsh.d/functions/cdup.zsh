function cdup() {
  if [ -n "$BUFFER" ]; then
    zle self-insert "^"
  else
    echo
    cd ..
    zle reset-prompt
  fi
}
zle -N cdup
bindkey '\^' cdup
