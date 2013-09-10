function ls_abbrev() {
  if [[ ! -r $PWD ]]; then
    return
  fi

  local ls_result
  ls_result=$(COLUMNS=$COLUMNS ls -CF --color=always | sed $'/^\e\[[0-9;]*m$/d')

  if [ $(echo $ls_result | wc -l) -gt 12 ]; then
    echo $ls_result | head -n 5
    echo '...'
    echo $ls_result | tail -n 5
    echo "$(ls -1 | wc -l) files exist"
  else
    echo $ls_result
  fi
}

function dir_status() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi

  echo
  ls_abbrev

  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    echo
    echo "--- git status ---"
    git status -sb

    stash=$(git stash list)
    if [ -n "$stash" ]; then
      echo
      echo "--- git stash ---"
      echo $stash
    fi
  fi

  echo
  zle reset-prompt
}
zle -N dir_status
bindkey '^m' dir_status

function chpwd() { ls_abbrev }

function cdup() {
  echo
  cd ..
  echo
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
