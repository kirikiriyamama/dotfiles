node.reverse_merge!(home: '/home/kirikiriyamama')

include_cookbook 'apt_repository'
include_cookbook 'deb'
include_cookbook 'dotfile'
include_cookbook 'github_binary'

package 'build-essential'
package 'curl'
package 'libssl-dev'

include_cookbook 'git'
include_cookbook 'unzip'

include_cookbook 'amazon-ecr-credential-helper'
include_cookbook 'asdf'
include_cookbook 'awscli'
include_cookbook 'bin'
include_cookbook 'colordiff'
include_cookbook 'eksctl'
include_cookbook 'gh'
include_cookbook 'ghq'
include_cookbook 'helm'
include_cookbook 'kustomize'
include_cookbook 'nvim'
include_cookbook 'protobuf'
include_cookbook 'ruby'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'zsh'

package 'cu'
package 'ipcalc'
package 'jq'
package 'nkf'
package 'tree'
package 'whois'

if wsl?
  include_cookbook 'win32yank'
else
  node.reverse_merge!(display: ':1')

  include_cookbook 'dconf'

  include_cookbook 'alacritty'
  include_cookbook 'appearance'
  include_cookbook 'docker'
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
