### env ###
export EDITOR=vim
export LANG=en_US.UTF-8
export PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH


### alias ###
alias sudo='sudo '
alias su='su -'
alias sqlite='sqlite3'
alias vi='vim'
alias yum='yum -y'


### complement ###
autoload -Uz compinit
compinit

setopt auto_menu
setopt menu_complete

setopt auto_pushd
setopt pushd_ignore_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select
zstyle ':completion:*:sudo:*' command-path $PATH
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
export LS_COLORS='di=01;34:ln=01;36:so=01;35:ex=01;32:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:tw=30;42:ow=34;42'
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz colors
colors
PROMPT="
%{${fg[cyan]}%}%n@%m%{${reset_color}%} %{${fg[magenta]}%}[%/]%{${reset_color}%}
%# "

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

