#!/bin/bash
set -o errexit -o pipefail -o xtrace

repository=$(cd $(dirname ${0}); pwd)
cd ${repository}

git submodule update --init
grep -v -e '^$' -e '^#' Brewfile | xargs -t -L 1 brew
find home -mindepth 1 -maxdepth 1 | sed -e 's|home/||' | xargs -t -I {} ln -s ${repository}/{} ${HOME}
vim +PlugInstall +qa
${HOME}/.tmux/plugins/tpm/bin/install_plugins
