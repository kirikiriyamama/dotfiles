if [ $ARCH != "cygwin" ]; then
  # General
  # Show which segment fails and its exit code.
  export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
  # Use patched font symbols.
  export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"
  # The theme to use.
  export TMUX_POWERLINE_THEME="my-theme"
  # Overlay dirctory to look for themes. There you can put your own themes outside the repo. Fallback will still be the "themes" directory in the repo.
  export TMUX_POWERLINE_DIR_USER_THEMES="~/.tmux/themes"
  # Overlay dirctory to look for segments. There you can put your own segments outside the repo. Fallback will still be the "segments" directory in the repo.
  export TMUX_POWERLINE_DIR_USER_SEGMENTS="~/.tmux/segments"

  # pwd.sh
  # Maximum length of output.
  export TMUX_POWERLINE_SEG_PWD_MAX_LEN="24"

  # weather.sh
  # The data provider to use. Currently only "yahoo" is supported.
  export TMUX_POWERLINE_SEG_WEATHER_DATA_PROVIDER="yahoo"
  # What unit to use. Can be any of {c,f,k}.
  export TMUX_POWERLINE_SEG_WEATHER_UNIT="c"
  # How often to update the weather in seconds.
  export TMUX_POWERLINE_SEG_WEATHER_UPDATE_PERIOD="600"
  # Name of GNU grep binary if in PATH, or path to it.
  export TMUX_POWERLINE_SEG_WEATHER_GREP="grep"
  # Your location. Find a code that works for you:
  # 1. Go to Yahoo weather http://weather.yahoo.com/
  # 2. Find the weather for you location
  # 3. Copy the last numbers in that URL. e.g. "http://weather.yahoo.com/united-states/california/newport-beach-12796587/" has the numbers "12796587"
  export TMUX_POWERLINE_SEG_WEATHER_LOCATION="26237038"

  function ruby_version() {
    if which rvm-prompt &> /dev/null; then
      echo "$(rvm-prompt i v g)"
    elif which rbenv &> /dev/null; then
      echo "$(rbenv version | sed -e 's/ (set.*$//')"
    else
      return
    fi
  }

  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXRUBY_$(tmux display -p "#D" | tr -d %) "$(ruby_version)")'
fi
