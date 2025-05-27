export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:${PATH}"

# asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
# must be executed before compinit (in completion.zsh)
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions ${fpath})
