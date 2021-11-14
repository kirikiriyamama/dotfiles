package 'cmake' if node[:platform] == 'arch'
package 'tmux'

dotfile '.tmux'
dotfile '.tmux.conf'

plugins = "#{node[:home]}/.tmux/plugins"

execute "#{plugins}/tpm/bin/install_plugins" do
  user node[:user]
  only_if "test \"$(find #{plugins} -mindepth 1 -maxdepth 1 -type d | wc -l)\" -eq 1"
end

execute 'build tmux-mem-cpu-load' do
  user node[:user]
  cwd "#{plugins}/tmux-mem-cpu-load"
  command 'cmake . && make'
  not_if "test -f #{plugins}/tmux-mem-cpu-load/tmux-mem-cpu-load"
end
