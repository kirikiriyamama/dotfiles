case node[:platform]
when 'arch'
  package 'kubectl'
when 'ubuntu'
  apt_key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg' do
    fingerprint 'BA07F4FB'
  end

  remote_file '/etc/apt/sources.list.d/kubernetes.list' do
    mode '644'
    notifies :run, 'execute[apt update]', :immediately
  end

  package 'kubectl'

  execute 'apt update' do
    action :nothing
  end
else
  raise NotImplementedError
end
