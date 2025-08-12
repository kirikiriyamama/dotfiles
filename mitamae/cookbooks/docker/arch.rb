package 'docker'
package 'docker-buildx'
package 'docker-compose'

directory "#{node[:home]}/.docker/cli-plugins" do
  user node[:user]
end

github_binary 'docker-mcp' do
  repository 'docker/mcp-gateway'
  version 'v0.13.0'
  asset 'docker-mcp-linux-amd64.tar.gz'
  extract 'tar -xzf docker-mcp-linux-amd64.tar.gz'
  dest "#{node[:home]}/.docker/cli-plugins/docker-mcp"
end

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
