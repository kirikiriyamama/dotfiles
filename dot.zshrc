# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh.d/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler capistrano colored-man knife rails thor zsh-syntax-highlighting)

case $OSTYPE in
  linux*) export PLATFORM="linux" ;;
  cygwin*) export PLATFORM="cygwin" ;;
  darwin*) export PLATFORM="osx" ;;
  *) export PLATFORM="unknown" ;;
esac

if [ "$PLATFORM" != "cygwin" ]; then
  # tmux-powerline
  plugins=($plugins tmux-powerline)
fi

ZSH_CUSTOM=$HOME/.zsh.d
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if [ "$PLATFORM" = "cygwin" ]; then
  source $HOME/.mintty-colors-solarized/sol.dark
else
  # tmux-powerline
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXRUBY_$(tmux display -p "#D" | tr -d %) "$(ruby_version)")'
fi
