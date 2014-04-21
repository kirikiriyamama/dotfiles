setopt noflowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt menu_complete
setopt always_to_end
setopt always_last_prompt
setopt complete_in_word

setopt glob_complete
setopt globdots
setopt magic_equal_subst
setopt nonomatch

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

WORDCHARS=''

zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps x -o pid,user,args"
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*:manuals' separate-sections true
zstyle '*' single-ignored show

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_ssh_config[@]"
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# appearance
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _list
zstyle ':completion:*:descriptions' format '%F{yellow}'%d'%f'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


compdef tig git-checkout
