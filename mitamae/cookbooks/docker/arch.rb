package 'docker'
package 'docker-buildx'
package 'docker-compose'

service 'docker.service' do
  action [:enable, :start]
end

# https://zenn.dev/23prime/articles/a54d986abdc0d8
remote_file '/etc/docker/daemon.json' do
  mode '600'
  notifies :restart, 'service[docker.service]'
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "getent group docker | grep #{node[:user]}"
end
