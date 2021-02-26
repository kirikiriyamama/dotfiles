apt_key 'https://baltocdn.com/helm/signing.asc' do
  fingerprint '7C1A168A'
end

remote_file '/etc/apt/sources.list.d/helm-stable-debian.list' do
  mode '644'
  notifies :run, 'execute[apt update]', :immediately
end

package 'helm'

execute 'apt update' do
  action :nothing
end
