asset = 'xremap-linux-x86_64-gnome.zip'

github_binary 'xremap' do
  repository 'k0kubun/xremap'
  version 'v0.8.9'
  asset asset
  extract "unzip #{asset}"
end

dotfile '.xremap.yml'

execute "usermod -aG input #{node[:user]}" do
  not_if "getent group input | grep #{node[:user]}"
end

remote_file '/etc/modules-load.d/uinput.conf' do
  mode '644'
end

remote_file '/etc/udev/rules.d/99-input.rules' do
  mode '644'
end

template "#{node[:home]}/.config/systemd/user/xremap.service" do
  source 'templates/xremap.service.erb'
  owner node[:user]
  group node[:user]
  mode '644'
  notifies :run, 'execute[daemon-reload]', :immediately
end

uid = run_command("id -u #{node[:user]}").stdout.chomp
env = "XDG_RUNTIME_DIR=/run/user/#{uid}"

execute 'daemon-reload' do
  user node[:user]
  command "#{env} systemctl --user daemon-reload"
  action :nothing
end

execute "#{env} systemctl --user enable xremap.service" do
  user node[:user]
  not_if "#{env} systemctl --user is-enabled xremap.service"
end
