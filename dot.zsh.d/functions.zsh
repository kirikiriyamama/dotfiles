if [ "$ARCH" != "cygwin" ]; then
  function ls_abbrev() {
    if [[ ! -r $PWD ]]; then
      return
    fi

    local ls_cmd="ls"
    local ls_opts
    if [ "$ARCH" = "mac" ]; then
      ls_opts=("-CFG")
    else
      ls_opts=("-CF" "--color=always")
    fi
    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $ls_cmd ${ls_opts[@]} | sed $'/^\e\[[0-9;]*m$/d')

    if [ $(echo $ls_result | wc -l | tr -d " ") -gt 12 ]; then
      echo $ls_result | head -n 5
      echo "..."
      echo $ls_result | tail -n 5
      echo "$(ls -1 | wc -l | tr -d " ") files exist"
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

    if svn info &> /dev/null; then
      echo
      echo "--- svn status ---"
      svn st --ignore-externals
    fi

    zle reset-prompt
  }
  zle -N dir_status
  bindkey '^m' dir_status

  function chpwd() { ls_abbrev }
fi

function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
