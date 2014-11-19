alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

alias less='less -r'
alias sqlite='sqlite3'
alias sudo='sudo -E '
alias tmux='tmux -2 -u'
alias vi='vim'
alias yum='yum -y'

if type colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

alias be='bundle exec'
alias bi='bundle install --path vendor/bundle --without production'

alias g='git'
alias grt='cd $(git rev-parse --show-toplevel 2> /dev/null || echo ".")'

alias tailf='tail -f'

alias -g :l='| less'
alias -g :h='| head'
alias -g :t='| tail'
alias -g :p='| peco'

alias @d='~/dev'
