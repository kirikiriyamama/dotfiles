alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

alias less='less -R'
alias tmux='tmux -2 -u'
alias grep='grep --color=auto --ignore-case'

alias g='git'
alias be='bundle exec'
alias d='docker'
alias dc='docker-compose'
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
alias s='ec2ssh update >/dev/null && peco-ec2ssh'

if type colordiff &>/dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# completion isn't working if using alias
man() { colored-man ${@} }
