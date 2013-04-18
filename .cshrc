# $FreeBSD: release/9.0.0/etc/root/dot.cshrc 170088 2007-05-29 06:37:58Z dougb $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias vi		'vim'
alias less		'lv'
alias su		'su -'
alias sqlite	'sqlite3'

# A righteous umask
umask 022

set path=(/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
set color
set autolist
set autocorrect
set nobeep
set ignoreeof

limit coredumpsize 0

setenv	EDITOR	vim
setenv	PAGER	lv
setenv	LV		'-Ou8'
setenv	BLOCKSIZE	K
setenv	LC_CTYPE	ja_JP.UTF-8

if ($?prompt) then
	# An interactive shell -- set some stuff up
	if ($?WINDOW) then
		set prompt="\n%{\e[36m%}%n@%m%{\e[0m%}[$WINDOW] [%{\e[35m%}%/%{\e[00m%}]\n$ "
	else
		set prompt="\n%{\e[36m%}%n@%m%{\e[0m%} [%{\e[35m%}%/%{\e[00m%}]\n$ "
	endif
	set filec
	set history=1000
	set savehist=(1000 merge)
	set mail=(/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif
