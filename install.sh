#!/bin/bash
set -o errexit -o pipefail -o xtrace

repository=$(cd $(dirname ${0}); pwd)
cd ${repository}

git submodule update --init
while read c; do
  brew ${c}
done < <(grep -v -e '^$' -e '^#' Brewfile)
while read f; do
  ln -s ${repository}/${f} ${HOME}
done < <(find home -mindepth 1 -maxdepth 1)
vim +PlugInstall +qa
${HOME}/.tmux/plugins/tpm/bin/install_plugins
