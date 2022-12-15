user node[:user] do
  create_home true
end

package 'sudo'

execute "usermod -aG wheel #{node[:user]}" do
  not_if "getent group wheel | grep #{node[:user]}"
end
