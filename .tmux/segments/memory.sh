run_segment() {
  local meminfo=$(free -m | sed -r -e 's/\s+/ /g')

  local total=$(echo ${meminfo} | cut -d ' ' -f 8)
  local used=$(echo ${meminfo} | cut -d ' ' -f 16)

  echo "${used}/${total}MB"
}
