function ls_abbrev() {
  if [[ ! -r $PWD ]]; then
    return
  fi

  local ls_result
  ls_result=$(COLUMNS=$COLUMNS ls -CF --color=always | sed $'/^\e\[[0-9;]*m$/d')

  if [ $(echo $ls_result | wc -l) -gt 12 ]; then
    echo $ls_result | head -n 5
    echo '...'
    echo $ls_result | tail -n 5
    echo "$(ls -1 | wc -l) files exist"
  else
    echo $ls_result
  fi
}

function chpwd() { ls_abbrev }
