github_binary 'ghq' do
  repository 'x-motemen/ghq'
  version 'v1.3.0'
  asset 'ghq_linux_amd64.zip'

  extract 'unzip ghq_linux_amd64.zip'
  source 'ghq_linux_amd64/ghq'
end
