#!/bin/bash
set -o errexit -o pipefail -o xtrace

repository=$(cd $(dirname ${0}); pwd)
cd ${repository}

git submodule update --init

while read c; do
  brew ${c}
done < <(grep -v -e '^$' -e '^#' Brewfile)

while read f; do
  ln -s ${repository}/${f} ${HOME} || true
done < <(find home -mindepth 1 -maxdepth 1 ! -name '.config')
while read f; do
  ln -s ${repository}/${f} ${HOME}/.config || true
done < <(find home/.config -mindepth 1 -maxdepth 1)

vim +PlugInstall +qa
${HOME}/.tmux/plugins/tpm/bin/install_plugins

if ! type cargo &>/dev/null; then
  rustup-init --no-modify-path -y
  source ${HOME}/.cargo/env
fi
if [[ ! -x /Applications/Alacritty.app ]]; then
  ghq get -p jwilm/alacritty
  (
    cd ${HOME}/.ghq/github.com/jwilm/alacritty
    make app
    cp -r target/release/osx/Alacritty.app /Applications/
    gzip -c alacritty.man >/usr/local/share/man/man1/alacritty.1.gz
  )
fi
