alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

alias grep='grep --color=auto --ignore-case'
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
alias k='kubecolor'
alias e='peco-src'

alias grt='cd $(git rev-parse --show-toplevel)'
alias s='ec2ssh update >/dev/null && peco-ec2ssh'

if type colordiff &>/dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

if type bat &>/dev/null; then
  alias cat="BAT_THEME='Monokai Extended' bat --style=plain --pager=never"
fi

# completion isn't working if using alias
man() { colored-man ${@} }
