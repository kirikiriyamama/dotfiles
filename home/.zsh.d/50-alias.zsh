alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

alias grep='grep --color=auto'
alias less='less -R'
alias tig='TERM=xterm-256color tig'
alias tmux='tmux -2 -u'
alias vim='nvim'

alias g='git'
alias be='bundle exec'
alias d='docker'
alias dc='docker compose'
alias dce='dc exec'
alias dcr='dc run'
alias dcl='dc logs'
dca() {
  docker attach "${PWD##*/}_${1}_1"
}
alias v='nvim'
alias k='kubectl'
alias e='peco-src'

alias grt='cd $(git rev-parse --show-toplevel)'

if type colordiff &>/dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

if type bat &>/dev/null; then
  alias cat="BAT_THEME='gruvbox-dark' bat --style=plain --pager=never"
fi

# completion isn't working if using alias
man() { colored-man ${@} }
