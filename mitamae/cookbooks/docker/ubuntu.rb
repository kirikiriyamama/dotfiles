apt_repository 'docker' do
  uri 'https://download.docker.com/linux/ubuntu'
  options(
    arch: run_command('dpkg --print-architecture').stdout.chomp
  )
  suite run_command('lsb_release -cs').stdout.chomp
  components ['stable']
  key 'https://download.docker.com/linux/ubuntu/gpg'
end

package 'docker-ce'
package 'docker-ce-cli'
package 'containerd.io'
package 'docker-compose'

service 'docker.service' do
  action [:enable, :start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "getent group docker | grep #{node[:user]}"
end
