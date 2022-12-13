export LANG='en_US.UTF-8'
export LC_CTYPE="${LANG}"

export GREP_COLOR='mt=1;32'

export EDITOR='nvim'
export PAGER='less'

export WORDCHARS="${WORDCHARS//[\/=.-]/}"

setopt no_global_rcs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${PATH}"

export GOPATH="${HOME}/.go"

export PATH="${GOPATH}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin.local:${HOME}/bin:${PATH}"

if [[ "$(uname -s)" = "Darwin" ]]; then
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
  export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:${PATH}"
  export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:${PATH}"
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"

  export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"
  export MANPATH="/opt/homebrew/opt/findutils/libexec/gnuman:${MANPATH}"
  export MANPATH="/opt/homebrew/opt/gawk/libexec/gnuman:${MANPATH}"
  export MANPATH="/opt/homebrew/opt/gnu-sed/libexec/gnuman:${MANPATH}"
fi
