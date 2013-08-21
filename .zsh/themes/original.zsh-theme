local ruby_version=""
if which rvm-prompt &> /dev/null; then
  ruby_version=" [$(rvm-prompt i v g)]"
else
  if which rbenv &> /dev/null; then
    ruby_version=" [$(rbenv version | sed -e 's/ (set.*$//')]"
  fi
fi


function git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return

  INDEX=$(git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_STAGED}"
  fi
  if $(echo "$INDEX" | grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_UNSTAGED}"
  fi
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_UNTRACKED}"
  fi
  if $(echo "$INDEX" | grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_UNMERGED}"
  fi
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref#refs/heads/}\
${ZSH_THEME_GIT_STATUS_PREFIX}${STATUS}${ZSH_THEME_GIT_STATUS_SUFFIX}\
${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
ZSH_THEME_GIT_STATUS_PREFIX="$FG[214]"
ZSH_THEME_GIT_STATUS_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD="!"
ZSH_THEME_GIT_PROMPT_STAGED="+"
ZSH_THEME_GIT_PROMPT_UNSTAGED="-"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_UNMERGED="#"


if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[032]%~\
$(git_prompt) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

RPROMPT='$FG[237]%n@%m$ruby_version%{$reset_color%}'
