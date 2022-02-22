if [ ! -f ${HOME}/.asdf/asdf.sh ]; then
  return
fi

. ${HOME}/.asdf/asdf.sh
# must be executed before compinit (in completion.zsh)
fpath=(${HOME}/.asdf/completions ${fpath})
