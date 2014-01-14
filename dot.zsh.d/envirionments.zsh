function merge_path() {
  case ":${PATH}:" in
    *:"$1":*) ;;
    *) export PATH=$PATH:$1 ;;
  esac
}

merge_path $HOME/dev/bin

export EDITOR=vim
export LANG=en_US.UTF-8

unset LESS
