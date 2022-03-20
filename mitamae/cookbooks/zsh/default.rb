package 'zsh'

case node[:platform]
when 'darwin'
  execute "sudo -E chsh -s /opt/homebrew/bin/zsh #{node[:user]}" do
    not_if %Q{test "$(dscl . -read #{node[:home]} UserShell | sed 's/UserShell: //')" = /opt/homebrew/bin/zsh}
  end
else
  execute "chsh -s /usr/bin/zsh #{node[:user]}" do
    not_if %Q{test "$(getent passwd #{node[:user]} | cut -d: -f7)" = /usr/bin/zsh}
  end
end

dotfile '.dircolors'
dotfile '.zshrc'
dotfile '.zshenv'
dotfile '.zsh.d'

package 'bat'
include_cookbook 'peco'
