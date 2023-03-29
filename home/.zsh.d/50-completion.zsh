autoload -Uz compinit && compinit

# Load completion functions
for f in ${HOME}/.zsh.d/completion/*.zsh; do
  . ${f}
done

setopt auto_menu
setopt menu_complete

setopt complete_in_word
setopt always_to_end
setopt always_last_prompt

setopt glob_complete
setopt glob_dots
setopt no_nomatch
setopt magic_equal_subst

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
