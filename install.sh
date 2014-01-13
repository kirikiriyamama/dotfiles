repository=$(cd $(dirname $0); pwd)
case $OSTYPE in
  darwin*) PLATFORM="osx" ;;
  *) PLATFORM="unknown" ;;
esac

(cd ${repository} && git submodule update --init)

type tmux-mem-cpu-load &>/dev/null
if [ "$?" -ne 0 ]; then
  if [ "$PLATFORM" = "osx" ]
    echo "Please execute the following command: brew install tmux-mem-cpu-load"
  else
    if [ ! -d ${HOME}/bin ]; then
      echo "mkdir ${HOME}/bin"
      mkdir ${HOME}/bin
    fi
    echo "g++ -Wall ${repository}/tmux-mem-cpu-load/tmux-mem-cpu-load.cpp -o ${HOME}/bin/tmux-mem-cpu-load"
    g++ -Wall ${repository}/tmux-mem-cpu-load/tmux-mem-cpu-load.cpp -o ${HOME}/bin/tmux-mem-cpu-load
  fi
fi

if [ "$PLATFORM" = "osx" ]; then
  find_opts=("-E")
else
  find_opts=() ;;
fi
find ${find_opts[@]} ${repository} -regex "${repository}/dot\.[^/]+$" |
sed -e "s|${repository}/||" |
while read dotfile
do
  link_name=$(echo ${dotfile} | sed -e "s/^dot//g")
  if [ ! -e ${HOME}/${link_name} ]; then
    echo "ln -s ${repository}/${dotfile} ${HOME}/${link_name}"
    ln -s ${repository}/${dotfile} ${HOME}/${link_name}
  else
    echo "${HOME}/${link_name} exists"
  fi
done
