package 'networkmanager'

service 'NetworkManager.service' do
  action [:enable, :start]
end
