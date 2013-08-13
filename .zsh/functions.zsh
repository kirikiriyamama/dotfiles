function chpwd() { ls -F --color=auto }

function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
