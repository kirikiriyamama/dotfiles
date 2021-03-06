include_recipe File.expand_path('../../../helper', __FILE__)

node.reverse_merge!(
  user: 'kirikiriyamama',
  home: '/home/kirikiriyamama',
  dotfiles: File.expand_path('../../../../home', __FILE__),
)


include_cookbook 'apt-key'
include_cookbook 'deb'
include_cookbook 'dotfile'
include_cookbook 'github_binary'

include_cookbook 'base'
include_cookbook 'git'

include_cookbook 'asdf'
include_cookbook 'awscli'
include_cookbook 'bin'
include_cookbook 'colordiff'
include_cookbook 'ctags'
include_cookbook 'eksctl'
include_cookbook 'gh'
include_cookbook 'ghq'
include_cookbook 'helm'
include_cookbook 'kustomize'
include_cookbook 'nvim'
include_cookbook 'peco'
include_cookbook 'ruby'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'zsh'

include_cookbook 'packages'

if wsl?
  include_cookbook 'win32yank'
else
  node.reverse_merge!(display: ':1')

  include_cookbook 'dconf'

  include_cookbook 'python3'
  include_cookbook 'xkeysnail'

  include_cookbook 'alacritty'
  include_cookbook 'appearance'
  include_cookbook 'docker'
  include_cookbook 'docker-compose'
  include_cookbook 'keybindings'
  include_cookbook 'kubectl'
  include_cookbook 'peripherals'
  include_cookbook 'slack'

  package 'chromium-browser'
  package 'clipit'
  package 'dconf-editor'
  package 'flameshot'
  package 'gnome-tweaks'
  package 'gnuplot'
  package 'peek'
  package 'xclip'
end
