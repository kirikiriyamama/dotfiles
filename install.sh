#!/bin/sh

# initialize
repository=$(cd $(dirname $0); pwd)
case $OSTYPE in
  darwin*) PLATFORM="osx" ;;
  *) PLATFORM="unknown" ;;
esac

# update submodules
(cd ${repository} && git submodule update --init)

# build tmux-mem-cpu-load
type tmux-mem-cpu-load &>/dev/null
if [ "$?" -ne 0 ]; then
  if [ "$PLATFORM" = "osx" ]; then
    echo "Please execute the following command: brew install tmux-mem-cpu-load"
  else
    if [ ! -d ${HOME}/dev/bin ]; then
      command="mkdir -p ${HOME}/dev/bin"
      echo $command && command $command
    fi
    command="g++ -Wall ${repository}/tmux-mem-cpu-load/tmux-mem-cpu-load.cpp -o ${HOME}/dev/bin/tmux-mem-cpu-load"
    echo $command && command $command
  fi
fi

# create symlinks
if [ "$PLATFORM" = "osx" ]; then
  find_opts=("-E")
else
  find_opts=()
fi
find ${find_opts[@]} ${repository} -regex "${repository}/dot\.[^/]+$" |
sed -e "s|${repository}/||" |
while read dotfile
do
  link_name=$(echo ${dotfile} | sed -e "s/^dot//g")
  if [ ! -e ${HOME}/${link_name} ]; then
    command="ln -s ${repository}/${dotfile} ${HOME}/${link_name}"
    echo $command && command $command
  else
    echo "${HOME}/${link_name} exists"
  fi
done
