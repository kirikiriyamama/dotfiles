alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

alias sudo='sudo -E '
alias sqlite='sqlite3'
alias vi='vim'
alias yum='yum -y'
alias tmux='tmux -2 -u'

alias g='git'
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle'
alias grt='cd $(git rev-parse --show-toplevel 2> /dev/null || echo ".")'

if type colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

alias -g :x='| xargs'
alias -g :xg='| xargs grep'
alias -g :g='| grep'
alias -g :gv='| grep -v'
alias -g :l='| less'
alias -g :lr='| less -r'
alias -g :h='| head'
alias -g :t='| tail'
alias -g :tf='| tail -f'

alias @dev='~/dev'
alias @github='~/dev/github'
alias @remain='~/dev/remain'
