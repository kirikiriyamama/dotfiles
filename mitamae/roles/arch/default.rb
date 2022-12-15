node.reverse_merge!(home: '/home/kirikiriyamama')

package 'base-devel'
# Ensure that all packages of base-devel are installed
base_devel = run_command('pacman -Sg base-devel | cut -d\  -f2').stdout.split
base_devel.reject { |p| wsl? && p == 'fakeroot' }.each { |p| package p }

unless wsl?
  include_cookbook 'user'

  ["#{node[:home]}/.config/systemd/user", "#{node[:home]}/.config/environment.d"].each do |d|
    directory d do
      owner node[:user]
      group node[:user]
    end
  end
end

include_cookbook 'dconf'
include_cookbook 'dotfile'
include_cookbook 'git'
include_cookbook 'aur'
include_cookbook 'unzip'
include_cookbook 'github_binary'

include_cookbook 'amazon-ecr-credential-helper'
include_cookbook 'asdf'
include_cookbook 'awscli'
include_cookbook 'bin'
include_cookbook 'colordiff'
include_cookbook 'gh'
include_cookbook 'ghq'
include_cookbook 'helm'
include_cookbook 'iputils'
include_cookbook 'kubectl'
include_cookbook 'man'
include_cookbook 'nvim'
include_cookbook 'protobuf'
include_cookbook 'ruby'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'zsh'

aur 'apg'
package 'bind' # dnsutils
aur 'google-cloud-sdk'
package 'ipcalc'
package 'jq'
package 'mariadb-clients'
package 'mtr'
aur 'nkf'
package 'openssh'
package 'pacman-contrib'
package 'parallel'
package 'rustup'
package 'strace'
package 'tree'
package 'uucp' # cu(1)
package 'whois'

if wsl?
  include_cookbook 'win32yank'
  include_cookbook 'wslu'
else
  package 'noto-fonts'
  package 'noto-fonts-cjk'
  package 'noto-fonts-emoji'

  package 'firefox'
  package 'fwupd'
  aur 'google-chrome'
  package 'wl-clipboard'

  include_cookbook 'alacritty'
  include_cookbook 'docker'
  include_cookbook 'fcitx'
  include_cookbook 'gnome'
  include_cookbook 'network'
  include_cookbook 'slack'
  include_cookbook 'xremap'
end
