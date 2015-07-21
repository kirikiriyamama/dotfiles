#!/bin/bash

# initialize
repository=$(cd $(dirname ${0}); pwd)

case ${OSTYPE} in
  darwin*) PLATFORM="osx" ;;
  *) PLATFORM="unknown" ;;
esac

find_opts=()
[ "${PLATFORM}" = "osx" ] && find_opts=("-E")

# update submodules
(cd ${repository} && git submodule update --init)

# make directories
dirs=("dev")
for dir in ${dirs[@]}; do
  target="${HOME}/${dir}"
  if [ ! -e "${target}" ]; then
    command="mkdir ${target}"
    echo ${command} && command ${command}
  fi
done

# create symlinks
files=($(find ${find_opts[@]} ${repository} -regex "${repository}/dot\.[^/]+$" | sed -e "s|${repository}/||") "dev/bin")
for file in ${files[@]}; do
  source="${repository}/${file}"
  target="${HOME}/$(echo ${file} | sed -e "s|^dot||g")"
  if [ ! -e "${target}" ]; then
    command="ln -s ${source} ${target}"
    echo ${command} && command ${command}
  else
    echo "${target} exists"
  fi
done
