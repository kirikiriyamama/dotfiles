run_segment() {
  local env_name=$(tmux display -p "TMUXRUBY_#D" | tr -d %)
  local env_val=$(tmux show-environment | grep --color=never "$env_name")

  if [[ ! $env_val =~ "unknown variable" ]]; then
    local tmux_ruby=$(echo "$env_val" | sed 's/^.*=//')
    echo "$tmux_ruby"
  fi
}
