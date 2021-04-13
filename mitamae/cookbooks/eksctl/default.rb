github_binary 'eksctl' do
  repository 'weaveworks/eksctl'
  version '0.44.0'
  asset 'eksctl_Linux_amd64.tar.gz'

  extract 'tar -xzf eksctl_Linux_amd64.tar.gz'
end
