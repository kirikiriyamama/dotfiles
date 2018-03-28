export LANG='en_US.UTF-8'
export LC_CTYPE="${LANG}"

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export EDITOR='vim'
export PAGER='less'

export WORDCHARS="${WORDCHARS//[\/=.]/}"

setopt no_global_rcs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${PATH}"

export GOPATH="${HOME}/.go"
export PATH="${GOPATH}/bin:${PATH}"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="${HOME}/bin:${PATH}"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

source "${HOME}/.cargo/env"
