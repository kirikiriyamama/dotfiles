package 'python3-evdev'

execute 'pip3 install --user xkeysnail' do
  not_if 'pip3 -q show xkeysnail'
end

dotfile '.xprofile'
dotfile '.xkeysnail'

template '/etc/systemd/system/xkeysnail.service' do
  mode '644'
  notifies :run, 'execute[daemon-reload]', :immediately
end

service 'xkeysnail.service' do
  action [:enable, :start]
end

execute 'daemon-reload' do
  command 'systemctl daemon-reload'
  action :nothing
end
