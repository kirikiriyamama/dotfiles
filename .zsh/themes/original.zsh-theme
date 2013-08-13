local ruby_version=''
if which rvm-prompt &> /dev/null; then
  ruby_version='$FG[075]‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_version='$FG[075]‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi


local git_branch='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214]✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075]›%{$reset_color%}"


PROMPT='$FG[032]%n@%m $FG[105]%(!.#.»)%{$reset_color%} '
RPROMPT="%~ ${ruby_version}${git_branch}"
