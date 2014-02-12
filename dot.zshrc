# initialize
. $HOME/.zsh.d/antigen/antigen.zsh

# environments
ZSH_CUSTOM=$HOME/.zsh.d

case $OSTYPE in
  linux*) PLATFORM="linux" ;;
  cygwin*) PLATFORM="cygwin" ;;
  darwin*) PLATFORM="osx" ;;
  *) PLATFORM="unknown" ;;
esac

if [ "$PLATFORM" = "cygwin" ]; then
  USE_TMUX=false
else
  USE_TMUX=true
fi

# completions
fpath=($ZSH_CUSTOM/completions $fpath)

# plugins
antigen bundle $ZSH_CUSTOM/plugins/bundler
antigen bundle robbyrussell/oh-my-zsh plugins/capistrano
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man
antigen bundle robbyrussell/oh-my-zsh plugins/knife
antigen bundle robbyrussell/oh-my-zsh plugins/rails
antigen bundle robbyrussell/oh-my-zsh plugins/thor
antigen bundle zsh-users/zsh-syntax-highlighting

if [ "$USE_TMUX" ]; then
  antigen bundle $ZSH_CUSTOM/plugins/tmux-powerline
fi

# configurations
for config_file ($ZSH_CUSTOM/*.zsh(N)); do
  . $config_file
done
unset config_file

# functions
for function ($ZSH_CUSTOM/functions/*.zsh(N)); do
  . $function
done
unset function

# theme
antigen theme $ZSH_CUSTOM/themes/agnoster.zsh-theme

if [ "$USE_TMUX" ]; then
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXRUBY_$(tmux display -p "#D" | tr -d %) "$(ruby_version)")'
fi

# local configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# finalize
antigen apply
