package 'docker'
package 'docker-compose'

service 'docker.service' do
  action [:enable, :start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "getent group docker | grep #{node[:user]}"
end
