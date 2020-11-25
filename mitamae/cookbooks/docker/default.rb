apt_key 'https://download.docker.com/linux/ubuntu/gpg' do
  fingerprint '0EBFCD88'
end

template '/etc/apt/sources.list.d/docker.list' do
  mode '644'
  notifies :run, 'execute[apt update]', :immediately

  variables(
    codename: run_command('lsb_release -cs').stdout.chomp
  )
end

package 'docker-ce'
package 'docker-ce-cli'
package 'containerd.io'

service 'docker.service' do
  action [:enable, :start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "getent group docker | grep #{node[:user]}"
end

execute 'apt update' do
  action :nothing
end
