repository=$(cd $(dirname $0);pwd)
cd ${repository}
git submodule init
git submodule update

find ${repository} -regex "${repository}/\.[a-z.]+$" |
sed -e "s|${repository}/||" |
while read dotfile
do
  case ${dotfile} in
    .git) continue;;
    .gitmodules) continue;;
    .gitignore) continue;;
  esac

  if [ ! -f ${HOME}/${dotfile} -a ! -d ${HOME}/${dotfile} ]; then
    echo "ln -s ${repository}/${dotfile} ${HOME}/${dotfile}"
    ln -s ${repository}/${dotfile} ${HOME}/${dotfile}
  else
    echo "${HOME}/${dotfile} exists"
  fi
done

if [ ! -d ${HOME}/.oh-my-zsh ]; then
  echo "ln -s ${repository}/oh-my-zsh ${HOME}/.oh-my-zsh"
  ln -s ${repository}/oh-my-zsh ${HOME}/.oh-my-zsh
else
  echo "${HOME}/.oh-my-zsh exists"
fi

if [ ! -d ${HOME}/.tmux-powerline ]; then
  echo "ln -s ${repository}/tmux-powerline ${HOME}/.tmux-powerline"
  ln -s ${repository}/tmux-powerline ${HOME}/.tmux-powerline
else
  echo "${HOME}/.tmux-powerline exists"
fi

if [ ! -d ${HOME}/bin ]; then
  echo "mkdir ${HOME}/bin"
  mkdir ${HOME}/bin
fi
if [ ! -f ${HOME}/bin/tmux-mem-cpu-load ]; then
  echo "g++ -Wall ${repository}/tmux-mem-cpu-load/tmux-mem-cpu-load.cpp -o ${HOME}/bin/tmux-mem-cpu-load"
  g++ -Wall ${repository}/tmux-mem-cpu-load/tmux-mem-cpu-load.cpp -o ${HOME}/bin/tmux-mem-cpu-load
fi
