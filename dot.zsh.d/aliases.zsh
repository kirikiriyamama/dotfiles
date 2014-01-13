alias ls='ls -F --color=auto'
alias sudo='sudo -E '
alias sqlite='sqlite3'
alias vi='vim'
alias yum='yum -y'
alias tmux='tmux -2 -u'
alias diff='diff -u'
alias be='bundle exec'
alias grt='cd $(git rev-parse --show-toplevel 2> /dev/null || echo ".")'

alias -g @x='| xargs'
alias -g @xg='| xargs grep'
alias -g @g='| grep'
alias -g @l='| less'
alias -g @h='| head'

unalias sl
