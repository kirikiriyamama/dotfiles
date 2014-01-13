# This checks if the current branch is ahead of
# or behind the remote branch with which it is tracked

# Source lib to get the function get_tmux_pwd
source "${TMUX_POWERLINE_DIR_LIB}/tmux_adapter.sh"

flat_symbol="⤚"

run_segment() {
  tmux_path=$(get_tmux_cwd)
  cd "$tmux_path"
  stats=""
  if [ -n "${git_stats=$(__parse_git_stats)}" ]; then
    stats="$git_stats"
  elif [ -n "${svn_stats=$(__parse_svn_stats)}" ]; then
    stats="$svn_stats"
  elif [ -n "${hg_stats=$(__parse_hg_stats)}" ]; then
    stats="$hg_stats"
  fi

  if [ -n "$stats" ]; then
    echo "${stats}"
  fi
  return 0
}

__parse_git_stats() {
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  # check if git
  [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

  # print out the information
  if [ $ahead -eq 0 ] && [ $behind -gt 0 ]; then
    local ret="↓ $behind"
  elif [ $ahead -gt 0 ] && [ $behind -eq 0 ]; then
    local ret="↑ $ahead"
  elif [ $ahead -gt 0 ] && [ $behind -gt 0 ]; then
    local ret="↓ $behind ↑ $ahead"
  fi
  echo "$ret"
}

__parse_hg_stats() {
  type hg >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi
  # not yet implemented
}

__parse_svn_stats() {
  type svn >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi
  # not yet implemented
}
