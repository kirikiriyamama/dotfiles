case node[:platform]
when 'arch'
  package 'kubectl'

  github_binary 'kubecolor' do
    repository 'dty1er/kubecolor'
    version 'v0.0.20'
    asset 'kubecolor_0.0.20_Linux_x86_64.tar.gz'
    extract 'tar -xzf kubecolor_0.0.20_Linux_x86_64.tar.gz kubecolor'
  end
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
