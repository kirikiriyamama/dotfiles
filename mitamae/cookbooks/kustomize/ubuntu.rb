github_binary 'kustomize' do
  repository 'kubernetes-sigs/kustomize'
  version 'kustomize%2Fv4.0.2'
  asset 'kustomize_v4.0.2_linux_amd64.tar.gz'

  extract 'tar -xzf kustomize_v4.0.2_linux_amd64.tar.gz'
end
