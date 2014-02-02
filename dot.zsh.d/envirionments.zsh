function add_path() {
  case ":${PATH}:" in
    *:"$1":*) ;;
    *) export PATH=$PATH:$1 ;;
  esac
}

add_path $HOME/dev/bin

export LANG='en_US.UTF-8'
export LC_CTYPE=$LANG
export EDITOR='vim'
export PAGER='less'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
