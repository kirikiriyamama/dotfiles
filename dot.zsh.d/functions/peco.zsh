alias e='cd `ghq list -p | peco`'

function d() {
  git ls-files --modified --others --exclude-standard | peco | xargs $@
}
alias dv='vim `d`'

function s() {
  git diff --staged --name-only | peco | xargs $@
}
alias sv='vim `s`'

function c() {
  git ls-files --cached | peco | xargs $@
}
alias cv='vim `c`'

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
