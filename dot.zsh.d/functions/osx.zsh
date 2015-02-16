function trash() {
  local trash_dir="${HOME}/.Trash"
  local temp_ifs=$IFS
  IFS=$'\n'
  for item in "$@"; do
    if [[ -e "$item" ]]; then
      item_name="$(basename $item)"
      if [[ -e "${trash_dir}/${item_name}" ]]; then
        mv -f "$item" "${trash_dir}/${item_name} $(date "+%H-%M-%S")"
      else
        mv -f "$item" "${trash_dir}/"
      fi
    fi
  done
  IFS=$temp_ifs
}

function itunes() {
  local opt=$1
  case "$opt" in
    launch|play|pause|stop|rewind|resume|quit)
      ;;
    mute)
      opt="set mute to true"
      ;;
    unmute)
      opt="set mute to false"
      ;;
    next|previous)
      opt="$opt track"
      ;;
    ""|help|-h|--help)
      echo "Usage: itunes <option>"
      echo "option:"
      echo "\tlaunch|play|pause|stop|rewind|resume|quit"
      echo "\tmute|unmute\tcontrol volume set"
      echo "\tnext|previous\tplay next or previous track"
      echo "\thelp\tshow this message and exit"
      return 0
      ;;
    *)
      print "Unknown option: $opt"
      return 1
      ;;
  esac
  osascript -e "tell application \"iTunes\" to $opt"
}
