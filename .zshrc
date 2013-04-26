### env ###
export EDITOR=vim
export LANG=en_US.UTF-8
# export PATH


### alias ###
alias ls='ls -v -F --color=auto'
alias sudo='sudo '
alias su='su -'
alias sqlite='sqlite3'


### complement ###
autoload -Uz compinit
compinit

setopt auto_menu
setopt menu_complete

setopt auto_pushd
setopt pushd_ignore_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


### glob ###
setopt extended_glob
unsetopt caseglob


### history ###
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups


### prompt ###
autoload -Uz colors
colors
PROMPT="
%{${fg[cyan]}%}%n@%m%{${reset_color}%} %{${fg[magenta]}%}[%/]%{${reset_color}%}
$ "

setopt prompt_subst


### keybind ###
# bindkey -v

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey "^[[Z" reverse-menu-complete


### function ###
function chpwd() { ls -v -F --color=auto }
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup


### other ###
setopt print_eight_bit
setopt no_beep
# umask 

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
