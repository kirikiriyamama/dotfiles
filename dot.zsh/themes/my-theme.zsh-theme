#!/bin/zsh


# primary prompt
PROMPT='$FG[236]------------------------------------------------------------%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# right prompt
RPROMPT='$FG[236]%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"


# tmux-powerline
function ruby_version() {
  if which rvm-prompt &> /dev/null; then
    echo "$(rvm-prompt i v g)"
  elif which rbenv &> /dev/null; then
    echo "$(rbenv version | sed -e 's/ (set.*$//')"
  else
    return
  fi
}

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXRUBY_$(tmux display -p "#D" | tr -d %) "$(ruby_version)")'
