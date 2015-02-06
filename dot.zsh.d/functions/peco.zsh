alias -g B='$(git branch -a | sed -E -e "s/remotes\///g" | grep -v "origin/HEAD" | peco | sed -E -e "s/^[* ]+//")'
alias -g R='$(git log --date=short --pretty=format:"%h %ad [%an] %s%d" "$@" | peco | cut -d" " -f1)'
alias -g T='$(git tag | peco)'
alias -g C='$(git ls-files --cached | peco)'

function peco-src() {
  local dir=$(ghq list | peco)
  [[ -n ${dir} ]] && cd "${HOME}/.ghq/${dir}"
}
alias e=peco-src

function gim() {
  local file=$(echo C)
  [[ -n ${file} ]] && vim ${file}
}

function peco-git-cherry-pick() {
  for revision in $(echo R | tr ' ' '\n' | tac); do
    git cherry-pick ${revision}
  done
}
alias gp=peco-git-cherry-pick

function peco-git-reflog() {
local revision=$(git reflog | peco | cut -d' ' -f1)
  [[ -n ${revision} ]] && git reset ${revision}
}
alias gr=peco-git-reflog

function peco-kill-processes() {
  for pid in $(ps aux | peco | awk '{ print $2 }'); do
    kill ${pid}
    echo "Killed ${pid}"
  done
}
alias pk=peco-kill-processes

function peco-select-history() {
  BUFFER=$(history -n 1 | tac | peco --query "${LBUFFER}")
  CURSOR=${#BUFFER}
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
