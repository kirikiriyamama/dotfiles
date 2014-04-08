function git_status() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    echo
    echo "--- git status ---"
    git status -sb

    # stash list
    stash=$(git stash list)
    if [ -n "$stash" ]; then
      echo
      echo "--- git stash ---"
      echo $stash
    fi
  fi
}

function svn_status() {
  if svn info &> /dev/null; then
    echo
    echo "--- svn status ---"
    svn st --ignore-externals
  fi
}

function dir_status() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi

  echo && ls_abbrev
  git_status
  svn_status
  zle reset-prompt
}
zle -N dir_status
bindkey '^m' dir_status
